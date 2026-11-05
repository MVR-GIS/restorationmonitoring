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

## GeoPackage staging

A GeoPackage exported from the same Restoration Features snapshot enables an open, inspectable import through DuckDB's [`ST_Read`](https://duckdb.org/docs/current/core_extensions/spatial/functions#st_read). Include the Revetment layer, original `RESTORFEATIDPK` and `PROJECT_ID` fields, geometries, CRS and enough metadata to identify the source and export date. Other relevant layers can be added incrementally.

The staging driver creates a **new** database with the existing XML fixture and a separate `rf.geopackage_stage` table, limited to project 65. It records the GeoPackage fingerprint, layer, reported source feature count, geometry type and CRS metadata in `rf.geopackage_source`. It prints matched and unmatched IDs, duplicate or invalid IDs, and missing geometry counts for inspection. It does not copy the staged geometries into `rf.revetment` or create any asserted relationships. It checks the input hash before and after staging and refuses to overwrite a destination; as with the XML build, a failure can leave an incomplete output.

```text
Rscript dev/scripts/duckdb-rf-geopackage-build.R dev/outputs/duckdb/restoration-rf-staged.duckdb ../UMRR/RestorationFeatures/RestorationSchema_data_20261102.xml PATH/TO/export.gpkg EXACT_LAYER_NAME dev/outputs/duckdb-extensions
```

The path and layer name above must be replaced with the supplied export and its exact layer name. The importer requires one geometry column plus `RESTORFEATIDPK` and `PROJECT_ID`, and reads source attributes as exported. It selects project 65 using a numeric project ID; malformed IDs do not enter the subset. Its ID comparison is a screening aid, not identity validation. The developer test uses an isolated synthetic GeoPackage and includes mismatched IDs; no actual feature location has yet been imported. Test generation uses the optional `sf` package, but the staging driver does not.

Before connecting actual geometries, review the export date against the XML snapshot, identifier and count mismatches, duplicate IDs, missing geometries, geometry types, validity and CRS. Preserve the export and import provenance. A successful geometry import alone does not establish survey overlap or ecological effects. Oracle spatial types and migration require separate review with enterprise deployers.
