# Foundational source inventory

Inspected: 2026-10-07. Scope: repository context, the supplied UMRR collection in the parent workspace, and user-designated websites. This is a working inventory, not an exhaustive search of external program holdings.

## Available material

| Source | Origin/version | Coverage and authority | Review state |
| --- | --- | --- | --- |
| [Initial conversation](../checkpoints/archive/initial_transcript.md) | User-provided archived chat; conversation dates not established | User purpose, sequencing correction, and FG relationship; assistant proposals interspersed | Read; accepted directions extracted into project-foundation.md. Assistant claims about other chats or recovered work are unverified. |
| Hand-off prompt in this chat | User, 2026-10-07 | Explicit scope, sequencing, framework use, and implementation deferral | Incorporated into maintained foundation and architecture notes; not a program evidence source |
| [AGENTS.md](../../AGENTS.md) and [development context](../README.md) | Local scaffold | Standing repository instructions and artifact routing | Read |
| [Artifact lifecycle](../governance/artifact-lifecycle.md) and [completion workflow](../workflows/complete-development-task.md) | Local scaffold | Existing context authority, maintenance, and completion procedures | Read; followed without adding a separate governance framework |
| [Scaffold manifest](../agentic-context.yml) | Records reproducibleai package_version 2026.9.4, standard_version 0.1, base and r-package profiles | Installation metadata and seeded-file hashes | Read; does not establish an implemented R package or verify the latest upstream guidance |
| [reproducibleai website](https://mvr-gis.github.io/reproducibleai/) | URL supplied by user | Potential upstream framework guidance | Attempted access through web tool failed; current upstream content was not reviewed. Local scaffold guidance remains the available evidence. |

At initial inspection, no program reports or prior technical work were present. The user has since supplied `UMRR/KeyDocuments` (37 PDFs, 2,478 pages) and `UMRR/EMMA` (three decks, 82 slides) in the parent workspace. These originals remain outside the Git repository. See the [first program review](umrr-program-review.md), [complete file register](umrr-source-register.json), and [EMMA crosswalk](../architecture/emma-crosswalk.md). Datasets, an executable EMMA schema, and FG source/interface documentation are still absent from this collection.

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

The categories below were the initial assistant-proposed collection priorities. The supplied collection now partially meets the program-document and user-framing priorities. Use the [program review's remaining gaps](umrr-program-review.md#foundational-material-still-missing-or-unverified) for the current specific acquisition needs. These priorities are not approved program requirements.

| Priority | Material to locate | Purpose |
| --- | --- | --- |
| First | User's existing program-level synthesis, framing, prior analyses, and referenced source lists | Recover accumulated understanding before starting a new design |
| First | Foundational UMRR goals, guidance, historical syntheses, evaluations, and lessons learned, with dates and versions | Ground goals in documented program knowledge |
| Next | UMRR monitoring, research-design, assessment, and adaptive-management guidance | Understand established scientific reasoning and decision processes |
| Next | Descriptions of current information systems, inventories, data dictionaries, stewardship, and access constraints | Identify existing capabilities and gaps before proposing new tooling |
| Next | NESP program framing and relevant scientific guidance | Establish shared needs and program differences |
| Next | FG documentation, existing provenance conventions, outputs, and needs for shared scientific context | Ground its contributor and consumer relationship in actual implementation evidence |
| Later | Representative project records covering rationale through assessment and management response | Test the reviewed foundation; do not substitute for program-level review |

For incoming sources, record origin, date/version, program coverage, authority/review status, specific evidence locations, implications, and unresolved questions. This is a proposed working convention, not a formal schema. Do not store restricted material or personal information in agentic-context artifacts.
