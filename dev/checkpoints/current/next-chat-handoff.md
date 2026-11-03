# Handoff: science and restoration integration design

- Updated: 2026-11-03
- Status: active conceptual-design work; no production implementation is authorized
- Use: concise rehydration for the next chat. Read this after `AGENTS.md`; then open only the linked maintained artifacts needed for the task.

## Objective

Design the **science and restoration integration component of EMMA** for UMRR/NESP. It must help a mature, distributed partnership link questions, hypotheses, designs, restoration implementations, observations, analyses, findings, performance assessments and adaptive-management decisions across projects, disciplines and decades. It supports existing workflows rather than replacing them.

## Directions accepted from the user

- Build inductively from program artifacts. Preserve source/version/locator, documented statements, assistant proposals, uncertainty and review state.
- Existing EMMA anchor: HREP → Project Objective → Performance Criterion → Monitoring Task → Observation. Exported objective–criterion and task–criterion many-to-many relationships must remain intact.
- Restoration Features is the production GIS anchor for planned/installed practices. Studies, sampling areas and habitat/context units may also be spatial. Preserve spatial relations and reproducible overlay/proximity evidence when material; geometry alone does not establish identity, exposure, causation, applicability or success.
- Use the USACE ontology as the organizational baseline now. Do not publish a UMRR ontology module yet.
- Use R-centered workflows for reporting/document processing. Use **report**, not dashboard. Do not generate PDFs unless requested.
- Build the pkgdown site locally and version `docs/` for manual GitHub Pages publication; do not add GitHub Actions. Users install from GitHub. See the [package workflow](../../workflows/r-package-development.md).
- Treat the 2025–2035 strategic plan as a draft until a controlled final is supplied. The FWWG research-framework initiative is active program context, not an approved system design.
- The user wants to tighten the conceptual model and test it with compelling visualizations for potential FWWG use as the group moves from prioritization to specific research questions. The timing is an expectation, not a scheduled commitment. Practitioner story elicitation is deferred until members have capacity; preserve the [prompts](../../goals/fwwg-practitioner-story-prompts.md) without attributing proposed stories to them.
- The user envisions dynamic, model-guided reports with multiple starting points (question, study, project, etc.), discovery in conceptual/historical and observational directions, and drill-down to connected evidence. See [model-guided evidence reports](../../architecture/model-guided-evidence-reports.md). The Bertom prototype offers selectable views of a curated fixture; it does not query live systems, discover a wider corpus or demonstrate complete institutional coverage.
- The user reports that formal artifacts for findings, assessments and decisions are often absent, in part because frameworks, criteria and data can be lacking; absence does not mean judgments are unnecessary. For design purposes EMMA is the likely application and system of record for practitioner-authored, evidence-linked judgments. UMRR may increasingly define formal assessment reports. The [durable-judgment model](../../architecture/durable-assessment-and-decision-model.md) does not establish a deployed schema, approved workflow or existing reporting requirement.

## What is established

- The [project foundation](../../goals/project-foundation.md), [requirements crosswalk](../../goals/goals-requirements-crosswalk.md) and [relationship analysis](../../architecture/science-restoration-relationships.md) are the maintained design baseline. R-01–R-20 and L-01–L-08 remain proposed unless a document explicitly says otherwise.
- The user accepted the **attributed linkage record** as a conceptual pattern for further validation. Each linkage records a precise relation, attribution/evidence, scope, lifecycle/review state and responsible contributor/system, while referencing authoritative source systems. It is not a schema, form, workflow or system-of-record decision. See [minimum pattern](../../architecture/prospective-study-linkage-minimum-record.md).
- The pattern has been tested against Steamboat, Reno Bottoms, construction-stage evidence, Marsh Lake, and older HREP/PER material. See [cross-case consolidation](../../architecture/cross-case-linkage-consolidation.md).
- The Steamboat mussel report/extraction is sufficient for the present demonstration. It does not establish a local mussel effect, a final feature identity, or designer adoption of the assistant-formulated hypothesis.
- The full Marsh Lake feasibility report now supplies planning objectives, restoration action and monitoring intent, but not EMMA/Restoration Features identities, as-built geometry, detailed design, event register, raw-data links or formal assessment records. It remains an external cross-case, not a UMRR production record.
- The new [strategic-plan and FWWG review](../../goals/strategic-plan-fwwg-review.md) aligns the work with draft actions for a research framework, learning opportunities, performance evaluation, data/metadata, HREP–LTRM exchange and knowledge transfer.

## Read conditionally

| Task | Start here |
| --- | --- |
| Program purpose, source status or strategic alignment | [Project foundation](../../goals/project-foundation.md), [source inventory](../../goals/source-inventory.md), [strategic/FWWG review](../../goals/strategic-plan-fwwg-review.md) |
| Conceptual entities/relationships or ontology alignment | [Relationship analysis](../../architecture/science-restoration-relationships.md), [Steamboat model](../../architecture/steamboat-conceptual-model.md), [USACE alignment](../../architecture/usace-ontology-alignment.md) |
| Consolidated data model design review | [Data model design report](../../architecture/data-model-design-report.md), then the linked detailed model and source reviews as needed |
| Existing science and AM data tooling, models or reuse | [Tooling watch baseline](../../goals/science-am-tooling-watch.md) and [repeatable watch workflow](../../workflows/science-am-tooling-watch.md); the earlier broad landscape review's priorities are superseded |
| Bounded comparison of Bertom with external models | [Bertom tool-model mapping](../../architecture/bertom-tool-model-mapping.md); documentation-based, no imports, implementation or schema approval |
| HREP monitoring, PERs or assessment lineage | [HREP/PER/workshop review](../../goals/hrep-per-workshop-review.md) |
| FWWG/workshop priorities and learning opportunities | [Strategic/FWWG review](../../goals/strategic-plan-fwwg-review.md), [workshop priorities](../../goals/workshop-research-priorities.md) |
| Marsh Lake comparison | [Marsh Lake linkage](../../goals/marsh-lake-mussel-monitoring-linkage.md) |
| Restoration Features structure | [Restoration Features review](../../architecture/restoration-features-documentation-review.md), then sibling `../umrs_rf/` authored Quarto sources |
| EMMA structure/integration gaps | [Production schema review](../../architecture/production-schema-review.md), [EMMA crosswalk](../../architecture/emma-crosswalk.md) |
| R reports or extraction workflow | [Document-processing workflow](../../workflows/document-processing.md) |

The root `AGENTS.md` now contains the same source-family routing. Do not reread the archived transcript or scan all of `UMRR/` by default.

## Next safe action

The user clarified on 2026-11-03 that manuals, AM program descriptions and construction/project tracking are insufficient: the goal is inspectable data models and preferably open-source tooling for long-term governance of science–restoration integration. The [tooling watch](../../goals/science-am-tooling-watch.md) supersedes the earlier broad review's comparison priorities. No verified open end-to-end replacement emerged from the bounded search. Continue conceptual design and report work while examining concrete partial candidates, particularly AMMonitor/AMModels, Miradi's model, NPAM, ORKG and SEPIO; repositories for the USGS R packages returned 403 in direct browsing. Do not stall for broad manual/portal searches or assume outreach, adoption, production records or a technology choice is authorized. The [watch workflow](../../workflows/science-am-tooling-watch.md) gives a bounded, unscheduled refresh process.

The user then requested a one- or two-turn mapping exercise. The [Bertom mapping](../../architecture/bertom-tool-model-mapping.md) completes it in one turn using available documentation: AMMonitor's monitoring concepts, Miradi's intended results, SEPIO's claims/evidence, and AMModels' analysis bundle. It records analogies and limits; no candidate was installed and no schema was validated. Resume conceptual model and practitioner-report iteration rather than extend the mapping without a new reason.

The [Bertom linkage review](../../goals/bertom-rock-habitat-linkage-review.md) and [availability screen](cross-system-case-screen.md) trace WQ-39, historical objectives and targets, a rock habitat channel and the 2014 survey. UMRRDB project ID 65 matches named Restoration Features records in the supplied snapshots, but EMMA identity and survey-to-feature geometry are unverified. The FY27 compilation is an entry source, not evidence that entry occurred; it also contains a project-label mismatch elsewhere. The cited source passages have been reviewed. Do not present the historical target as an evaluated EMMA criterion or the report as a project-success judgment.

The user confirmed no EMMA monitoring tasks are recorded for Bertom and explained that tasks were not back-entered for completed older projects with no future monitoring planned. Source-supported historical analysis can proceed without a task record. Qualify an inference when its required evidence is missing, and do not invent a task or assume an unlocated record never existed. See [historical evidence without an EMMA task](../../architecture/science-restoration-relationships.md#historical-evidence-without-an-emma-task).

A [Bertom practitioner report](../../features/research-question-dashboard.md#bertom-practitioner-walkthrough-2026-11-02) renders the case and its gaps. The user found it helpful but visually and conceptually uninspiring. A subsequent [question-and-evidence visualization prototype](../../features/fwwg-question-evidence-prototype.md) tests a tighter [learning-opportunity model](../../architecture/fwwg-learning-opportunity-model.md). Review it with the user, iterate on the conceptual distinctions and visual design, and defer practitioner/SME interviews until participants have capacity. Reconcile system identity and survey geometry when accessible and needed for a particular inference; a complete cross-system chain is not a prerequisite for all analysis.

The [three-entry Bertom model test](../../goals/bertom-three-entry-model-test.md) manually walks the same evidence from question, survey and project. The [multi-entry prototype](../../features/bertom-multi-entry-prototype.md) supplies a shared, manually curated fixture, selectable precompiled views and an opt-in hypothetical assessment. The user described it as good progress; that is not model, scientific or workflow approval. The user then requested the consolidated [data model design report](../../architecture/data-model-design-report.md) for review of the concepts behind these reports. It is not live-system retrieval; do not assume unobserved sources have been searched or present hypothetical judgments as real decisions. Continue testing conceptual distinctions, evidence coverage, conflicting evidence and additional starting types before generalizing. Defer FWWG interviews until members have capacity.

For any subsequent mapping, record identifiers/names, source/version/locator, relationship meaning, lifecycle and review state, and relevant spatial operations and temporal alignment. Use a narrative test record or mapping worksheet; do not create production links, ontology terms, identifiers or monitoring obligations without a separate decision.

## Open decisions and limits

- Production observation storage, cross-system identity rules, feature/event identity, cardinalities, review ownership and sustainable update practices are unresolved.
- A spatial relationship requires source inputs, method, parameters/tolerance, temporal alignment and output version when it matters.
- Scientific evaluation, criterion evaluation, objective assessment and project-success judgment remain distinct.
- No comprehensive research/HREP corpus inventory, SME validation, final strategic-plan confirmation or program-wide retrieval result exists.
- Do not claim all-HREP coverage, completed action, scientific confirmation, ecological benefit or program adoption from the pilot artifacts.

## Workspace state

The repository is an R package with exported Steamboat report functions, installed report templates, tests and a locally built pkgdown site. The Bertom examples and evidence view builder remain development prototypes, not exported APIs. Report snapshots under `dev/outputs/` are ignored; `docs/` is versioned for manual GitHub Pages publication. On 2026-11-02 `R CMD check --no-manual` returned `Status: OK` after the multi-entry prototype, and simulated selector checks passed; full browser layout and practitioner review remain outstanding. Inspect `git status` before editing and preserve unrelated work. Production implementation and ontology publication remain separate decisions.
