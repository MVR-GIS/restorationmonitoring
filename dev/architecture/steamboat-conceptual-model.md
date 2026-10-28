# Steamboat Island mussel pilot: conceptual-model review

- Started: 2026-10-22, at the user's request to begin the walkthrough
- Status: proposed meanings and relationships for discussion; no model decisions accepted by this walkthrough alone
- Basis: [requirements](../goals/goals-requirements-crosswalk.md#requirements-clarified-by-the-steamboat-pilot), [relationship analysis](science-restoration-relationships.md), [production review](production-schema-review.md), [Restoration Features review](restoration-features-documentation-review.md), [ontology baseline](usace-ontology-alignment.md), [MS-03 instance](../goals/mussel-vital-rates-instance.json)

## The model's job

Make it possible to explain what restoration was intended, what was committed and implemented, what science informed an expectation, what was actually observed and analyzed, and why an assessment or decision follows. The purpose is durable, low-friction coordination: scientists and restoration practitioners must be able to create, review, carry forward and reuse these connections across decades of a project's lifecycle and across a regional portfolio of projects. Preserve incomplete cases. A coherent report shows these information needs; it does not determine tables, classes or an implementation platform.

Use existing system records as anchors rather than maintaining competing project, objective or GIS inventories. A conceptual reference can point to a retained external dataset; modeling individual measurements does not require ingesting every historical observation into EMMA.

## 1. Begin with existing restoration objects

| Object / anchor | Meaning in this case | Existing structure and unresolved connection |
| --- | --- | --- |
| Project | Steamboat Island HREP | EMMA `USACE_PROJECTS.USACE_PROJECT_ID`; the authoritative value and GIS crosswalk are not populated in this pilot |
| Project objective | A stated formal desired project result, such as island restoration/protection | Existing `PROJECT_OBJECTIVES`; worksheet SI-O3 is an extraction reference, not a production key |
| Performance criterion | The measure/condition used to assess a formal objective | Existing `PERFORMANCE_CRITERIA`; preserve objective–criterion cross-references rather than assume one criterion belongs to one objective |
| Monitoring task | A monitoring commitment with phase, frequency and responsibility | Existing `ENV_MONITORING_TASKS` and task–criterion cross-references; one task can inform several criteria |
| Task event | A planned/performed occurrence of a task | Existing `ENV_TASK_EVENTS`; execution/outcome notes are not automatically a biological observation or scientific evaluation |
| Restoration practice and implementation | A kind of intervention versus a particular planned/built intervention at a location and time | Restoration Features definitions/classifications and feature records; stone-protection intent is documented, but a specific installed record and condition are unresolved |
| Spatial representation | Geometry describing a feature or relevant habitat | Preserve GIS identifiers, feature class and representation. A line/polygon pair is not automatically two interventions, nor automatically one identity |

Known exported objective–criterion and task–criterion relations are many-to-many. The remaining identities and cardinalities require review. Source field names do not establish that GIS `PROJECT_ID` equals EMMA `USACE_PROJECT_ID`. Preserve existing identifiers and systems of record, then establish the crosswalk with evidence.

The case also needs an **expected benefit/design rationale** concept: the anticipated ancillary mussel-habitat benefit associated with stone protection. It is source-documented intent, separate from the project's formal objectives. It must be representable without creating a mussel criterion or survey commitment that the plan did not make. Whether benefit and rationale are separate entity types or qualified statements remains open.

## 2. Represent the scientific reasoning

| Candidate object | Concrete example | Boundary / relationship to review |
| --- | --- | --- |
| Source and passage | Feasibility VI-1; MS-03 abstract sections 3–5; ScienceBase metadata | A document/passage provides the origin of an extracted assertion; provenance does not establish its truth |
| Research question | Workshop WQ-39 about substrate and biological habitat | A question motivates investigation; its reach-specific rank belongs to a priority assessment, not to the question's scientific confidence |
| Hypothesis | SC-08, the assistant-formulated substrate-stability/persistence proposition | A testable proposition distinct from a question, objective or reported result; local designer adoption is not established |
| Study and design | MS-03 West Newton Chute investigation and core/periphery comparison | One investigation can have multiple outputs and analyses; neither the paper DOI nor dataset DOI is automatically a study identifier. This habitat comparison is not a Steamboat treatment experiment |
| Sampling event, subject, property and observation/result | Repeated tagged-mussel recovery; live/dead status and shell length | Separate mussel identity from changing tag identity; preserve date/place/procedure, observed property, units and result. A wide CSV row can represent several measurements; a non-recovery is not a recorded death |
| Dataset and analysis | Release `10.5066/P9HRXPJQ`; analyses yielding reported vital rates | The dataset supplies recorded evidence; an analysis uses inputs and methods to generate estimates/results. Full fitted models and exclusions remain unverified |
| Finding and interpretation | Higher core survival; no significant core/periphery growth difference; proposed source–sink explanation | Different responses need separate findings. An explanatory hypothesis remains distinct from a reported comparison; neither should be merged into a universal treatment-effect conclusion |
| Applicability/evidence assessment | Why MS-03 findings may inform SC-08 and the Steamboat expectation | A reviewable judgment relating evidence, proposition and receiving context, with rationale, limitations, reviewer and time. Proposed here; transferability is not yet established |
| Performance evaluation and objective assessment | Future comparison of suitable local observations with an applicable formal criterion | Preserve criterion version, interval, method, result and judgment. The case has no performed mussel criterion evaluation; this is a complementary path needed by US-05 |
| Management decision | Future continuation, modification or additional study informed by assessment | Link the evidence and reasoning to an actual decision when available; no such case decision is invented here |

These are conceptual distinctions, not a requirement to create one entity class per row. For example, hypotheses and findings might be specializations or kinds of attributed statements; study design might be a separately versioned plan. The review should decide based on identity, independent revision, reuse and query needs. Species, dates and units are ordinarily contextual references/values, not new scientific entity types merely because they appear in the report.

## 3. Walk the concrete links

The currently inspectable path is:

1. The feasibility report **documents** an anticipated ancillary benefit for Steamboat Island.
2. The MS-03 publication **reports** a study; its release **provides** supporting metadata/data. Recoverable observations and comparison design give meaning to the reported findings, while the full analysis remains a gap.
3. SC-02 and SC-03 **inform formulation of** SC-08. This is recorded analyst derivation, not an author statement that the study tested SC-08.
4. A proposed applicability assessment **relates** those findings, SC-08 and local restoration context, recording what would justify transfer and what is missing. This implements the meaning being explored in L-02/L-05, rather than treating provenance as proof.
5. To evaluate the local expectation, identify the relevant feature/design and condition, suitable local observations, a defensible comparison and an analysis. L-03/L-04/L-05 are only partially populated; no post-construction effect follows from the current path.
6. For formal project success, use observations **evaluated against** an applicable criterion and an assessment **interpreting** criterion evaluations against objectives (L-06/L-07). This can share data with scientific evaluation but answers a different question. Assessment/conclusion **informing** a decision is L-08.

All important links should retain source and locator, attribution, relation meaning, place/time scope, interpretation/review state, rationale and change history. A bare `paper supports project` edge loses too much meaning. The model must allow relevant findings to challenge or leave a proposition unresolved, and allow studies to contribute without belonging to an HREP.

## 4. Build on organizational ontology foundations

Rechecked selected local definitions on 2026-10-22 at unchanged HEAD `3ab4e87813875f444748720b29e59483a44bfb0c`; this is a local source review, not a remote-freshness, import-closure or SHACL qualification. Module paths below are relative to `../../../usace-ukg-ontologies/TBWorkspace/USACE-KG/`. Full namespaces and earlier limits are in the baseline review.

| Candidate meaning | Existing foundation | Proposed use / limit |
| --- | --- | --- |
| Attributed scientific information | `usace:Entity` under `prov:Entity`, `domain-specific/ontologies/core.ttl` | Reuse foundation for identified information objects; candidate scientific specializations require review |
| Paper/report and data release/files | `foaf:Document` grounding and DCAT import in `core.ttl` | Reuse document/catalogue meanings; review the dataset/distribution profile before exact mappings; a study is distinct from its outputs |
| Source derivation | `gov:ProvenanceRecord`, `gov:hasProvenanceRecord`, `gov:derivedFrom`, `governance.ttl` | Record sources and extraction/analysis derivations. Evidence-strength/applicability judgments need additional semantics |
| Plan, objective and planned work | `plan:Plan`, `plan:Objective`, `plan:PlannedActivity`, `cross-domain/microtheories/activity-microtheory/plan.ttl` | Reuse candidates, subject to import/semantics review. These class definitions are sparse; they do not supply all criterion, study-design or assessment meaning |
| Observations | SOSA imported and specialized by `domain-specific/ontologies/hydrologic-observation.ttl` | Reuse the subject/property/procedure/result/time pattern for biological measurements. Do not classify mussel shell-length observations as gauge or hydrologic observations. Derived estimates must remain distinguishable from field records even if both can be represented as observation results |
| Physical intervention and geometry | Physical-asset/location modules and GeoSPARQL imports | Reuse suitable meanings after checking the feature. A physical intervention is distinct from its geometry and planned specifications; not every habitat polygon is a Structure |
| Time and record history | OWL-Time and governance validity/record-time properties | Distinguish observation time, criterion applicability, publication date, record time and revision. Current/Provisional lifecycle values do not express scientific confidence |

Question, hypothesis, finding and evidence/applicability assessment are candidate extension areas based on the scoped baseline scan, not certified absences from every import. Do not mint terms or assert equivalences during this walkthrough. In particular, an HREP should not be typed as `ppa:PromisProject` without resolving its P2/program restrictions, and the older `indicator:Indicator` meaning should not be equated to a performance criterion by name.

## 5. Proposed model decisions to review next

Review each candidate link for its operational value over time and at program scale, not only for whether it can describe Steamboat. For every link, ask what minimum evidence establishes it, which partner can maintain it through staff turnover, how a later project can discover and reuse it, and how the model preserves an unresolved or contested connection without blocking work.

- Give the scientific proposition, reported finding and local applicability judgment distinguishable identities/meanings; decide their smallest useful granularity and revision behavior.
- Represent ancillary expected benefit independently of whether it has a formal objective/criterion; review how it relates to design rationale and one or more features.
- Reference observations/datasets at the useful granularity without assuming wholesale raw-data ingestion; define how field records and analysis-derived results remain distinguishable.
- Preserve verified production multiplicities; test many-to-many study/output, question/hypothesis and feature/evaluation possibilities without asserting exact cardinalities from one example.
- Walk US-02 through relevant installed/planned practices and located/absent evaluations, US-03 through expectation versus outcome, and US-05 through criterion evaluation. Steamboat currently supplies an opportunity and incomplete evidence chain, not a completed local test.

## 6. Link-by-link lifecycle and portfolio review

The following review works forward from science planning and then tests each connection against Steamboat. It does not assume that a completed HREP must exist before the model can be useful, nor that every project follows one linear process. Each row is a proposed minimum coordination record, not a required new form, table or workflow step.

| Link to support | Minimum durable connection | Steamboat pilot status | Portfolio value and review question |
| --- | --- | --- | --- |
| Priority question → hypothesis | Question identity/context; attributed hypothesis wording, scope and review state | WQ-39 is background; SC-08 is an analyst-formulated proposition, not an adopted project hypothesis | Lets future teams find which propositions respond to a shared learning need. What review establishes a proposed linkage? |
| Hypothesis → study design | Intended response, comparison, scale, timing, conditions and known limitations | MS-03 supplies an observational core/periphery design; it was not designed as a Steamboat experiment | Lets a planner identify whether a proposed study can answer the stated proposition. What minimum design detail is reusable across disciplines? |
| Design → practice or implementation | Role of the practice in the design, planned/actual state, feature reference, place/time and change record | Stone protection is a documented rationale/intent; identified installed feature and condition are unresolved | Prevents a practice label from being reported as an installed, studied treatment. How should planned changes and undocumented implementation be carried forward? |
| Design → monitoring task/event → observation | Planned collection, responsible partner, task/event reference, observation/dataset reference and method | Baseline/construction context is reported; a dedicated mussel monitoring commitment is not located | Allows study continuity without treating EMMA task completion as a biological observation. Which work remains in existing partner systems? |
| Observation/data → analysis → finding | Data/version, method, result, scope, limitation and derivation | MS-03 provides partial source-to-data trace; fitted-model details remain unverified | Allows later users to reuse a finding without losing inference limits. What is the smallest viable reference to external data and analysis? |
| Finding → applicability judgment → local expected benefit | Finding, receiving conditions, rationale, limitations, reviewer/time and local expectation | Scientific findings inform the proposed SC-08 path; documented local adoption remains unresolved | Makes transfer reasoning inspectable without calling it proof. Who reviews applicability and how are competing judgments retained? |
| Observation → performance evaluation → objective assessment | Criterion/version, lifecycle interval, observations, method, result, aggregation rationale and assessment history | No formal mussel criterion or local mussel evaluation is documented; formal non-mussel EMMA chain remains the anchor | Supports US-05 across repeated intervals without retroactively changing prior assessments. How do differing criteria and incomplete evidence affect aggregation? |
| Assessment/conclusion → decision → subsequent learning | Decision context, evidence considered, action/continuation, follow-up and unresolved issue | No Steamboat mussel decision is documented | Makes lessons discoverable by later projects and enables confirmation or correction. What decision records already exist and which links can be captured with low burden? |

The review confirms these design boundaries: project-success assessment and scientific hypothesis evaluation can share observations but remain distinct; a planned practice, installed implementation, monitored condition and evaluated outcome are distinct lifecycle states; and a reusable regional connection needs provenance, scope, stewardship and revision history. The review leaves exact cardinalities, system-of-record assignments, new relationship identifiers, ontology extensions and physical implementation open.

Review outcome at creation: discussion begun; recommendations above remain proposals. No formal entity set, cardinalities, source correction, production join, database platform or ontology module is approved.
