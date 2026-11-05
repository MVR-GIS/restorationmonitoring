# Load a bounded attribute sample from the supplied ArcGIS workspace XML.
rf_import_bertom <- function(con, xml_file, schema_file='dev/schemas/duckdb-rf-mvp.sql') {
  if (!requireNamespace('xml2', quietly=TRUE) || !requireNamespace('digest', quietly=TRUE)) stop('Install xml2 and digest.')
  if (!file.exists(xml_file)) stop('Restoration Features XML not found.')
  hash <- digest::digest(file=xml_file, algo='sha256', serialize=FALSE)
  expected <- '30c02a640b3f899872a6fd780dfd97ae0b67a399e958938e165145e1e2d29eb5'
  if (!identical(tolower(hash), expected)) stop('Unexpected XML version; review before importing.')
  x <- xml2::read_xml(xml_file)
  datasets <- xml2::xml_find_all(x, '//*[local-name()="DatasetData"]')
  names <- vapply(datasets, function(z) xml2::xml_text(xml2::xml_find_first(z, './DatasetName')), '')
  if (sum(names=='RESTORATION.Revetment') != 1L) stop('Expected one Revetment dataset.')
  data <- xml2::xml_find_first(datasets[[which(names=='RESTORATION.Revetment')]], './Data')
  fields <- xml2::xml_text(xml2::xml_find_all(data, './Fields/FieldArray/Field/Name'))
  needed <- c('RESTORFEATIDPK','SDSFEATURENAME','PROJECT_ID','PROGRAM_UID','RESTORFEATSTATUS','UMRRTYPE','UMRRSUBTYPE')
  if (anyDuplicated(fields) || !all(needed %in% fields)) stop('Unexpected Revetment fields.')
  idx <- match(needed, fields)
  rows <- xml2::xml_find_all(data, './Records/*')
  out <- lapply(rows, function(row) {
    vals <- xml2::xml_find_all(row, './Values/Value')
    if (length(vals) != length(fields)) stop('Row/field count mismatch.')
    s <- vapply(idx, function(i) xml2::xml_text(vals[[i]]), '')
    if (s[[3]] != '65' || !s[[1]] %in% as.character(6723:6729)) return(NULL)
    s
  })
  out <- Filter(Negate(is.null), out)
  if (length(out) != 7L || !setequal(vapply(out, `[[`, '', 1L), as.character(6723:6729))) stop('Expected seven unique candidate segment records.')
  sql <- paste(readLines(schema_file, warn=FALSE), collapse='\n')
  statements <- trimws(strsplit(sql, ';', fixed=TRUE)[[1]])
  DBI::dbWithTransaction(con, {
    for (statement in statements[nzchar(statements)]) DBI::dbExecute(con, statement)
    DBI::dbExecute(con, 'INSERT INTO rf.dataset_snapshot VALUES (?, ?, ?, ?)', params=list('rf-20261102-revetment','RESTORATION.Revetment',hash,basename(xml_file)))
    for (s in out) DBI::dbExecute(con, paste('INSERT INTO rf.revetment',
      '(snapshot_id,restorfeatidpk,feature_name,project_id,program_uid,restorfeatstatus,umrrtype,umrrsubtype,geometry_note)',
      'VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)'), params=list('rf-20261102-revetment',as.numeric(s[[1]]),s[[2]],s[[3]],s[[4]],s[[5]],s[[6]],s[[7]],'Not imported: ArcGIS XML shape bytes are not verified as WKB; CRS unverified.'))
    DBI::dbExecute(con, "INSERT INTO rf.spatial_demo VALUES (1, 'Synthetic geometry; unrelated to any actual feature', ST_GeomFromText('LINESTRING (0 0, 1 1, 2 1)'), 'Synthetic local coordinates; no real-world CRS')")
  })
  invisible(length(out))
}
