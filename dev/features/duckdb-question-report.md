# DuckDB research-question evidence report

Status: bounded development prototype. This report reads the current DuckDB fixture at render time, beginning with a numeric research-question key. It shows linked hypotheses, question–study relationships, findings, source versions and passages, with a separate optional hypothetical assessment. The existing [Bertom multi-entry report](bertom-multi-entry-prototype.md) remains the richer manually curated question/survey/project comparison; it has not been rewired or replaced.

The later [DuckDB multi-entry reports](duckdb-multi-entry-report.md) add separate question, survey and project starting points against the version-2 fixture; this question-only snapshot remains available as an earlier increment.

## Reproduce

Create a new local fixture using the [DuckDB setup](../architecture/duckdb-mvp-and-emma-migration.md); install the optional R packages and ensure the database file exists. From the repository root with Pandoc available:

```text
Rscript dev/scripts/duckdb-question-report.R DATABASE.duckdb NEW-REPORT.html 1 FALSE
```

The numeric ID and final `TRUE`/`FALSE` are optional; `1` and `FALSE` are defaults. `TRUE` includes linked hypothetical assessments and labels them as illustrations. It does not add a decision or claim a practitioner judgment. The output directory must exist; the driver refuses to overwrite an existing output. It opens the database read-only, checks its MD5 before and after reading, renders a self-contained HTML snapshot, and records that fingerprint, render time and DuckDB R version. A database fingerprint identifies the bytes read, not a guarantee of semantic completeness. Source hashes and locators come from the fixture and are not reverified against original documents at render time.

The [reader](../scripts/duckdb-report-lib.R) queries the question, its hypothesis associations and its question–study–finding path. Findings are returned only when a study-version linkage is represented in the database; multiple findings/passages can produce multiple rows. An empty result means no path in this fixture, not no program evidence. The source note, relationship status and scope travel with each row; the question–study relation is an analyst-proposed later relevance, not verified original study motivation. The report does not query EMMA, perform RAG, search documents, infer spatial joins or compute target attainment.

The [report template](../../inst/reports/duckdb_question_report.Rmd) escapes database text and uses R Markdown to create a standalone snapshot. It is a repository-local development workflow, not an exported package API. It does not yet support survey or project starting points, the earlier prototype's complete curated channel/GIS path, or live refresh. The static [published example](../../pkgdown/assets/reports/bertom-duckdb-question-20261105.html) is a dated default rendering; rebuilding the database later will not automatically update that snapshot.

In-memory tests change a finding and remove its link to demonstrate that a new query reflects database changes, test source and status propagation, exclude hypothetical assessments by default, and reject a missing question. A separate default and opt-in HTML render verified the expected labels and scope. These checks do not constitute scientific or partner validation.
