# Steamboat Island: worked objective and performance-criterion extraction

- Source: `UMRR/HREPs/SteamboatIsland/Steamboat Island HREP - Final Report w Appendices.pdf`, SHA-256 `ce62f059ddf5c9a28feb60647e06093aa00c2572de10c6914390433d4d04544c`
- Status: assistant extraction, source checked; user review pending. No production records changed.
- User review update: accepted as sufficient demonstration for the current project stage. This does not resolve retained source differences or constitute approval of a production migration.
- Deliverables: this review and [structured extraction](steamboat-island-objectives-criteria.json): four objectives, eleven separately located criterion assertions, and five response-trigger groups. Local SI identifiers are worksheet references, not EMMA identifiers.
- Scope: objectives in Section III.G; Section X performance-monitoring summary; Appendix K monitoring, success criteria, and response triggers; ancillary-benefit language in Section VI. Not a full report/research-paper extraction or performance assessment.

## Located sources and method

Text was extracted/searchable across the 979-page report. Relevant passages were read with PDF indices retained. Rendered pages visually checked: PDF 81 (III-15), 133 (VI-1), 169 (X-4), 170 (X-5), 698 (K-5), 701–705 (K-8 through K-12), and 707 (K-14). These checks verify source layout and table placement; they are not an independent human reference standard.

Section III.G lists the four project objectives at PDF p81 (III-15). Appendix K repeats the same objectives at PDF p698 (K-5), then expands their monitoring and success criteria in III.A–D, PDF pp701–705 (K-8–K-12). Main-body Table X-4, PDF p170 (X-5), contains quantitative targets across Years 1, 10, 25, and 50. Body explanation at PDF p171 (X-6) describes their basis.

The objective wording agrees in substance between III-15 and K-5. Repeated wording is represented as source evidence for the same conceptual objective, not four additional objectives. Detailed criteria are retained as separate source assertions where times, scope, or presentation differ. The normalization and grouping are assistant interpretations, clearly separated from source wording and numeric values.

## Four formal objectives and Appendix K criteria

Summaries below are paraphrases; the JSON retains normalized objective wording and source locators. All target values are planned criteria, not observed outcomes.

| Local objective | Formal objective | Detailed criterion in Appendix K | Evidence |
| --- | --- | --- | --- |
| SI-O1 | Restore forest area and diversity, including hardwood forest, hard-mast suitability, structure, age, and species composition | Assumed 60% planted-tree survival at Year 9; assumed 800 trees/acre at Year 9 including early-/late-successional and hard-mast species. Density/diversity targets are to be calibrated/validated using a reference stand | K-8–K-9; PDF 701–702 |
| SI-O2 | Increase year-round aquatic habitat diversity, measured by habitat acres and limnophilic native fish use of overwintering habitat | Retain 28 acres of overwintering/summer backwater habitat at Year 5, meeting depth ≥4 ft, average winter velocity ≤1 cm/sec, average winter dissolved oxygen ≥5 mg/L, and winter temperature ≥1°C | K-9–K-10; PDF 702–703 |
| SI-O3 | Restore 50% of island acreage/topography lost since the 1950s and protect against erosion | At Year 10, acreage of affected areas is not less than as-built acreage. Locations are assessed individually | K-10; PDF 703 |
| SI-O4 | Protect existing backwater from sediment deposition and enhance backwater/interior wetlands, measured by acres and scrub-shrub/pollinator survival | At Year 5, protection measures intact and reducing sediment transport; also apply aquatic-diversity criteria. Interior SSP habitat at higher elevations (573.1 ft) has an assumed 60% plant-survival criterion at Year 9 | K-11–K-12; PDF 704–705 |

The source calls several vegetation criteria **assumed**. Its criterion wording does not explicitly state a mathematical operator for the Year-9 60%/800 targets. Those qualifiers are retained; the extraction does not silently add a comparator. Response thresholds below specify less-than comparisons separately.

SI-O3's 50% historical-restoration objective and its as-built persistence criterion address different comparisons. Do not replace one with the other or claim that one automatically proves the other.

## Main-body quantitative summary: retain alongside Appendix K

Table X-4, X-5/PDF 170, lists these targets at Years 1 / 10 / 25 / 50:

| Measure | Target sequence | Scope |
| --- | --- | --- |
| Aquatic habitat | 29 / 28 / 27 / 26 acres | All constructed dredge cuts; Year-0 without-alternative area is 0.14 acre. Table also gives site-specific acreages, transcribed into JSON |
| Forestry survival | ≥90% / ≥60% / ≥60% / ≥40% | All topographic diversity sites |
| Forestry density | >800 after planting / 800 / 350–500 / 150–250 trees per acre | All topographic diversity sites |
| SSP survival | ≥80% / ≥60% / ≥45% / ≥30% | All SSP sites |
| Timber stand improvement | >90% / >90% / >60% / >40% of silvicultural treatment target threshold | All TSI areas; prescription details/denominator require Appendix M follow-up |
| Constructed island acreage | 26 / 26 / 26 / 26 acres | USI Head 14.2, NE Bank 8.3, West SE Island 3.5 acres |

Site-specific aquatic values at Years 1 / 10 / 25 / 50 are Lower Lake 10.4 / 10.2 / 9.8 / 9.2; Upper Lake 12.5 / 12.2 / 11.8 / 11.2; NW Grant Slough 6.0 / 5.9 / 5.8 / 5.5 acres. Source totals are retained as printed rather than recomputed from rounded site values. X-6 explains declining area using an assumed uniform deposition rate of 1 cm/year; these are projected habitat values, not measured future observations.

## Success criteria, response triggers, and monitoring tasks are distinct

Appendix K specifies:

- Forest survival below 60% or density below 800 trees/acre at Years 5 or 7 prompts additional planting (K-9/PDF 702).
- Sediment from NE Bank and/or Grade Control Structure affecting water-quality success criteria for two consecutive years, corroborated by Year-5 bathymetry, prompts modifications (K-10/PDF 703).
- Inability to attain backwater-protection criteria after Year 5 prompts NE Bank/GCS modifications informed by monitoring, potentially adding stone, dredged material, or plantings as specified (K-11/PDF 704).
- SSP survival below 60% at Years 5 or 7 prompts additional planting (K-12/PDF 705).

These conditional responses are not observations of failure or evidence that any response occurred. The forest discussion at K-5 treats phased planting/monitoring as part of construction planning rather than an additional formal Adaptive Management measure; do not label every planting response a separately budgeted AM action.

Examples of planned methods include fixed-radius forest plots and stratified transects; completion/Year-5 bathymetry and water-quality monitoring; topographic surveys, LiDAR, or imagery for island persistence; and shrub transects. A survey protocol or scheduled year is a task specification, not a performance threshold. Supplemental fish sampling in K-10 also contributes evidence but is not itself a newly inferred numerical success criterion.

## Mussels: ancillary benefit, not a fifth formal objective

The user's clarification is directly supported by the report:

- **VI-1/PDF 133:** additional fish/mussel habitat structures may be incorporated where appropriate, as an additional benefit of proposed stone protection, not specifically tied to objectives requiring success monitoring or adaptive management. The source points to Appendix M for preliminary design and to other HREPs for relevant learning. Planning-stage language does not establish that those structures were installed.
- **X-4/PDF 169, Table X-3 footnote 8:** the plan states there is no formal mussel-habitat objective requiring monitoring and specifies no post-construction mussel surveys. It identifies the annual interagency Cordova Mussel Blitz as an opportunity to leverage resource data.

Therefore, represent an **anticipated ancillary benefit** and potential connection to external mussel research/data without inventing an objective, success threshold, dedicated survey obligation, or achieved benefit. Dedicated post-construction mussel surveys are not in this plan, which is a different status from formal-objective performance monitoring that is not yet due during construction. External data may later support evaluation but are not guaranteed to have suitable location, timing, design, or availability.

The source's VI-1 internal reference calls III.G "Complex Connectivity," whereas III.G is titled Project Goals and Objectives. Preserve the passage locator and avoid using its inconsistent cross-reference as an entity identity rule.

## Source differences requiring review

| Issue | Statements retained | Treatment |
| --- | --- | --- |
| Aquatic target horizons | X-5: 28 acres at Year 10; K-9: 28 acres at Year 5 | Separate horizons/assertions; do not declare a contradiction or choose a controlling plan without clarification |
| Vegetation target/schedule years | X-5: Year-10 60% targets; K-9/K-12: Year-9 60% criteria. K-8/K-12 methodology/tables use Years 7 and 9; K-14 responsibilities use Years 7 and 10 | Preserve every source statement; resolve before deriving a final operational schedule |
| Island scope | X-5 total includes NE Bank; K-10 III.C explicitly names USI Head and West SE Island | Retain table/section scope; NE Bank is also part of backwater protection |
| Site versus aggregate aquatic evaluation | K-9 requires individual site assessment but states a combined 28-acre criterion | Do not invent site-specific Year-5 acreage allocations |

Appendix K describes feasibility-level planning and future refinement. This extraction does not determine whether later PED/construction documents supersede these values.

## What this demonstrates about AI extraction

**Demonstrated on this sample:** locating formal objectives; finding their repeated appearance; extracting numeric criteria, units, time horizons, locations, and linked response conditions; distinguishing ancillary benefit from objective; and retaining source differences. Tables and footnotes were checked visually because raw text interleaves columns and can corrupt comparison symbols.

**Not demonstrated:** unattended accuracy, completeness across all report content, extraction performance on research full text, correct linkage to live EMMA/GIS records, or scientific validity of any criterion. Counts here describe extracted assertions, not a precision/recall score. A user/SME review of these worked records can establish a reference set for later extraction evaluation.

**Conceptual implications to review:** repeated source statements may describe one objective; a criterion needs units, population, time/reference condition and applicability; a response trigger is distinguishable from a criterion; a benefit can be relevant to science without being a formal objective; and an external-data opportunity is distinguishable from an assigned monitoring commitment. These are evidence-backed proposals for the conceptual model, not approved production entities.

Next: review the extracted distinctions and unresolved source differences, then extract selected scientific-paper propositions/methods/findings and test links to the ancillary mussel benefit. Baseline survey material was also located at PDF pp192–193 and is a subsequent extraction lead; its numerical results have not been added to this deliverable.
