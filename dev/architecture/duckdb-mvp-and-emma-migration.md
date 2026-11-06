# DuckDB prototype and EMMA migration crosswalk

Updated 2026-11-05. Status: **local development prototype**, not a production schema, approved EMMA change, automated LLM extractor or tested Oracle migration. The user selected embedded DuckDB for R-first development, superseding the earlier PostgreSQL selection. PostgreSQL and Oracle are possible later deployment targets; migration requires dialect and enterprise review rather than assuming automatic compatibility.

Restoration Features and UMRR-DB are separately maintained sources, intended for read-only import into this sandbox; EMMA is the independent existing application whose model this work proposes to extend. See the [system boundaries](relational-model-and-extraction-roadmap.md#system-boundaries-and-data-flow). The [Restoration Features and UMRR-DB Projects GeoPackages](../features/restoration-features-duckdb.md) are imported as local source-layer tables; the science fixture and reports remain bounded, and live connections are not implemented.

## Run the local prototype

Install the R packages `DBI`, `duckdb` and `jsonlite` in an appropriate R library, then from the repository root:

```r
source("dev/scripts/duckdb-prototype.R")
```

For this workspace, DuckDB was installed into the ignored `dev/outputs/R-library` development library. Before running the example in an R session here, use `.libPaths(c(normalizePath("dev/outputs/R-library"), .libPaths()))`, or set `R_LIBS_USER` to that directory before launching R. Other checkouts must install the dependencies in their own library; the ignored library is not shared through Git. The package declares `DBI` and `duckdb` as optional development dependencies.

Alternatively run `Rscript dev/scripts/duckdb-prototype.R [new-file.duckdb]`. The default database is `dev/outputs/duckdb/restoration-prototype-v2.duckdb`; provide a **new** path on each subsequent run. The script refuses to overwrite an existing destination. It creates parent directories and disconnects after use. SQL table/view definitions are in [duckdb-mvp.sql](../schemas/duckdb-mvp.sql); [prototype helpers](../scripts/duckdb-prototype-lib.R) initialize an empty database and load the small, curated case. Version 2 adds a typed, attributed `project_objective_link`; older databases are not automatically migrated and must be recreated for the new report. The database and `.wal` files are ignored by Git. Use a disposable database and do not point this script at enterprise systems or an existing file.

To explore:

```r
con <- DBI::dbConnect(duckdb::duckdb(), dbdir = "dev/outputs/duckdb/restoration-prototype-v2.duckdb", read_only = TRUE)
DBI::dbGetQuery(con, "SELECT * FROM question_finding_path")
DBI::dbGetQuery(con, "SELECT * FROM objective_criterion_path")
DBI::dbDisconnect(con, shutdown = TRUE)
```

The question-to-finding view explicitly includes the **assistant-proposed** later-relevance link and its limitation, the source report locator and SHA-256; it does not establish that the Bertom survey was designed for WQ-39. The objective–criterion view shows one source-reported **planned** Steamboat linkage, not a completed evaluation. An MVP database has no comprehensive discovery or live systems integration.

## Fixture and provenance

The fixture reads WQ-39 and SC-08 from the reviewed JSON worksheets and binds the cited source versions/locators from the [Bertom review](../goals/bertom-rock-habitat-linkage-review.md) and [Steamboat review](../goals/steamboat-performance-evaluation-linkage.md). Its local IDs are fixture keys, not EMMA identifiers. It records the Bertom event and report-level finding but creates **no monitoring task or raw measurements**. The historical Bertom objectives have no asserted UMRRDB or EMMA project/objective FK. The separately recorded study association to UMRRDB project 65 is a candidate and is not asserted as an EMMA identity. The Steamboat criterion is a planned source record, not an assessed outcome.

One assessment and one decision are explicitly `hypothetical` model examples, not practitioner judgments; the model does not link a made-up criterion to them. The fixture uses a fixed record timestamp for deterministic examples, not a claim about when a finding was made. Source `extracted_text` is left empty where only a paraphrase was prepared; original documents remain outside the database. SHA-256 values are recorded from the prior reviews, not freshly verified on every run. Synthetic test records used to exercise many-to-many links are isolated in memory and not part of the saved fixture.

## Migration and ownership crosswalk

The [EMMA production schema review](production-schema-review.md) describes the supplied export; it is not a live system audit. Existing EMMA names below remain authoritative for their domain. The DuckDB tables are local prototypes and must not be loaded into EMMA without reconciliation.

| Prototype | Existing anchor or target | Migration review |
| --- | --- | --- |
| `external_reference` (`system`, `namespace`, `entity_kind`, `native_id`) | `USACE_PROJECTS.USACE_PROJECT_ID`, source-system objective/criterion/task IDs, Restoration Features class and identifier | Preserve source and namespace. UMRRDB project 65 is not automatically the EMMA project key. GIS ID reuse across classes requires class/namespace context. |
| `project_objective` | `PROJECT_OBJECTIVES` | Reuse EMMA's identity and ownership when verified. Local text/source and nullable external reference support historical records; define matching, missing IDs and conflict handling before migration. |
| `project_objective_link` | No confirmed production equivalent; prototype association | Keeps the inferred UMRRDB project/objective match separate from direct ownership, with source and candidate status. Compare with existing EMMA project reference rather than assuming an enterprise table is needed. |
| `performance_criterion` | `PERFORMANCE_CRITERIA` | Reconcile source wording, project reference and target date with EMMA. This prototype omits a criterion-to-project reference present in the export; add or map it deliberately before migration. A historical target is not necessarily an existing criterion. |
| `objective_criterion` | `UPRJ_OBJ_PERF_XREF` | Both represent unique objective/criterion pairs. Preserve many-to-many links and map both endpoint IDs; pair uniqueness in the prototype does not model multiple provenance versions. |
| `monitoring_task_ref`, `task_criterion` | `ENV_MONITORING_TASKS`, `ENV_TASK_UPRJ_PERF_XREF` | Preserve existing task ownership and many-to-many pairs plus association notes. No task is fabricated for an old survey. |
| `study_event` | `ENV_TASK_EVENTS` only when an actual crosswalk is established | A source-reported study event may have no EMMA task. The prototype's optional `source_passage_id` adds direct event provenance to the logical design; do not equate it with an EMMA event. |
| `source_document`, `source_version`, `source_passage` | EMMA document discovery and external repositories | Proposed evidence layer. Reconcile `ENV_DOCUMENT_PREFERENCES` and existing repositories before choosing tables or storage; avoid copying protected documents into the database. |
| `research_question`, `hypothesis`, `study`, `finding`, `assessment`, `decision` and typed links | Proposed integration concepts | Export review did not establish equivalent standalone EMMA structures for several science concepts. Confirm existing enterprise capabilities and ownership before designing extensions; do not assume absence across the complete application. |

DuckDB is an embedded analytical engine, not an Oracle or PostgreSQL compatibility layer. Compare foreign keys, update/delete behavior, transaction and concurrency semantics, types, null/empty strings, identity generation, timestamps, spatial representations, indexes and authentication. DuckDB documents limitations around constraints and altering tables: [DuckDB constraints](https://duckdb.org/docs/stable/sql/constraints.html). For a later target, produce reviewed engine-specific migrations and validate case queries and constraints against actual versions and enterprise conventions. A successful DuckDB run is not proof of migration correctness.

## Scope and next work

This increment implements the domain skeleton and a manually curated fixture, not retrieval, LLM extraction, a web application, complete provenance, formal review governance or extraction benchmarking. The `source_version.sha256` is required in this prototype, and project/criterion/assessment provenance is simplified; the [logical model](relational-vertical-slice.md) documents open design questions. The engine does not enforce that an `external_reference` has the expected `entity_kind` for each FK; validate this when importing and design stronger constraints before enterprise handoff. The current schema is recreated only in new databases and is not yet a migration framework. The [DuckDB multi-entry reports](../features/duckdb-multi-entry-report.md) demonstrate bounded query-to-report paths.
