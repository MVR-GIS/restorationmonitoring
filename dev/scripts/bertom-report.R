# Run from repository root: Rscript dev/scripts/bertom-report.R [new-output.html]
args <- commandArgs(trailingOnly = TRUE)
source("R/bertom_report.R")
summary <- bertom_report_summary(".")
dir.create("dev/outputs/bertom", recursive = TRUE, showWarnings = FALSE)
destination <- if (length(args)) args[1] else file.path("dev/outputs/bertom",
  paste0("bertom-evidence-", format(Sys.time(), "%Y%m%dT%H%M%SZ", tz = "UTC"), ".html"))
bertom_report(summary, destination)
cat(normalizePath(destination, winslash = "/"), "\n")
