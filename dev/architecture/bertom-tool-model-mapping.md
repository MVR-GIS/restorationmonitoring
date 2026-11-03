# Bertom: bounded mapping to existing data models

Reviewed 2026-11-03. This is a **documentation-based conceptual comparison**, not an import, schema validation, software demonstration or recommendation to adopt a product. The user requested a one- or two-turn exercise; this mapping completes that bounded exercise. Candidate correspondences below are proposals, not claims that the applications contain Bertom data or that their schemas can encode every detail exactly as shown.

## Shared case and limits

The [three-entry Bertom case](../goals/bertom-three-entry-model-test.md) supplies the source-checked fixture and links to original page, workbook-cell and snapshot locators. It includes:

- **WQ-39:** a workshop question about substrate, with reach-specific ranks. The workbook marks Bertom; the mark's meaning is unknown. Relevance to the 2014 survey is an analyst's candidate interpretation, not the survey's demonstrated original purpose.
- **Bertom project and rock habitat channel:** historical objective and target statements, a described channel and candidate Restoration Features records. The correspondence between individual GIS segments and the surveyed channel and EMMA identity remains unverified.
- **2014 survey and 2015 report:** the report documents field work and reports 40 live mussels and 11 species in the channel across methods. Raw observations and analysis inputs were not located in the bounded review. The user confirms that no EMMA monitoring task was recorded for Bertom.
- **Assessment example:** For illustration only, imagine a practitioner later records, “The material reviewed is insufficient to determine whether the historical year-50 target was attained.” This is synthetic, not an actual assessment, a finding of project failure, or evidence that no other records exist.

The 1989 DPR and 11-year PER contain historical targets; the case has not established an evaluated EMMA performance criterion, a causal effect or a target-attainment decision. A report-level result must not be represented as recovered individual observations. Do not create a task, location geometry, dataset, analysis or evidence of contrary results to fill a modeling gap.

## 1. AMMonitor: monitoring context and data stewardship

Clarfeld et al.'s [2025 AMMonitor 2 paper](https://usgs-cru-individual-data.s3.amazonaws.com/tdonovan/intellcont/Methods%20Ecol%20Evol%20-%202025%20-%20Clarfeld%20-%20AMMonitor%202%20%20Remote%20monitoring%20of%20biodiversity%20in%20an%20adaptive%20framework%20in%20R-1.pdf), pp. 3–4, describes a project SQLite database with `locations`, `visits`, `models`, `modeloutputs` and `dbdictionary`. It describes visits nested under locations and a dictionary defining tables and fields. This comparison uses the paper's descriptions; the full dictionary and schema were not inspected. Exact field names, cardinalities, required fields and suitability for a historical manual mussel survey remain unverified.

| Bertom object | Possible correspondence | What the mapping reveals |
| --- | --- | --- |
| Survey area or comparison area | `locations` is a **candidate analogy** for a monitoring location | A monitoring location is distinct from the restoration feature being studied. The paper does not establish how to represent the unresolved geometry or relation to a channel segment. |
| Field work on 7–9 October 2014 | One or more `visits`, subject to source detail and schema | Record actual field dates and methods at the appropriate granularity. Do not invent three visit records or an EMMA monitoring task. |
| 2015 report's aggregate results | A source-reported result, with document and page locator; any mapping into specific AMMonitor tables is **unverified** | The report can be evidence without recovered raw data. Do not populate an observation table with invented mussel-level records or assume `modeloutputs` is appropriate. |
| Hypothetical future analysis, if inputs are recovered | `models` / `modeloutputs` are candidate comparisons | Only a real analysis warrants analysis/model records. AMMonitor's named tables do not establish the relationships or provenance required for a given Bertom analysis. |

**Design lesson:** explicitly separate project, restoration feature, monitoring location, field event and source-reported result. Borrow the idea of a maintained, versioned data dictionary that travels with exported data, without assuming the SQLite implementation or all AMMonitor classes should be adopted. The paper does not establish a cross-project question, assessment, decision or revision model.

## 2. Miradi: intent, results and indicators

The [Conservation Measures Partnership's Miradi overview](https://www.conservationstandards.org/library-item/miradi-adaptive-management-software/) documents project scope, conceptual models, objectives, strategies, indicators and program rollups. This is a **concept-level comparison**: no Miradi exchange file, class schema or application was inspected. Its precise fields, semantics, relationships and ability to represent these records are unverified.

| Bertom object | Candidate Miradi concept | Important distinction |
| --- | --- | --- |
| Project | Project and, potentially, program | A Miradi project analogy does not establish identity with EMMA or Restoration Features. |
| Historical project objective | Objective | Preserve original wording, date, source and scale; do not assume matching definitions or an active EMMA objective. |
| Rock habitat channel | Strategy/action **intent** is comparable to a planned intervention | The physical constructed channel and individual GIS features are separate from a strategy; actual completion and feature matching require their own evidence. |
| Historical year-50 target | A possible objective or indicator target, depending on meaning | Test its exact wording before classifying it. Do not equate target, indicator, measurement and evaluated performance criterion. |
| 2014 survey and reported results | Potential indicator/monitoring evidence | The overview does not establish a mapping of report passages or methods into a specific Miradi data object. |
| WQ-39 and marked Bertom association | No verified direct correspondence from the reviewed overview | A later program-wide research question and an uncertain relevance link should not be collapsed into the project's original objective or into a proven causal pathway. |

**Design lesson:** show intended relationships separately from evidence about what happened. A useful report might put historical objective → intended action → target beside survey evidence, while visually labeling each linkage's source and status. A line in an intended pathway does not demonstrate that a particular action caused the observed outcome. The overview does not establish how Miradi stores contrary evidence, assessment authorship, a decision or its revisions.

## 3. SEPIO: proposition, statement and evidence line

The [SEPIO LinkML core model](https://sepio-framework.github.io/sepio-linkml/) describes `Proposition`, `Statement`, `Document`, `StudyResult`, `Contribution` and `EvidenceLine`. Its [EvidenceLine definition](https://sepio-framework.github.io/sepio-linkml/EvidenceLine/) treats an evidence line as an interpreted argument about a specific proposition, with evidence items and direction/strength. The [project's description](https://sepio-framework.github.io/sepio-linkml/about/) says an application-specific profile extends its generic model. The generated documentation was accessed on the review date; an immutable release or commit was not established. The following is a **conceptual sketch, not a validated SEPIO instance**.

| Bertom item | Candidate SEPIO concept | Qualification |
| --- | --- | --- |
| 2015 survey report | `Document` | Retain report identity, publication date and page locator. A document is not automatically an evidence argument. |
| Report's 40 live mussels / 11 species across methods | `Statement` or `StudyResult`, depending on the inspected profile and granularity | Preserve the reporting authors' attribution, sampling scope and source passage. The review does not establish which class or slots are valid for this exact representation. |
| “The historical year-50 target was attained” | `Proposition` | This is a *possible claim to evaluate*, not an assertion that it is true or that the 2014 survey measured it. |
| Hypothetical practitioner conclusion of insufficient evidence | Potential `Statement` about the sufficiency of the reviewed material | Record who made it, when, its subject, evidence scope and review state. Do not represent a lack of located records as scientific evidence that the target was not attained. Exact profiling and confidence representation require validation. |
| Hypothetical interpretation of specific source passages | Potential `EvidenceLine` | Create only if a practitioner actually formulates an attributed argument for or against a specified proposition. Do not automatically mark the survey as supporting or refuting attainment, or assign strength. A limitation or missing input is not itself a contrary empirical observation. |
| Different future practitioner interpretation of the same evidence | Separate attributed `Statement` and, where warranted, its own `EvidenceLine` | The model should preserve disagreement and the particular reasoning, rather than overwrite the earlier view. The detailed revision mechanism is not established by this sketch. |

**Design lesson:** a source result, a proposition, an authored assessment of evidence sufficiency and a decision are distinct. An evidence line is an *interpretation* relating evidence to a claim, not a synonym for a document, data point or ordinary topic link. SEPIO is a promising comparison for judgment provenance, but it does not itself establish the UMRR assessment/decision workflow, review permissions or record history.

## 4. AMModels: analysis bundle, if recoverable

The [AMModels paper](https://pmc.ncbi.nlm.nih.gov/articles/PMC5830045/) describes an `amModelLib` holding `amData` inputs and `amModel` outputs, each with associated metadata. If an actual Bertom analysis and inputs are recovered or newly created, this is a useful pattern for keeping them with descriptive context. No actual bundle can be mapped from this case today: the reviewed report is available, but its underlying inputs and analysis were not located. A saved R object does not by itself demonstrate a governed portfolio, complete provenance graph or durable revisions.

## Implications for our model and reports

1. **Keep the existing attributed-linkage pattern.** The comparison reinforces independent source, relationship meaning and review status. It does not validate the detailed UMRR schema or require adopting any external platform.
2. **Show two lanes together:** project intent and physical implementation on one side; survey, report result, analysis and future judgment on the other. Join them only with scoped, attributed relations. Starting from WQ-39, the survey or the project should expose the same known objects and the reason each connection appears.
3. **Treat a report result as a first-class evidence item even when raw observations are unavailable.** Record its method and scope at the source-supported level; neither infer task existence nor manufacture observations.
4. **Separate a claim from the evidence-based argument and from a judgment of sufficiency.** Allow conflicting interpretations, attribution and revisions; do not force binary support/refutation when the reviewer has not made that judgment.
5. **Keep feature, monitoring location and field event distinct**, with spatial linkage method, temporal context and identity confidence recorded when established. A shared project identifier alone is not a feature match.
6. **Maintain dictionary and export context** alongside records so future users can understand field meanings, sources, versions and unknowns. This is a proposed stewardship requirement to examine, not an approved database feature.

These are design implications to carry into the next conceptual/report iteration, not new approved schema terms. The time-limited exercise is complete; no further tool research is necessary to proceed.
