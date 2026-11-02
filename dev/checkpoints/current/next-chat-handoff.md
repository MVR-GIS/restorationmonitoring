# Handoff: science and restoration integration design

- Updated: 2026-11-02
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
- Treat the 2025–2035 strategic plan as a draft until a controlled final is supplied. The FWWG research-framework initiative is active program context, not an approved system design.

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
| HREP monitoring, PERs or assessment lineage | [HREP/PER/workshop review](../../goals/hrep-per-workshop-review.md) |
| FWWG/workshop priorities and learning opportunities | [Strategic/FWWG review](../../goals/strategic-plan-fwwg-review.md), [workshop priorities](../../goals/workshop-research-priorities.md) |
| Marsh Lake comparison | [Marsh Lake linkage](../../goals/marsh-lake-mussel-monitoring-linkage.md) |
| Restoration Features structure | [Restoration Features review](../../architecture/restoration-features-documentation-review.md), then sibling `../umrs_rf/` authored Quarto sources |
| EMMA structure/integration gaps | [Production schema review](../../architecture/production-schema-review.md), [EMMA crosswalk](../../architecture/emma-crosswalk.md) |
| R reports or extraction workflow | [Document-processing workflow](../../workflows/document-processing.md) |

The root `AGENTS.md` now contains the same source-family routing. Do not reread the archived transcript or scan all of `UMRR/` by default.

## Next safe action

Use **one** FWWG/workshop priority or uncertainty and **one** project that can supply all of the following for a bounded cross-system mapping review:

1. an EMMA project/objective/criterion/task reference;
2. a Restoration Features implementation and spatial reference;
3. a monitoring event, observation or dataset reference; and
4. source evidence for the relationship and, if material, a reproducible spatial relation.

Record identifiers/names, source/version/locator, relation meaning, lifecycle/review state, spatial operation and temporal alignment, plus every mismatch or missing record. Create a narrative test record or mapping worksheet only. Do not create tables, production links, ontology terms, identifiers, monitoring obligations or a technology selection.

Bertom and McCartney is a possible older-project candidate, but choose it only after confirming actual EMMA and Restoration Features access. The FWWG framework should guide priority selection; it does not make a candidate automatically suitable.

## Open decisions and limits

- Production observation storage, cross-system identity rules, feature/event identity, cardinalities, review ownership and sustainable update practices are unresolved.
- A spatial relationship requires source inputs, method, parameters/tolerance, temporal alignment and output version when it matters.
- Scientific evaluation, criterion evaluation, objective assessment and project-success judgment remain distinct.
- No comprehensive research/HREP corpus inventory, SME validation, final strategic-plan confirmation or program-wide retrieval result exists.
- Do not claim all-HREP coverage, completed action, scientific confirmation, ecological benefit or program adoption from the pilot artifacts.

## Workspace state

Documentation changes are intentionally uncommitted. Preserve them and inspect `git status` before editing. The active worktree includes updates to `AGENTS.md`, goals, architecture and the current checkpoint, plus new cross-case, HREP/PER, Marsh Lake, Reno Bottoms, Steamboat construction and strategic/FWWG review documents. Generated outputs remain ignored. No production systems or source originals were changed.
