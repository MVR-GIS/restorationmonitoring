# Rscript dev/scripts/duckdb-multi-report.R database.duckdb output.html question|survey|project id [TRUE|FALSE]
args <- commandArgs(trailingOnly=TRUE)
if (length(args) < 4L || length(args) > 5L) stop('Supply database, new HTML path, starting type, ID and optional TRUE/FALSE.')
database <- args[[1]]; output <- args[[2]]; start_type <- args[[3]]
start_id <- suppressWarnings(as.numeric(args[[4]]))
if (length(args)==5L && !args[[5]] %in% c('TRUE','FALSE')) stop('Fifth argument must be TRUE or FALSE.')
include <- length(args)==5L && args[[5]]=='TRUE'
if (!file.exists(database)) stop('Database does not exist.')
if (file.exists(paste0(database,'.wal'))) stop('Checkpoint the database with other connections closed before taking a fingerprinted report snapshot.')
if (file.exists(output)) stop('Output already exists; refusing to overwrite.')
if (!dir.exists(dirname(output))) stop('Output directory does not exist.')
if (!requireNamespace('duckdb',quietly=TRUE) || !requireNamespace('DBI',quietly=TRUE)) stop('Install DBI and duckdb.')
source('dev/scripts/duckdb-multi-report-lib.R', local=TRUE)
before <- unname(tools::md5sum(database))
con <- DBI::dbConnect(duckdb::duckdb(), dbdir=database, read_only=TRUE)
summary <- tryCatch(duckdb_multi_summary(con, start_type, start_id, include), finally=DBI::dbDisconnect(con, shutdown=TRUE))
if (file.exists(paste0(database,'.wal')) || !identical(before, unname(tools::md5sum(database)))) stop('Database changed during read.')
summary$database_md5 <- before
summary$generated_at <- format(Sys.time(), tz='UTC', usetz=TRUE)
summary$duckdb_version <- as.character(utils::packageVersion('duckdb'))
rendered <- rmarkdown::render('inst/reports/duckdb_multi_report.Rmd', output_dir=tempdir(),
  output_file=paste0('duckdb-multi-',Sys.getpid(),'.html'), params=list(report=summary),
  envir=new.env(parent=globalenv()), quiet=TRUE, encoding='UTF-8')
html <- paste(readLines(rendered,encoding='UTF-8',warn=FALSE),collapse='\n')
if (grepl('<pre[^>]*><code[^>]*>\\s*## (Warning|Error)',html,perl=TRUE)) stop('Rendered warning or error.')
if (!isTRUE(suppressWarnings(file.link(rendered,output)))) stop('Could not publish without replacement.')
cat(normalizePath(output,winslash='/',mustWork=TRUE),'\n')
