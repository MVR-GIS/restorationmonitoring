# DuckDB-backed Steamboat report

This static R Markdown prototype queries a local DuckDB snapshot at render time. It presents the source-reported planning objectives, analyst-grouped criteria, proposed response triggers, source-based science assertions, assistant-formulated SC-08, the ten-part Newton study evidence chain and workshop context. The page exposes targets, source locators, scientific limitations and review flags; it does not infer local restoration effects, an adopted hypothesis or criterion attainment. It does not query the database after rendering.

The [planning model](../architecture/steamboat-planning-extraction-duckdb.md) describes the plan tables. [Study evidence DDL](../schemas/duckdb-study-evidence.sql) records the instance and its ten typed components, five review flags and three file records. These are source-described/paraphrased components with locators and basis, not reconstructed raw observations, fitted analyses or independent replications. The migration preserves the worksheet fingerprint, publication/data-release links, file MD5s and optional row/column counts. The model still has source-specific worksheet tables alongside the common prototype; not every source record is normalized into the final enterprise study design.

With the aligned plan database and local dependencies available, from the repository root:

```text
Rscript dev/scripts/duckdb-migrate-study-evidence.R dev/outputs/duckdb/restoration-steamboat-plan-v3.duckdb dev/outputs/duckdb/restoration-steamboat-evidence-new.duckdb
Rscript dev/scripts/duckdb-steamboat-report.R dev/outputs/duckdb/restoration-steamboat-evidence-new.duckdb dev/outputs/duckdb/steamboat-report-new.html
```

Both outputs must be new paths. Close other database connections before migration. The copy helper checkpoints and verifies the database copy; the report opens the database read-only and refuses to fingerprint it while a WAL exists. A failed migration can leave an incomplete destination. The combined local prototype for this increment is `dev/outputs/duckdb/restoration-steamboat-evidence-v1.duckdb`; ignored databases are not backups. The report records the database MD5, render time and source worksheet/PDF hashes. Its source records do not themselves verify that an original still has those bytes at render time.

The [reader](../scripts/duckdb-steamboat-report-lib.R) and [template](../../inst/reports/duckdb_steamboat_report.Rmd) use DuckDB-derived case data, with explanatory presentation text in the template. The current public package API (`research_question_summary()` and `research_question_report()`) still uses JSON worksheets; the new report is a development workflow, not a replacement exported API. The prior report and worksheet files remain for migration and reconciliation. This increment does not establish complete scientific/ontology modeling, authoritative production storage, actual project-feature identity or a review workflow.
