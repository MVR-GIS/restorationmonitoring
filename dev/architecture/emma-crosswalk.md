# EMMA and Restoration Monitoring: first crosswalk

- Date: 2026-10-07
- Status: assistant analysis and proposals for review
- Evidence: three supplied 2024 decks; [program review](../goals/umrr-program-review.md)

## What the decks document

## Established relationships supplied by the user, 2026-10-09

HREP → Project Objective → Performance Criterion → Monitoring Task → Observation.

Each arrow means the preceding item "has" the following item, as specified by the user. This is the accepted conceptual starting point, not a verified physical schema or a statement of cardinality. Objectives, criteria, tasks, and observations are existing EMMA concepts; proposed work should inspect how these are represented and connected before defining extensions.

The research side includes UMESC's LTRM and specialized research outputs, with ScienceBase identified by the user as a discovery platform. The desired scientific extension connects hypotheses in that research to planned/installed restoration practices and observed outcomes. A project performance assessment also connects observations back to criteria and objectives at lifecycle intervals. Scientific hypothesis evaluation and project performance assessment require related evidence but answer distinct questions.

## Historical deck evidence

[EMMA Getting Started](../../../UMRR/EMMA/EMMA%20Getting%20Started.pptx), slides 7-12, describes task recording, schedules, budgets, data stewardship, reporting, deployment in FY22-23, and subsequent data entry. This is historical deployment evidence as reported by the deck; the live system was not accessed.

[EMMA Roadmap](../../../UMRR/EMMA/EMMA%20Roadmap.pptx), slides 8-9, proposes connecting studies, questions, hypotheses, scientific objectives/designs/treatments, measurements/results/conclusions/assessments with restoration projects, objectives, performance criteria, features, monitoring events, field data, and performance reports. Slides 26 and 31 include physical-model screenshots with entity and relationship tables. The drawings provide a valuable starting vocabulary but not a validated full schema or cardinality contract.

Roadmap slides 14-23 and 26-33 propose publishing documents, annotation, SME entry, controlled vocabularies, a relational database, RDF conversion, and knowledge-graph publication. The Shiny prototype, EMMA migration, and public publication mechanisms are design candidates. We have not confirmed their implementation, approval, or suitability now.

[May 2024 monitoring workshop deck](../../../UMRR/EMMA/UMRR_Workshop_2024_Monitoring_session_slides.pptx), slides 9 and 19-25, describes monitoring obstacles and an exercise to inform a future framework. Exercise instructions are historical source content; the underlying responses and resulting synthesis are needed to establish participant recommendations.

## Recommended conceptual responsibilities

The user clarified on 2026-10-08 that EMMA's task stewardship, budgeting, scheduling, staffing, reporting, project objectives, and performance criteria are accomplished capabilities. Building outward incrementally into connected scientific concepts is accepted project direction. This account updates the historical decks; the live schema and interfaces remain uninspected. The responsibility boundaries below remain proposals, and deployment arrangements are undecided.

| Capability | Evidence and recommended relationship |
| --- | --- |
| Monitoring operations | Build on EMMA's existing project, task, staffing, scheduling, budgeting, reporting, objectives, and performance-criteria capabilities; inspect records and interfaces before defining extensions |
| Document access | A versioned document collection and search service provides discovery and cited passages across program materials |
| Scientific context | Restoration Monitoring connects questions, hypotheses, designs, analyses, conclusions, assessments, and resulting management decisions across tools and disciplines |
| Domain measurements | FG, LTRM, and other suites maintain specialized measurement/analysis meaning; establish links to source datasets, methods, and versions rather than assuming relocation of all data |
| Reviewed assertions | Scientific relationships and evidence claims are curated with source, scope, review status, and history; a retrieved passage or generated answer is not automatically an accepted assertion |

## Model refinements to test against the program foundation

| Candidate refinement | Reason and evidence |
| --- | --- |
| Distinguish management objectives from learning objectives | Strategic Plan objective 1.2 and the AM flowchart address different questions and responses |
| Record an assessment's reference condition, evaluator perspective, rationale, and aggregation | HNA-II PDF pages 35, 46-47 show scores alone do not retain meaning |
| Separate indicators, desired targets, and action triggers | Draft monitoring handbook PDF pages 15-17 includes different thresholds and ambiguous labeling requiring review |
| Connect conclusions to decisions, implemented changes, and later reevaluations | AM flowchart and 2022 RTC PDF pages 77-79 depict learning and modification cycles |
| Retain planned, constructed, maintained, and modified feature histories | Environmental Design Handbook Introduction lists design, as-built, O&M, and evaluation documents |
| Preserve observation-to-analysis provenance and inference limits | Systemic monitoring and project studies have different spatial/temporal support; record comparison design, model/method versions, uncertainty, and disturbance context |
| Support scientific work at system, reach, pool, habitat, and project scales | Strategic Plan, HNA-II, and resilience framework include questions not owned by a single project |
| Test many-to-many relationships explicitly | Roadmap questions ask where hypotheses are tested and which studies use features; do not interpret drawing sequence as a mandatory one-to-one chain |
| Clarify terminology across diagrams | Conceptual diagram uses Measurement/Result while physical screenshot includes observation/finding; define equivalence or distinction before table design |
| Attach evidence and review history to relationship assertions | Entity/relationship tables are a useful seed; pairwise relations alone do not capture why an assertion is supported, its scope, uncertainty, or supersession |

## Implications for RAG and knowledge graphs

RAG can help locate and explain existing passages. Reviewed structured records are needed for dependable questions such as which projects test a hypothesis, which versions of a treatment were assessed, and what decisions followed. An unanswered search cannot establish that a relationship does not exist.

Begin with stable document and passage identifiers and evidence-backed requirements. Defer an ontology stack, graph store, embedding provider, and relational schema until requirements, intended queries, access boundaries, and deployment constraints are reviewed. A later graph representation may complement a relational system and document retrieval; these are independent choices to evaluate.

The decks' statements about unavailable commercial alternatives, hosting, repositories, and technology capabilities describe the authors' 2024 research and proposals. They have not been independently revalidated and are not current market conclusions.
