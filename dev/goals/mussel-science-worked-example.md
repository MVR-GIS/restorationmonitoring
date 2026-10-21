# Mussel research: scientific objects and restoration evidence links

- Reviewed: 2026-10-16
- Status: first science-side conceptual extraction and organizational reuse analysis; proposals for review, not a codified UMRR ontology
- Starting collection: Zotero group 4862069, mussels collection `2SIRQ6RY`; small purposive sample, not a comprehensive literature synthesis
- Dependencies: [organizational ontology baseline](../architecture/usace-ontology-alignment.md), [Steamboat restoration extraction](steamboat-island-objectives-criteria.md)
- Machine-readable review material: [six sources and eight assertion records](mussel-science-evidence.json), including a separately labelled assistant-formulated local hypothesis

## Sources and actual reading depth

Zotero collection membership was observed in its browser view/search results. DOI/title identify the publication independently of catalogue metadata. Primary USGS records corroborate scientific summaries. Most of this first pass is abstract-level evidence, not full-text extraction; do not infer detailed designs, effect sizes, raw data availability or replication from abstract text alone.

| ID | Collection item / publication | Evidence read and scientific contribution |
| --- | --- | --- |
| MS-01 | Zigler et al. (2008), Importance of physical and hydraulic characteristics to unionid mussels, DOI 10.1007/s10750-007-9167-1; Zotero `5FDNSRCG` | [USGS record/abstract](https://pubs.usgs.gov/publication/70033362), Zotero metadata: retrospective CART/GIS modelling relates distribution to physical/hydraulic variables. Provides study, predictor, analysis, finding and spatial-context concepts; not an intervention experiment |
| MS-02 | Steuer, Newton and Zigler (2008), Use of complex hydraulic variables to predict distribution and density, DOI 10.1007/s10750-008-9423-z; Zotero `DUVHKHIT` | [USGS abstract](https://www.usgs.gov/publications/use-complex-hydraulic-variables-predict-distribution-and-density-unionids-a-side), Zotero metadata: retrospective analysis distinguishes low- and high-flow conditions; complex hydraulic predictors and substrate context matter. Suggests low-flow transport and high-flow refuge mechanisms; those are not universally established design thresholds |
| MS-03 | Newton et al. (2020), Estimation of vital population rates, DOI 10.1111/fwb.13575; Zotero `T5L6D83Y` | [USGS abstract](https://pubs.usgs.gov/publication/70215652) and previously inspected Zotero abstract: four species, tagged mussels, repeated growth/survival assessment across core/peripheral habitat. Establishes the need to represent population/life-history context and temporal responses. Source–sink dynamics are proposed with further testing needed |
| MS-04 | Ries et al. (2016), Annual variation in recruitment and river discharge, DOI 10.1002/aqc.2590; title observed in collection | [USGS abstract](https://pubs.usgs.gov/publication/70159856): multiyear sampling and retrospective cohort/discharge analysis. Recruitment relationships vary by life-history grouping. Distinguish sampling dates, inferred cohort years, covariates and recruitment findings; do not transfer coefficients or thresholds without full-text review |
| MS-05 | Newton et al. (2022), Assessment of a habitat equivalency analysis, DOI 10.31931/fmbc-d-21-00004; title observed in collection | [Publisher early-view PDF](https://molluskconservation.org/PUBLICATIONS/FMBC/EARLY%20VIEW/FMBC_Vol25_Newton_EarlyView.pdf), selected text sections: Parameterization/Evaluation (PDF pp3–4), Sensitivity Analysis (p6), Data Needed (p8). Four biological inputs concern recovery time, relative productivity, time to full services and created-habitat lifespan. Literature estimates and professional judgment inform parameters; alternative runs expose uncertainty. Treat outputs as modelled restoration-scaling estimates, not observed habitat success. Early-view pagination differs from final journal pp15–26; screenshot fetch failed, so table-cell numbers were not transcribed |
| MS-06 | Bouska et al. (2018), Developing a shared understanding of the Upper Mississippi River, DOI 10.5751/ES-10014-230206; Zotero `7LEGWGAJ` | [USGS summary](https://www.usgs.gov/publications/developing-a-shared-understanding-upper-mississippi-river-foundation-ecological): conceptual framework for connected channels, off-channel areas and floodplains, controlling variables, scales and system services. Provides system context rather than a mussel-specific treatment-effect finding |

The sample is enough to propose/test scientific object distinctions. It is not enough to certify the entire science basis for creating mussel habitat. Full-text methods, datasets, species-specific requirements, host relationships and potentially contrary studies remain acquisition/review work. No paper is asserted here to have evaluated Steamboat Island.

## Conceptual objects exposed by the papers

This is naming of conceptual data entities, not reinvention of ecosystem-restoration vocabulary. Physical variables, species names and ecological processes are established domain content within these records.

| Candidate object | Why the sample needs it | Organizational reuse / extension boundary |
| --- | --- | --- |
| Research output / source passage | Identify the paper and exactly which text supports an extraction; keep abstracts distinct from full papers | Reuse document, identifier and provenance patterns; passage locator profile needs definition |
| Research study and study execution | One investigation can produce several papers, datasets and analyses; a paper is not the study itself | Reuse plans and activities as appropriate; distinguish study information record from execution |
| Research question / hypothesis | Preserve propositions investigated and later explanations proposed by authors | Candidate scientific specialization of information entities; explicit versus reconstructed statement retained |
| Study design / sampling design | Retrospective modelling, repeated tagged-animal surveys and sensitivity studies support different inferences | Reuse plan/procedure foundations; design/comparison details may need scientific extensions |
| Habitat/population context | Mussel bed, study reach, species/life stage, substrate, flow regime, dates and spatial scale limit applicability | Reuse feature-of-interest, sample, location and time foundations; refine biological scope without forcing it into hydrologic station classes |
| Observable property / observation / result | Distinguish measuring survival or velocity from the property and returned value | Follow the organizational SOSA-based pattern; numerical result, method, units and timing retained |
| Dataset / analysis / model run | Models use inputs and methods, and scenarios produce different outputs | Reuse catalogue and PROV derivation/activity patterns; observed data and modelled output remain distinct |
| Model parameter / assumption / scenario | HEA shows literature-derived estimates, expert judgments, baseline and bounded scenarios | Add only needed scientific specifics around existing provenance/planning structures; reference scenarios are not observations |
| Finding / conclusion | Associations, predictions and interpretations have different meaning and strength | Candidate information-entity specializations; keep result separate from author's interpretation |
| Evidence assessment | Relate a finding to a proposition with scope, rationale, uncertainty and contrary/inconclusive evidence | Candidate UMRR relation/assertion profile; provenance supplies origin, not evidential support semantics |
| Restoration design rationale / expected response | Explain why a practice is expected to alter habitat conditions and biological response | Reuse existing restoration identities and plans; expected ancillary benefit is distinct from a formal objective or observed outcome |
| Applicability assessment / knowledge gap | Decide whether evidence transfers to another site and identify what must be tested | Candidate UMRR extension using existing provenance, agent and time patterns |

These are candidate conceptual distinctions, not a requirement for twelve new classes or tables. Reuse/classification mappings are detailed in the ontology baseline; do not promote them as accepted axioms yet.

## A worked evidence path

1. **Source evidence:** MS-02 relates hydraulic conditions to density under low/high flow regimes. MS-03 reports habitat-dependent survival and highlights substrate stability. These studies have specific designs, populations and locations.
2. **Candidate design hypothesis (assistant formulation):** a proposed intervention that maintains suitable substrate stability across relevant flows may improve conditions for mussel persistence at the receiving site. This is not a verbatim hypothesis, a universal causal result, or proof of colonization.
3. **Project connection:** Steamboat VI-1 describes potential additional fish/mussel habitat associated with stone protection. Connect this documented ancillary intent to the candidate rationale through an explicitly proposed applicability assessment. The feasibility statement alone does not establish the final built design or a measured benefit.
4. **Missing bridge to evaluate:** local hydraulics across relevant discharges, substrate conditions/stability, affected species and habitat, actual feature design/installation, and suitable baseline/follow-up evidence. Additional requirements must be grounded in the full papers and local design evidence; no numerical mussel threshold is invented here.
5. **Evaluation:** future observations and analyses could support, challenge or leave the design hypothesis inconclusive. Keep the findings and the review judgment separate. The current project has no demonstrated post-construction mussel response in this example.

This preserves a useful science-to-restoration link now, while making its untested parts visible. It also permits studies to be linked without sharing a project, and permits an ancillary benefit without fabricating an EMMA objective or monitoring obligation.

## Proposed graph representation of reasoning

Use identified records and explicit relations along this path (labels below are conceptual, not minted ontology predicates):

`Document → reports → Study → uses → Design/Procedure → produces → Observation/Analysis result → interpreted as → Finding`

`Finding → evidence assessment → Hypothesis → applicability assessment → Restoration design rationale → planned/actual feature → expected or observed response`

A scientific assertion or assessment should carry: source passage; authorship versus analyst reconstruction; source study and design; subject/property/context; direction and qualifications; evidence/result references; uncertainty; reviewer/status; and derivation history. Reuse organizational provenance and temporal terms for those portions they actually define. Keep evidence-strength/review vocabularies distinct from governance validity status.

Deriving an assertion from a document does not mean its ecological proposition is true. An abstract's association is not a causal proof; a modelled output is not an observed outcome; a secondary paper citing a study is not an independent replication. Preserve study/dataset identities to avoid counting repeated publications as independent evidence. Conflicting findings may reflect different species, flow regimes or scales; preserve context before marking them contradictory.

## Questions partnership members should be able to ask

- What scientific propositions justify the expected mussel benefit of this feature, and which are source-stated versus reconstructed?
- Which studies/results inform each proposition; what methods, spatial/temporal scales and species were involved?
- Does support concern substrate stability, survival, recruitment, habitat occupancy or ecological services? Which links remain assumptions?
- Which evidence challenges the proposed mechanism or limits transfer to this location?
- Which physical/biological observations and analyses would test the local expectation, and are they committed tasks, possible external data, or unplanned work?
- What new evidence would change the design rationale, and who reviewed the applicability judgment?

## Recommended next increment

### Completed increment, 2026-10-21: an MS-03 source-to-data instance

The [structured instance](mussel-vital-rates-instance.json) expands SC-03 using the [USGS abstract](https://www.usgs.gov/publications/estimation-vital-population-rates-assess-relative-health-mussel-assemblages-upper) and [ScienceBase data release](https://doi.org/10.5066/P9HRXPJQ). Its ten source-located records distinguish purpose, context, comparison design, observations, dataset, analysis gap, survival finding, growth finding, author interpretation and proposed local applicability. This is a partial scientific instance, not a completed full-paper extraction or independent reanalysis. The publisher blocked full-text access.

The comparison is within an existing mussel bed, not an experimental HREP treatment contrast. Survival and growth need separate findings: a habitat contrast in survival cannot be carried over to growth. Individual identity, changing tag identity, sampling event, recovery status and measured shell length also need separate meanings. Non-recovery cannot automatically be classified as death; recorded death can persist across later columns without representing another death observation. Preserve source taxon labels pending explicit reconciliation.

The inspected files expose an unresolved cohort-accounting issue: 578 in the narrative, 576 from summing 2012 plot placement counts, and 569 unique tracking IDs. These are distinct source statements/file calculations, not corrected totals or proof of source error. Full methods and exclusions are needed before fitting models. The abstract's directional wording about stability also needs checking against the actual substrate metric. No analysis code is attached among the inspected release's three files; no claim is made that code does not exist elsewhere.

Organizational reuse remains as recorded in the [ontology baseline](../architecture/usace-ontology-alignment.md), rechecked against unchanged local HEAD `3ab4e87813875f444748720b29e59483a44bfb0c`: retain document/catalogue and provenance patterns, SOSA measurement distinctions and plan/procedure context. A derived survival estimate is an analysis result, distinct from a recovered animal's live/dead record. Scientific findings and applicability judgments remain candidate scientific extensions; this extraction mints no classes or predicates.

[The R inspection script](../scripts/review-mussel-vital-rates.R) verifies fingerprints, file dimensions, unique IDs and placement total. `--download` retrieves absent public files; changed editions fail rather than silently updating the instance. Raw files are local ignored acquisitions in `dev/outputs/research-question/`; source URLs and fingerprints are maintained in the instance. The report reads the reviewed instance and never downloads data while rendering.

The next useful increment is to reconcile those source/method gaps and identify Steamboat's relevant feature and existing mussel observations. Partner review can then assess transferability to SC-08 without claiming designer adoption or a demonstrated local effect.

Review the candidate objects and organizational reuse matrix together, focusing on one substrate/hydraulics–mussel-response path. Acquire full text for MS-02 and MS-03 and extract exact hypothesis/design/result passages; inspect the relevant Steamboat engineering design and actual feature records. Then build a small instance example and validation expectations before codifying a UMRR module. Abstract-level claims remain labelled until fuller review. The accepted restoration extraction is sufficient for this stage; do not repeat manual EMMA entry work as the main milestone.
