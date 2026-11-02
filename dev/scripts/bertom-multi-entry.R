# Run from repository root: Rscript dev/scripts/bertom-multi-entry.R [new-output.html]
# Development-only evidence fixture and visualization; no production data access.
args <- commandArgs(trailingOnly = TRUE)
root <- normalizePath(".", winslash = "/", mustWork = TRUE)
source(file.path(root, "R/evidence_walkthrough.R"))
input_files <- c("R/evidence_walkthrough.R", "dev/goals/bertom-three-entry-model-test.md",
  "dev/goals/bertom-rock-habitat-linkage-review.md", "dev/checkpoints/current/cross-system-case-screen.md",
  "dev/goals/workshop-research-priorities.md", "dev/architecture/durable-assessment-and-decision-model.md")
input_paths <- normalizePath(file.path(root, input_files), winslash = "/", mustWork = TRUE)
graph <- .rm_bertom_evidence()
views <- lapply(c("question", "survey", "project"), function(start) {
  list(actual = .rm_evidence_view(graph, start), example = .rm_evidence_view(graph, start, TRUE))
})
names(views) <- c("question", "survey", "project")
summary <- list(views = views, generated = Sys.time(),
  sources = data.frame(file = basename(input_paths), md5 = unname(tools::md5sum(input_paths))))
dir.create(file.path(root, "dev/outputs/bertom-multi-entry"), recursive = TRUE, showWarnings = FALSE)
output <- if (length(args)) args[1] else file.path(root, "dev/outputs/bertom-multi-entry",
  paste0("bertom-evidence-", format(Sys.time(), "%Y%m%dT%H%M%SZ", tz = "UTC"), ".html"))
if (!dir.exists(dirname(output)) || !grepl("\\.html$", output, ignore.case = TRUE) || file.exists(output))
  stop("Supply a new HTML destination in an existing directory.")
output <- file.path(normalizePath(dirname(output), winslash = "/"), basename(output))
stage <- tempfile("bertom-views-", tmpdir = dirname(output)); dir.create(stage)
on.exit(unlink(stage, recursive = TRUE), add = TRUE)
template <- file.path(root, "inst/reports/bertom_multi_entry.Rmd")
if (!file.copy(template, stage)) stop("Could not stage the report template.")
rendered <- rmarkdown::render(file.path(stage, basename(template)), output_file = "report.html",
  params = list(report = summary), envir = new.env(parent = baseenv()), quiet = TRUE, encoding = "UTF-8")
html <- paste(readLines(rendered, encoding = "UTF-8", warn = FALSE), collapse = "\n")
if (grepl("<pre[^>]*><code[^>]*>\\s*## (Warning|Error)", html, perl = TRUE)) stop("Rendered warning or error.")
if (!isTRUE(suppressWarnings(file.link(rendered, output)))) stop("Could not publish without replacement.")
cat(normalizePath(output, winslash = "/"), "\n")
