# Build a fresh RF prototype and stage a GeoPackage layer for inspection.
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 5L) stop('Supply NEW database, source XML, GeoPackage, layer name and installed extension directory.')
path <- args[[1]]; xml <- args[[2]]; gpkg <- args[[3]]; layer <- args[[4]]; ext <- args[[5]]
if (file.exists(path)) stop('Destination exists; refusing to overwrite.')
if (!dir.exists(dirname(path)) || !dir.exists(ext)) stop('Database parent and extension directory must exist.')
source('dev/scripts/duckdb-prototype-lib.R', local = TRUE)
source('dev/scripts/duckdb-rf-lib.R', local = TRUE)
source('dev/scripts/duckdb-rf-geopackage-lib.R', local = TRUE)
con <- DBI::dbConnect(duckdb::duckdb(), dbdir = path)
tryCatch({
  DBI::dbExecute(con, paste0('SET extension_directory=', DBI::dbQuoteString(con, normalizePath(ext, winslash = '/'))))
  DBI::dbExecute(con, 'LOAD spatial')
  prototype_init(con); prototype_seed(con); rf_import_bertom(con, xml)
  result <- rf_stage_geopackage(con, gpkg, layer)
  print(result$source[, setdiff(names(result$source), 'crs_wkt'), drop = FALSE])
  print(result$counts); print(result$comparison); print(result$unmatched)
}, finally = DBI::dbDisconnect(con, shutdown = TRUE))
cat(normalizePath(path, winslash = '/', mustWork = TRUE), '\n')
