# FWWG question-and-evidence visualization prototype

- Started: 2026-11-02. Status: analyst-created conceptual-model and report design test; no FWWG interview, partner validation or adopted requirements.
- Purpose: make distinctions in the [learning-opportunity model](../architecture/fwwg-learning-opportunity-model.md) inspectable using WQ-39 and the [Bertom linkage review](../goals/bertom-rock-habitat-linkage-review.md). The user requested more compelling visualizations before later practitioner elicitation; the specific design is a proposal, not a representation of FWWG preference.

The user subsequently clarified a broader objective: a report family should dynamically compile connected institutional knowledge from a chosen question, study, project or other supported item, in both conceptual/historical and observational directions, with evidence drill-down guided by the scientific model. See the [model-guided report review](../architecture/model-guided-evidence-reports.md). This static, case-specific prototype does not yet supply multi-entry selection, dynamic retrieval or comprehensive coverage.

## Contents and limits

The prototype presents reach-specific recorded ranks, a source-backed/candidate relationship map with expandable evidence and limits, and the survey report's four site-level densities. It explicitly distinguishes priority from evidence, a workshop mark from an adopted opportunity, a project objective from an evaluated criterion, report results from raw data, and a missing EMMA task from an absent survey. It does not compare site densities to the historical target as an attainment calculation or claim a cross-system GIS match or causal effect. The overview map is an example, not an exhaustive entity list or approved relationship vocabulary.

The workshop question and ranks are read from the reviewed register and checked against the workbook fingerprint. Bertom site values are transcribed from the source-located linkage review/report; the prototype does not recompute them from raw observations. The source table records input fingerprints; the linkage review records original document fingerprints and printed/PDF page locators. Practitioner usefulness, study comparability and formal conceptual-model/ontology approval remain untested.

## Reproduce and review

From the repository root with `jsonlite`, `rmarkdown`, `knitr`, `htmltools`, `ggplot2`, and Pandoc available:

```r
source("dev/scripts/fwwg-question-evidence.R")
```

Alternatively run `Rscript dev/scripts/fwwg-question-evidence.R [new-output.html]`. The driver validates the reviewed workbook hash, renders a self-contained HTML snapshot to ignored `dev/outputs/fwwg/`, and refuses to overwrite an existing destination. It does not alter inputs or production records. The [template](../../inst/reports/fwwg_question_evidence.Rmd) is a case-specific prototype; it is not an exported general report interface.

Review the rendered charts for labels, layout and distinction between reported and candidate connections. The in-app browser has previously blocked local `file:` access; a successful render and inspection of embedded charts do not by themselves establish full browser or mobile layout quality. The [deferred practitioner prompts](../goals/fwwg-practitioner-story-prompts.md) should be used only when participants have capacity.

The 2026-11-02 [prototype snapshot](../outputs/fwwg/question-evidence-20261102T201559Z.html) rendered successfully using R 4.6.1. The three embedded charts were inspected for legibility; the relationship diagram was revised to make arrowheads visible. A focused output check confirmed the three charts and key evidence/qualification text. Full-page browser and narrow-width review, interpretation by users, and scientific/partner validation remain outstanding.
