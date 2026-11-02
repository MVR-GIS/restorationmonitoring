make_worksheets <- function() {
  dir <- tempfile("worksheets-")
  dir.create(dir)
  science <- file.path(dir, "science.json")
  restoration <- file.path(dir, "restoration.json")
  jsonlite::write_json(list(sources = list(list(id = "S1")),
    assertions = list(list(id = "A1", source_id = "S1"),
                      list(id = "A2", informed_by = list("A1")))),
    science, auto_unbox = TRUE)
  jsonlite::write_json(list(objectives = list(list(id = "O1", name = "Objective"))),
    restoration, auto_unbox = TRUE)
  list(science = science, restoration = restoration)
}

test_that("summary preserves source attribution and derivation", {
  f <- make_worksheets()
  result <- research_question_summary("What happened?", f$science, f$restoration)
  expect_s3_class(result, "research_question_summary")
  expect_equal(result$assertions$source_id[1], "S1")
  expect_equal(result$derivations$from, "A1")
  expect_equal(result$derivations$to, "A2")
  expect_length(result$inputs$md5, 2)
  expect_error(research_question_summary(" ", f$science, f$restoration), "nonempty")
})

test_that("unknown source references are rejected", {
  f <- make_worksheets()
  x <- jsonlite::fromJSON(f$science, simplifyVector = FALSE)
  x$assertions[[1]]$source_id <- "missing"
  jsonlite::write_json(x, f$science, auto_unbox = TRUE)
  expect_error(research_question_summary("Question", f$science, f$restoration), "unknown source")
})

test_that("installed report resources are present", {
  expect_true(file.exists(system.file("reports", "research_question_report.Rmd", package = "restorationmonitoring")))
  expect_true(file.exists(system.file("reports", "report-tables.css", package = "restorationmonitoring")))
  expect_true(file.exists(system.file("reports", "bertom_report.Rmd", package = "restorationmonitoring")))
})
