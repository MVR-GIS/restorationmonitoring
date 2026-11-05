# Run from the repository root: Rscript dev/scripts/duckdb-prototype.R [new-file.duckdb]
args <- commandArgs(trailingOnly = TRUE)
if (length(args) > 1L) stop('Supply at most one new database path.')
if (!requireNamespace('DBI', quietly = TRUE) || !requireNamespace('duckdb', quietly = TRUE))
  stop('Install DBI and duckdb to run the prototype.')
source('dev/scripts/duckdb-prototype-lib.R', local = TRUE)
path <- if (length(args)) args[[1]] else 'dev/outputs/duckdb/restoration-prototype-v1-reviewed.duckdb'
if (file.exists(path)) stop('Destination already exists; refusing to overwrite: ', path)
dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
con <- DBI::dbConnect(duckdb::duckdb(), dbdir = path)
tryCatch({
  prototype_init(con)
  prototype_seed(con)
  print(DBI::dbGetQuery(con, 'SELECT question_id, question_text, record_status FROM research_question'))
  print(DBI::dbGetQuery(con, 'SELECT finding_text, authorship_status FROM finding_version'))
  print(DBI::dbGetQuery(con, 'SELECT relation_type, relation_status, scope_note, finding_text, source_locator FROM question_finding_path'))
}, finally = DBI::dbDisconnect(con, shutdown = TRUE))
cat('Created local prototype:', normalizePath(path, winslash = '/'), '\n')
