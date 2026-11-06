# Durable assessment and decision concepts

- Recorded: 2026-11-02. Status: conceptual design for review, prompted by user direction; not an approved schema, mandatory form, governance workflow, ontology module or production implementation.
- Purpose: make expert judgments, their evidence, and adaptive-management decisions durable and discoverable even when they are not formal reports. The [three-entry Bertom walkthrough](../goals/bertom-three-entry-model-test.md) tests these distinctions against available evidence.

## Program context and direction

The user reports that the program has few, if any, required formal artifacts expressing definitive findings, conclusions and decisions. Practitioners may be reluctant to commit to formal documents, partly because a clear analysis framework, performance criteria or sufficient observations are often lacking. The user considers the lack of recorded decisions a potential impediment to adaptive management, not evidence that judgments are unnecessary. This is user-provided program insight and a hypothesis about its effects, not a quantified finding about all projects. The [HREP/PER review](../goals/hrep-per-workshop-review.md) also documents existing reports that contain evaluations and conclusions: preserve and link those examples rather than treating all formal assessment as absent.

The user directs an opinionated model that can represent durable findings, assessments and decisions as first-class information, rather than depending entirely on preexisting documents. For design purposes the user identifies **EMMA as the likely database application and system of record** for these judgments; this work should inform which data objects are needed. This is a design assumption, not confirmation of an approved deployed schema, application workflow, data migration or production change. The user also anticipates that UMRR may increasingly define formal assessment reports to make decisions durable and traceable for adaptive management. That is a possible future program choice, not an existing requirement or adopted report standard.

## Proposed object boundaries

| Concept | Working meaning | Evidence and decision boundary |
| --- | --- | --- |
| Observation or reported result | A measured value or source-reported result, with procedure, unit, place and time where known | A reported summary is not automatically a recovered raw dataset; a value does not itself explain what it means. |
| Analysis | A method or activity that transforms or compares evidence to address a question | A report can describe an analysis even when code or raw data are unavailable; preserve the missing inputs and method detail. |
| Finding | A bounded statement about what evidence indicates, including an inconclusive finding | Attribute it to its author or source and distinguish observation from interpretation. It can be recorded directly by a practitioner or referenced from a document. |
| Assessment | An attributed, scoped judgment that considers evidence against a question, criterion or other explicitly stated frame | An assessment can state that evidence is insufficient or the assessment is not yet possible. A scientific assessment, criterion evaluation and objective/project assessment may overlap in evidence but answer different questions. A formal criterion is not mandatory for all scientific judgments. |
| Decision | An attributed choice or explicit deferral concerning a question, action or course of study | Record the options/context and reasoning to the degree known, and distinguish a recommendation or proposed choice from an adopted decision. A decision is not proof an action was performed. |
| Action and follow-up | Planned, performed, changed or unverified implementation, study or monitoring, and questions to revisit | An intended follow-up is not automatically completed; later evidence can prompt a new or revised judgment. |

These meanings are proposed to make distinctions inspectable. They do not require separate tables, exclusive types, universal field lists or a single linear sequence. A source may use terms differently; retain its wording and meaning. Scientific claims are not made true by entry, approval or the presence of a confidence label.

## Partnership interpretation and long-term reexamination

The user's consciously postmodern position treats conclusions as situated, attributable interpretations that can be revisited as knowledge and methods evolve. The partnership may reach a shared conclusion, or it may retain competing conclusions. The minimum useful outcome is to make the differences and their scientific bases understandable, not to force agreement. Traceability supports rigorous evaluation of claims; it does not establish that all interpretations are equally supported or that every conclusion is merely subjective.

For each recoverable interpretation, the model should distinguish the **claim or judgment**, its author or group and attribution basis, the reasoning connecting it to evidence, the observations/datasets/analyses or expert knowledge referenced, and source/version/locator, methods, context, uncertainty and limitations. Preserve source-authored statements separately from later analyst or machine reconstructions. Explicitly identify supporting, challenging and contextual evidence where known. A citation alone is not proof of an evidentiary relationship; a missing rationale or original observation stays unknown. A collective assessment and individual dissent can coexist without making an individual speak for the partnership.

Reports should let readers compare claims side by side and follow each claim's rationale to its own evidence, including shared datasets and methods. Sources maintained by different organizations can derive from the same underlying evidence; do not count them as independent confirmations without establishing their lineage. New measurements, methods or evidence can inform a new interpretation while the earlier claim and its then-available basis remain recoverable. Capture changes and supersession with attribution and time when implemented, without treating a later view as automatic proof that an earlier one was unreasonable.

For generations of use, preservation requires more than links or hashes: plan for authorized retention or sustainable access to source versions, observation datasets, metadata, methods and code where available, plus readable/exportable records, backups, migration and ownership. Record inaccessible, missing, restricted or lost material as a gap; do not promise that all artifacts can be recovered. Retention rights, access, preservation responsibilities, authentication and costs require partnership and enterprise decisions.

**Current prototype boundary:** the DuckDB slice carries selected source locators, extracted assertions, relation labels and example rationale. It does not yet implement complete named-actor/contribution attribution, observation-to-claim provenance, competing practitioner-authored judgments, durable version history, source synchronization or archival guarantees. Review, adjudication and change-control mechanics remain future partnership work after the MVP; do not infer approval or invent a reviewer.

## Minimum conceptual content for a durable judgment

For a practitioner-created finding, assessment or decision, propose capturing enough information to recover:

1. **Statement and subject:** what is being asserted or decided, about which question, project, feature or other item, and for what place, period and conditions.
2. **Author and timing:** the contributor or responsible group and date of the judgment, with separate recording time when known. Do not infer that the author speaks for an organization.
3. **Basis and reasoning:** links to supporting, challenging and contextual evidence, methods or expert knowledge; the rationale connecting evidence to the statement; and material gaps, counterevidence and uncertainty. An expert account can be attributed directly rather than inventing a source document.
4. **Type and state:** whether it is a finding, assessment, recommendation, decision or explicit deferral; its draft/review/adoption state and the basis for that state, where known. Lifecycle, review, authority, scientific confidence and sufficiency are different dimensions, not one combined status.
5. **Consequences and history:** if applicable, alternatives, chosen or deferred action, conditions for revisiting, subsequent evidence, related action state and links to earlier or superseding versions. Preserve disagreements and revisions rather than overwriting them.

This is an intentionally opinionated **conceptual checklist**, not a required-entry gate. Incomplete judgments should remain recordable with unknowns made visible. The minimum mandatory elements, permissions, review protocol, author attribution, revision history, stewardship and operational burden must be designed with practitioners; the model must not manufacture historical judgments or elevate an analyst draft to a program decision.

## Evidence and future records in reports

Reports should discover document-backed assertions and practitioner-created records through the same attributed relationship principles, while visibly distinguishing source-authored, practitioner-authored and analyst-proposed content. A result's uncertainty, evidence coverage, contradictions and review state must travel with it. A formal performance criterion, raw data or a formal publication can be absent without preventing a practitioner from recording an explicitly bounded assessment that the evidence is insufficient. Conversely, a new assessment does not create missing data or retroactively validate an unsupported result.

For Bertom, the 2015 report states a scoped observation and interpretation, and calls the downstream effect inconclusive. The reviewed sources do not establish a formal target assessment or later management decision. A **hypothetical future practitioner** might record an assessment that available evidence is insufficient to determine attainment of the year-50 mussel target, citing the report and the unreconciled coverage, methods, units and timing. That statement is a design example only: it has not been authored, reviewed or adopted by a program practitioner and must not appear as an actual record or determination. A separately recorded decision to seek further data or defer action would require an actual decision-maker and evidence; none is invented here.

## Organizational reuse and open decisions

The [USACE ontology baseline](usace-ontology-alignment.md) offers document/entity, provenance, validity/time and plan/observation concepts as candidates. Its scoped scan did not establish all scientific finding, assessment, decision or evidence-relation meanings; recheck current module semantics before proposing reuse or extensions. No class equivalences, IRIs, ontology publication or system-of-record assignment follow from this note.

Open design work: who may author and revise, how dissent and organizational authority are represented, appropriate access and confidentiality, whether individual and collective statements need distinct mechanisms, minimum useful fields, evidence-sufficiency language, versioning and audit history, and the boundary between an expert judgment, a formal criterion assessment and a management decision. Design against EMMA as the likely judgment record system while verifying its current capabilities and integration boundaries. A potential assessment report may reference, summarize or preserve a version of those records; authorship, authority, publication and whether it is generated from records remain unresolved. No particular implementation or report obligation is approved.
