# Model-guided evidence reports: design review

- Recorded: 2026-11-02. Status: user-directed reporting vision; traversal rules, presentation and implementation below are proposals for review.
- Scope: a family of R package reports that starts from a selected research question, study, project or another supported item and compiles connected institutional knowledge for expert teams. No production system, data source, physical schema, query technology or delivery schedule is selected here.

## Purpose and accepted direction

The user envisions a family of reports that practitioners can run from different starting points. For the selected item, the reports should rapidly and dynamically assemble the connected institutional knowledge available to the system, looking backward or upward conceptually and forward or downstream observationally. Practitioners should be able to drill down to the evidence. An opinionated, science-driven conceptual model should guide discovery of relevant items and connections, rather than requiring the practitioner to assemble a chain by hand.

The objective is comprehensive discovery **within the connected and accessible evidence**, with the sources searched, coverage and known gaps made visible. A report cannot establish that it contains everything the institution knows unless the holdings, access, ingestion, identities and coverage have actually been verified. Dynamic compilation is the intended behavior; the current case-specific prototypes do not yet implement it.

## One evidence network, multiple entry points

| Starting item | Conceptual or historical context to explore | Evidence and consequences to explore | Review question |
| --- | --- | --- | --- |
| Research question | Source wording, goal/objective context, priority assessments by reach and edition, related propositions | Relevant studies, projects/practices, datasets, findings, evaluations and remaining uncertainties | What evidence addresses this question, and where could further learning occur? |
| Study or survey | Motivating question or hypothesis if documented, design, place, comparison, source and timing | Executions, observations/datasets, analysis, findings and any documented application or decision | What was investigated, what was found and how can it be used? |
| Project | Program, objectives/criteria, planning rationale, priority questions and expected responses | Practices/implementations, monitoring, studies, findings, evaluations and decisions across time | What was intended, done and learned, and what remains uncertain? |

These are different **views of a shared conceptual network**, not separate disconnected project dossiers. Other starting types may become useful after model review. A path can begin at any known object and need not contain every intermediary. 'Upstream' and 'downstream' describe the role of a relationship in a question being explored, not a universal temporal or causal ordering.

## Proposed report behavior

1. **Identify the starting item.** Display its source identity, type, version, relevant aliases and any unresolved identity ambiguity. Select a specific item; do not silently merge similar labels.
2. **Compile a connected evidence view.** Follow model-defined relationship meanings in both useful directions. Show why each item was included: its direct relationship, the path from the starting item, source or attribution, and whether it is source-documented or a reviewed/unreviewed interpretation. Do not infer new evidence merely because two records are connected through an intermediate node.
3. **Orient before drilling down.** Present an understandable summary of questions, projects/practices, studies, findings and gaps, then let the reader inspect the actual relationships, source passages, records, methods and available data. Different starting items can emphasize different context while preserving the same underlying meanings.
4. **Make coverage and freshness inspectable.** Identify sources and versions actually included, retrieval/snapshot time, filters, access failures, known exclusions and unresolved matches. A missing result may be unrecorded, unsearched, unavailable or genuinely absent; distinguish these only when supported. Retain contradictory, negative and inconclusive evidence.
5. **Respect scientific and spatial context.** Preserve study design, response, place, time, implementation condition and inference limits; link to reproducible spatial evidence when material. A report should make clear whether an assertion concerns a planned practice, installed feature, measured response, scientific interpretation, criterion evaluation or decision.
6. **Support repeatable runs and evidence access.** A future run should reassemble from the then-available authorized sources and identify its inputs and versions. Drill-down should reach authoritative sources or explicitly report access/preservation gaps. Preserve source snapshots and provenance where appropriate; a dynamic view does not by itself guarantee archival access.

## Model-guided does not mean unrestricted traversal

The model should express **which relations can answer which discovery question**, their direction and meaning, and the context needed to interpret them. Candidate relevance, reported association, study design, measurement, evidence support, applicability, formal assessment and adoption are different relationships. A linked project is not necessarily a treatment; a reported finding does not automatically answer every related question; similarity of place, wording or geometry does not establish equivalence or causation.

Traversal policy needs review for relationship selection, bidirectional discovery without reversing meaning, depth and scope, cycles, duplicate paths, unresolved identities, permissions, conflicting sources, and what constitutes a useful explanation of inclusion. These are design questions, not chosen algorithms. Report all relevant connected evidence supported by the configured scope while making boundaries explicit; do not rely on an unexplained fixed-depth cutoff or claim exhaustive coverage from one pilot.

Existing EMMA objective–criterion and task–criterion many-to-many links must be preserved. A historical observation or survey may be usable without an EMMA task, as in Bertom. The [USACE ontology baseline](usace-ontology-alignment.md) informs reuse of source, provenance, plan, observation and spatial concepts; any additional scientific meanings remain candidates pending review. An attributed connection should carry source/version/locator, exact relation, scope, lifecycle/review state and responsible role or system where known, consistent with the [accepted pattern](prospective-study-linkage-minimum-record.md).

## Concrete test across starting points

Use the same bounded Bertom evidence to test three views, without creating production records:

- **WQ-39:** recover its workbook question and reach ranks; show the Bertom workbook mark as an association of unknown meaning and the analyst's candidate relevance; continue to the project, channel, 2014 survey and reported findings only through separately attributed links. No study intent or FWWG selection is implied.
- **2014 survey:** recover the report's study purpose, methods and comparison areas; show the Bertom project/channel context as supported at report level and the GIS-segment match as unresolved; follow to the reported site-level and channel findings, distinguishing them from raw observations and formal target assessment.
- **Bertom project:** recover the historical goals, objective/target and channel references, and the later survey and reported findings. Show that an EMMA monitoring task is not recorded without requiring one for discovery. The UMRRDB-to-EMMA identity and survey-to-GIS segment crosswalk remain unverified.

For each view, compare overlapping source objects and links, explain any differences in relevance or scope, and make the evidence and uncertainty drillable. A common underlying set should not yield conflicting identities or invent a reversed causal claim. This is a proposed evaluation using existing evidence, not evidence that the current prototype can perform multi-entry traversal.

## Next review boundary

Refine the concept inventory and relationship semantics against the three entry-point walkthroughs, including path explanations, identity ambiguity and coverage reporting. Then prototype a shared source-referenced evidence summary and multiple views in the existing R reporting workflow. Review the results with the user before seeking practitioner stories when FWWG members have capacity. Exact data contracts, performance expectations, physical storage, live system connectivity, cross-system identity rules and production deployment remain open.
