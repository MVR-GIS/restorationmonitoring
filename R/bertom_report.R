# Assemble a bounded, source-referenced practitioner walkthrough.
bertom_report_summary <- function(root = ".") {
  root <- normalizePath(root, winslash = "/", mustWork = TRUE)
  files <- c(
    "dev/goals/bertom-rock-habitat-linkage-review.md",
    "dev/checkpoints/current/cross-system-case-screen.md",
    "dev/goals/workshop-research-priorities.md",
    "../UMRR/HREPs/Bertrom_McCartney_Lakes/BertromMcCartneyLakes_DPR_1989.pdf",
    "../UMRR/HREPs/Bertrom_McCartney_Lakes/BertromMcCartneyLakes_PER_2004.pdf",
    "../UMRR/HREPs/Bertrom_McCartney_Lakes/2014_BertomMcCartney_PER_Mussels.pdf",
    "../UMRR/EMMA/UMRR_Goals_Objectives_PerfC_FY27_Update.xlsx",
    "../UMRR/EMMA/UMRRDB_PROJECTs_DDL.xml",
    "../UMRR/RestorationFeatures/RestorationSchema_data_20261102.xml",
    "dev/checkpoints/archive/research_question_ranks.xlsx")
  paths <- normalizePath(file.path(root, files), winslash = "/", mustWork = TRUE)
  structure(list(generated_at = Sys.time(),
    inputs = data.frame(source = basename(paths), md5 = unname(tools::md5sum(paths))),
    software = paste("R", getRversion(), "\u00b7 rmarkdown", as.character(utils::packageVersion("rmarkdown"))),
    case = data.frame(stage = c("Learning question", "Historical objectives", "Restoration practice", "Monitoring", "Reported finding"),
      evidence = c("WQ-39 asks about substrate properties and habitat for mussels, benthic invertebrates and fish spawning.",
        "Increase rock substrate aquatic habitat and establish a mussel bed; historical year-50 targets are recorded.",
        "The DPR and survey report describe a seven-section rock habitat channel; named GIS records are candidate matches.",
        "The report documents a survey on 7\u20139 October 2014 across the habitat channel and comparison areas.",
        "The report records 40 live mussels of 11 species in the habitat channel across its survey methods."),
      qualifier = c("Workshop mark links the project to the question, but its meaning is unknown; the study was not shown to test WQ-39.",
        "Historical targets are not established EMMA criterion records or evaluated outcomes.",
        "Individual GIS segment identity and survey-to-feature match remain unverified.",
        "The user confirms EMMA has no recorded Bertom monitoring tasks; this does not erase the survey.",
        "Methods varied across sites; the result does not by itself establish target attainment or a causal effect."),
      stringsAsFactors = FALSE)), class = "bertom_report_summary")
}

bertom_report <- function(summary, output_file, template_dir = "inst/reports") {
  if (!inherits(summary, "bertom_report_summary")) stop("Supply a Bertom report summary.")
  if (!requireNamespace("rmarkdown", quietly = TRUE) || !rmarkdown::pandoc_available())
    stop("rmarkdown and Pandoc are required.")
  if (!dir.exists(dirname(output_file)) || !grepl("\\.html$", output_file, ignore.case = TRUE))
    stop("Use an HTML destination in an existing directory.")
  output_file <- file.path(normalizePath(dirname(output_file), winslash = "/"), basename(output_file))
  if (file.exists(output_file)) stop("Report destination already exists.")
  template <- normalizePath(file.path(template_dir, "bertom_report.Rmd"), winslash = "/", mustWork = TRUE)
  stage <- tempfile("bertom-report-", tmpdir = dirname(output_file))
  dir.create(stage); on.exit(unlink(stage, recursive = TRUE), add = TRUE)
  file.copy(template, stage)
  rendered <- rmarkdown::render(file.path(stage, basename(template)), output_file = "report.html",
    params = list(report = summary), envir = new.env(parent = baseenv()), quiet = TRUE, encoding = "UTF-8")
  html <- paste(readLines(rendered, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  if (grepl("<pre[^>]*><code[^>]*>\\s*## (Warning|Error)", html, perl = TRUE)) stop("Rendered report contains a warning or error.")
  if (!isTRUE(suppressWarnings(file.link(rendered, output_file)))) stop("Could not publish without replacing a file.")
  invisible(output_file)
}
