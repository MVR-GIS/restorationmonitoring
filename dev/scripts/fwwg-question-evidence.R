# Run from repository root: Rscript dev/scripts/fwwg-question-evidence.R [new-output.html]
# Bounded research prototype; reads reviewed sources and never changes production systems.
args <- commandArgs(trailingOnly = TRUE)
root <- normalizePath(".", winslash = "/", mustWork = TRUE)
paths <- file.path(root, c("dev/goals/workshop-research-question-register.json",
  "dev/checkpoints/archive/research_question_ranks.xlsx",
  "dev/goals/bertom-rock-habitat-linkage-review.md",
  "dev/goals/cross-system-case-screen.md",
  "dev/architecture/fwwg-learning-opportunity-model.md"))
paths <- normalizePath(paths, winslash = "/", mustWork = TRUE)
register <- jsonlite::fromJSON(paths[1])
if (!identical(unname(tools::md5sum(paths[2])), register$source_md5))
  stop("Workshop workbook differs from the reviewed register.")
q <- register$questions[register$questions$local_id == "WQ-39", ]
if (nrow(q) != 1L) stop("Expected one WQ-39 question in the reviewed register.")
rank <- data.frame(reach = c("Upper Impounded", "Lower Impounded", "Unimpounded", "Illinois River"),
  rank = unlist(q[1, c("upper_impounded", "lower_impounded", "unimpounded", "illinois_river")], use.names = FALSE))
sites <- data.frame(site = c("2a", "5", "6", "7"), density = c(0.8, 4.8, 4.0, 1.6))
summary <- list(question = q$question, ranks = rank, sites = sites,
  sources = data.frame(file = basename(paths), md5 = unname(tools::md5sum(paths))),
  generated = Sys.time())
dir.create(file.path(root, "dev/outputs/fwwg"), recursive = TRUE, showWarnings = FALSE)
out <- if (length(args)) args[1] else file.path(root, "dev/outputs/fwwg",
  paste0("question-evidence-", format(Sys.time(), "%Y%m%dT%H%M%SZ", tz = "UTC"), ".html"))
if (!dir.exists(dirname(out)) || !grepl("\\.html$", out, ignore.case = TRUE) || file.exists(out))
  stop("Supply a new HTML destination in an existing directory.")
out <- file.path(normalizePath(dirname(out), winslash = "/"), basename(out))
stage <- tempfile("fwwg-review-", tmpdir = dirname(out)); dir.create(stage)
on.exit(unlink(stage, recursive = TRUE), add = TRUE)
template <- file.path(root, "inst/reports/fwwg_question_evidence.Rmd")
if (!file.copy(template, stage)) stop("Could not stage the report template.")
rendered <- rmarkdown::render(file.path(stage, basename(template)), output_file = "report.html",
  params = list(report = summary), envir = new.env(parent = baseenv()), quiet = TRUE, encoding = "UTF-8")
html <- paste(readLines(rendered, encoding = "UTF-8", warn = FALSE), collapse = "\n")
if (grepl("<pre[^>]*><code[^>]*>\\s*## (Warning|Error)", html, perl = TRUE)) stop("Rendered warning or error.")
if (!isTRUE(suppressWarnings(file.link(rendered, out)))) stop("Could not publish without replacement.")
cat(normalizePath(out, winslash = "/"), "\n")
