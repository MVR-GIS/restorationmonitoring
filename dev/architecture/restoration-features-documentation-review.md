# Restoration Features documentation in the scientific-linking project

- Reviewed: 2026-10-14
- Source: sibling `umrs_rf` Git repository, HEAD `b5f344f16e4aee733cdb3eabe026bcb06263e8e7`; clean at inspection
- Scope: Quarto configuration and 37 authored chapter files inventoried; purpose, classifications, crosswalks, feature definitions, attribute/lifecycle tables, and selected parameter meanings reviewed. Not an engineering-standard audit, rendered-book review, or verification of every numerical prescription or case-study claim.
- Authority: local authored documentation is evidence of the model's intended meaning. The user confirms production use. Schema exports establish exported structure; neither source establishes populated-record completeness or scientific outcomes.
- Related: [production schema review](production-schema-review.md), [scientific relationships](science-restoration-relationships.md), [goals/requirements](../goals/goals-requirements-crosswalk.md)

## Documented purpose and existing investment

[Preface](../../../umrs_rf/index.qmd) and [Introduction](../../../umrs_rf/intro.qmd), under Purpose and Data Design Standards, describe an evolving GIS model of physical restoration features designed to accomplish project objectives. The documentation states adaptation from DOD SDSFIE-V and alignment with the UMRR Design Handbook (2012, 2025); those upstream standards and the 2025 handbook were not independently reviewed here.

Introduction/Data Use identifies common terminology, cartography, upward reporting, investment record keeping, and whole-project lifecycle tracking as intended uses. Current Programs Usage covers UMRR and NESP and describes applicability independent of jurisdiction or funding source. This reinforces the accepted project direction: connect established restoration records to scientific reasoning while supporting existing distributed workflows. Existing restoration terminology should be retained; this project needs names and definitions for additional conceptual scientific entities.

## Findings relevant to conceptual relationships

| Documented finding and locator | Implication for this project's proposed model |
| --- | --- |
| [Restoration Features](../../../umrs_rf/features.qmd)/Notes and [Support Features](../../../umrs_rf/features_support.qmd)/Notes prescribe CAD/as-built evidence for constructed features and allow potential features and planning alternatives during planning | Preserve evidence of design intention, alternative participation, and actual implementation separately; a geometry alone does not establish what was built |
| Feature chapters' Feature Attribute Criteria distinguish required/optional attributes, earliest availability phase, and digitizing requirements | Missing values have lifecycle context. A feature in feasibility need not have all construction attributes; distinguish not-yet-available from undocumented or unknown |
| [Island](../../../umrs_rf/rf_island.qmd)/RestorFeatStatus describes status together with responsible party; a USACE-built feature remains USACE Built after later repairs | Status is not a complete intervention history. Scientific evaluation needs the implementation/repair condition relevant to observation dates |
| [IslandLine](../../../umrs_rf/rf_island_ln.qmd)/Definition and Applicability describes narrow-feature, cartographic, and alignment representations; [Riverine Flow Structure Line](../../../umrs_rf/rf_river_flow_struct_ln.qmd)/Definition contrasts line with polygon scale | Distinguish physical intervention identity from GIS representation; line/polygon records must not automatically be counted as separate treatments or assumed to be the same feature without identity evidence |
| [Feature Stationing](../../../umrs_rf/rsf_feat_station.qmd)/Purpose connects design, construction, inspection, and maintenance records to locations along structures | Retain local stationing and alignment references when linking fragmented artifacts; spatial overlap alone is an insufficient identity rule |
| [NESP crosswalk](../../../umrs_rf/rf_cross_x_nesp.qmd) associates multiple classes with a measure and reuses classes across measures | Broad restoration measure and GIS feature class are different organizing levels; membership is not equivalence or evidence that a particular HREP implemented the measure |
| [Design Handbook crosswalk](../../../umrs_rf/rf_cross_x_design_hb.qmd) links feature families to handbook chapters 4–9 | Existing crosswalks can guide artifact discovery and linking to design knowledge; they do not establish project-specific hypotheses or observed effectiveness |
| [Summary](../../../umrs_rf/summary.qmd) describes features operating as integrated systems with supporting infrastructure | Permit evaluations to address combinations of features and management operations, not only isolated feature records; causal allocation among components requires study evidence |

## Documented feature coverage

The book has 17 restoration-feature chapters and 10 support-feature chapters, plus introduction/overview, two crosswalks, synthesis/case studies, and reference/resource pages.

| Family | Chapter coverage and relevance |
| --- | --- |
| Earthworks, depth, and flow | Dredging Event, Flow Channel, Embankment and Centerline, Island and IslandLine, Notch, Riverine Flow Structure and Line, Revetment: geometry, design characteristics, material/dimension/elevation context for identifying interventions and comparing studies |
| Vegetation and habitat | Flora Planting or Seeding, Fish Structure, Wetland: type/subtype, species or habitat context, planting dates, dimensions and intended functions relevant to scientific questions |
| Active water management | Moist Soil Management Units, Pump Station, Water Control Structure, Well: physical capacity and management context; infrastructure installation does not itself establish when/how it was operated |
| Supporting evidence/infrastructure | Dredge Placement, Borehole Points, Electrical Utility Nodes/Segments, Feature Stationing, Pavement Section, Road Segment, Sign, Water Utility Nodes/Segments: dependencies and records needed to interpret implementation, maintenance, access, and operating conditions |

The book documents Dredge Placement as a support feature, while the previously supplied XML contains 26 feature classes and does not list a Dredge Placement class. Treat this as a documentation/export coverage difference to reconcile, not a reason to discard the concept.

## Floodplain forest example: evidence already available

[Flora Planting or Seeding](../../../umrs_rf/rf_flora_plant_seed.qmd) defines intentional vegetation establishment and links it to floodplain function, habitat, soil stabilization, diversity, and resilience. Its parameter definitions describe PlantingDate as the date planting occurred or was first completed, DominantSpecies1–3 as planted/seeded species (with mixture information possible), and MastPlanting as an intended wildlife-food function.

The [NESP Forest Management crosswalk](../../../umrs_rf/rf_cross_x_nesp.qmd) includes Flora Planting and Seeding, Riverine Flow Structures, and Wetlands. The [handbook Chapter 8 crosswalk](../../../umrs_rf/rf_cross_x_design_hb.qmd) includes Wetlands, Flora Planting and Seeding, and Dredging.

Proposed scientific extension: link the specific feature's planting and environmental context to independently extracted hypotheses, monitoring commitments, observations, analyses, and assessments. Planted species and intended mast function are intervention characteristics, not evidence of survival, recruitment, realized mast production, or objective attainment. Crosswalk membership supplies context, not a verified study relationship. This is a document-based illustration, not individual-HREP validation or a claim about treatment effectiveness.

## Identity and provenance meanings now better grounded

Many parameter sections describe PROJECT_ID as the foreign key to a unique NESP/UMRR project identity and RestorFeatIDPK as a feature-record primary key. This strengthens the documented intent, but does not establish equality with EMMA's USACE_PROJECT_ID or uniqueness across all feature classes. Some chapters instead describe RestorFeatIDPK and sdsID as attached-media references. Resolve these differences before choosing cross-system join rules.

The book distinguishes feature names/descriptions, metadata references, and media references; these are useful discovery/provenance starting points. A field reference alone does not provide the exact artifact passage supporting a scientific assertion. The extraction work should retain both existing references and assertion-level source locations.

## Reconciliation items affecting this project

These are observed documentation inconsistencies or incomplete sections, not production defect findings. Original chapters and production codes were not changed.

- IslandLine's attribute-criteria table lists pump attributes (NumberPumps, PumpConfiguration, capacity, etc.), whereas the XML IslandLine fields describe island characteristics. Do not adopt this table as an exact schema contract without reconciliation.
- Fish Structure's geometric section allows point or polygon while its overview and supplied XML use polygon; its geometry note mentions well-top elevation. Confirm the intended geometry rather than generating a new point feature entity from that text.
- Several identifier descriptions conflict as noted above. Common fields can appear optional at construction even when the scientific infrastructure needs a reference earlier; do not infer production nullability or global identity policy from narrative attribute criteria.
- FlowChannel repeats ConstructionMethod in the attribute table. NESP crosswalk repeats Dredging under Side Channel Restoration, uses "Fishing Structures" in one entry, and leaves Dam Point Control as `????`. Preserve incomplete mappings explicitly and avoid duplicate counting.
- Wetland documentation combines a regulatory classification definition with restoration purposes; prior XML domain inconsistencies remain unresolved. Feature presence does not by itself demonstrate a constructed intervention.
- Reference/resource chapters provide little supporting bibliographic content. Case-study narratives contain precise project/result assertions without consistent passage-level citations; retain them as authored narratives pending source corroboration, not verified project observations or conclusions.

Engineering prescriptions, numerical thresholds, typical monitoring schedules, and performance claims in chapters are not automatically project-specific criteria or approved monitoring commitments. When extracted, retain whether a statement is general guidance, design specification, planned criterion, reported observation, or interpreted conclusion, with source/version and applicability.

## Recommended next use

Use this book as an established restoration-model documentation source in the fragmented-artifact extraction pilot. Independent examples remain valid; no matched project document set is required. Begin with feature meanings and existing identifiers/classifications, then attach source-supported scientific entities and relationships as evidence accumulates. Record potential cross-document matches separately from established links.

Before exact integration design, reconcile identifier semantics, geometry alternatives, feature histories/operation records, and the relevant book/XML differences with existing GIS stewardship. Physical implementation and long-term USACE ontology alignment remain deferred.
