# USACE ontology baseline for Restoration Monitoring

- Reviewed: 2026-10-16
- Local source: sibling `usace-ukg-ontologies`, HEAD `3ab4e87813875f444748720b29e59483a44bfb0c`, clean at inspection; `VERSION` = `2.0.0`. No remote freshness check.
- Accepted direction: organizational terminology and structure are a design dependency now. A future UMRR module should extend the organizational infrastructure. This supersedes treating alignment as only a distant consideration; actual module authoring/promotion remains later work.
- Scope: README, MANIFEST, CONTRIBUTING, version/release context, selected modular definitions/shapes, and a declaration-name scan of 47 domain/microtheory TTL files. Not a complete semantic audit or import-closure validation. No sibling files changed.

## Reuse baseline

Paths in the table are relative to `../usace-ukg-ontologies/TBWorkspace/USACE-KG/`. Prefix labels are shorthand; the full namespace IRIs determine identity.

| Existing infrastructure | Inspected source and definition | Proposed use / qualification |
| --- | --- | --- |
| `usace:Entity` | `domain-specific/ontologies/core.ttl`; namespace `https://usace-data.com/ontology/usace-core#`; subclass of `prov:Entity` | Parent candidate for new scientific information objects; reuse provenance grounding |
| Documents and cataloguing | `core.ttl` places `foaf:Document` under `usace:Entity` and imports DCAT; namespace `http://xmlns.com/foaf/0.1/` | Papers/report documents reuse document meaning; datasets/distributions use the imported catalogue framework after its detailed profile is checked. A paper, study, and dataset are not the same object |
| `gov:ProvenanceRecord`, `gov:hasProvenanceRecord`, `gov:derivedFrom` | `domain-specific/ontologies/governance.ttl`; namespace `https://usace-data.com/ontology/governance#`; qualified derivation record aligned to PROV-O | Attach source and extraction/analysis derivation to scientific assertions. Do not use derivation alone to mean scientific support |
| `gov:ValidityPeriod`, `gov:hasValidityPeriod`, `gov:recordedAtTime` | `governance.ttl` distinguishes real-world valid time, record time, and entity generation time; adopts W3C OWL-Time | Preserve changing criteria/designs and recording dates. Study observation time, publication date, applicability scope and administrative validity must remain distinguishable |
| `gov:hasValidityStatus` and existing status taxonomy | `domain-specific/taxonomies/validity-status.ttl`: Current, Provisional, Superseded, Retired | Reuse record-authority lifecycle where applicable. These values are not scientific confidence, peer-review status, or evidence that a hypothesis is true |
| `sosa:Observation` and observation relations | `domain-specific/ontologies/hydrologic-observation.ttl` imports `http://www.w3.org/ns/sosa/`; specializes it as HydrologicObservation, GaugeObservation, FloodScenarioOutput | Follow the current SOSA pattern for measured properties, features of interest, procedures, results and timing. Biological observations should not be forced into HydrologicObservation or GaugeObservation |
| Hydrologic observable properties | Same module defines FlowVelocity, Discharge, GageHeight as `sosa:ObservableProperty` individuals | Reuse when measured meanings agree. Substrate stability, survival, recruitment, species/life-stage context are domain content requiring appropriate definitions, not aliases of discharge or velocity |
| `plan:Plan`, `plan:Objective`, `plan:PlannedActivity`, `plan:Outcome` | `cross-domain/microtheories/activity-microtheory/plan.ttl`; namespace `http://www.opengis.net/ont/plan#` | Candidate reuse for study plans, EMMA objectives, planned tasks and intended outcomes, subject to semantics/import review; planned outcomes are not observed findings |
| Project/program/site entities | `domain-specific/ontologies/ppa.ttl`, `asset.ttl` | Reconcile HREP/program/site identities with organizational concepts. `ppa:PromisProject` has P2/program restrictions; do not type a record as this merely because its label says Project |
| Physical features and locations | `physical-asset.ttl`, `asset.ttl`, `location.ttl`, GeoSPARQL foundation | Reuse suitable physical-asset/site/spatial meanings, preserving GIS IDs and geometry distinctions. Not every habitat polygon is a constructed Structure |
| Module and validation conventions | CONTRIBUTING and MANIFEST; neighboring OWL/SHACL modules | Future UMRR module should reuse imports/references selectively, declare extension terms with definitions, include appropriate shapes and follow existing promotion/registration conventions |

## Scientific extension boundary

The scoped declaration-name scan found no matching declared classes/properties for Hypothesis, ResearchQuestion, StudyDesign, Conclusion, Finding, Evidence, Claim, Assertion, or Confidence in the 47 inspected modular files. This is a candidate gap, not proof of absence from every import, historical bundle, or other agency repository.

Review proposals for scientific proposition/hypothesis, finding, evidence-to-proposition relation, and applicability/transfer assessment before adding terms. Prefer specializing existing `usace:Entity`, documents, activities, plans, observations and provenance over recreating them. A reviewable assertion can be an identified information object carrying existing provenance; the specific proposition and evidence semantics may need UMRR extensions. New names here are conceptual candidates, not registered USACE terms or chosen UMRR namespace IRIs.

## Important distinctions found in the evolving repository

- The MANIFEST and v1.7 notes are useful entry points but not a complete account of the local 2.0.0 tree. `core.ttl` still reports v1.7, physical-asset v1.9, and governance v0.1. Pin the local Git revision and record relevant module IRIs/version metadata; do not infer uniform module versions from the repository VERSION.
- The hydrologic-observation module explicitly treats SOSA/SSN as normative and the older custom observation microtheory as documentary/close-match context. Reuse that current direction rather than defaulting to the legacy Observation merely by name.
- `indicator:Indicator` in the older microtheory is described as analytic tradecraft detecting an activity, not simply an ecological indicator or numerical performance criterion. No direct equivalence to EMMA criteria is justified by its label.
- The older activity file binds its `activity:` prefix to `http://www.opengis.net/ont#`, while its default prefix and other modules use `http://www.opengis.net/ont/activity#`. Inspect actual IRIs and resolve the intended integration before relying on those legacy links. No upstream correction was made.
- Governance SHACL requires a source IRI on a ProvenanceRecord and bounds its producing activity; its validity-period shapes check start/end structure. Reuse these checks where their target pattern applies. They do not validate scientific truth or causal inference.
- `core.ttl` also makes USACE Activity an Entity; do not automatically add disjoint PROV activity/entity classifications to the same node. Separate a study/plan record from the actual execution/analysis activity when needed, and check imported axioms before finalizing mappings.

No full RDF parser/import closure or SHACL run was performed: the available bundled Python lacks rdflib, and no dependencies were installed for this read-only design review. Findings above come from direct source inspection and scoped text scanning, not a certified consistency result.

## Applying the dependency immediately

For each proposed scientific object/relationship, record: intended meaning; supporting paper passage; existing organizational term if appropriate; reuse/specialization/new-term/unresolved status; and source module/revision. Recheck this matrix when the organizational baseline changes. Do not publish candidate subclass/equivalence axioms merely because labels resemble one another.

The [mussel science worked example](../goals/mussel-science-worked-example.md) applies this approach. Next, review its scientific distinctions and reuse mappings with domain and ontology stewards. Later module work should follow the repository's existing nomination, validation, refinement, promotion and registration path. Production database changes and ontology publication are outside this review.
