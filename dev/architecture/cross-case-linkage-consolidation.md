# Cross-case linkage consolidation

- Started: 2026-10-30
- Status: conceptual-model review; the attributed-linkage pattern remains accepted for further validation, while the distinctions and integration evidence below remain proposed
- Basis: [minimum linkage pattern](prospective-study-linkage-minimum-record.md), [relationship analysis](science-restoration-relationships.md), [production schema review](production-schema-review.md), and the linked case records
- Boundary: this review does not create a physical schema, system-of-record assignment, ontology term, production identifier, partner obligation, or claim of project success

## Purpose

The five available examples now test the proposed linkage pattern against ordinary, incomplete program evidence. They show that a durable science and restoration integration component must retain the meaning, provenance, scope, lifecycle and review state of a connection without forcing every project through a complete or linear evidence chain.

This is a consolidation of evidence already reviewed in the working examples. It does not convert assistant-proposed relationship meanings into approved specifications.

## What the cases test

| Case | Source-backed path exercised | Distinction supported for further review | What the case does not establish |
| --- | --- | --- | --- |
| [Steamboat prospective linkage](../goals/steamboat-prospective-study-linkage.md) | Priority question → assistant-formulated hypothesis → externally informed study opportunity → ancillary project rationale | A science opportunity, expected benefit and locally adopted study or design are different claims | Local adoption, dedicated monitoring, installed feature, observation or effect |
| [Steamboat performance evaluation](../goals/steamboat-performance-evaluation-linkage.md) | Objective → performance criterion → planned evaluation interval | Formal performance evaluation can exist without a source-stated hypothesis or completed result | Monitoring task/event, result, criterion calculation, objective assessment or project success |
| [Reno Bottoms study design](../goals/reno-bottoms-study-design-linkage.md) | Research question → study design → modeled scenarios/inputs → scoped finding | A study may address a question directly; a formal hypothesis cannot be mandatory | Project implementation identity, monitoring event, applied decision or local outcome |
| [Steamboat construction initiation](../goals/steamboat-construction-initiation-linkage.md) | Project construction stage and contract event | Project lifecycle evidence is not evidence of a particular feature installation, condition or outcome | Feature record, as-built condition, monitoring, observation or evaluation |
| [Marsh Lake mussel monitoring](../goals/marsh-lake-mussel-monitoring-linkage.md) | Feasibility objective/action and planned monitoring → restoration action → post-construction monitoring → comparison/analysis → scoped scientific finding | A useful scientific learning path can be retained without becoming a formal criterion/objective assessment; feasibility design may retain a later detailed-design dependency | UMRR production identity, as-built feature reference, detailed-design record, formal project-success assessment or cross-project comparability |

## Consolidated relationship principles

The cases support these candidate principles for the next model review.

The user subsequently clarified that EMMA intentionally did not back-enter monitoring tasks for completed older projects without planned future monitoring, and that some historical evidence may be difficult or impossible to recover. The [Bertom walkthrough](../goals/bertom-rock-habitat-linkage-review.md#analysis-with-incomplete-historical-tracking) therefore tests an additional route: use source-supported historical survey and finding references even when no EMMA task exists, while qualifying each inference according to the evidence it needs. A missing task is not a general analysis gate and must not be fabricated.

1. **A relationship is an attributed assertion.** Preserve the two things linked, the exact relationship, source or contributor, locator, scope, lifecycle state and review state. Do not reduce this to an unqualified graph edge.
2. **Question, hypothesis and design are separable.** A question may lead to a source-stated hypothesis, an analyst-formulated candidate hypothesis, or directly to a study design. The absence of one is an evidence condition, not proof that the other did not exist.
3. **Restoration lifecycle claims have different levels.** Project authorization, contract, construction stage, action, feature, geometry, as-built condition and operating condition need distinguishable meanings. Evidence at an earlier level must not silently imply one at a later level.
4. **Monitoring, observation, analysis and finding are distinct.** A task or survey is not an observation; a set of observations is not an analysis; and an analysis is not a transferable conclusion without its scope and limitations.
5. **Scientific learning and formal performance assessment connect but do not collapse.** A finding about an expected ecological benefit may inform adaptive management without evaluating a project criterion or establishing objective achievement. A criterion evaluation similarly needs its own method, result and assessment context.
6. **Fragmentary evidence is preserved as a known gap.** Missing feasibility reports, feature identities or monitoring records should be stated with source context. They do not invalidate later evidence or justify fabricated links.
7. **Existing systems remain the anchors.** EMMA, Restoration Features, source publications, datasets and partner repositories should retain authoritative content. The integration component records reviewable connections among them rather than duplicating their full records.
8. **Spatial relationships are evidence, not shortcuts.** Studies, observations, habitat/context units and implementations may all have spatial representations. When overlap, containment, adjacency, distance, shared reach or another spatial relationship supports a linkage, preserve the authoritative spatial reference, method, parameters and time alignment. Do not infer identity, exposure, causation or success from geometry coincidence alone.

## Evidence needed before physical modeling

The relationship meanings can continue to be reviewed now. Physical integration choices need one bounded, real cross-system evidence package for each area below.

| Integration question | Existing anchor to inspect | Smallest useful evidence package | Decision it would inform |
| --- | --- | --- | --- |
| Project identity | EMMA `USACE_PROJECT_ID`, Restoration Features `PROJECT_ID`, project documents | One project represented in both production systems plus its documented crosswalk or mismatch | Whether a reference, mapping record or stewardship process is required for project identity |
| Implementation identity and condition | Restoration Features feature/class, geometry, planned/installed status and as-built or construction artifact | One source-backed implementation record that can be located in Restoration Features, including its lifecycle/condition evidence | Whether feature references need a qualified implementation linkage and what source remains authoritative |
| Monitoring and event identity | EMMA monitoring task and task-event records; the actual observation or dataset holding | One monitoring task, one event where available, and the corresponding observation/dataset reference | How to distinguish planned collection, performed event, observation and dataset without duplicating data |
| Evaluation and assessment | EMMA objective/criterion relationships, evaluation method, result and assessment artifact | One criterion with a versioned method, evaluated result and objective-level interpretation, if available | Which records belong to performance evaluation versus scientific interpretation |
| Evidence/review stewardship | Existing document metadata, source locators and responsible program/partner roles | One reviewed linkage with source/version/locator and a visible reviewer or responsible system/role | What minimum provenance and review history are feasible without imposing a centralized workflow |
| Spatial relationship evidence | Restoration Features geometry and status; study/observation/habitat spatial records or documented spatial references | One reproducible, source-backed overlay, containment, proximity or shared-unit analysis involving a restoration and science record | Which spatial references, methods, tolerances, time alignment and result retention are needed; when analysis remains in GIS rather than becoming a persisted linkage |

No case currently supplies all five packages. The absence is informative: it identifies the evidence needed to make implementation decisions without pretending that report-level examples answer production identity and ownership questions.

## Recommended bounded next review

Update 2026-11-02: do not treat an EMMA task as a universal eligibility gate. The Bertom case has a user-confirmed absence of such tasks and still supports source-level analysis. The review below remains useful when operational task/event records exist; for legacy cases, use available source, project and feature references and document the missing operational link. Confirm identity and data fitness for each proposed inference rather than requiring a complete chain before analysis.

Conduct a cross-system mapping review using a single project for which an EMMA project record, at least one Restoration Features record, and one monitoring or observation reference can be viewed together. Record only:

1. the identifiers and names used by each source system;
2. the documented basis for saying they concern the same project, feature or event;
3. the relationship meaning and lifecycle state;
4. the source/version/locator and review status; and
5. the unresolved mismatch or missing record.

Where the mapped relationship depends on spatial interaction, also record the authoritative spatial inputs, spatial operation, parameter/tolerance, temporal alignment and resulting relationship. Treat that result as analytical evidence for review.

The output should be a small mapping worksheet or narrative test record, not a new database table, identifier registry, ontology module or monitoring requirement. It will determine whether the attributed-linkage pattern can reference EMMA and Restoration Features records without duplicate capture, and which identity rules need a later physical-model decision.

## Relationship to requirements

This consolidation continues to exercise proposed R-01 (provenance), R-02 (questions/studies/outputs), R-03 (design and scope), R-04–R-06 (assessment and learning), R-07 (observations/analyses), R-09 (implementation), R-13 (continuity), R-15–R-17 (distributed stewardship), and R-20 (spatial entities and relationships). It adds R-20 to the proposed backlog, without an acceptance threshold. The [requirements crosswalk](../goals/goals-requirements-crosswalk.md) remains the authoritative project-level list.
