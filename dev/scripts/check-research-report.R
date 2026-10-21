# Focused checks: fidelity of source relationships, escaping and safe publication.
source('R/report_presentation.R')
source('R/research_question_report.R')
source('R/workshop_priority_context.R')
science <- 'dev/goals/mussel-science-evidence.json'
restoration <- 'dev/goals/steamboat-island-objectives-criteria.json'
priority <- 'dev/goals/workshop-research-question-register.json'
workbook <- 'dev/checkpoints/archive/research_question_ranks.xlsx'
pilot_links <- 'dev/goals/mussel-workshop-question-links.json'
instance <- 'dev/goals/mussel-vital-rates-instance.json'
input_paths <- c(science, restoration, priority, workbook, pilot_links, instance)
before <- tools::md5sum(input_paths)
r <- research_question_summary('<script>alert("source")</script> & review', science, restoration)
stopifnot(nrow(r$sources) == 6L, nrow(r$assertions) == 8L,
          sum(is.na(r$assertions$source_id)) == 1L,
          setequal(r$derivations$from, c('SC-02', 'SC-03')),
          all(r$derivations$to == 'SC-08'))
stopifnot(is.null(r$priorities))
r <- research_question_summary('<script>alert("source")</script> & review', science, restoration,
  priorities_file=priority, priorities_source=workbook, priority_links_file=pilot_links)
p <- r$priorities
stopifnot(nrow(p$questions)==49L, nrow(p$selected)==4L,
  p$selected$lower_impounded[p$selected$local_id=='WQ-39']==16,
  p$selected$illinois_river[p$selected$local_id=='WQ-37']==37.5,
  nrow(p$marks)==7L, all(p$marks$local_question_id=='WQ-39'),
  !any(p$marks$project_label=='Steamboat Island'),nrow(r$inputs)==5L,
  nrow(.rm_workshop_priorities(priority,workbook)$selected)==0L)
bad <- jsonlite::fromJSON(science, simplifyVector = FALSE)
bad$assertions[[1]]$source_id <- 'NONEXISTENT'
test_dir <- tempfile('research-report-check-'); dir.create(test_dir)
bad_path <- file.path(test_dir, 'bad.json')
jsonlite::write_json(bad, bad_path, auto_unbox = TRUE, null = 'null')
stopifnot(inherits(try(research_question_summary('Question', bad_path, restoration), silent=TRUE), 'try-error'))
bad_links <- jsonlite::fromJSON(pilot_links)
bad_links$links$question_id[1] <- 'WQ-NOT-RECORDED'
bad_links_path <- file.path(test_dir,'bad-links.json')
jsonlite::write_json(bad_links,bad_links_path,auto_unbox=TRUE)
stopifnot(inherits(try(.rm_workshop_priorities(priority,workbook,bad_links_path),silent=TRUE),'try-error'))
changed_workbook <- file.path(test_dir,'changed.xlsx')
file.copy(workbook,changed_workbook)
con <- file(changed_workbook,'ab'); writeBin(as.raw(0),con); close(con)
stopifnot(inherits(try(.rm_workshop_priorities(priority,changed_workbook,pilot_links),silent=TRUE),'try-error'))
ri <- research_question_summary('Question',science,restoration,study_instance_file=instance)
stopifnot(nrow(ri$study_instance$chain)==10L,nrow(ri$inputs)==3L)
bad_instance <- jsonlite::fromJSON(instance,simplifyVector=FALSE)
bad_instance$source_id <- 'MS-02'
bad_instance_path <- file.path(test_dir,'bad-instance.json')
jsonlite::write_json(bad_instance,bad_instance_path,auto_unbox=TRUE)
stopifnot(inherits(try(research_question_summary('Question',science,restoration,
  study_instance_file=bad_instance_path),silent=TRUE),'try-error'))
r <- research_question_summary('<script>alert("source")</script> & review', science, restoration,
  priorities_file=priority,priorities_source=workbook,priority_links_file=pilot_links,
  study_instance_file=instance)
html <- file.path(test_dir, 'report.html')
cache_before <- getOption('sass.cache')
research_question_report(r, html, 'inst/reports')
stopifnot(identical(getOption('sass.cache'),cache_before))
rendered <- paste(readLines(html, warn=FALSE), collapse='\n')
stopifnot(!grepl('<script>alert', rendered, fixed=TRUE),
          grepl('&lt;script&gt;', rendered, fixed=TRUE),
          grepl('data:image/png;base64', rendered, fixed=TRUE),
          grepl('Steamboat Island Mussel Pilot Report',rendered,fixed=TRUE),
          !grepl('Dashboard',rendered,fixed=TRUE),
          grepl('research_question_ranks.xlsx',rendered,fixed=TRUE),
          grepl('Full workshop learning agenda',rendered,fixed=TRUE),
          grepl('WQ-49',rendered,fixed=TRUE),
          grepl('569 individual IDs',rendered,fixed=TRUE),
          grepl('10.5066/P9HRXPJQ',rendered,fixed=TRUE),
          grepl('not a result established by the current science sample',rendered,fixed=TRUE))
parsed <- xml2::read_html(html)
code_blocks <- xml2::xml_text(xml2::xml_find_all(parsed,'//pre/code'))
stopifnot(!any(grepl('^## (Warning|Error)',code_blocks)))
h2 <- xml2::xml_text(xml2::xml_find_all(parsed,'//h2'))
stopifnot(grepl('The Steamboat Island pilot',h2[1],fixed=TRUE),
  match(TRUE,grepl('What would let us evaluate',h2,fixed=TRUE)) <
    match(TRUE,grepl('Background',h2,fixed=TRUE)))
rank_images <- xml2::xml_find_all(parsed,'//img[contains(@alt,"reach-specific panels")]')
stopifnot(length(rank_images)==1L,
  length(xml2::xml_find_all(rank_images,'ancestor::details'))==1L)
published <- tools::md5sum(html)
bad_template <- file.path(test_dir,'warning-template'); dir.create(bad_template)
file.copy('inst/reports/report-tables.css',bad_template)
writeLines(c('---','output: html_document','params:','  report: null','---',
  '```{r}', 'warning("Deliberate render warning for publication guard")','```'),
  file.path(bad_template,'research_question_report.Rmd'))
warning_html <- file.path(test_dir,'warning.html')
stopifnot(inherits(try(research_question_report(r,warning_html,bad_template),silent=TRUE),'try-error'),
  !file.exists(warning_html),identical(getOption('sass.cache'),cache_before))
stopifnot(inherits(try(research_question_report(r, html, 'inst/reports'), silent=TRUE), 'try-error'),
          identical(published, tools::md5sum(html)),
          identical(before, tools::md5sum(input_paths)))
legacy_html <- file.path(test_dir,'without-priorities.html')
research_question_report(research_question_summary('Question',science,restoration),legacy_html,'inst/reports')
stopifnot(grepl('No priority-defining artifact supplied',paste(readLines(legacy_html,warn=FALSE),collapse=''),fixed=TRUE))
unlink(test_dir, recursive=TRUE)
cat('Passed: source references, instance provenance, priority ranks/ties, explicit pilot links, source edition guard, full agenda, HTML escaping, embedded figures, warning rejection, cache restoration, non-overwrite, unchanged inputs.\n')
