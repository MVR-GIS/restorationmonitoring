# Production restoration systems and science vocabulary

- Reviewed: 2026-10-13
- Authority: user identifies EMMA and Restoration Features as production systems actively populated by EMMA Data Stewards and USACE GIS staff respectively; supplied exports provide structural evidence, not a live-system audit.
- Scope: read-only inspection of DDL, two ERDs, and XML schema. No production connection, execution, or modification.
- Direction: derive scientific vocabulary inductively from science and program artifacts. USACE ontology integration is a long-term goal, explicitly clarified by the user; it is not an immediate dependency.

## Supplied artifacts

| Artifact | Review and limits |
| --- | --- |
| `UMRR/EMMA/EMMA_full_model_20261008.txt` | Oracle 12c Release 2 model export; header modified 2026-09-08; 24 CREATE TABLE statements. Inspected table structures, relevant comments, keys, and relationship declarations; did not execute triggers or audit every behavior |
| `UMRR/EMMA/Environmental Task Tracking Component_PROJECT_OBJECTIVES_20260908.png` | Visually reviewed objectives workspace; diagram label 09/04/2026 differs from filename date |
| `UMRR/EMMA/Environmental Task Tracking Component_20230624.png` | Visually reviewed monitoring workspace; diagram label 06/24/2024 differs from filename date |
| `UMRR/RestorationFeatures/RestorationSchema_MVS_20260902.xml` | Parsed dataset/field/domain structures: 26 feature classes, 67 workspace domains. XML declares an ArcGIS 10.8 remote database workspace, although supplied as a geodatabase schema XML. No rows or live database inspected |

Originals are outside the repository. The XML includes embedded connection metadata in lineage; maintained context should carry only structural summaries, not that metadata. Originals remain unchanged; any shareable derivative should omit connection/credential metadata.

## EMMA: established structure

| Existing concept | Supplied structural evidence | Implication |
| --- | --- | --- |
| Project | `USACE_PROJECTS.USACE_PROJECT_ID` | Reuse the project identity rather than creating a competing HREP list |
| Objective | `PROJECT_OBJECTIVES`: project reference, short name, narrative, category reference | Existing narratives are a source for scientific extraction, not just reporting labels |
| Performance criterion | `PERFORMANCE_CRITERIA`: project reference, metric short name/narrative, target date | Criterion detail may be in narrative; a separate numerical threshold or criterion-evaluation table is not shown here |
| Objective–criterion relation | `UPRJ_OBJ_PERF_XREF`, unique objective/criterion pair; comment explicitly describes many-to-many | Replace the simplified linear interpretation with reusable links; a criterion can contribute to multiple objectives |
| Task–criterion relation | `ENV_TASK_UPRJ_PERF_XREF`, unique task/criterion pair, association notes; comment explicitly describes many-to-many | Tasks can inform multiple criteria, and criteria can draw on multiple tasks |
| Monitoring commitment | `ENV_MONITORING_TASKS`: project, phase, frequency, responsible organization, completion/cancellation, staffing/cost estimates | Existing operational context already supports parts of proposed continuity requirements |
| Task occurrence | `ENV_TASK_EVENTS`: task reference, planned/actual dates, organization, outcome and outcome notes, staffing/costs | Events provide implementation evidence for task execution; task outcomes are not automatically measured ecological observations |
| Document discovery preferences | `ENV_DOCUMENT_PREFERENCES` references DTS and REAPER category concepts | Reconcile existing document discovery with the new science corpus; these category preferences do not by themselves provide assertion-level citations |

No standalone observation, hypothesis, study design, analysis, or scientific conclusion table is named in the 24-table export. The user's conceptual observation relationship remains valid direction, but its detailed storage/external references require clarification. Do not equate event outcome text with a measurement dataset without evidence.

Only three explicit FOREIGN KEY clauses occur in this export (objective category and two document-category relationships). ERDs, reference columns, indexes, and comments document additional intended links. The supplied file alone does not establish enforcement for all intended relationships in the deployed system. This is an export-scope limitation, not a production defect finding.

## Restoration Features: established structure

The XML contains feature classes such as FloraPlantingOrSeeding, Island/IslandLine, DredgingEvent, FlowChannel, Wetland, Revetment, RiverineFlowStructure/Line, EmbankmentArea/Centerline, Notch, PumpStation, and supporting utility features.

Common identifiers and classifications include `RESTORFEATIDPK`, `SDSID`, `GLOBALID`, `PROJECT_ID`, `PROGRAM_UID`, `UMRRTYPE`, `UMRRSUBTYPE`, and `RESTORFEATSTATUS`. `PROGRAM_UID` has codes 1=UMRR and 2=NESP. The feature status domain distinguishes USACE/Other planned, built, enhanced, and repaired categories (one source label spells repaired as `Reparied`; preserve source codes when mapping).

The Flora subtype domain already names Tree planting, Wetland planting, Prairie planting, Floodplain Forest Planting, Timber Stand Improvement, and Aquatic Vegetation. These are immediate source terms for restoration-practice vocabulary. Domain descriptions reference the environmental design handbook in several cases. Feature-specific fields carry characteristics such as planting date/species, construction date, dimensions, elevations, and material.

Candidate linking needs, still unverified:

- Determine whether feature `PROJECT_ID` equals EMMA `USACE_PROJECT_ID`, uses another identity system, or needs a crosswalk; matching field names or project names is insufficient.
- Establish which feature identifier is durable and unique across classes, programs, and exports. Do not assume OBJECTID or RESTORFEATIDPK alone is globally unique; preserve class and program context until confirmed.
- Determine whether different geometry representations describe the same implementation, and how updates, enhancement, and repair history are retained. Status and edit timestamps alone do not establish a full lifecycle history.
- Connect objectives, criteria, tasks, observations, and scientific assertions to specific feature implementations where evidence supports that precision; project-level association alone is not feature-level attribution.

No relationship-class elements were found in this XML. This does not establish that no relationships exist in the broader system. Some Wetland domain labels/descriptions appear to describe fish structures or channel modifications; verify their intended meaning with GIS stewards before using them as authoritative scientific classifications. Do not alter production codes during this review.

## Inductive conceptual entity naming: immediate method

These production systems anchor restoration identities and established operational terms. The user clarified that "science vocabulary" means names for the data entities in our conceptual model. Ecosystem restoration already has a rich vocabulary to retain. The immediate task is to identify which kinds of scientific records recur in research/program artifacts and choose understandable entity names and definitions, rather than create a new domain lexicon or force artifacts into the assistant's preliminary entity list.

Proposed extraction/review sequence:

1. Inventory source versions, identifiers, availability, and exact passages, retaining publication/dataset relationships.
2. Record original phrases, definitions where present, contextual meaning, and candidate entities/relationships. Distinguish explicit text from reconstructed propositions.
3. Compare candidate entity meanings across documents: for example, what distinguishes a Hypothesis, Study Design, Observation, Analysis, Conclusion, or Assessment? Use examples and counterexamples to resolve conceptual distinctions; these names remain proposals.
4. Reconcile candidate entities with existing EMMA and Restoration Features structures while retaining identifiers, classifications, and established domain language. Determine which entities already exist, which need extension, and which conceptual distinctions remain unresolved.
5. Have domain experts review entity names, definitions, and relationship assertions using source evidence, then test whether they support the researcher and biologist stories. Preserve changed interpretations and uncertainty.
6. Retain a future alignment note for each reviewed concept where useful. USACE ontology class/property mapping, imports, and publication can follow later; no ontology class assignments are made now.

A modest, varied program-level extraction sample should reveal terminology and gaps before comprehensive scaling. Existing preliminary concepts are revisable. Database/embedding/ontology technology choices remain deferred.

## Research discovery and access evidence

On 2026-10-13 direct access to the supplied UMESC report-list URL returned 403, while its search-indexed official content was available. The [report list](https://www.umesc.usgs.gov/reports_publications/ltrmp_rep_list.html) indexes publications from 1987 through 2026 and notes copyright-related availability limits for reprints/journal publications and unpublished completion reports. Bibliographic discovery therefore must be tracked separately from full-text acquisition. No entire research collection was downloaded or screened in this review.

The [USACE ontology repository](https://github.com/cwbi-apps/usace-ukg-ontologies) is the user-designated long-term alignment target. Browser fetches of the repository and raw README failed; shell API access was unavailable. Its actual classes, properties, imports, license, and revision have not been reviewed. This does not block immediate inductive vocabulary work.

## Next inspection questions

The [2026-10-14 Restoration Features book review](restoration-features-documentation-review.md) now adds documented lifecycle rules, status semantics, geometry representations, NESP/handbook crosswalks, and reconciliation items. It strengthens intended meanings without establishing live-record completeness or cross-system identity equivalence.

- Where are EMMA observations and source-data/document links represented today?
- What is the authoritative EMMA–Restoration Features project identity crosswalk, and how are feature identities/history managed?
- Which accessible science/program documents should form the first varied terminology extraction sample?

This review updates earlier missing-schema statements: structural exports are now available, while live records, observed population coverage, and integration semantics remain uninspected.
