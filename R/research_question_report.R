# Report summaries are presentation inputs, not scientific database contracts.
# They preserve the supplied assertions; rendering does not approve their meaning.

#' Assemble a research question report from existing extraction worksheets
#'
#' @param question One analyst-supplied research question, labelled as proposed.
#' @param science_file Science worksheet JSON with sources and assertions.
#' @param restoration_file Restoration extraction JSON.
#' @param entities Optional data frame of candidate conceptual distinctions.
#' @return A read-only report summary with source fingerprints and derivation links.
research_question_summary <- function(question, science_file, restoration_file,
                                      entities = data.frame()) {
  if (!is.character(question) || length(question) != 1L || is.na(question) ||
      !nzchar(trimws(question))) stop("Supply one nonempty research question.")
  if (!requireNamespace("jsonlite", quietly = TRUE)) stop("Install jsonlite to read worksheets.")
  paths <- vapply(c(science_file, restoration_file), normalizePath, "", winslash = "/", mustWork = TRUE)
  s <- jsonlite::fromJSON(paths[1], simplifyVector = FALSE)
  r <- jsonlite::fromJSON(paths[2], simplifyVector = FALSE)
  scalar <- function(x) if (is.null(x) || !length(x)) NA_character_ else paste(unlist(x), collapse = "; ")
  records <- function(x, fields) {
    rows <- lapply(x, function(row) as.data.frame(setNames(lapply(fields,
      function(field) scalar(row[[field]])), fields), stringsAsFactors = FALSE))
    if (!length(rows)) return(as.data.frame(setNames(rep(list(character()), length(fields)), fields)))
    do.call(rbind, rows)
  }
  sources <- records(s$sources, c("id", "doi", "source_url", "reading_depth"))
  assertions <- records(s$assertions, c("id", "source_id", "kind", "paraphrase", "source_locator", "limit", "extraction_status"))
  check_ids <- function(x, what) {
    if (anyNA(x) || any(!nzchar(x)) || anyDuplicated(x)) stop(what, " need unique nonempty IDs.")
  }
  check_ids(sources$id, "Sources"); check_ids(assertions$id, "Assertions")
  cited <- assertions$source_id[!is.na(assertions$source_id)]
  if (any(!cited %in% sources$id)) stop("An assertion references an unknown source.")
  links <- lapply(s$assertions, function(a) {
    parents <- unlist(a$informed_by, use.names = FALSE)
    if (!length(parents)) return(NULL)
    data.frame(from = parents, to = a$id, relationship = "informs formulation", stringsAsFactors = FALSE)
  })
  links <- Filter(Negate(is.null), links)
  edges <- if (length(links)) do.call(rbind, links) else data.frame(from = character(), to = character(), relationship = character())
  if (any(!c(edges$from, edges$to) %in% assertions$id)) stop("Derivation references an unknown assertion.")
  objectives <- records(r$objectives, c("id", "name", "source_text_normalized", "detailed_criterion_pdf_pages"))
  if (!is.data.frame(entities)) stop("entities must be a data frame.")
  structure(list(report_version = "research-question-1", question = question,
    question_basis = "Analyst formulation for review", generated_at = Sys.time(),
    sources = sources, assertions = assertions, derivations = edges,
    entities = entities, objectives = objectives,
    project_connection = s$project_connection, lifecycle = scalar(r$lifecycle),
    mussel_benefit = r$mussel_benefit, source_status = scalar(s$status),
    organizational_baseline = s$organizational_baseline,
    inputs = data.frame(role = c("Science worksheet", "Restoration worksheet"),
      file = basename(paths), md5 = unname(tools::md5sum(paths))),
    software = data.frame(component = c("R", "jsonlite", "rmarkdown", "knitr", "gt", "ggplot2"),
      version = c(as.character(getRversion()), vapply(c("jsonlite", "rmarkdown", "knitr", "gt", "ggplot2"),
        function(p) if (requireNamespace(p, quietly = TRUE)) as.character(utils::packageVersion(p)) else "Not installed", "")))),
    class = "research_question_summary")
}

#' Render a self-contained research question HTML report
#'
#' @param summary Output of research_question_summary().
#' @param output_file New HTML destination in an existing local directory.
#' @param template_dir Source checkout's inst/reports directory. When NULL, use
#'   the installed restorationmonitoring package's report resources.
#' @return Normalized report path invisibly. Existing snapshots are never replaced.
research_question_report <- function(summary, output_file, template_dir = NULL) {
  if (!inherits(summary, "research_question_summary")) stop("Supply a research_question_summary().")
  for (p in c("rmarkdown", "knitr", "htmltools", "gt", "ggplot2"))
    if (!requireNamespace(p, quietly = TRUE)) stop("Rendering requires ", p, ".")
  if (!rmarkdown::pandoc_available()) stop("Pandoc is unavailable. Set RSTUDIO_PANDOC to your Quarto/Positron Pandoc directory.")
  if (!is.character(output_file) || length(output_file) != 1L || is.na(output_file) ||
      !grepl("\\.html$", output_file, ignore.case = TRUE) || !dir.exists(dirname(output_file)))
    stop("Supply a new .html destination in an existing directory.")
  output_file <- file.path(normalizePath(dirname(output_file), winslash = "/"), basename(output_file))
  if (file.exists(output_file)) stop("Report destination already exists; use a new snapshot name.")
  if (is.null(template_dir)) template_dir <- system.file("reports", package = "restorationmonitoring")
  template_dir <- normalizePath(template_dir, winslash = "/", mustWork = TRUE)
  template <- file.path(template_dir, "research_question_report.Rmd")
  css <- file.path(template_dir, "report-tables.css")
  if (!file.exists(template) || !file.exists(css)) stop("Report template and shared CSS are required.")
  # Render outside the source tree. Publish with a non-replacing filesystem link.
  stage_dir <- tempfile("research-report-", tmpdir = dirname(output_file))
  dir.create(stage_dir); on.exit(unlink(stage_dir, recursive = TRUE), add = TRUE)
  file.copy(c(template, css), stage_dir)
  env <- new.env(parent = baseenv())
  env$report_table <- .rm_report_table
  env$report_derivations <- .rm_report_derivations
  staged <- rmarkdown::render(file.path(stage_dir, basename(template)),
    output_file = "report.html", params = list(report = summary),
    envir = env, quiet = TRUE, encoding = "UTF-8")
  if (!isTRUE(suppressWarnings(file.link(staged, output_file))))
    stop("Could not publish without replacement; use a local hard-link-capable filesystem.")
  invisible(output_file)
}
