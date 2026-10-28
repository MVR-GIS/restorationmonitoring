# Science–restoration relationship analysis

- Started: 2026-10-09; current-state reconciliation: 2026-10-22
- Status: assistant proposal for review; conceptual meanings and evidence needs, not a physical schema
- Starting need: accepted researcher story US-02; complementary biologist story US-05
- Context: [foundation](../goals/project-foundation.md), [requirements](../goals/goals-requirements-crosswalk.md), [EMMA baseline](emma-crosswalk.md)

## Established baseline and scope

The [workshop research-priority review](../goals/workshop-research-priorities.md), added 2026-10-21, establishes source question records as a practical anchor for the research network. Proposed conceptual distinctions now need to accommodate a question's reach- and assessment-specific rank, its supplied restoration-goal/objective context, and a recorded question/project association separately from a scientific finding. Questions can motivate multiple hypotheses/studies; priority is not confidence, and an `x` is not proof of a tested relationship. Reuse the [extracted register](../goals/workshop-research-question-register.json) for concrete instances; WQ identifiers are review-local. These are source-grounded design proposals, not codified ontology terms or physical schema changes.

Current dependency: [USACE ontology alignment](usace-ontology-alignment.md) is required from the outset under the user's latest direction. Reuse organizational provenance, observation, planning and spatial structure where semantically appropriate; new scientific terms are candidates to justify, not a parallel vocabulary. The [mussel science pilot](../goals/mussel-science-worked-example.md) tests this distinction using source-depth-labelled evidence. Earlier notes deferring ontology alignment are superseded by this direction.

The [Restoration Features documentation review](restoration-features-documentation-review.md) supplies existing feature definitions and crosswalks. Proposed L-02/L-03 meanings must distinguish broad restoration measures, GIS feature classes, physical implementations, and their spatial representations. L-04/L-05 must allow evaluations of combined interventions and operating histories. A feature-status label alone does not establish its condition at the time of observation; general handbook/documentation guidance is not automatically an HREP-specific criterion or hypothesis.

### Inductive construction of the research network

The user clarified that "science vocabulary" refers to conceptual data-entity names. Derive and review those entity distinctions from artifacts while preserving established ecosystem-restoration language. An entity such as Hypothesis describes the kind of record; ecological terms within a particular hypothesis remain domain content, not newly invented entity terminology.

The user intends to build the network by extracting elements and relationships from the accumulated program artifacts. The terms and relationships in this draft are starting hypotheses about useful structure, not a closed ontology to impose on the source collection. Program-level artifact review should reveal additional concepts, exceptions, and relationship meanings and drive revisions before physical implementation.

Proposed working progression:

1. Inventory an artifact and its provenance, version, scope, and preservation/access state.
2. List identifiable elements using original wording and precise evidence locations; record uncertain classification rather than silently forcing a match.
3. Link elements where source details support a relationship. Keep source statements distinct from retrospective interpretations and record missing context.
4. Reconcile identities across artifacts without erasing original labels or equating related hypotheses, practices, or observations prematurely.
5. Inspect descriptive patterns, gaps, and connected evidence paths; record newly proposed interpretations as analysis rather than backdating them into source assertions.
6. Evaluate scientific implications using study designs, analyses, conclusions, and applicability limits. A connected graph path is a route to evidence, not by itself proof of a causal or scientific conclusion.

Listing and linking can yield useful descriptive discoveries before scientific synthesis. It also preserves a documented program record even if anticipated insights do not emerge. The network representation is accepted conceptual intent; a graph database, ontology stack, extraction automation, and physical storage architecture remain undecided. Underlying sources and datasets need a preservation plan in addition to extracted records.

The user defined EMMA's conceptual chain as HREP → Project Objective → Performance Criterion → Monitoring Task → Observation. Supplied DDL/ERDs now document project/objective/criterion/task/event structures, including many-to-many objective–criterion and task–criterion links. Observation storage and cross-system identity semantics remain unresolved; see the production review. Preserve established structures while testing extensions through artifact extraction.

The accepted purpose is to connect hypotheses in the UMESC research body to planned/installed HREP restoration practices and observed landscape outcomes. The relationships below translate that purpose into reviewable meanings. User authorization to proceed with this analysis does not approve every proposed definition.

## Distributed scientific practice: design direction

The user's clarification establishes that tooling should support a mature, effective Federal–State–Local–NGO program and its experienced interdisciplinary experts. Relationship capture should fit existing scientific work and partner stewardship. Do not assume a mandatory linear sequence, a single organizational owner, or replacement of established review and research methods.

Proposed implications for the relationship analysis:

- Relate scientific records across existing systems with stable references and explicit responsibility; inspect current workflows before assigning new capture steps.
- Compare planned study elements with implementation evidence over time. Preserve changes and their rationale, and make unimplemented or undocumented elements visible with their implications for inference.
- Carry lessons and prior conclusions into subsequent design reviews with their applicability limits. A question may be answered under particular conditions while remaining open elsewhere.
- Record tentative conclusions and the evidence needed for confirmation. Link subsequent studies to the earlier conclusion they seek to strengthen, challenge, or extend.
- Support overlapping studies, multiple disciplines, long time horizons, and revisions. Study tracking should distinguish omission, deliberate revision, delayed work, and missing documentation.
- Evaluate the added maintenance burden as part of usefulness; recording every activity is not an established requirement.

These are proposed mechanisms supporting the accepted direction. They extend L-05 and L-08 and requirements R-13 and R-15 through R-17; physical entities and interfaces remain undecided.

## Working term definitions

| Term | Proposed meaning | Boundary to preserve |
| --- | --- | --- |
| Research output | An identifiable publication, report, dataset, model, or other research product | A publication and its supporting dataset can be separate related outputs; multiple versions/catalog records need reconciliation |
| Hypothesis | A proposition about an ecological response, relationship, or mechanism that can be evaluated with evidence under stated conditions | A question, desired objective, or criterion is not automatically a hypothesis; retain original wording and any analyst formulation separately |
| Restoration practice | A described intervention intended to alter ecosystem conditions | A general practice is distinct from a site's planned or actual implementation |
| Practice implementation | A particular planned, constructed, modified, or maintained intervention with location, timing, and relevant characteristics | Plans alone do not establish installation; relevant changes over time must remain recoverable |
| Observation | Monitoring evidence recorded under the existing EMMA concept | Whether this means individual measurements, datasets, summaries, or external references remains to be inspected |
| Evaluation | An interpretation derived through a stated method from evidence to address a scientific proposition or performance criterion | Retain designs, methods, results, limitations, and conclusions rather than treating observations alone as an evaluation |
| Assessment | A contextual judgment about an objective, project, or program using one or more evaluations | Aggregation, reference conditions, and judgment need explicit reasoning |

These are proposed working meanings, not a mandate to create one table per term.

## Pilot implications for conceptual-model review

The [Steamboat conceptual-model walkthrough](steamboat-conceptual-model.md), begun 2026-10-22 at the user's request, applies these distinctions to concrete existing-system anchors, proposed scientific objects and organizational reuse. It records recommendations and open decisions; beginning the review does not accept the proposed model.

On 2026-10-22 the user recognized the coherent case report as a milestone and reaffirmed that its purpose is to help reason through data modeling. The next model review should use the [requirements clarification matrix](../goals/goals-requirements-crosswalk.md#requirements-clarified-by-the-steamboat-pilot) and existing worksheets. The following are evidence-grounded questions and candidate distinctions, not approved ontology classes, predicates or cardinalities.

| Distinction or relationship to review | Concrete pilot example | Modeling implication and unresolved decision |
| --- | --- | --- |
| Source passage → extracted assertion | Feasibility VI-1; MS-03 abstract sections 3–5; release metadata | Give evidence location and attributed statement separate meanings; one passage can discuss several concepts. Review passage identity and assertion granularity; SC-03 still summarizes multiple findings |
| Question / hypothesis / finding / interpretation | WQ-39; SC-08; separate MS-03 survival/growth findings; SC-04 source–sink explanation | Review relationships rather than merge these by topic. A question can motivate hypotheses; a finding addresses a response under a design/context; an explanation can remain untested |
| Study / execution / publication / dataset / analysis | MS-03 paper and ScienceBase release, repeated recovery effort and unverified fitted models | Multiple outputs need not mean independent studies. The worksheet's publication ID is not an approved study identifier. Unknown analysis details must not prevent representing known source and dataset records |
| Individual / tag / sampling event / observation / derived estimate | Repeated tagged mussels; replacement tags; plot visits; shell lengths and recovery codes | Preserve individual identity independently of tag history. A wide CSV row is not necessarily one observation, and estimated survival is not identical to a recorded live/dead status. Production EMMA Observation meaning/storage remains a separate integration question |
| Finding → applicability judgment → local design rationale | SC-03 informs assistant-formulated SC-08; local adoption is undocumented | Separate origin of formulation, scientific support/limits, transfer to a receiving site and documented designer intent. Existing provenance semantics alone do not assert evidential support |
| Objective / criterion / task / expected ancillary benefit | Four formal Steamboat objectives versus anticipated mussel habitat | Represent ancillary expectation without requiring a fabricated objective or criterion. Reuse production objective/criterion/task anchors and their verified many-to-many links; review how benefit and design rationale relate to them |
| Restoration practice / physical implementation / spatial record / condition over time | Stone-protection intent; installed feature and GIS match unresolved | Do not create an installation or join from a practice label alone. Preserve identity/version/place/time and allow several features or interventions to contribute to an evaluation; precise cardinalities require review |
| Source statement / reconciliation / review outcome | 578 narrative, 576 placement total, 569 tracking IDs; taxon-label difference | Preserve competing source values with their scopes and any correction rationale. Do not declare an error or canonical value until reconciled; user acceptance of the report does not resolve source disagreements |
| Priority assessment / relevance / scientific evaluation | Reach-specific workshop rank, workbook marks, proposed pilot link | Preserve assessment edition and context. Importance to the partnership, relevance to a study and evidence for a proposition answer different questions |

Review place/time, responsible role, source attribution, interpretation/review state and change history across these relationships; their exact representation remains open. Missing evidence, not-yet-applicable monitoring, work not committed, and contrary results need distinguishable meanings without inventing a status enumeration now. The case illustrates the first three; it does not establish a local failed restoration outcome.

The report's grouped entities, diagram nodes, chain rows and helper objects are presentation structures. The conceptual-model review should decide whether each corresponds to an entity, relationship, attribute, contextual qualification or view. It should reuse the organizational baseline before proposing extensions and leave physical storage and ontology publication deferred.

## Connecting relationships

### Prospective pathway under review

The user asked to work forward from science planning as well as backward from legacy artifacts. The following is a proposed coordination path, not a mandatory linear workflow: mature projects may begin at different points, and a study can examine an existing practice rather than cause it to be installed. It makes explicit the prospective connections that are only partly covered by L-01 through L-08.

| Proposed forward connection | Existing requirement/relationship support | Review question before formalizing it |
| --- | --- | --- |
| Priority research question → hypothesis | R-02, R-09; workshop records provide a question/priority anchor | What formulation, scope and review establish that a question motivates a particular hypothesis, without treating priority as evidence or confidence? |
| Hypothesis → study design | R-03, R-09, R-15 | Which response, comparison, conditions, timing and limitations must be planned so that later evidence can evaluate the proposition? |
| Study design → planned evidence collection and relevant practice/implementation | R-03, R-08, R-15; L-02/L-03 provide related practice meanings | Is the practice an experimental treatment, an existing exposure, an implementation being observed, or only a candidate opportunity? Who records design changes and omissions? |
| Planned evidence collection → monitoring task/event → observation | Existing EMMA objective/criterion/task anchors; L-04 | How do planned scientific sampling and EMMA monitoring commitments relate without assuming they are the same task or that task completion is an observation? |
| Observation/data → analysis → finding/conclusion | R-03, R-07, R-11; L-05 | What identifies the analysis, inputs, method, result and scope so that a finding can be reviewed and reused? |
| Finding/conclusion → applicability judgment → local expectation | R-09, R-11, R-16; L-02/L-05 | What local conditions, rationale, reviewer and limitation justify carrying evidence to a specific project without asserting a treatment effect? |
| Observation → criterion evaluation → objective assessment | R-14; L-06/L-07 | Which criterion version, interval, method and aggregation rationale support a project-success judgment, separately from hypothesis inference? |
| Assessment or conclusion → management decision → later question/design | R-06, R-16; L-08 | What decision, action, follow-up and unresolved uncertainty should be retained to make learning available to future projects? |

This is a review matrix, not an addition to L-01 through L-08. It identifies where the current relationship register is sufficient, where a proposed link needs a precise meaning, and where existing EMMA structures must remain the operational anchor.

| ID | Relationship and meaning | Minimum evidence to record | Reviewer should be able to establish |
| --- | --- | --- | --- |
| L-01 | Research output addresses a hypothesis | Output identifier/version, exact passage or evidence location, hypothesis wording, author's stated purpose, explicit versus reconstructed formulation | Whether the output proposes, evaluates, discusses, or synthesizes the hypothesis; those roles must remain distinguishable |
| L-02 | A practice is relevant to a hypothesis through an expected response or mechanism | Practice definition/version, hypothesis, expected response, applicable conditions, rationale and source, interpretation/review status | Why relevance is asserted and whether it was intended by practitioners or inferred retrospectively; relevance alone is not a test |
| L-03 | An HREP has a planned or actual practice implementation | Existing HREP identifier, implementation reference, location, status and dates, defining characteristics, planning/as-built or other supporting record | Whether the practice was installed, when and where, and which version/condition is addressed |
| L-04 | Observations characterize an implementation and its relevant context | Existing task/observation references, dataset/version, sampling locations/times, measured variables, methods, quality information, implementation relation and comparison context | Whether observations have the spatial/temporal support needed for the proposed evaluation; nearby systemic samples are not automatically project-effect evidence |
| L-05 | An evaluation uses evidence to inform a hypothesis | Hypothesis, implementation references where relevant, study/comparison design, observations/data and analysis references, result, conclusion, uncertainty and scope | What was learned, with supporting, challenging, mixed, or inconclusive evidence preserved; causal claims require a defensible design and analysis |
| L-06 | A performance evaluation compares observations with a criterion | Criterion definition/version, applicable interval and conditions, observations, evaluation method, result and uncertainty | Whether evidence meets the criterion, falls short, or is insufficient to decide; these provisional result labels require review |
| L-07 | An assessment interprets criterion evaluations against an objective | Objective/version, relevant criterion evaluations, lifecycle interval, aggregation or judgment rationale, unresolved evidence and review history | Why the objective is assessed as achieved or otherwise; task completion or one passing criterion cannot silently stand for all project objectives |
| L-08 | An assessment or scientific conclusion informs a management decision | Assessment/conclusion references, decision date/context, reasoning, resulting action or deliberate continuation, follow-up needs | How evidence contributed to management and what later evaluation is needed |

L-01 through L-05 support US-02. L-04, L-06, and L-07 support US-05. L-08 preserves the adaptive-management purpose. One evaluation may support both paths, but criterion attainment and hypothesis inference must remain distinguishable.

## Evidence carried with a relationship assertion

Proposed minimum context: the linked records; the precise meaning asserted; source and locator; spatial/temporal applicability; explicit source statement versus analyst inference; rationale; review status and responsible role; date/version; and changes or supersession. These are information requirements, not final fields or a new governance process. Use existing project artifact and stewardship conventions where available.

Missing evidence should be recorded as missing. An inferred legacy hypothesis should remain an attributed, reviewable formulation. Conflicting conclusions should coexist with their scope and reasoning. Revision should preserve what a previous assessment meant when made. Unknown values need not block recording a useful partial link, but should limit the claims made from it.

## Answering the accepted researcher story

For a specified hypothesis, a proposed answer separates:

1. **Implemented practices with evaluations informing the hypothesis:** traceable L-01/L-02, L-03, and L-05 evidence. Include inconclusive or contrary results; informing does not mean confirming.
2. **Implemented relevant practices with no located evaluation:** candidate opportunities or evidence gaps, clearly distinguished from completed scientific evaluation.
3. **Planned relevant practices:** prospective opportunities, distinguished from installed practices.

Each returned HREP should identify its implementation, scientific connection, supporting output/evaluation, scope, and review status. A general study may inform interpretation of a practice without having evaluated that particular HREP; record that scope rather than attributing the study's findings to the site.

"All" requires an explicit coverage statement: which HREP population and date, which research collection/searches, which records were screened, unresolved matches, inaccessible materials, and missing implementation/evaluation records. An absent link means no link found in the reviewed coverage, not proof that no relationship exists. Hypothesis identity and related formulations require reviewed matching; keyword similarity alone is insufficient.

## Proposed review demonstrations

- Trace a returned HREP to actual installation evidence and an evaluation addressing the specified hypothesis.
- Explain why a planned practice or a relevant but unevaluated installation appears in a different result group.
- Recover the study design and limits behind a reported scientific conclusion.
- Reconstruct a biologist's criterion evaluation at two lifecycle intervals without overwriting the earlier assessment.
- Explain how missing observations, criterion ambiguity, conflicting findings, and incomplete corpus coverage affect the answer.

These are acceptance scenarios for future real-record validation after foundation review, not claims that these cases have already been inspected.

## Inventory needed before real-record validation

| Source | Obtain or establish | Purpose / current limit |
| --- | --- | --- |
| EMMA | DDL and ERDs supplied and reviewed; further clarify observation storage, source-data references, and revision/evaluation practices | Production structural evidence is available; live records and population coverage remain uninspected. These gaps do not block independent document extraction |
| EMMA/HREP holdings | Program-level inventory of planned/installed practices, supporting design/as-built/evaluation records, and existing project cross-references | Establish implementation evidence and program coverage before choosing representative validation records |
| ScienceBase / UMESC | Defined collection boundaries; item identifiers, DOI and related publication links; dates/versions, attached versus externally hosted products; related dataset and study records | Build a deduplicated research inventory; a metadata match does not establish an explicit hypothesis or HREP evaluation |
| Program guidance | Applicable criteria/evaluation guidance and stewardship/review responsibilities | Resolve terminology and judgment rules without assuming historical draft documents are current policy |

## Initial external discovery check, 2026-10-09

Official [UMESC background](https://umesc.usgs.gov/ltrmp/about_us_background.html) describes LTRM research/monitoring and HREP restoration as program components. The [UMESC data catalogue](https://www.usgs.gov/centers/upper-midwest-environmental-sciences-center/data) is an additional discovery entry point.

The official USGS [Hydrogeomorphic Units and Catena Linkages record](https://www.usgs.gov/data/hydrogeomorphic-units-and-catena-linkages-upper-mississippi-river-system), dated September 2, 2025, identifies a UMESC data release (DOI 10.5066/P14BFCUP). Its description connects the product to UMRR research and HREP planning/design and says resulting products are in a ScienceBase release. This establishes a concrete discovery lead, not a reviewed hypothesis-to-HREP relationship. The release attachments have not been reviewed. No complete ScienceBase collection has been enumerated.

## Questions to resolve through inspection and review

- What does an EMMA Observation currently represent, and where are its source measurements stored?
- Where are practice implementations and their planned/actual histories represented today?
- How are criteria evaluated over time, and how are evaluations combined into objective/project assessments?
- Which ScienceBase collection(s) and complementary publication lists define the research inventory?
- What evidence and review suffice for a hypothesis/practice link, and how should related hypothesis formulations be reconciled?

Next review: use the [conceptual-model milestone](../goals/goals-requirements-crosswalk.md#next-milestone-conceptual-model-review-from-the-pilot) to review these meanings against the existing pilot. More source acquisition should resolve a specific ambiguity rather than postpone modeling until the collection is complete. No matched end-to-end project history or physical implementation is required to represent a useful partial model.
