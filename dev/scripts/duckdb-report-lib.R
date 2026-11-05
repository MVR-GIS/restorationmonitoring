# Bounded, read-only report assembly for the local DuckDB prototype.
duckdb_question_summary <- function(con, question_id, include_hypothetical = FALSE) {
  if (length(question_id) != 1L || is.na(question_id) ||
      !is.numeric(question_id) || !is.finite(question_id) ||
      question_id != as.integer(question_id) || question_id < 1) stop('Supply one positive integer question ID.')
  if (!is.logical(include_hypothetical) || length(include_hypothetical) != 1L ||
      is.na(include_hypothetical)) stop('include_hypothetical must be TRUE or FALSE.')
  question <- DBI::dbGetQuery(con, paste(
    'SELECT q.question_id, q.question_text, q.origin_kind, q.record_status,',
    'd.title AS source_title, p.locator AS source_locator, v.sha256 AS source_sha256',
    'FROM research_question q LEFT JOIN source_passage p ON p.passage_id=q.source_passage_id',
    'LEFT JOIN source_version v ON v.source_version_id=p.source_version_id',
    'LEFT JOIN source_document d ON d.document_id=v.document_id WHERE q.question_id=?'),
    params = list(as.integer(question_id)))
  if (nrow(question) != 1L) stop('Question ID not found in the database.')
  findings <- DBI::dbGetQuery(con, paste(
    'SELECT qs.link_id, qs.relation_type, qs.record_status AS relation_status, qs.attribution,',
    'qs.scope_note, sv.study_version_id, sv.title AS study_title,',
    'fv.finding_version_id, fv.finding_text, fv.authorship_status,',
    'd.title AS source_title, p.locator AS source_locator, v.sha256 AS source_sha256',
    'FROM question_study qs JOIN study_version sv ON sv.study_id=qs.study_id',
    'JOIN finding_version fv ON fv.study_version_id=sv.study_version_id',
    'LEFT JOIN finding_passage fp ON fp.finding_version_id=fv.finding_version_id',
    'LEFT JOIN source_passage p ON p.passage_id=fp.passage_id',
    'LEFT JOIN source_version v ON v.source_version_id=p.source_version_id',
    'LEFT JOIN source_document d ON d.document_id=v.document_id',
    'WHERE qs.question_id=? ORDER BY qs.link_id, sv.study_version_id, fv.finding_version_id, p.passage_id'),
    params = list(as.integer(question_id)))
  hypotheses <- DBI::dbGetQuery(con, paste(
    'SELECT h.hypothesis_text, h.record_status AS hypothesis_status,',
    'qh.relation_type, qh.record_status AS relation_status, qh.scope_note',
    'FROM question_hypothesis qh JOIN hypothesis h ON h.hypothesis_id=qh.hypothesis_id',
    'WHERE qh.question_id=? ORDER BY qh.link_id'), params = list(as.integer(question_id)))
  assessments <- DBI::dbGetQuery(con, paste(
    'SELECT DISTINCT a.assessment_id, a.assessment_text, a.record_status,',
    'fv.finding_version_id, fv.finding_text, af.role, af.rationale',
    'FROM question_study qs JOIN study_version sv ON sv.study_id=qs.study_id',
    'JOIN finding_version fv ON fv.study_version_id=sv.study_version_id',
    'JOIN assessment_finding af ON af.finding_version_id=fv.finding_version_id',
    'JOIN assessment a ON a.assessment_id=af.assessment_id',
    "WHERE qs.question_id=? AND (? OR LOWER(a.record_status) <> 'hypothetical')",
    'ORDER BY a.assessment_id, fv.finding_version_id'),
    params = list(as.integer(question_id), include_hypothetical))
  list(question = question, hypotheses = hypotheses, findings = findings,
       assessments = assessments, include_hypothetical = include_hypothetical)
}
