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
