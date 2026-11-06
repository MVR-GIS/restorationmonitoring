# Build a new local prototype containing the full Restoration Features export.
args <- commandArgs(trailingOnly=TRUE)
if (length(args) != 4L) stop('Supply NEW database, RF XML, RF GeoPackage and extension directory.')
path <- args[1]; xml <- args[2]; gpkg <- args[3]; ext <- args[4]
if (file.exists(path)) stop('Destination exists; refusing to overwrite.')
if (!dir.exists(dirname(path)) || !dir.exists(ext)) stop('Database parent and extension directory must exist.')
source('dev/scripts/duckdb-prototype-lib.R', local=TRUE)
source('dev/scripts/duckdb-rf-lib.R', local=TRUE)
source('dev/scripts/duckdb-geopackage-import-lib.R', local=TRUE)
con <- DBI::dbConnect(duckdb::duckdb(), dbdir=path)
tryCatch({
  DBI::dbExecute(con, paste0('SET extension_directory=', DBI::dbQuoteString(con, normalizePath(ext, winslash='/'))))
  DBI::dbExecute(con, 'LOAD spatial')
  prototype_init(con); prototype_seed(con); rf_import_bertom(con, xml)
  print(import_geopackage_snapshot(con, gpkg, 'rf'))
}, finally=DBI::dbDisconnect(con, shutdown=TRUE))
cat(normalizePath(path, winslash='/', mustWork=TRUE), '\n')
