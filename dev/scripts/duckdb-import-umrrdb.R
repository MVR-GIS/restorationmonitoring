# Add an explicitly named projects layer from an export to a local prototype.
args <- commandArgs(trailingOnly=TRUE)
if (length(args) != 4L) stop('Supply EXISTING local DuckDB database, UMRR-DB GeoPackage, exact projects layer name and extension directory.')
path <- args[1]; gpkg <- args[2]; layer <- args[3]; ext <- args[4]
if (!file.exists(path) || !dir.exists(ext)) stop('Local database or extension directory not found.')
source('dev/scripts/duckdb-geopackage-import-lib.R', local=TRUE)
con <- DBI::dbConnect(duckdb::duckdb(), dbdir=path)
tryCatch({
  DBI::dbExecute(con, paste0('SET extension_directory=', DBI::dbQuoteString(con, normalizePath(ext, winslash='/'))))
  DBI::dbExecute(con, 'LOAD spatial')
  print(import_geopackage_snapshot(con, gpkg, 'umrrdb', layers=layer))
}, finally=DBI::dbDisconnect(con, shutdown=TRUE))
