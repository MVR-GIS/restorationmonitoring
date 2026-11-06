# Steamboat planning extraction in DuckDB

The local planning slice preserves the reviewed Steamboat Island feasibility extraction as source-specific relational data. It contains **four objectives, eleven planned criterion assertions and five proposed response-trigger groups**. These are not measurements, findings of attainment, completed actions or confirmed EMMA records. The source-based summaries and criterion-to-objective groupings are analyst work; their qualifiers and unresolved discrepancies remain explicit.

```mermaid
erDiagram
  PLAN_EXTRACTION ||--o{ PLAN_PASSAGE : has
  PLAN_EXTRACTION ||--o{ PLAN_OBJECTIVE : describes
  PLAN_EXTRACTION ||--o{ PLAN_CRITERION : describes
  PLAN_OBJECTIVE ||--o{ PLAN_OBJECTIVE_PASSAGE : cited_in
  PLAN_PASSAGE ||--o{ PLAN_OBJECTIVE_PASSAGE : documents
  PLAN_OBJECTIVE ||--o{ PLAN_OBJECTIVE_CRITERION : grouped_by
  PLAN_CRITERION ||--o{ PLAN_OBJECTIVE_CRITERION : grouped_by
  PLAN_CRITERION ||--o{ PLAN_CRITERION_PASSAGE : cited_in
  PLAN_PASSAGE ||--o{ PLAN_CRITERION_PASSAGE : documents
  PLAN_CRITERION ||--o| PLAN_TARGET : has
  PLAN_CRITERION ||--o{ PLAN_TARGET_CONDITION : qualifies
  PLAN_CRITERION ||--o{ PLAN_TARGET_SERIES : has
  PLAN_OBJECTIVE ||--o{ PLAN_TRIGGER : proposed_for
  PLAN_TRIGGER ||--o{ PLAN_TRIGGER_PASSAGE : cited_in
  PLAN_PASSAGE ||--o{ PLAN_TRIGGER_PASSAGE : documents
  PLAN_EXTRACTION ||--o{ PLAN_RECONCILIATION_ISSUE : records
```

`plan_target` preserves single stated target fields and wording. `plan_target_series` stores one value per criterion, source label and year, with values **as reported** so thresholds, ranges and explanatory text are not silently converted to numeric observations. It retains the explicitly stated year-zero and later-year bases where supplied. `plan_target_condition` separates stated conditions from targets. Passage junctions retain PDF page, printed page and section. The benefit, criterion references, detailed objective pages and reconciliation issues have separate tables in the [physical DDL](../schemas/duckdb-plan-extraction.sql). Local SI identifiers are worksheet identifiers, not EMMA IDs.

The source-side records intentionally do not overwrite the earlier `main.project_objective` and `main.performance_criterion` pilot entries. The earlier SI-O3/SI-C04-like records summarize rather than exactly reproduce the worksheet; their identity and wording must be reconciled deliberately before making a canonical mapping. Relationship status on `plan_objective_criterion` is `analyst-proposed`, reflecting the worksheet's grouping by named measure. A criterion can exist without an implemented EMMA record or an assessment.

## Reproduce and inspect

With the dependencies and spatial extension configured as in the [Restoration Features guide](../features/restoration-features-duckdb.md), and all other database connections closed, create a **new** database from the aligned prototype:

```text
Rscript dev/scripts/duckdb-migrate-plan-extraction.R dev/outputs/duckdb/restoration-research-aligned-v5.duckdb dev/outputs/duckdb/restoration-steamboat-plan-new.duckdb "../UMRR/HREPs/Steamboat_Island/Steamboat Island HREP - Final Report w Appendices.pdf"
```

The third argument handles the locally relocated PDF. The worksheet retains its original recorded path; the script checks the PDF SHA-256 against the reviewed worksheet and stores the worksheet SHA-256. It checkpoints and copies the existing database before importing in a transaction, refuses to overwrite, and may leave an incomplete destination on failure. The prior database remains unchanged apart from checkpointing. The current local output is `dev/outputs/duckdb/restoration-steamboat-plan-v3.duckdb`; failed earlier v1/v2 outputs are incomplete. These ignored files are not backups.

The database has 56 year-by-year target values, ten target conditions and four open reconciliation issues, in addition to the objective, criterion and trigger records. Automated reconciliation compares all objective texts and source pages, criterion summaries and statuses, series years and values, trigger conditions and actions, and selected links and counts to the reviewed worksheet. It also verifies that the full 27-layer GIS import remains present. The [original worksheet](../goals/steamboat-island-objectives-criteria.json) and [source review](../goals/steamboat-island-objectives-criteria.md) remain available while migration and reporting are incomplete.

The subsequent [DuckDB-backed Steamboat report](../features/steamboat-duckdb-report.md) migrates and presents the separate Newton study-evidence chain alongside these plan records. The older exported report API and other worksheet reports have not yet been migrated. Neither increment completes the research inventory or establishes durable update/backup, enterprise table names, target evaluation, practitioner approval, or links to actual project features.
