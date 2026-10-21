# Focused checks: fidelity of source relationships, escaping and safe publication.
source('R/report_presentation.R')
source('R/research_question_report.R')
science <- 'dev/goals/mussel-science-evidence.json'
restoration <- 'dev/goals/steamboat-island-objectives-criteria.json'
before <- tools::md5sum(c(science, restoration))
r <- research_question_summary('<script>alert("source")</script> & review', science, restoration)
stopifnot(nrow(r$sources) == 6L, nrow(r$assertions) == 8L,
          sum(is.na(r$assertions$source_id)) == 1L,
          setequal(r$derivations$from, c('SC-02', 'SC-03')),
          all(r$derivations$to == 'SC-08'))
bad <- jsonlite::fromJSON(science, simplifyVector = FALSE)
bad$assertions[[1]]$source_id <- 'NONEXISTENT'
test_dir <- tempfile('research-report-check-'); dir.create(test_dir)
bad_path <- file.path(test_dir, 'bad.json')
jsonlite::write_json(bad, bad_path, auto_unbox = TRUE, null = 'null')
stopifnot(inherits(try(research_question_summary('Question', bad_path, restoration), silent=TRUE), 'try-error'))
html <- file.path(test_dir, 'report.html')
research_question_report(r, html, 'inst/reports')
rendered <- paste(readLines(html, warn=FALSE), collapse='\n')
stopifnot(!grepl('<script>alert', rendered, fixed=TRUE),
          grepl('&lt;script&gt;', rendered, fixed=TRUE),
          grepl('data:image/png;base64', rendered, fixed=TRUE))
published <- tools::md5sum(html)
stopifnot(inherits(try(research_question_report(r, html, 'inst/reports'), silent=TRUE), 'try-error'),
          identical(published, tools::md5sum(html)),
          identical(before, tools::md5sum(c(science, restoration))))
unlink(test_dir, recursive=TRUE)
cat('Passed: source references, supplied derivations, HTML escaping, embedded figure, non-overwrite, worksheet preservation.\n')
