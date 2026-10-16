# Restoration Monitoring: purpose, current state, and direction

Updated: 2026-10-16. This is the entry point for current project context. Accepted directions below come from the user's statements in this chat and the explicitly reviewed initial conversation. Source reviews document evidence; proposed requirements and conceptual definitions remain subject to review.

## Accepted purpose and approach

Systematically connect science and restoration across disciplines, organizations, careers, and generations. The intended network links hypotheses, research designs, restoration implementations, observations, analyses, conclusions, assessments, and adaptive-management decisions for UMRR and NESP. FluvialGeomorph is one contributing measurement/analysis suite and a consumer of this shared infrastructure.

Support the mature Federal–State–Local–NGO program and its experienced experts through existing scientific methods, stewardship, and workflows. The user describes an effective 40+ year program whose regional, disciplinary, and temporal complexity creates opportunities for improved study continuity, design, follow-through, cumulative learning, and confirmation of tentative findings. These improvements are intended benefits, not demonstrated project outcomes.

Build inductively: inventory accumulated artifacts, extract their key elements, and link them using documented details. Refine the conceptual model through real examples. Preserve original wording, source/version/locator, and the distinction between documented statements and later interpretations. Listing and linking may reveal descriptive patterns and enable scientific synthesis. Durable preservation of the underlying work is independently valuable even without new discoveries.

Review accumulated program knowledge before detailed individual-project validation. Independent examples from different projects are appropriate for the initial extraction pilot: an already connected set is not required. Missing links are part of the problem to represent, not an admission barrier.

"Science vocabulary" means names and definitions of conceptual data entities. Retain established ecosystem-restoration terminology. The user's latest direction makes the local USACE ontology an immediate terminology/structure dependency: reuse organizational concepts and identify justified gaps from the start. A future UMRR module will codify reviewed decisions beneath that infrastructure. This supersedes the earlier deferral of alignment; authoring/publishing the module remains later work. See the [organizational baseline review](../architecture/usace-ontology-alignment.md).

Use reproducibleai's established `dev/` artifact structure. Physical database implementation, production changes, and technology selection remain deferred until grounded requirements and the conceptual model have been reviewed.

## Existing systems and evidence

| Source/system | Current understanding | Remaining limits |
| --- | --- | --- |
| EMMA | Production system populated by Data Stewards from legacy HREP artifacts. User reports accomplished budgeting, scheduling, staffing, reporting, objectives, and criteria capabilities. Reviewed DDL/ERDs document projects, objectives, criteria, monitoring tasks/events, and many-to-many objective–criterion and task–criterion links | Observation storage/references, live records, population coverage, and integration semantics remain uninspected |
| Restoration Features | Production GIS database populated by USACE GIS staff for UMRR/NESP planned and installed practices. XML schema and Quarto documentation reviewed; existing feature definitions, classifications, lifecycle guidance, and crosswalks anchor the restoration side | Project/feature identity reconciliation, history/operations, and selected documentation/schema differences need clarification before exact integration |
| Program foundation | First review of 37 supplied PDFs and three EMMA decks completed with explicit scope limits; subsequent schema and book reviews add structural context | Historical coverage is incomplete; draft/historical documents do not automatically establish current policy |
| Research corpus | User identifies UMESC publications, ScienceBase and the Zotero mussels collection. First science-side analysis samples six publications and derives candidate conceptual distinctions with source-depth labels | Most evidence is abstract-level; selected HEA full-text sections reviewed. Comprehensive inventory, full-text extraction and SME validation remain incomplete |

The user's conceptual chain is HREP → Project Objective → Performance Criterion → Monitoring Task → Observation. Preserve that intent alongside the more detailed exported relationships; no new observation-table structure or cross-system join rule has been approved.

## User needs and current analysis focus

Five user stories are recorded in the [crosswalk](goals-requirements-crosswalk.md): managerial reporting, research discovery, treatment-outcome assessment, citizen understanding of program value, and biologist assessment against project criteria at lifecycle intervals.

The user accepted the researcher story (US-02) as the analysis starting point: identify HREPs implementing treatments that inform a specified hypothesis. The biologist story (US-05) is a complementary check. Criterion attainment and scientific hypothesis evaluation can use related evidence while answering different questions.

## Design status on 2026-10-16

The user accepts the restoration extraction as sufficient for the current demonstration; Data Stewards already perform this task in production. The active milestone now moves to scientific objects/evidence relationships and organizational reuse. The [science-side worked example](mussel-science-worked-example.md) and [structured evidence worksheet](mussel-science-evidence.json) provide an initial sample; they do not codify a UMRR module or demonstrate a local mussel outcome. Source disagreements in the accepted restoration example remain visible rather than resolved by acceptance.

The user explicitly identifies assessment of this AI platform's ability to extract specific data from unstructured reports and scientific papers as a project goal. The [Steamboat Island objective/criterion extraction](steamboat-island-objectives-criteria.md) is the first worked restoration extraction, including evidence locations, source differences, and a structured review worksheet. Scientific-paper extraction and user/SME validation remain pending; source-checked output alone does not establish unattended accuracy.

- **Established direction:** purpose, inductive method, existing production anchors, support for current workflows, starting user story, and preservation value.
- **Reviewed evidence:** program foundation, EMMA structure, Restoration Features schema and authored documentation, with limits retained in each review.
- **Draft design:** G-01 through G-06, R-01 through R-19, and L-01 through L-08 are working proposals. They are a review backlog, not a requirement to approve every item before examining artifacts.
- **Worked design evidence:** restoration extraction accepted as adequate for this stage; initial science-side conceptual extraction and organizational reuse matrix now available for review, with full-text and inference limits retained.
- **Not established:** a validated conceptual model, comprehensive source coverage, demonstrated scientific discoveries, or an implementation architecture.

The project is transitioning from framing and existing-system review into empirical conceptual modeling. Enough context exists to start the pilot; complete ScienceBase harvesting, production access, and resolution of every schema question are not prerequisites.

## Next milestone and reading route

Use the [crosswalk's next milestone](goals-requirements-crosswalk.md#next-milestone-worked-extraction-from-fragmented-artifacts) for the proposed bounded extraction pilot and its completion evidence.

The [knowledge graph literature assessment](knowledge-graph-literature-assessment.md) supports continuing the inductive approach, with expert validation of meanings and source-traceable links. Its focused review does not demonstrate UMRR collaboration or ecological benefits. The proposed next refinement is to compare answers to three mussel/Steamboat Island questions using current workflows and the linked evidence, recording usefulness, correctness and curation burden. This refines the current milestone rather than introducing another prerequisite or implementation commitment. Reconciliation with the final current strategic plan remains a source gap.

Read additional material conditionally:

- [Source inventory](source-inventory.md): available holdings, discovery sources, and acquisition gaps.
- [Program review](umrr-program-review.md): source-linked E1–E7 findings and historical review limits.
- [Production schema review](../architecture/production-schema-review.md): current structural anchors and integration questions.
- [Restoration Features book review](../architecture/restoration-features-documentation-review.md): feature meanings, lifecycle rules, crosswalks, and reconciliation items.
- [Scientific relationship analysis](../architecture/science-restoration-relationships.md): draft L-01–L-08 and evidence needs to test against artifacts.
- [EMMA deck review](../architecture/emma-crosswalk.md): historical design intent; current production exports take precedence for exported structure.
