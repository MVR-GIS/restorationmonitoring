# Rscript dev/scripts/duckdb-question-report.R database.duckdb new-report.html [question-id] [include-hypothetical]
args <- commandArgs(trailingOnly=TRUE)
if (length(args) < 2L || length(args) > 4L) stop('Supply database, new HTML path, optional question ID and optional TRUE/FALSE.')
database <- args[[1]]
output <- args[[2]]
if (!file.exists(database)) stop('Database does not exist: ', database)
if (file.exists(output)) stop('Output already exists; refusing to overwrite: ', output)
if (!dir.exists(dirname(output))) stop('Output directory does not exist.')
if (!requireNamespace('duckdb', quietly=TRUE) || !requireNamespace('DBI', quietly=TRUE)) stop('Install DBI and duckdb.')
question_id <- if (length(args) >= 3L) suppressWarnings(as.numeric(args[[3]])) else 1
if (length(args) == 4L && !args[[4]] %in% c('TRUE','FALSE')) stop('Fourth argument must be TRUE or FALSE.')
include_hypothetical <- length(args) == 4L && args[[4]] == 'TRUE'
source('dev/scripts/duckdb-report-lib.R', local=TRUE)
before <- unname(tools::md5sum(database))
con <- DBI::dbConnect(duckdb::duckdb(), dbdir=database, read_only=TRUE)
summary <- tryCatch(duckdb_question_summary(con, question_id, include_hypothetical),
                    finally=DBI::dbDisconnect(con, shutdown=TRUE))
if (!identical(before, unname(tools::md5sum(database)))) stop('Database changed during read.')
summary$database_md5 <- before
summary$generated_at <- format(Sys.time(), tz='UTC', usetz=TRUE)
summary$duckdb_version <- as.character(utils::packageVersion('duckdb'))
rendered <- rmarkdown::render('inst/reports/duckdb_question_report.Rmd',
  output_dir=tempdir(), output_file=paste0('duckdb-question-', Sys.getpid(), '.html'),
  params=list(report=summary), envir=new.env(parent=globalenv()), quiet=TRUE, encoding='UTF-8')
html <- paste(readLines(rendered, encoding='UTF-8', warn=FALSE), collapse='\n')
if (grepl('<pre[^>]*><code[^>]*>\\s*## (Warning|Error)', html, perl=TRUE)) stop('Rendered warning or error.')
if (!isTRUE(suppressWarnings(file.link(rendered, output)))) stop('Could not publish without replacement.')
cat(normalizePath(output, winslash='/', mustWork=TRUE), '\n')
