# Restoration Features in DuckDB

The prototype uses a separate `rf` schema to reflect the existing Restoration Features source boundary. The supplied GeoPackage's 27 layers are imported as `rf.src_<layer name>` tables. `rf.import_source` and `rf.import_layer` record snapshot and layer provenance, feature counts and CRS metadata. These are local source copies, not an enterprise ownership change or a complete recreation of source geodatabase constraints, domains, relationships, indexes or application behavior. The separate legacy `rf.dataset_snapshot` and `rf.revetment` preserve the earlier XML-based seven-record Bertom fixture used by existing reports. The shared project number supports a **candidate project-level association**, not an established survey-to-feature relationship, exposure, effect, or EMMA identity.

The source XML's geometry encoding and coordinate reference system have not been verified. Consequently, geometry and CRS remain null in the legacy `rf.revetment` fixture. Actual GeoPackage geometries are in the `rf.src_` tables. `rf.spatial_demo` contains a separately identified synthetic line, solely to test spatial storage and functions.

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

From the repository root, create a **new** database containing the earlier XML fixture and the complete supplied GeoPackage's layers, substituting local paths as needed:

```text
Rscript dev/scripts/duckdb-full-rf-build.R dev/outputs/duckdb/restoration-full-rf.duckdb ../UMRR/RestorationFeatures/RestorationSchema_data_20261102.xml ../UMRR/RestorationFeatures/RestorationFeatures_20261106.gpkg dev/outputs/duckdb-extensions
```

The destination's parent directory must exist. The script refuses to overwrite a database, verifies the expected XML hash, checks the GeoPackage hash before and after import, and checks each available source layer count; it does not download the extension. The GeoPackage layers are loaded in one transaction. A failed build can leave an incomplete database, so use a new destination after addressing the error. The XML may contain connection metadata and should not be committed or reproduced in logs. The [multi-entry reports](duckdb-multi-entry-report.md) prefer the imported GeoPackage Revetment layer when present, and explicitly label the legacy fixture fallback. Extension binaries and local databases under `dev/outputs/` are ignored by Git and are not backups.

The local build is `dev/outputs/duckdb/restoration-full-rf-20261106.duckdb`: all 27 source layers, including two empty layers, produced matching source and imported counts totaling 6,259 records. A bidirectional `EXCEPT ALL` comparison against DuckDB's reading of each GeoPackage layer also found no row differences. This checks the imported values as read by DuckDB; it does not validate every geometry, source completeness, cross-system identity or scientific interpretation.

## UMRR-DB projects export

When the coworker's GeoPackage arrives, inspect its layer names, fields, CRS and date, then import the exact projects layer into the existing **local** prototype's separate `umrrdb` schema:

```text
Rscript dev/scripts/duckdb-import-umrrdb.R dev/outputs/duckdb/restoration-full-rf-20261106.duckdb PATH/TO/projects.gpkg EXACT_LAYER_NAME dev/outputs/duckdb-extensions
```

This adds `umrrdb.src_<layer name>`, `umrrdb.import_source` and `umrrdb.import_layer` transactionally. It refuses to overwrite a previously imported snapshot and does not alter the GeoPackage or establish identity links; use a new database for a later snapshot. The import mechanism is tested with a synthetic projects layer; the coworker's export, schema, identifiers and CRS have not yet been verified. This command modifies the named local DuckDB file, so disconnect other processes first. It must not target enterprise systems.

## GeoPackage staging

A GeoPackage enables an open, inspectable import through DuckDB's [`ST_Read`](https://duckdb.org/docs/current/core_extensions/spatial/functions#st_read). Include the Revetment layer, original `RESTORFEATIDPK` and `PROJECT_ID` fields, geometries, CRS and enough metadata to identify the source and export date. Other relevant layers can be added incrementally.

The staging driver creates a **new** database with the existing XML fixture and a separate `rf.geopackage_stage` table, limited to project 65. It records the GeoPackage fingerprint, layer, reported source feature count, geometry type and CRS metadata in `rf.geopackage_source`. It prints matched and unmatched IDs, duplicate or invalid IDs, and missing geometry counts for inspection. It does not copy the staged geometries into `rf.revetment` or create any asserted relationships. It checks the input hash before and after staging and refuses to overwrite a destination; as with the XML build, a failure can leave an incomplete output.

```text
Rscript dev/scripts/duckdb-rf-geopackage-build.R dev/outputs/duckdb/restoration-rf-staged.duckdb ../UMRR/RestorationFeatures/RestorationSchema_data_20261102.xml PATH/TO/export.gpkg EXACT_LAYER_NAME dev/outputs/duckdb-extensions
```

The path and layer name above must be replaced with the supplied export and its exact layer name. The importer requires one geometry column plus `RESTORFEATIDPK` and `PROJECT_ID`, and reads source attributes as exported. It selects project 65 using a numeric project ID; malformed IDs do not enter the subset. Its ID comparison is a screening aid, not identity validation. The developer test uses an isolated synthetic GeoPackage and includes mismatched IDs. Test generation uses the optional `sf` package, but the staging driver does not.

### Supplied 2026-11-06 export

`../UMRR/RestorationFeatures/RestorationFeatures_20261106.gpkg` has SHA-256 `070fc007660829b8f9cd449b9d4070c0e9df835e96004f7c7d3c79cd367d5499`. Its metadata lists 27 layers; `Revetment` reports 116 features, 3D multipolygon geometry and EPSG:26915. The earlier bounded stage at `dev/outputs/duckdb/rf-20261106-staged.duckdb` contains seven project 65 records. Each of the seven XML fixture IDs 6723–6729 has one staged match; there are no unmatched staged IDs, missing IDs, duplicates or null geometries. DuckDB's `ST_IsValid` and `ST_IsEmpty` checks report each geometry valid and nonempty. These checks do not establish correspondence of the differently dated exports as complete snapshots, survey overlap, historical geometry, or scientific effects. The source GeoPackage and ignored databases are local.

Before connecting actual geometries, review the export date against the XML snapshot, identifier and count mismatches, duplicate IDs, missing geometries, geometry types, validity and CRS. Preserve the export and import provenance. A successful geometry import alone does not establish survey overlap or ecological effects. Oracle spatial types and migration require separate review with enterprise deployers.
