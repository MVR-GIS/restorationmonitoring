# Local prototype helpers; no production database connections or writes.
prototype_init <- function(con, schema_file = 'dev/schemas/duckdb-mvp.sql') {
  if (length(DBI::dbListTables(con))) stop('Database is not empty; refusing to initialize it.')
  sql <- paste(readLines(schema_file, warn = FALSE), collapse = '\n')
  statements <- trimws(strsplit(sql, ';', fixed = TRUE)[[1]])
  DBI::dbWithTransaction(con, {
    for (statement in statements[nzchar(statements)]) DBI::dbExecute(con, statement)
  })
  invisible(con)
}

prototype_seed <- function(con, goals_dir = 'dev/goals') {
  questions <- jsonlite::fromJSON(file.path(goals_dir, 'workshop-research-question-register.json'))$questions
  question <- questions$question[questions$local_id == 'WQ-39']
  hypotheses <- jsonlite::fromJSON(file.path(goals_dir, 'mussel-science-evidence.json'))$assertions
  hypothesis <- hypotheses$paraphrase[hypotheses$id == 'SC-08']
  stopifnot(length(question) == 1L, length(hypothesis) == 1L)
  put <- function(sql, ...) DBI::dbExecute(con, sql, params = list(...))
  DBI::dbWithTransaction(con, {
    put('INSERT INTO source_document VALUES (?, ?, ?)', 1L, 'Workshop research question ranks', 'workbook')
    put('INSERT INTO source_document VALUES (?, ?, ?)', 2L, 'Bertom and McCartney Lakes 2014 mussel monitoring report', 'report')
    put('INSERT INTO source_document VALUES (?, ?, ?)', 3L, 'Bertom and McCartney Lakes 1989 definite project report', 'report')
    put('INSERT INTO source_document VALUES (?, ?, ?)', 4L, 'Steamboat Island HREP final feasibility report', 'report')
    put('INSERT INTO source_version VALUES (?, ?, ?, ?, ?)', 1L, 1L, 'supplied workbook', '3ab02f2b077cb2a6547b31a6c9b6d15421c3a54442aa3767a454d731e759d81b', 'dev/checkpoints/archive/research_question_ranks.xlsx')
    put('INSERT INTO source_version VALUES (?, ?, ?, ?, ?)', 2L, 2L, 'January 2015 final report', '7c05c664b29ff5d944df726a7271458c7c57a8c4bba9c765c23e47adc27439a3', 'UMRR/HREPs/Bertrom_McCartney_Lakes/2014_BertomMcCartney_PER_Mussels.pdf')
    put('INSERT INTO source_version VALUES (?, ?, ?, ?, ?)', 3L, 3L, '1989 DPR', '9787b1cca4317f0db2d8a5e255543244547175a04b7b78becd738dc5a9861845', 'UMRR/HREPs/Bertrom_McCartney_Lakes/BertromMcCartneyLakes_DPR_1989.pdf')
    put('INSERT INTO source_version VALUES (?, ?, ?, ?, ?)', 4L, 4L, 'final feasibility report and appendices', 'ce62f059ddf5c9a28feb60647e06093aa00c2572de10c6914390433d4d04544c', 'UMRR/HREPs/SteamboatIsland/Steamboat Island HREP - Final Report w Appendices.pdf')
    put('INSERT INTO source_passage VALUES (?, ?, ?, ?)', 1L, 1L, 'Ranked by Reach!C41', question)
    put('INSERT INTO source_passage VALUES (?, ?, ?, ?)', 2L, 2L, 'printed p. 7; PDF p. 8', NA_character_)
    put('INSERT INTO source_passage VALUES (?, ?, ?, ?)', 3L, 3L, 'table 4-1, printed p. 10; PDF p. 25', NA_character_)
    put('INSERT INTO source_passage VALUES (?, ?, ?, ?)', 4L, 4L, 'printed III-15, PDF p. 81; printed K-5, PDF p. 698', NA_character_)
    put('INSERT INTO source_passage VALUES (?, ?, ?, ?)', 5L, 4L, 'printed K-10; PDF p. 703', NA_character_)
    put('INSERT INTO source_passage VALUES (?, ?, ?, ?)', 6L, 2L, 'printed pp. 3-4; PDF pp. 4-5', NA_character_)
    put('INSERT INTO external_system VALUES (?, ?)', 1L, 'UMRRDB export')
    put('INSERT INTO external_reference VALUES (?, ?, ?, ?, ?)', 1L, 1L, 'project', 'UMRRDB.Projects', '65')
    put('INSERT INTO research_question VALUES (?, ?, ?, ?, ?)', 1L, question, 'workshop workbook', 1L, 'source-reported')
    put('INSERT INTO hypothesis VALUES (?, ?, ?, ?, ?)', 1L, hypothesis, 'assistant formulation', NA_integer_, 'assistant-proposed')
    put('INSERT INTO question_hypothesis VALUES (?, ?, ?, ?, ?, ?, ?, ?)', 1L, 1L, 1L, 'proposed relevance', 1L, 'analyst', 'assistant-proposed', 'Not an adopted hypothesis or completed study.')
    put('INSERT INTO study VALUES (?)', 1L)
    put('INSERT INTO study_version VALUES (?, ?, ?, ?, ?)', 1L, 1L, 1L, 'Bertom 2014 mussel survey', 'Report-described historical survey; study identity is a local prototype interpretation.')
    put('INSERT INTO study_event VALUES (?, ?, ?, CAST(? AS DATE), CAST(? AS DATE), ?, ?)', 1L, 1L, 'Bertom mussel survey', '2014-10-07', '2014-10-09', 'day', 6L)
    put('INSERT INTO question_study VALUES (?, ?, ?, ?, ?, ?, ?, ?)', 1L, 1L, 1L, 'later candidate relevance', 1L, 'analyst', 'assistant-proposed', 'Not evidence of the survey original purpose.')
    put('INSERT INTO project_objective VALUES (?, ?, ?, ?, ?, ?)', 1L, 'Increase rock substrate aquatic habitat', NA_integer_, NA_integer_, 3L, 'source-reported')
    put('INSERT INTO project_objective VALUES (?, ?, ?, ?, ?, ?)', 2L, 'Establish mussel bed', NA_integer_, NA_integer_, 3L, 'source-reported')
    put('INSERT INTO project_objective VALUES (?, ?, ?, ?, ?, ?)', 3L, 'Island restoration and protection: restore 50% of lost island acreage/topography and protect it from erosion', NA_integer_, NA_integer_, 4L, 'source-reported')
    put('INSERT INTO performance_criterion VALUES (?, ?, CAST(? AS DATE), ?, ?, ?)', 1L, 'At 10 years, affected island acreage is not less than as-built acreage', NA_character_, NA_integer_, 5L, 'source-reported')
    put('INSERT INTO objective_criterion VALUES (?, ?, ?, ?)', 3L, 1L, 5L, 'Steamboat planned criterion; not an evaluation result.')
    put('INSERT INTO finding VALUES (?)', 1L)
    put('INSERT INTO finding_version VALUES (?, ?, ?, ?, ?, ?, ?, CAST(? AS TIMESTAMP))', 1L, 1L, 1L, 1L, '40 live mussels representing 11 species were reported for the habitat channel across methods.', 'survey aggregate', 'source-reported', '2026-11-05 00:00:00')
    put('INSERT INTO finding_passage VALUES (?, ?, ?, ?)', 1L, 2L, 'reported in', 'No raw individual observations reconstructed.')
    put('INSERT INTO study_external_link VALUES (?, ?, ?, ?, ?, CAST(? AS DATE), CAST(? AS DATE), ?, CAST(? AS TIMESTAMP))', 1L, 1L, 1L, 'candidate project context', 'Project match not validated as EMMA identity.', NA_character_, NA_character_, 'candidate', '2026-11-05 00:00:00')
    put('INSERT INTO study_link_passage VALUES (?, ?, ?)', 1L, 2L, 'project context')
    put('INSERT INTO assessment VALUES (?, ?, ?, CAST(? AS DATE), ?, ?, ?)', 1L, 'Hypothetical: reviewed material is insufficient to determine attainment of the historical target.', 'evidence sufficiency', NA_character_, NA_integer_, 'synthetic illustration', 'hypothetical')
    put('INSERT INTO assessment_finding VALUES (?, ?, ?, ?, ?)', 1L, 1L, 'considered', 'Synthetic example, not a practitioner assessment.', NA_integer_)
    put('INSERT INTO decision VALUES (?, ?, ?, CAST(? AS DATE), ?, ?, ?)', 1L, 'Hypothetical: defer a target-attainment decision pending evidence.', 'deferral', NA_character_, NA_character_, NA_integer_, 'hypothetical')
    put('INSERT INTO assessment_decision VALUES (?, ?, ?, ?)', 1L, 1L, 'Synthetic model illustration only.', NA_integer_)
  })
  invisible(con)
}
