# Align local workshop and science records in a new database copy.
args <- commandArgs(trailingOnly=TRUE)
if (length(args) != 2L) stop('Supply EXISTING database and NEW database path.')
if (!file.exists(args[1]) || file.exists(args[2]) || !dir.exists(dirname(args[2]))) stop('Input must exist and output must be a new file in an existing directory.')
source('dev/scripts/duckdb-copy-checkpoint.R', local=TRUE)
copy_checkpointed_database(args[1],args[2])
con <- DBI::dbConnect(duckdb::duckdb(),dbdir=args[2])
tryCatch({
  sql <- paste(readLines('dev/schemas/duckdb-research-alignment.sql',warn=FALSE),collapse='\n')
  statements <- trimws(strsplit(sql,';',fixed=TRUE)[[1]])
  DBI::dbWithTransaction(con, {
    q <- DBI::dbGetQuery(con,'SELECT question_id, source_cell, question_text FROM research_register.workshop_question ORDER BY question_id')
    if (nrow(q)!=49L || anyDuplicated(q$question_id)) stop('Unexpected workshop question set.')
    old <- DBI::dbGetQuery(con,'SELECT question_text FROM research_question WHERE question_id=1')
    anchor <- q[q$question_id=='WQ-39',,drop=FALSE]
    if (nrow(old)!=1L || nrow(anchor)!=1L || !identical(old$question_text,anchor$question_text)) stop('WQ-39 differs from the existing prototype; reconcile before mapping.')
    h <- DBI::dbGetQuery(con,"SELECT h.hypothesis_text, a.paraphrase FROM hypothesis h CROSS JOIN research_register.science_assertion a WHERE h.hypothesis_id=1 AND a.assertion_id='SC-08'")
    if (nrow(h)!=1L || !identical(h$hypothesis_text,h$paraphrase)) stop('SC-08 differs from the existing prototype; reconcile before mapping.')
    for (s in statements[nzchar(statements)]) DBI::dbExecute(con,s)
    for (i in seq_len(nrow(q))) {
      local <- q$question_id[i]; num <- as.integer(sub('WQ-','',local,fixed=TRUE))
      id <- if (local=='WQ-39') 1L else num+1L
      if (local!='WQ-39') {
        passage <- 100L+num
        DBI::dbExecute(con,'INSERT INTO source_passage VALUES (?, 1, ?, ?)',params=list(passage,paste0('Ranked by Reach!',q$source_cell[i]),q$question_text[i]))
        DBI::dbExecute(con,"INSERT INTO research_question VALUES (?, ?, 'workshop workbook', ?, 'source-reported')",params=list(id,q$question_text[i],passage))
      }
      DBI::dbExecute(con,"INSERT INTO question_register_identity VALUES (?, ?, 'same local workshop record', 'Migration reconciled exact question wording and worksheet identifier.')",params=list(id,local))
      DBI::dbExecute(con,"INSERT INTO question_source SELECT question_id, source_passage_id, 'documented in', NULL, 'source-reported', NULL FROM research_question WHERE question_id=? AND source_passage_id IS NOT NULL",params=list(id))
    }
    DBI::dbExecute(con,"INSERT INTO hypothesis_assertion_identity VALUES (1, 'SC-08', 'same local proposed formulation', 'Migration reconciled exact formulation text; not a claim of adoption.')")
    check <- DBI::dbGetQuery(con,'SELECT count(*) AS n FROM workshop_question_model WHERE question_text IS NOT NULL')$n
    if (check!=49) stop('Question alignment incomplete.')
  })
  print(DBI::dbGetQuery(con,'SELECT count(*) AS questions FROM workshop_question_model'))
  print(DBI::dbGetQuery(con,'SELECT count(*) AS reach_ranks FROM workshop_rank_model'))
  print(DBI::dbGetQuery(con,'SELECT hypothesis_id, assertion_id, record_status FROM proposed_hypothesis_science'))
},finally=DBI::dbDisconnect(con,shutdown=TRUE))
cat(normalizePath(args[2],winslash='/'),'\n')
