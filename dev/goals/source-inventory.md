# Foundational source inventory

Initial inspection: 2026-10-07; current-state cleanup: 2026-10-16. Scope: repository context, supplied collections, the sibling book, and recorded discovery checks. This is a working inventory, not an exhaustive search of external program holdings. Website access observations below retain their original dates; they are not new checks.

## Available material

### Workshop research priorities, 2026-10-21

The user supplied [research_question_ranks.xlsx](../checkpoints/archive/research_question_ranks.xlsx) as workshop analysis identifying priority research questions. [The review](workshop-research-priorities.md) documents six sheets, 49 questions under five restoration goals/eleven objectives, four reach-specific rankings, 20 recorded question/project marks and four embedded historical inventory images. The [derivative register](workshop-research-question-register.json) retains question wording, ranks, source cells and marked project labels. The four sorted rank views reconcile with the main sheet; raw weighting inputs/protocol, workshop dates and mark semantics are unavailable. This is a supplied learning agenda, not evidence of hypothesis evaluation or approved strategic-plan numbering. The workbook was left unchanged and is not part of the initial 40-file corpus register.

### Knowledge graph literature collection, 2026-10-16

The user supplied the [KnowledgeGraphs Zotero collection](https://www.zotero.org/groups/4862069/usace_ecomodeling/collections/CLHU5MJG/collection) as a source of the project's expectations. Its public library view displayed 89 items. The [literature assessment](knowledge-graph-literature-assessment.md) records a focused ten-publication review, reading-depth limits, duplicate-publication handling, a supplementary 2025 source, and implications for the existing design. This is not a systematic review or a complete attachment inventory. The local Zotero API remains unavailable; the public metadata API attempt was blocked. Browser-visible metadata and accessible primary publications supported the assessment. No Zotero records were changed.

### Organizational ontology and science-side sample, 2026-10-16

The sibling `usace-ukg-ontologies` checkout is now available and reviewed at HEAD `3ab4e87813875f444748720b29e59483a44bfb0c`, repository VERSION 2.0.0. See [organizational alignment](../architecture/usace-ontology-alignment.md) for inspected modules, reuse candidates, and review limits; remote freshness was not established. This supersedes earlier external-fetch-only access limits.

The [mussel science review](mussel-science-worked-example.md) and [evidence worksheet](mussel-science-evidence.json) record six selected Zotero collection publications, primary-source summaries and selected full-text HEA sections. This is a bounded conceptual sample, not complete full-text literature acquisition or an inventory of all ScienceBase items. No source libraries or sibling repositories were modified.

### Steamboat Island example and Zotero mussels collection, 2026-10-16

The user selected MVR Steamboat Island for the worked example and supplied three PDFs in `UMRR/HREPs/SteamboatIsland/` (979, 23, and 6 pages). Access/readability checks, checksums, lifecycle context, and proposed handling are recorded in [worked-example setup](steamboat-island-worked-example.md). The Zotero USACE_EcoModeling mussels collection is readable in the browser; selected metadata/abstracts were inspected, but collection-wide full-text availability and Desktop API access are not established. These additions are not yet part of the initial 40-file corpus register.

### Restoration Features documentation repository, 2026-10-14

The sibling repository `../umrs_rf/` contains the **UMRS Restoration Features** Quarto book, authored in root-level `.qmd` chapters with output in `docs/`. The [book review](../architecture/restoration-features-documentation-review.md) records HEAD `b5f344f16e4aee733cdb3eabe026bcb06263e8e7`, all 37 chapter files inventoried, and focused review of purpose, feature definitions, attribute/lifecycle guidance, classification crosswalks, and selected parameters. NESP and Design Handbook crosswalk chapters connect existing classifications. Numerical engineering prescriptions and case-study outcomes were not independently verified. `AGENTS.md` routes relevant work here; no sibling files were changed.

### Production schema additions, 2026-10-13

Four supplied structural artifacts are now reviewed: EMMA model DDL, two ERD PNGs, and Restoration Features geodatabase XML. See [production schema review](../architecture/production-schema-review.md) for exact filenames, structural findings, and limits. Both systems are actively populated production databases according to the user. Prior statements about absent executable schema exports are superseded; current records, observed corpus coverage, and cross-system identity semantics remain uninspected. Source originals remain outside the repository. The XML's embedded connection metadata must be excluded from maintained context and shareable derivatives.

| Source | Origin/version | Coverage and authority | Review state |
| --- | --- | --- | --- |
| [Initial conversation](../checkpoints/archive/initial_transcript.md) | User-provided archived chat; conversation dates not established | User purpose, sequencing correction, and FG relationship; assistant proposals interspersed | Read; accepted directions extracted into project-foundation.md. Assistant claims about other chats or recovered work are unverified. |
| Hand-off prompt in this chat | User, 2026-10-07 | Explicit scope, sequencing, framework use, and implementation deferral | Incorporated into maintained foundation and architecture notes; not a program evidence source |
| [AGENTS.md](../../AGENTS.md) and [development context](../README.md) | Local scaffold | Standing repository instructions and artifact routing | Read |
| [Artifact lifecycle](../governance/artifact-lifecycle.md) and [completion workflow](../workflows/complete-development-task.md) | Local scaffold | Existing context authority, maintenance, and completion procedures | Read; followed without adding a separate governance framework |
| [Scaffold manifest](../agentic-context.yml) | Records reproducibleai package_version 2026.9.4, standard_version 0.1, base and r-package profiles | Installation metadata and seeded-file hashes | Read; does not establish an implemented R package or verify the latest upstream guidance |
| [reproducibleai website](https://mvr-gis.github.io/reproducibleai/) | URL supplied by user | Potential upstream framework guidance | Attempted access through web tool failed; current upstream content was not reviewed. Local scaffold guidance remains the available evidence. |

The supplied `UMRR/KeyDocuments` collection contains 37 PDFs (2,478 pages), and `UMRR/EMMA` includes three decks (82 slides) plus the DDL and ERDs noted above. Source originals remain outside the Git repository. The [initial corpus register](umrr-source-register.json) covers the 40 PDFs/decks only; subsequent schema/book sources are recorded in their maintained reviews and this inventory. See the [program review](umrr-program-review.md) and [EMMA review](../architecture/emma-crosswalk.md). Live production records, scientific measurement datasets, and FG source/interface documentation have not been inspected.

## User-designated canonical discovery sources

Supplied by the user on 2026-10-07. Canonical status applies to these discovery sources; individual linked documents still need version, scope, and review metadata. Providing these links does not approve a retrieval architecture or database implementation.

| Source | Role | Access observed on 2026-10-07 |
| --- | --- | --- |
| [Official UMRR program](https://www.mvr.usace.army.mil/missions/environmental-stewardship/upper-mississippi-river-restoration/) | Program framing and official navigation | Direct web fetch returned 403; search index exposed a limited excerpt |
| [Key documents](https://www.mvr.usace.army.mil/missions/environmental-stewardship/upper-mississippi-river-restoration/key-documents/) | Foundational document discovery | Direct fetch returned 403; search index identified strategic-plan and ecosystem-objectives material; documents not yet reviewed |
| [HREP project finder](https://www.mvr.usace.army.mil/missions/environmental-stewardship/upper-mississippi-river-restoration/habitat-restoration/find-an-hrep-project/) | Project discovery for later validation | Page read; project finder is embedded ArcGIS content, not a static document listing |
| [USGS LTRM](https://umesc.usgs.gov/ltrm-home.html) | Monitoring and scientific material discovery | Direct fetch returned 403; search found the official [LTRM report list](https://www.umesc.usgs.gov/reports_publications/ltrmp_rep_list.html); full documents not yet reviewed |

These URLs are canonical discovery starting points. Local documents are now available and have received a first review; no vector index has been built. Individual files still require original-URL reconciliation and source-status/version review.

## Materials still to acquire and review

### Research discovery addition, 2026-10-09

The user identified USGS ScienceBase as the discovery platform for UMESC-administered UMRR LTRM and specialized research outputs. This is a user-designated research source to inventory, not an independently verified complete collection. No ScienceBase records or attachments have been inventoried in this review. A later acquisition pass should reconcile publication records, datasets, attachments, versions, and stable identifiers with the local collection and explicitly record coverage gaps.

An initial official-source discovery check on 2026-10-09 located the UMESC data catalogue and a USGS data-release description linked to ScienceBase (DOI 10.5066/P14BFCUP). See [relationship analysis](../architecture/science-restoration-relationships.md#initial-external-discovery-check-2026-10-09) for exact sources and limits. This lead has not been added to the local-file register: no release attachments were acquired, and complete research coverage remains unestablished.

The categories below were the initial assistant-proposed collection priorities. The supplied collection now partially meets the program-document and user-framing priorities. Use the [program review's remaining gaps](umrr-program-review.md#foundational-material-still-missing-or-unverified) for the current specific acquisition needs. These priorities are not approved program requirements.

| Priority | Material to locate | Purpose |
| --- | --- | --- |
| First | User's existing program-level synthesis, framing, prior analyses, and referenced source lists | Recover accumulated understanding before starting a new design |
| First | Foundational UMRR goals, guidance, historical syntheses, evaluations, and lessons learned, with dates and versions | Ground goals in documented program knowledge |
| Next | UMRR monitoring, research-design, assessment, and adaptive-management guidance | Understand established scientific reasoning and decision processes |
| Next | Descriptions of current information systems, inventories, data dictionaries, stewardship, and access constraints | Identify existing capabilities and gaps before proposing new tooling |
| Next | NESP program framing and relevant scientific guidance | Establish shared needs and program differences |
| Next | FG documentation, existing provenance conventions, outputs, and needs for shared scientific context | Ground its contributor and consumer relationship in actual implementation evidence |
| Immediate pilot | Independent research and HREP planning/monitoring artifacts, supplementing existing program/model documents | Test extraction and conceptual entity distinctions without requiring a matched project history |
| Later | Connected project records and live-system integration examples | Validate end-to-end relationships after the initial conceptual review |

For incoming sources, record origin, date/version, program coverage, authority/review status, specific evidence locations, implications, and unresolved questions. This is a proposed working convention, not a formal schema. Do not store restricted material or personal information in agentic-context artifacts.

## MS-03 acquisition update, 2026-10-21

The public [ScienceBase data release](https://doi.org/10.5066/P9HRXPJQ), catalog item `5d583085e4b01d82ce8ec16e`, was inspected for the Newton et al. 2020 vital-rates study. Acquired FGDC metadata and both CSVs are local ignored files in `dev/outputs/research-question/ms03-*`. [The maintained instance](mussel-vital-rates-instance.json) retains download URLs, fingerprints, locators and review flags; [the R inspection script](../scripts/review-mussel-vital-rates.R) can reacquire missing files and verify the reviewed edition. The publisher's full text was blocked; analysis code was not attached among the three files inspected. Dataset access does not close the full-paper/model-validation gap.
