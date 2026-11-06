# Query only. Rendering and publication are separate from scientific approval.
steamboat_duckdb_summary <- function(con) {
  get <- function(sql) DBI::dbGetQuery(con,sql)
  if (get('SELECT count(*) n FROM research_alignment_issues')$n != 0) stop('Research identity alignment requires reconciliation.')
  r <- list(
    plan=get("SELECT * FROM research_register.plan_extraction WHERE plan_id='steamboat-feasibility'"),
    benefit=get("SELECT * FROM research_register.plan_benefit WHERE plan_id='steamboat-feasibility'"),
    objectives=get('SELECT objective_id,objective_name,normalized_text FROM research_register.plan_objective ORDER BY objective_id'),
    criteria=get('SELECT c.criterion_id,l.objective_id,c.statement_kind,c.summary,c.qualification,c.scope_note,l.relation_status FROM research_register.plan_criterion c JOIN research_register.plan_objective_criterion l ON l.criterion_id=c.criterion_id ORDER BY c.criterion_id'),
    target=get('SELECT * FROM research_register.plan_target ORDER BY criterion_id'),
    conditions=get('SELECT * FROM research_register.plan_target_condition ORDER BY criterion_id,position'),
    series=get('SELECT * FROM research_register.plan_target_series ORDER BY criterion_id,series_label,target_year'),
    triggers=get('SELECT trigger_id,objective_id,condition_text,proposed_action FROM research_register.plan_trigger ORDER BY trigger_id'),
    issues=get('SELECT issue_id,issue_text FROM research_register.plan_reconciliation_issue ORDER BY issue_id'),
    passages=get("SELECT 'objective' AS kind, e.objective_id AS item,p.pdf_page,p.printed_page,p.section_label FROM research_register.plan_objective_passage e JOIN research_register.plan_passage p ON p.passage_id=e.passage_id UNION ALL SELECT 'criterion',e.criterion_id,p.pdf_page,p.printed_page,p.section_label FROM research_register.plan_criterion_passage e JOIN research_register.plan_passage p ON p.passage_id=e.passage_id UNION ALL SELECT 'trigger',e.trigger_id,p.pdf_page,p.printed_page,p.section_label FROM research_register.plan_trigger_passage e JOIN research_register.plan_passage p ON p.passage_id=e.passage_id UNION ALL SELECT 'ancillary benefit',e.plan_id,p.pdf_page,p.printed_page,p.section_label FROM research_register.plan_benefit_passage e JOIN research_register.plan_passage p ON p.passage_id=e.passage_id ORDER BY kind,item,pdf_page"),
    hypothesis=get("SELECT * FROM proposed_hypothesis_science WHERE assertion_id='SC-08'"),
    assertions=get('SELECT assertion_id,source_id,assertion_kind,paraphrase,source_locator,limitation,extraction_status FROM research_register.science_assertion ORDER BY assertion_id'),
    sources=get('SELECT * FROM research_register.science_source ORDER BY source_id'),
    derivations=get('SELECT * FROM research_register.assertion_derivation ORDER BY assertion_id,informed_by_id'),
    instance=get("SELECT * FROM research_register.study_evidence_instance WHERE instance_id='MS03-instance-20261021'"),
    chain=get("SELECT position,component_type,description,source_locator,basis FROM research_register.study_evidence_component WHERE instance_id='MS03-instance-20261021' ORDER BY position"),
    flags=get("SELECT position,flag FROM research_register.study_evidence_review_flag WHERE instance_id='MS03-instance-20261021' ORDER BY position"),
    files=get("SELECT source_name,md5,source_url,row_count,column_count FROM research_register.study_evidence_file WHERE instance_id='MS03-instance-20261021' ORDER BY local_name"),
    questions=get('SELECT question_id,workshop_question_id,question_text FROM workshop_question_model ORDER BY workshop_question_id'),
    ranks=get('SELECT * FROM workshop_rank_model ORDER BY workshop_question_id,reach_id'),
    pilot_links=get('SELECT * FROM research_register.pilot_question_link ORDER BY question_id'),
    workshop=get('SELECT * FROM research_register.workshop'),
    workshop_limits=get('SELECT limitation FROM research_register.workshop_limitation ORDER BY position'),
    workbook_marks=get('SELECT * FROM research_register.workshop_project_mark ORDER BY mark_id'))
  if(nrow(r$plan)!=1L || nrow(r$benefit)!=1L || nrow(r$hypothesis)!=1L || nrow(r$instance)!=1L || nrow(r$chain)!=10L) stop('Incomplete Steamboat data; refusing to render.')
  r
}
