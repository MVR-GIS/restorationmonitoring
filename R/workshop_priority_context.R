# Read a reviewed derivative register and an explicitly supplied source artifact.
# Priority is a workshop assessment; it is not scientific evidence strength.
.rm_workshop_priorities <- function(register_file, source_file, links_file = NULL) {
  paths <- vapply(c(register_file, source_file), normalizePath, "", winslash = "/", mustWork = TRUE)
  p <- jsonlite::fromJSON(paths[1], simplifyVector = TRUE)
  hash <- unname(tools::md5sum(paths[2]))
  if (!is.character(p$source_md5) || length(p$source_md5) != 1L ||
      is.na(p$source_md5) || !identical(hash, p$source_md5))
    stop("Priority workbook differs from the reviewed register; reconcile before rendering.")
  q <- p$questions
  fields <- c("local_id", "source_cell", "question", "restoration_goal", "restoration_objective",
              "upper_impounded", "lower_impounded", "unimpounded", "illinois_river")
  if (!is.data.frame(q) || !nrow(q) || !all(fields %in% names(q))) stop("Incomplete priority register.")
  if (anyNA(q$local_id) || any(!nzchar(q$local_id)) || anyDuplicated(q$local_id))
    stop("Priority questions need unique nonempty IDs.")
  ranks <- fields[6:9]
  for (field in ranks) if (!is.numeric(q[[field]]) || anyNA(q[[field]]) ||
      any(!is.finite(q[[field]])) || any(q[[field]] < 1 | q[[field]] > nrow(q)))
    stop("Invalid reach ranks in priority register.")
  labels <- unlist(p$reach_labels, use.names = FALSE)
  if (length(labels) != length(ranks)) stop("Reach labels must match the four rank fields.")
  links <- data.frame(question_id = character(), role = character(), rationale = character())
  status <- "No pilot relevance links supplied; none inferred."
  scope <- status
  if (!is.null(links_file)) {
    links_file <- normalizePath(links_file, winslash = "/", mustWork = TRUE)
    l <- jsonlite::fromJSON(links_file)
    if (!identical(l$workbook_md5, hash)) stop("Pilot links refer to a different priority artifact edition.")
    links <- l$links
    if (!is.data.frame(links) || !all(c("question_id", "role", "rationale") %in% names(links)) ||
        anyNA(links$question_id) || anyDuplicated(links$question_id) ||
        any(!links$question_id %in% q$local_id)) stop("Invalid workshop question reference in pilot links.")
    status <- l$status; scope <- l$scope
  }
  selected <- q[match(links$question_id, q$local_id), , drop = FALSE]
  selected$pilot_role <- links$role
  selected$pilot_rationale <- links$rationale
  marks <- p$recorded_project_marks
  if (!is.data.frame(marks) || !all(c("local_question_id", "reach", "cell", "project_label", "mark") %in% names(marks)) ||
      any(!marks$local_question_id %in% q$local_id)) stop("Invalid source question/project marks.")
  marks <- marks[marks$local_question_id %in% selected$local_id, , drop = FALSE]
  inputs <- data.frame(role = c("Priority-defining workbook", "Derivative priority register"),
    file = basename(paths[c(2,1)]), md5 = unname(tools::md5sum(paths[c(2,1)])))
  if (!is.null(links_file)) inputs <- rbind(inputs, data.frame(role = "Proposed pilot relevance links",
    file = basename(links_file), md5 = unname(tools::md5sum(links_file))))
  list(artifact = data.frame(Item = c("Artifact", "Purpose", "Source location", "Questions", "Rank definition", "Identifier scope"),
      Record = c(basename(paths[2]), "Records workshop research priorities by river reach", "Ranked by Reach!A1:G51",
        nrow(q), p$rank_definition, p$identifier_note)),
    questions = q, selected = selected, reach_labels = labels, rank_fields = ranks,
    link_status = status, link_scope = scope, marks = marks,
    limitations = p$limitations, inputs = inputs)
}
