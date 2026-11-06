test_that('Steamboat plan rows preserve source wording, targets, locators and qualifications', {
  skip_if_not_installed('DBI'); skip_if_not_installed('duckdb'); skip_if_not_installed('jsonlite')
  root <- normalizePath(test_path('..','..'),winslash='/')
  db <- file.path(root,'dev/outputs/duckdb/restoration-steamboat-plan-v3.duckdb')
  skip_if_not(file.exists(db),'Local migrated plan database unavailable')
  x <- jsonlite::fromJSON(file.path(root,'dev/goals/steamboat-island-objectives-criteria.json'),simplifyVector=FALSE)
  con <- DBI::dbConnect(duckdb::duckdb(),dbdir=db,read_only=TRUE)
  on.exit(DBI::dbDisconnect(con,shutdown=TRUE),add=TRUE)
  for(o in x$objectives) {
    row <- DBI::dbGetQuery(con,'SELECT normalized_text FROM research_register.plan_objective WHERE objective_id=?',params=list(o$id))
    expect_equal(row$normalized_text,o$source_text_normalized)
    e <- DBI::dbGetQuery(con,'SELECT p.pdf_page FROM research_register.plan_objective_passage e JOIN research_register.plan_passage p ON p.passage_id=e.passage_id WHERE e.objective_id=? ORDER BY p.pdf_page',params=list(o$id))
    expect_equal(as.integer(e$pdf_page),sort(as.integer(vapply(o$evidence,`[[`,0L,'pdf_page_1based'))))
  }
  for(z in x$criteria) {
    row <- DBI::dbGetQuery(con,'SELECT summary, statement_kind, qualification FROM research_register.plan_criterion WHERE criterion_id=?',params=list(z$id))
    expect_equal(row$summary,z$summary)
    expect_equal(row$statement_kind,z$statement_kind)
    if (!is.null(z$qualification)) expect_equal(row$qualification,z$qualification)
    links <- DBI::dbGetQuery(con,'SELECT objective_id,relation_status FROM research_register.plan_objective_criterion WHERE criterion_id=?',params=list(z$id))
    expect_equal(links$objective_id,z$objective_id)
    expect_equal(links$relation_status,'analyst-proposed')
    if (!is.null(z$target_series)) {
      ts <- z$target_series
      for(n in setdiff(names(ts),c('years','unit','year_0_basis','later_years_basis'))) {
        actual <- DBI::dbGetQuery(con,'SELECT target_year,value_as_reported FROM research_register.plan_target_series WHERE criterion_id=? AND series_label=? ORDER BY target_year',params=list(z$id,n))
        expect_equal(as.integer(actual$target_year),as.integer(unlist(ts$years)))
        expect_equal(actual$value_as_reported,as.character(unlist(ts[[n]])))
      }
    }
  }
  for(t in x$response_triggers) {
    row <- DBI::dbGetQuery(con,'SELECT condition_text,proposed_action FROM research_register.plan_trigger WHERE trigger_id=?',params=list(t$id))
    expect_equal(row$condition_text,t$condition); expect_equal(row$proposed_action,t$action)
  }
  expect_equal(DBI::dbGetQuery(con,'SELECT count(*) n FROM rf.import_layer')$n,27)
  expect_equal(DBI::dbGetQuery(con,'SELECT count(*) n FROM research_register.plan_reconciliation_issue')$n,4)
  expect_equal(DBI::dbGetQuery(con,'SELECT count(*) n FROM research_register.plan_target_condition')$n,10)
  expect_equal(DBI::dbGetQuery(con,'SELECT referenced_criterion_id FROM research_register.plan_criterion_reference WHERE criterion_id=\'SI-C05\'')$referenced_criterion_id,'SI-C03')
})
