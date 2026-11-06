# Bounded relational traversal for three starting points; no inferred joins.
duckdb_multi_summary <- function(con, start_type, start_id, include_hypothetical=FALSE) {
  if (length(start_type) != 1L || is.na(start_type) || !start_type %in% c('question','survey','project')) stop('Unknown starting type.')
  if (length(start_id) != 1L || !is.numeric(start_id) || is.na(start_id) || !is.finite(start_id) || start_id < 1 || start_id != floor(start_id) || start_id > .Machine$integer.max) stop('Supply one positive integer ID.')
  if (!is.logical(include_hypothetical) || length(include_hypothetical) != 1L || is.na(include_hypothetical)) stop('include_hypothetical must be TRUE or FALSE.')
  has_alignment <- DBI::dbGetQuery(con, "SELECT count(*) AS n FROM information_schema.views WHERE table_schema='main' AND table_name='research_alignment_issues'")$n == 1
  if (has_alignment && DBI::dbGetQuery(con, 'SELECT count(*) AS n FROM research_alignment_issues')$n != 0) stop('Research register identity or wording mismatch; reconcile before reporting.')
  id <- as.integer(start_id)
  get <- function(sql) DBI::dbGetQuery(con, sql, params=list(id))
  if (start_type == 'question') {
    start <- get('SELECT question_id AS id, question_text AS description, record_status FROM research_question WHERE question_id=?')
    selected <- 'SELECT sv.study_version_id FROM question_study qs JOIN study_version sv ON sv.study_id=qs.study_id WHERE qs.question_id=?'
  } else if (start_type == 'survey') {
    start <- get('SELECT event_id AS id, description, date_precision, start_date, end_date FROM study_event WHERE event_id=?')
    selected <- 'SELECT study_version_id FROM study_event WHERE event_id=? AND study_version_id IS NOT NULL'
  } else {
    start <- get("SELECT r.external_ref_id AS id, r.native_id AS project_id, r.namespace, s.system_name FROM external_reference r JOIN external_system s ON s.system_id=r.system_id WHERE r.external_ref_id=? AND r.entity_kind='project'")
    selected <- "SELECT sv.study_version_id FROM study_external_link l JOIN external_reference r ON r.external_ref_id=l.external_ref_id JOIN study_version sv ON sv.study_id=l.study_id WHERE l.external_ref_id=? AND r.entity_kind='project'"
  }
  if (nrow(start) != 1L) stop('Starting record not found for this type.')
  cte <- paste0('WITH selected AS (', selected, ') ')
  studies <- get(paste0(cte, 'SELECT sv.study_version_id, sv.title, sv.description FROM selected x JOIN study_version sv ON sv.study_version_id=x.study_version_id ORDER BY sv.study_version_id'))
  questions <- get(paste0(cte, 'SELECT DISTINCT q.question_id, q.question_text, q.record_status AS question_status, qs.relation_type, qs.record_status AS relation_status, qs.attribution, qs.scope_note FROM selected x JOIN study_version sv ON sv.study_version_id=x.study_version_id JOIN question_study qs ON qs.study_id=sv.study_id JOIN research_question q ON q.question_id=qs.question_id ORDER BY q.question_id'))
  events <- get(paste0(cte, 'SELECT e.event_id, e.description, e.start_date, e.end_date, d.title AS source_title, p.locator AS source_locator FROM selected x JOIN study_event e ON e.study_version_id=x.study_version_id LEFT JOIN source_passage p ON p.passage_id=e.source_passage_id LEFT JOIN source_version v ON v.source_version_id=p.source_version_id LEFT JOIN source_document d ON d.document_id=v.document_id ORDER BY e.event_id'))
  projects <- get(paste0(cte, "SELECT DISTINCT r.external_ref_id, s.system_name, r.namespace, r.native_id, l.relationship_type, l.review_state, l.scope_note, p.locator AS source_locator FROM selected x JOIN study_version sv ON sv.study_version_id=x.study_version_id JOIN study_external_link l ON l.study_id=sv.study_id JOIN external_reference r ON r.external_ref_id=l.external_ref_id JOIN external_system s ON s.system_id=r.system_id LEFT JOIN study_link_passage lp ON lp.link_id=l.link_id LEFT JOIN source_passage p ON p.passage_id=lp.passage_id WHERE r.entity_kind='project' ORDER BY r.external_ref_id"))
  objectives <- get(paste0(cte, "SELECT DISTINCT o.objective_id, o.objective_text, o.record_status AS objective_status, pol.relation_type AS objective_relation, pol.record_status AS objective_relation_status, pol.scope_note AS objective_scope, l.relationship_type AS study_relation, l.review_state AS study_relation_status, l.scope_note AS study_scope, p.locator AS source_locator FROM selected x JOIN study_version sv ON sv.study_version_id=x.study_version_id JOIN study_external_link l ON l.study_id=sv.study_id JOIN external_reference er ON er.external_ref_id=l.external_ref_id AND er.entity_kind='project' JOIN project_objective_link pol ON pol.project_ref_id=er.external_ref_id JOIN project_objective o ON o.objective_id=pol.objective_id LEFT JOIN source_passage p ON p.passage_id=pol.source_passage_id ORDER BY o.objective_id"))
  if (start_type == 'project') objectives <- get("SELECT o.objective_id, o.objective_text, o.record_status AS objective_status, pol.relation_type AS objective_relation, pol.record_status AS objective_relation_status, pol.scope_note AS objective_scope, p.locator AS source_locator FROM project_objective_link pol JOIN project_objective o ON o.objective_id=pol.objective_id LEFT JOIN source_passage p ON p.passage_id=pol.source_passage_id WHERE pol.project_ref_id=? ORDER BY o.objective_id")
  has_full_rf <- DBI::dbGetQuery(con, "SELECT COUNT(*) AS n FROM information_schema.tables WHERE table_schema='rf' AND lower(table_name) IN ('src_revetment','import_source')")$n == 2
  has_rf <- DBI::dbGetQuery(con, "SELECT COUNT(*) AS n FROM information_schema.tables WHERE table_schema='rf' AND table_name IN ('revetment','dataset_snapshot')")$n == 2
  features <- NULL
  feature_source <- 'unavailable'
  if (has_full_rf) {
    feature_source <- 'geopackage'
    feature_fields <- "SELECT DISTINCT f.RESTORFEATIDPK AS restorfeatidpk, f.SDSFEATURENAME AS feature_name, f.PROJECT_ID AS project_id, f.RESTORFEATSTATUS AS restorfeatstatus, CASE WHEN f.SHAPE IS NULL THEN 'Missing' ELSE 'Present (not evaluated for survey overlap)' END AS geometry_status, 'Revetment' AS source_class, ds.source_sha256 FROM "
    source_join <- " JOIN external_reference er ON er.external_ref_id=l.external_ref_id JOIN external_system es ON es.system_id=er.system_id AND es.system_name='UMRRDB export' JOIN rf.src_Revetment f ON CAST(f.PROJECT_ID AS VARCHAR)=er.native_id CROSS JOIN rf.import_source ds WHERE er.entity_kind='project' AND er.namespace='UMRRDB.Projects' ORDER BY f.RESTORFEATIDPK"
    features <- get(paste0(cte, feature_fields, 'selected x JOIN study_version sv ON sv.study_version_id=x.study_version_id JOIN study_external_link l ON l.study_id=sv.study_id', source_join))
    if (start_type == 'project') features <- get(paste0(feature_fields, "external_reference er JOIN external_system es ON es.system_id=er.system_id AND es.system_name='UMRRDB export' JOIN rf.src_Revetment f ON CAST(f.PROJECT_ID AS VARCHAR)=er.native_id CROSS JOIN rf.import_source ds WHERE er.external_ref_id=? AND er.entity_kind='project' AND er.namespace='UMRRDB.Projects' ORDER BY f.RESTORFEATIDPK"))
  } else if (has_rf) {
    feature_source <- 'legacy_xml'
    feature_fields <- "SELECT DISTINCT f.restorfeatidpk, f.feature_name, f.project_id, f.restorfeatstatus, f.geometry_note, ds.source_class, ds.source_sha256 FROM "
    match_join <- " JOIN external_reference er ON er.external_ref_id=l.external_ref_id JOIN external_system es ON es.system_id=er.system_id AND es.system_name='UMRRDB export' JOIN rf.revetment f ON f.project_id=er.native_id JOIN rf.dataset_snapshot ds ON ds.snapshot_id=f.snapshot_id WHERE er.entity_kind='project' AND er.namespace='UMRRDB.Projects' ORDER BY f.restorfeatidpk"
    features <- get(paste0(cte, feature_fields, 'selected x JOIN study_version sv ON sv.study_version_id=x.study_version_id JOIN study_external_link l ON l.study_id=sv.study_id', match_join))
    if (start_type == 'project') features <- get(paste0(feature_fields, "external_reference er JOIN external_system es ON es.system_id=er.system_id AND es.system_name='UMRRDB export' JOIN rf.revetment f ON f.project_id=er.native_id JOIN rf.dataset_snapshot ds ON ds.snapshot_id=f.snapshot_id WHERE er.external_ref_id=? AND er.entity_kind='project' AND er.namespace='UMRRDB.Projects' ORDER BY f.restorfeatidpk"))
  }
  findings <- get(paste0(cte, 'SELECT fv.finding_version_id, fv.finding_text, fv.authorship_status, d.title AS source_title, p.locator AS source_locator, v.sha256 AS source_sha256 FROM selected x JOIN finding_version fv ON fv.study_version_id=x.study_version_id LEFT JOIN finding_passage fp ON fp.finding_version_id=fv.finding_version_id LEFT JOIN source_passage p ON p.passage_id=fp.passage_id LEFT JOIN source_version v ON v.source_version_id=p.source_version_id LEFT JOIN source_document d ON d.document_id=v.document_id ORDER BY fv.finding_version_id, p.passage_id'))
  hypotheses <- get(paste0(cte, 'SELECT DISTINCT h.hypothesis_text, h.record_status AS hypothesis_status, qh.relation_type, qh.record_status AS relation_status, qh.scope_note FROM selected x JOIN study_version sv ON sv.study_version_id=x.study_version_id JOIN question_study qs ON qs.study_id=sv.study_id JOIN question_hypothesis qh ON qh.question_id=qs.question_id JOIN hypothesis h ON h.hypothesis_id=qh.hypothesis_id ORDER BY h.hypothesis_text'))
  assessment_sql <- paste0(cte, 'SELECT DISTINCT a.assessment_id, a.assessment_text, a.record_status, af.role, af.rationale FROM selected x JOIN finding_version fv ON fv.study_version_id=x.study_version_id JOIN assessment_finding af ON af.finding_version_id=fv.finding_version_id JOIN assessment a ON a.assessment_id=af.assessment_id WHERE (? OR LOWER(a.record_status) <> ', "'hypothetical'", ') ORDER BY a.assessment_id')
  assessments <- DBI::dbGetQuery(con, assessment_sql, params=list(id, include_hypothetical))
  list(start_type=start_type, start=start, studies=studies, questions=questions, events=events,
       projects=projects, objectives=objectives, features=features, feature_source=feature_source, findings=findings, hypotheses=hypotheses, assessments=assessments,
       include_hypothetical=include_hypothetical)
}
