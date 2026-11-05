# Restoration Features in DuckDB

The prototype uses a separate `rf` schema to reflect the existing Restoration Features source boundary. This is a development representation, not a complete replica of the source schema or a decision about enterprise ownership. `rf.dataset_snapshot` records the source class and SHA-256; `rf.revetment` contains selected attributes for the seven Bertom project 65 records from `RESTORATION.Revetment`. The shared project number supports a **candidate project-level association**, not an established survey-to-feature relationship, exposure, effect, or EMMA identity.

The source XML's geometry encoding and coordinate reference system have not been verified. Consequently, real feature geometry and CRS are null. `rf.spatial_demo` contains a separately identified synthetic line, solely to test spatial storage and functions. It has no real-world location and must not be associated with the seven features.

## Reproduce

Install R packages DBI, duckdb, xml2 and digest. Install DuckDB's spatial extension once for the specific DuckDB version and platform, using a local extension directory (network access is needed for installation):

```r
dir.create('dev/outputs/duckdb-extensions', recursive = TRUE, showWarnings = FALSE)
con <- DBI::dbConnect(duckdb::duckdb(), dbdir = ':memory:')
extension_dir <- normalizePath('dev/outputs/duckdb-extensions', winslash = '/')
DBI::dbExecute(con, paste0('SET extension_directory=', DBI::dbQuoteString(con, extension_dir)))
DBI::dbExecute(con, 'INSTALL spatial')
DBI::dbExecute(con, 'LOAD spatial')
DBI::dbDisconnect(con, shutdown = TRUE)
```

From the repository root, create a **new** database with the original authorized XML, substituting local paths as needed:

```text
Rscript dev/scripts/duckdb-rf-build.R dev/outputs/duckdb/restoration-rf.duckdb ../UMRR/RestorationFeatures/RestorationSchema_data_20261102.xml dev/outputs/duckdb-extensions
```

The destination's parent directory must exist. The script refuses to overwrite a database and checks the exact source hash before importing; it does not download the extension. A failed build can leave an incomplete database, so use a new destination after addressing the error. The XML may contain connection metadata and should not be committed or reproduced in logs. The [multi-entry reports](duckdb-multi-entry-report.md) can read this database and show the candidate features. Extension binaries and local databases under `dev/outputs/` are ignored by Git.

## Next: actual geometry

A GeoPackage exported from the same Restoration Features snapshot would allow an open, inspectable import through DuckDB's [`ST_Read`](https://duckdb.org/docs/current/core_extensions/spatial/functions#st_read). Include the Revetment layer, original `RESTORFEATIDPK` and `PROJECT_ID` fields, geometries, CRS and enough metadata to identify the source and export date. Other relevant layers can be added incrementally. Before connecting geometries, compare identifiers, snapshot dates, feature counts, geometry types and CRS; preserve the export and import provenance. A successful geometry import alone does not establish survey overlap or ecological effects. Oracle spatial types and migration require separate review with enterprise deployers.
