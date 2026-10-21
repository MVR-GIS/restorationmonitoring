# Run from the repository root:
# Rscript dev/scripts/mussel-research-report.R [new-output.html]
args <- commandArgs(trailingOnly = TRUE)
root <- normalizePath('.', winslash = '/', mustWork = TRUE)
stopifnot(file.exists(file.path(root, 'AGENTS.md')), dir.exists(file.path(root, 'inst/reports')))
source(file.path(root, 'R/report_presentation.R'))
source(file.path(root, 'R/research_question_report.R'))
entities <- data.frame(
  Entity = c('Source and passage', 'Study and execution', 'Question and hypothesis',
    'Study and sampling design', 'Population and habitat context', 'Property, observation and result',
    'Dataset, analysis and model run', 'Parameter and assumption', 'Finding and conclusion',
    'Evidence assessment', 'Design rationale and expected response', 'Applicability and knowledge gap'),
  Meaning = c('Publication/version and precise evidence locator', 'Investigation distinct from its outputs',
    'Explicit proposition distinct from reconstructed expectation', 'Method and comparison supporting the inference',
    'Species, life stage, reach, substrate, flow and period', 'Measured property, event and returned value',
    'Inputs and methods; observed data distinct from modeled output', 'Data-derived estimate distinct from expert judgment',
    'Result distinct from explanatory interpretation', 'Scope and rationale of support, challenge or uncertainty',
    'Why an intervention may produce a benefit', 'Review of transfer to another site and missing evidence'))
summary <- research_question_summary(
  'Could restoration features improve mussel persistence through hydraulic and substrate changes, and how would we evaluate that expectation at Steamboat Island?',
  file.path(root, 'dev/goals/mussel-science-evidence.json'),
  file.path(root, 'dev/goals/steamboat-island-objectives-criteria.json'), entities)
destination <- file.path(root, 'dev/outputs/research-question')
dir.create(destination, recursive = TRUE, showWarnings = FALSE)
output <- if (length(args)) args[1] else file.path(destination,
  paste0('mussel-research-', format(Sys.time(), '%Y%m%dT%H%M%SZ', tz = 'UTC'), '.html'))
research_question_report(summary, output, template_dir = file.path(root, 'inst/reports'))
cat(normalizePath(output, winslash = '/'), '\n')
