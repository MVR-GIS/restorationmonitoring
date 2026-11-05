# Rscript dev/scripts/duckdb-rf-build.R new-database.duckdb source.xml extension-directory
args <- commandArgs(trailingOnly=TRUE)
if (length(args) != 3L) stop('Supply a new database path, source XML and installed DuckDB extension directory.')
path <- args[[1]]; xml_file <- args[[2]]; ext_dir <- args[[3]]
if (file.exists(path)) stop('Destination exists; refusing to overwrite.')
if (!dir.exists(dirname(path)) || !dir.exists(ext_dir)) stop('Database parent and extension directory must exist.')
source('dev/scripts/duckdb-prototype-lib.R', local=TRUE)
source('dev/scripts/duckdb-rf-lib.R', local=TRUE)
con <- DBI::dbConnect(duckdb::duckdb(), dbdir=path)
tryCatch({
  DBI::dbExecute(con, paste0('SET extension_directory=', DBI::dbQuoteString(con, normalizePath(ext_dir, winslash='/'))))
  DBI::dbExecute(con, 'LOAD spatial')
  prototype_init(con); prototype_seed(con); rf_import_bertom(con, xml_file)
  print(DBI::dbGetQuery(con, 'SELECT restorfeatidpk, feature_name, project_id, geometry_note FROM rf.revetment ORDER BY restorfeatidpk'))
  print(DBI::dbGetQuery(con, 'SELECT description, ST_AsText(geometry) AS wkt FROM rf.spatial_demo'))
}, finally=DBI::dbDisconnect(con, shutdown=TRUE))
cat(normalizePath(path, winslash='/', mustWork=TRUE), '\n')
