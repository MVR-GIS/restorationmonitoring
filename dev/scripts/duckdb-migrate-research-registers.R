# One-time migration from reviewed worksheets into a new local database copy.
args <- commandArgs(trailingOnly=TRUE)
if (length(args) != 2L) stop('Supply EXISTING database and NEW database path.')
old <- args[1]; new <- args[2]
if (!file.exists(old) || file.exists(new) || !dir.exists(dirname(new))) stop('Input must exist and output must be a new file in an existing directory.')
if (!requireNamespace('digest', quietly=TRUE)) stop('Install digest.')
inputs <- file.path('dev/goals',c('workshop-research-question-register.json','mussel-workshop-question-links.json','mussel-science-evidence.json'))
data <- lapply(inputs, jsonlite::fromJSON, simplifyVector=TRUE)
w <- data[[1]]; links <- data[[2]]; science <- data[[3]]
if (!identical(w$source_md5, links$workbook_md5)) stop('Workshop and relevance link workbook hashes differ.')
if (!identical(unname(tools::md5sum(w$source_file)), w$source_md5)) stop('Workshop workbook differs from reviewed source.')
if (nrow(w$questions)!=49 || nrow(w$recorded_project_marks)!=20 || nrow(links$links)!=4 || nrow(science$sources)!=6 || nrow(science$assertions)!=8) stop('Unexpected worksheet counts; review before migration.')
source('dev/scripts/duckdb-copy-checkpoint.R', local=TRUE)
copy_checkpointed_database(old,new)
con <- DBI::dbConnect(duckdb::duckdb(), dbdir=new)
tryCatch({
  sql <- paste(readLines('dev/schemas/duckdb-research-registers.sql',warn=FALSE),collapse='\n')
  statements <- trimws(strsplit(sql,';',fixed=TRUE)[[1]])
  put <- function(sql, ...) DBI::dbExecute(con,sql,params=list(...))
  nil <- function(x) if (is.null(x) || !length(x) || is.na(x[[1]])) NA_character_ else as.character(x[[1]])
  DBI::dbWithTransaction(con, {
    for (s in statements[nzchar(statements)]) DBI::dbExecute(con,s)
    for (f in inputs) put('INSERT INTO research_register.migration_source VALUES (?, ?, ?)',basename(f),digest::digest(file=f,algo='sha256',serialize=FALSE),'one-time reviewed worksheet migration')
    put('INSERT INTO research_register.workshop VALUES (?, ?, ?, ?, ?, ?)', 'workshop-2026',w$source_file,w$source_md5,w$rank_definition,w$identifier_note,w$method)
    for(i in seq_along(w$limitations)) put('INSERT INTO research_register.workshop_limitation VALUES (?, ?, ?)', 'workshop-2026',i,w$limitations[[i]])
    reaches <- c('upper_impounded','lower_impounded','unimpounded','illinois_river')
    for(i in seq_along(reaches)) put('INSERT INTO research_register.workshop_reach VALUES (?, ?, ?, ?)',reaches[i],'workshop-2026',w$reach_labels[[i]],i)
    q <- w$questions; goals <- unique(q$restoration_goal)
    for(i in seq_along(goals)) put('INSERT INTO research_register.workshop_goal VALUES (?, ?)',i,goals[i])
    objective_keys <- unique(q[c('restoration_goal','restoration_objective')])
    for(i in seq_len(nrow(objective_keys))) put('INSERT INTO research_register.workshop_objective VALUES (?, ?, ?)',i,match(objective_keys$restoration_goal[i],goals),objective_keys$restoration_objective[i])
    for(i in seq_len(nrow(q))) {
      oid <- which(objective_keys$restoration_goal == q$restoration_goal[i] & objective_keys$restoration_objective == q$restoration_objective[i])
      stopifnot(length(oid)==1L)
      put('INSERT INTO research_register.workshop_question VALUES (?, ?, ?, ?, ?)',q$local_id[i],'workshop-2026',oid,q$source_cell[i],q$question[i])
      for(reach in reaches) put('INSERT INTO research_register.workshop_rank VALUES (?, ?, ?)',q$local_id[i],reach,q[[reach]][i])
    }
    marks <- w$recorded_project_marks
    for(i in seq_len(nrow(marks))) put('INSERT INTO research_register.workshop_project_mark VALUES (?, ?, ?, ?, ?, ?)',i,marks$local_question_id[i],marks$reach[i],marks$cell[i],marks$project_label[i],marks$mark[i])
    for(i in seq_len(nrow(links$links))) put('INSERT INTO research_register.pilot_question_link VALUES (?, ?, ?, ?, ?)',links$links$question_id[i],links$links$role[i],links$links$rationale[i],links$status,links$scope)
    for(i in seq_len(nrow(science$sources))) { x<-science$sources[i,]; put('INSERT INTO research_register.science_source VALUES (?, ?, ?, ?, ?)',x$id,nil(x$zotero_item_key),nil(x$doi),nil(x$source_url),x$reading_depth) }
    for(i in seq_len(nrow(science$assertions))) { x<-science$assertions[i,]; put('INSERT INTO research_register.science_assertion VALUES (?, ?, ?, ?, ?, ?, ?, ?)',x$id,nil(x$source_id),x$kind,x$paraphrase,nil(x$source_locator),nil(x$limit),x$extraction_status,nil(x$full_text_scope)) }
    for(i in seq_len(nrow(science$assertions))) for(parent in unlist(science$assertions$informed_by[[i]],use.names=FALSE)) put('INSERT INTO research_register.assertion_derivation VALUES (?, ?)',science$assertions$id[i],parent)
  })
  print(DBI::dbGetQuery(con,"SELECT 'questions' AS item, count(*) AS n FROM research_register.workshop_question UNION ALL SELECT 'ranks',count(*) FROM research_register.workshop_rank UNION ALL SELECT 'project marks',count(*) FROM research_register.workshop_project_mark UNION ALL SELECT 'assertions',count(*) FROM research_register.science_assertion"))
}, finally=DBI::dbDisconnect(con,shutdown=TRUE))
cat(normalizePath(new,winslash='/'), '\n')
