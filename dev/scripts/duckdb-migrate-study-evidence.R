args <- commandArgs(trailingOnly=TRUE)
if (length(args)!=2L) stop('Supply EXISTING database and NEW database path.')
old <- args[1]; new <- args[2]
if (!file.exists(old) || file.exists(new) || !dir.exists(dirname(new))) stop('Input must exist and output must be a new file in an existing directory.')
file <- 'dev/goals/mussel-vital-rates-instance.json'
x <- jsonlite::fromJSON(file,simplifyVector=FALSE)
if (length(x$chain)!=10L || length(x$review_flags)!=5L || length(x$files)!=3L) stop('Unexpected instance record counts.')
source('dev/scripts/duckdb-copy-checkpoint.R',local=TRUE)
copy_checkpointed_database(old,new)
con <- DBI::dbConnect(duckdb::duckdb(),dbdir=new)
tryCatch({
  sql <- paste(readLines('dev/schemas/duckdb-study-evidence.sql',warn=FALSE),collapse='\n')
  statements <- trimws(strsplit(sql,';',fixed=TRUE)[[1]])
  put <- function(sql,...) DBI::dbExecute(con,sql,params=list(...))
  DBI::dbWithTransaction(con,{
    for(s in statements[nzchar(statements)]) DBI::dbExecute(con,s)
    put('INSERT INTO research_register.study_evidence_instance VALUES (?, ?, CAST(? AS DATE), ?, ?, ?, ?, ?, ?, ?, ?)',x$id,x$status,x$reviewed,x$source_id,x$assertion_id,x$hypothesis_id,x$reading_depth,x$publication_url,x$dataset_doi,x$dataset_url,digest::digest(file=file,algo='sha256',serialize=FALSE))
    for(i in seq_along(x$chain)) { z<-x$chain[[i]]; put('INSERT INTO research_register.study_evidence_component VALUES (?, ?, ?, ?, ?, ?)',x$id,i,z$object,z$record,z$locator,z$basis) }
    for(i in seq_along(x$review_flags)) put('INSERT INTO research_register.study_evidence_review_flag VALUES (?, ?, ?)',x$id,i,x$review_flags[[i]])
    for(z in x$files) put('INSERT INTO research_register.study_evidence_file VALUES (?, ?, ?, ?, ?, ?, ?)',x$id,z$name,z$source_name,z$md5,z$url,if(is.null(z$rows)) NA_integer_ else z$rows,if(is.null(z$columns)) NA_integer_ else z$columns)
  })
  print(DBI::dbGetQuery(con,'SELECT component_type,source_locator,basis FROM research_register.study_evidence_component ORDER BY position'))
},finally=DBI::dbDisconnect(con,shutdown=TRUE))
cat(normalizePath(new,winslash='/'),'\n')
