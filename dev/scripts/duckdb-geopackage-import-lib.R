# Copy a GeoPackage into a source-specific DuckDB schema, preserving layer names.
import_geopackage_snapshot <- function(con, path, schema, layers = NULL) {
  if (!requireNamespace('digest', quietly = TRUE)) stop('Install digest.')
  if (length(schema) != 1L || is.na(schema) || !grepl('^[A-Za-z][A-Za-z0-9_]*$', schema)) stop('Invalid schema name.')
  if (!file.exists(path) || tolower(tools::file_ext(path)) != 'gpkg') stop('Supply an existing GeoPackage.')
  path <- normalizePath(path, winslash = '/', mustWork = TRUE)
  hash <- digest::digest(file = path, algo = 'sha256', serialize = FALSE)
  qs <- function(x) as.character(DBI::dbQuoteString(con, x))
  qi <- function(x) as.character(DBI::dbQuoteIdentifier(con, x))
  schema_sql <- qi(schema)
  meta <- DBI::dbGetQuery(con, paste0('SELECT layer.name AS name, layer.feature_count AS feature_count, ',
    'len(layer.geometry_fields) AS geometry_count, layer.geometry_fields[1].name AS geometry_name, ',
    'layer.geometry_fields[1].type AS geometry_type, layer.geometry_fields[1].crs.auth_name AS crs_authority, ',
    'layer.geometry_fields[1].crs.auth_code AS crs_code, layer.geometry_fields[1].crs.wkt AS crs_wkt ',
    'FROM ST_Read_Meta(', qs(path), ') m, UNNEST(m.layers) AS l(layer) ORDER BY layer.name'))
  if (!nrow(meta)) stop('No layers found.')
  if (anyDuplicated(tolower(meta$name))) stop('Layer names collide in DuckDB.')
  if (!is.null(layers)) {
    if (!length(layers) || anyDuplicated(tolower(layers)) || !all(layers %in% meta$name)) stop('Requested layers not found uniquely.')
    meta <- meta[match(layers, meta$name), , drop = FALSE]
  }
  if (any(is.na(meta$geometry_count)) || any(meta$geometry_count > 1)) stop('Layer has unsupported geometry field metadata.')
  table_names <- paste0('src_', meta$name)
  tables <- paste0(schema_sql, '.', vapply(table_names, qi, ''))
  counts <- numeric(nrow(meta))
  DBI::dbWithTransaction(con, {
    DBI::dbExecute(con, paste('CREATE SCHEMA IF NOT EXISTS', schema_sql))
    DBI::dbExecute(con, paste0('CREATE TABLE ',schema_sql,'.import_source (source_name VARCHAR NOT NULL, source_sha256 VARCHAR NOT NULL, imported_at TIMESTAMP NOT NULL)'))
    DBI::dbExecute(con, paste0('CREATE TABLE ',schema_sql,'.import_layer (layer_name VARCHAR NOT NULL, table_name VARCHAR NOT NULL, ',
      'source_count BIGINT, imported_count BIGINT NOT NULL, geometry_count INTEGER NOT NULL, geometry_name VARCHAR, geometry_type VARCHAR, ',
      'crs_authority VARCHAR, crs_code VARCHAR, crs_wkt VARCHAR)'))
    DBI::dbExecute(con, paste0('INSERT INTO ',schema_sql,'.import_source VALUES (?, ?, current_timestamp)'), params=list(basename(path),hash))
    for (i in seq_len(nrow(meta))) {
      read_sql <- paste0('ST_Read(', qs(path), ', layer=', qs(meta$name[i]), ')')
      DBI::dbExecute(con, paste('CREATE TABLE', tables[i], 'AS SELECT * FROM', read_sql))
      counts[i] <- DBI::dbGetQuery(con, paste('SELECT count(*) AS n FROM', tables[i]))$n
      if (!is.na(meta$feature_count[i]) && meta$feature_count[i] >= 0 && counts[i] != meta$feature_count[i]) stop('Feature count mismatch for layer: ', meta$name[i])
      DBI::dbExecute(con, paste0('INSERT INTO ',schema_sql,'.import_layer VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'),
        params=list(meta$name[i],table_names[i],meta$feature_count[i],counts[i],meta$geometry_count[i],
          meta$geometry_name[i],meta$geometry_type[i],meta$crs_authority[i],meta$crs_code[i],meta$crs_wkt[i]))
    }
    if (!identical(hash, digest::digest(file=path, algo='sha256', serialize=FALSE))) stop('GeoPackage changed during import.')
  })
  invisible(data.frame(layer=meta$name, table=table_names, source_count=meta$feature_count, imported_count=counts))
}
