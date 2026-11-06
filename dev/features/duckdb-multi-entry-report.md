# DuckDB multi-entry evidence reports

This development prototype creates separate self-contained report snapshots starting from a question, survey event or project reference in the DuckDB fixture. It queries recorded relationships at render time; the HTML does not query the database after rendering. It extends the [earlier question-only report](duckdb-question-report.md), while the [original curated multi-entry prototype](bertom-multi-entry-prototype.md) remains the richer source for channel/GIS candidate details. These reports are not a production API, live EMMA search or complete corpus discovery.

## Reproduce

Use the [current aligned development database and migration notes](../architecture/research-questions-evidence-relational-design.md#implementation-and-unresolved-work), or create a new full GIS prototype as described in the [Restoration Features import guide](restoration-features-duckdb.md). The earlier version-2 fixture described in the [DuckDB crosswalk](../architecture/duckdb-mvp-and-emma-migration.md) also works but has narrower content; version-1 databases do not contain `project_objective_link` and are not automatically migrated. With DuckDB/DBI, R Markdown and Pandoc installed, from the repository root:

```text
Rscript dev/scripts/duckdb-multi-report.R DATABASE.duckdb NEW-REPORT.html question 1
Rscript dev/scripts/duckdb-multi-report.R DATABASE.duckdb NEW-REPORT.html survey 1
Rscript dev/scripts/duckdb-multi-report.R DATABASE.duckdb NEW-REPORT.html project 1
```

The final optional `TRUE` includes a synthetic assessment; it is excluded by default. IDs are local fixture keys: `project 1` means the local external-reference row for UMRRDB project 65, not EMMA project ID 1. Outputs must be distinct new files in existing directories. The driver opens the database read-only, checks its MD5 before/after reading, and records its fingerprint and render time. Source hashes are stored fixture data and not verified against originals at render time.

The [reader](../scripts/duckdb-multi-report-lib.R) follows question–study, survey-event–study-version and project–study associations through explicit tables, then queries findings, event context and sources. Project objectives use the separately attributed `project_objective_link`, rather than silently turning a candidate identity into a direct FK. From a project start, its objective links remain visible even if no study is linked. Question and survey starts reach those objectives through the candidate study–project association. Rows retain both association statuses and scope. Survey starts restrict study versions to the event's linked version; project and question starts include all associated versions. A study-level finding is **not** proof that it is attributable to a particular event.

Tests compare the same question, finding and candidate project/objective associations across all three starts, check source locators and link status, reject missing starts, verify hypothetical exclusion and test a project with objectives but no study. The three published snapshots were rendered from the full GIS prototype; the aligned database has also been checked with the project report and all three readers. No scientific validation, full corpus search, RAG extraction, final GIS identity or project-success assessment is implied.

## Current gap versus the original walkthrough

The optional [Restoration Features import](restoration-features-duckdb.md) adds the complete exported Revetment layer under `rf.src_Revetment`; these reports now prefer it, report geometry presence and retain its GeoPackage hash. Databases with only the older seven-record XML fixture still work and are labeled as such; databases with neither display an absence message. Reports display candidate associations using the shared UMRRDB project number. That association does not establish a channel-to-feature or survey-to-feature relationship. No intervention effect, historical target evaluation or EMMA task is inferred to make the paths complete. Detailed spatial modeling and source-identity reconciliation remain future work. The reports present tabular snapshots rather than an interactive in-page selector; readers select an entry point when rendering or from the guide's separate links.
