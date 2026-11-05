# Stage a bounded project subset for inspection, without changing source features.
rf_stage_geopackage <- function(con, path, layer, project_id = 65) {
  if (!requireNamespace('digest', quietly = TRUE)) stop('Install digest.')
  if (!file.exists(path) || tolower(tools::file_ext(path)) != 'gpkg') stop('Supply an existing GeoPackage.')
  if (length(layer) != 1L || is.na(layer) || !nzchar(layer)) stop('Supply a layer name.')
  if (length(project_id) != 1L || is.na(project_id) || !is.finite(project_id) || project_id != trunc(project_id)) stop('Project ID must be an integer.')
  path <- normalizePath(path, winslash = '/', mustWork = TRUE)
  hash <- digest::digest(file = path, algo = 'sha256', serialize = FALSE)
  quote_string <- function(x) as.character(DBI::dbQuoteString(con, x))
  metadata_sql <- paste0('SELECT layer.name AS name, layer.feature_count AS feature_count, ',
    'len(layer.geometry_fields) AS geometry_count, layer.geometry_fields[1].name AS geometry_name, ',
    'layer.geometry_fields[1].type AS geometry_type, layer.geometry_fields[1].crs.auth_name AS crs_authority, ',
    'layer.geometry_fields[1].crs.auth_code AS crs_code, layer.geometry_fields[1].crs.wkt AS crs_wkt ',
    'FROM ST_Read_Meta(', quote_string(path), ') m, UNNEST(m.layers) AS l(layer)')
  layers <- DBI::dbGetQuery(con, metadata_sql)
  meta <- layers[layers$name == layer, , drop = FALSE]
  if (nrow(meta) != 1L) stop('Requested layer not found uniquely in GeoPackage.')
  if (is.na(meta$geometry_count) || meta$geometry_count != 1L) stop('Expected one geometry field.')
  read_sql <- paste0('ST_Read(', quote_string(path), ', layer=', quote_string(layer), ')')
  fields <- DBI::dbGetQuery(con, paste('DESCRIBE SELECT * FROM', read_sql))
  if (anyDuplicated(toupper(fields$column_name))) stop('Ambiguous case-insensitive column names.')
  ids <- match(c('RESTORFEATIDPK', 'PROJECT_ID'), toupper(fields$column_name))
  if (anyNA(ids)) stop('Layer requires RESTORFEATIDPK and PROJECT_ID fields.')
  field_id <- as.character(DBI::dbQuoteIdentifier(con, fields$column_name[ids[1]]))
  field_project <- as.character(DBI::dbQuoteIdentifier(con, fields$column_name[ids[2]]))
  geom_index <- match(toupper(meta$geometry_name), toupper(fields$column_name))
  if (is.na(geom_index) || !startsWith(fields$column_type[geom_index], 'GEOMETRY')) stop('Geometry field not readable as GEOMETRY.')
  geom <- as.character(DBI::dbQuoteIdentifier(con, fields$column_name[geom_index]))
  project_literal <- format(project_id, scientific = FALSE, trim = TRUE)
  DBI::dbWithTransaction(con, {
    DBI::dbExecute(con, paste('CREATE TABLE rf.geopackage_stage AS SELECT * FROM', read_sql,
      'WHERE TRY_CAST(', field_project, 'AS DOUBLE) =', project_literal))
    DBI::dbExecute(con, paste('CREATE TABLE rf.geopackage_source (source_name VARCHAR, source_sha256 VARCHAR, layer_name VARCHAR,',
      'source_feature_count BIGINT, project_id BIGINT, geometry_name VARCHAR, geometry_type VARCHAR,',
      'crs_authority VARCHAR, crs_code VARCHAR, crs_wkt VARCHAR, imported_at TIMESTAMP)'))
    DBI::dbExecute(con, 'INSERT INTO rf.geopackage_source VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, current_timestamp)',
      params = list(basename(path), hash, layer, meta$feature_count[[1]], project_id, meta$geometry_name[[1]],
        meta$geometry_type[[1]], meta$crs_authority[[1]], meta$crs_code[[1]], meta$crs_wkt[[1]]))
    if (!identical(hash, digest::digest(file = path, algo = 'sha256', serialize = FALSE))) stop('GeoPackage changed during import.')
  })
  counts <- DBI::dbGetQuery(con, paste0('SELECT count(*) AS staged, count(*) FILTER (WHERE ', geom,
    ' IS NULL) AS missing_geometry, count(*) FILTER (WHERE TRY_CAST(', field_id,
    ' AS DOUBLE) IS NULL) AS missing_or_invalid_id, count(*) - count(DISTINCT TRY_CAST(', field_id,
    ' AS DOUBLE)) AS duplicate_or_invalid_ids FROM rf.geopackage_stage'))
  comparison <- DBI::dbGetQuery(con, paste0('SELECT r.restorfeatidpk, count(s.', field_id,
    ') AS staged_matches FROM rf.revetment r LEFT JOIN rf.geopackage_stage s ON TRY_CAST(s.', field_id,
    ' AS DOUBLE) = r.restorfeatidpk WHERE r.project_id = ', quote_string(as.character(project_id)),
    ' GROUP BY r.restorfeatidpk ORDER BY r.restorfeatidpk'))
  unmatched <- DBI::dbGetQuery(con, paste0('SELECT count(*) AS unmatched_staged FROM rf.geopackage_stage s ',
    'WHERE NOT EXISTS (SELECT 1 FROM rf.revetment r WHERE r.project_id = ', quote_string(as.character(project_id)),
    ' AND TRY_CAST(s.', field_id, ' AS DOUBLE) = r.restorfeatidpk)'))
  list(source = meta, counts = counts, comparison = comparison, unmatched = unmatched)
}
