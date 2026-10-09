# Science–restoration relationship analysis

- Date: 2026-10-09
- Status: assistant proposal for review; conceptual meanings and evidence needs, not a physical schema
- Starting need: accepted researcher story US-02; complementary biologist story US-05
- Context: [foundation](../goals/project-foundation.md), [requirements](../goals/goals-requirements-crosswalk.md), [EMMA baseline](emma-crosswalk.md)

## Established baseline and scope

### Inductive construction of the research network

The user intends to build the network by extracting elements and relationships from the accumulated program artifacts. The terms and relationships in this draft are starting hypotheses about useful structure, not a closed ontology to impose on the source collection. Program-level artifact review should reveal additional concepts, exceptions, and relationship meanings and drive revisions before physical implementation.

Proposed working progression:

1. Inventory an artifact and its provenance, version, scope, and preservation/access state.
2. List identifiable elements using original wording and precise evidence locations; record uncertain classification rather than silently forcing a match.
3. Link elements where source details support a relationship. Keep source statements distinct from retrospective interpretations and record missing context.
4. Reconcile identities across artifacts without erasing original labels or equating related hypotheses, practices, or observations prematurely.
5. Inspect descriptive patterns, gaps, and connected evidence paths; record newly proposed interpretations as analysis rather than backdating them into source assertions.
6. Evaluate scientific implications using study designs, analyses, conclusions, and applicability limits. A connected graph path is a route to evidence, not by itself proof of a causal or scientific conclusion.

Listing and linking can yield useful descriptive discoveries before scientific synthesis. It also preserves a documented program record even if anticipated insights do not emerge. The network representation is accepted conceptual intent; a graph database, ontology stack, extraction automation, and physical storage architecture remain undecided. Underlying sources and datasets need a preservation plan in addition to extracted records.

The user defined EMMA's existing chain as HREP → Project Objective → Performance Criterion → Monitoring Task → Observation. Preserve these meanings and inspect their representation before proposing extensions. No cardinality, field structure, or identifier convention has been established here.

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

## Connecting relationships

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
| EMMA | Data dictionary or entity/relationship export; existing identifiers and meanings; representation of objectives, criteria, tasks, observations, lifecycle intervals, and revisions | Confirm the user-defined baseline and identify links already present; supplied workspace currently has three historical decks, not a current schema or record export |
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

Next review: refine these definitions with the user, inventory the available source structures, and identify missing inputs. No physical database implementation is authorized by this draft.
