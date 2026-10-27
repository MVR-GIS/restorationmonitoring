# Checkpoint: science and restoration conceptual design

- Updated: 2026-10-22
- Status: coherent case-report milestone recognized; requirements consolidated; conceptual-model review begun, proposed meanings awaiting discussion

## Objective and accepted direction

Develop the science and restoration integration component of EMMA by inductively linking program science, restoration practices and observed outcomes across organizations and generations. Support existing expert workflows and production EMMA/Restoration Features systems. Reuse the organizational USACE ontology from the outset; module publication and physical implementation remain later work.

On 2026-10-22 the user recognized the Steamboat Island mussel report as a coherent case and the reporting milestone as accomplished, and requested a requirements-focused documentation pass. The report is explicitly a means to reason through data modeling. This does not accept a schema, all proposed requirements, scientific propositions or a local restoration effect. Further report development should serve an identified modeling question.

## Read first

1. [Project foundation](../../goals/project-foundation.md): accepted purpose, current scope and evidence boundaries.
2. [Requirements crosswalk](../../goals/goals-requirements-crosswalk.md#requirements-clarified-by-the-steamboat-pilot): pilot clarifications mapped to existing R-01 through R-19 and the next conceptual-model milestone.
3. [Relationship analysis](../../architecture/science-restoration-relationships.md#pilot-implications-for-conceptual-model-review): L-01 through L-08 and candidate distinctions exposed by the case.
4. [USACE ontology baseline](../../architecture/usace-ontology-alignment.md): meanings already inspected and reuse/extension limits.

Use detailed source reviews conditionally; do not restart foundation review or reread archived transcripts for routine context. Existing instructions route the adjacent Restoration Features book and organizational ontology.

## What is established

- Program foundation, production EMMA exports, Restoration Features schema/book and selected organizational ontology modules have scoped reviews. The user's conceptual chain is HREP → Project Objective → Performance Criterion → Monitoring Task → Observation; exported many-to-many objective/criterion and task/criterion relationships must also be preserved.
- The user accepted the Steamboat restoration extraction as sufficient demonstration. Mussel habitat is an anticipated ancillary benefit, not a formal objective or dedicated post-construction monitoring commitment. User-reported construction stage does not establish current field status or a post-construction outcome.
- [The science worksheet](../../goals/mussel-science-evidence.json) contains six publication records, seven source-based assertions and assistant-formulated SC-08. [The MS-03 instance](../../goals/mussel-vital-rates-instance.json) adds ten source-located chain records, metadata and CSV inspection. These are presentation/evidence worksheets, not an approved model or count of independent studies.
- [The report](../../outputs/research-question/steamboat-mussel-pilot-20261021-evidence.html) connects local intent, scientific reasoning, the proposed hypothesis and evaluation gaps. Workshop priorities remain background. The user recognizes its coherence; scientific and technical qualifications remain separate.
- The workshop source records 49 questions, four reach-specific rankings and recorded project associations. Rank, relevance and completed scientific evaluation are distinct. WQ identifiers are review-local; marks and blanks retain their interpretation limits.
- A focused knowledge-graph literature review supports pursuing the approach conditionally; no UMRR collaboration or ecological benefit has been demonstrated by this prototype.
- The 2026-10-22 documentation pass consolidates requirements and modeling implications in existing artifacts. No new requirement IDs, ontology terms, tables or governance framework were introduced. R-01 through R-19 and detailed L definitions remain proposals for review.

## Current design lessons

Keep source/passage, extracted assertion, study/design, sampling event, measured property/result, dataset/analysis, finding, interpretation and applicability distinguishable. Survival and growth are separate responses; measured live/dead status is not an estimated survival rate. Derivation is not empirical support, and relevance is not designer adoption or a local test. Ancillary benefit need not be forced into a formal objective/criterion. Report groups, diagram nodes and JSON rows do not determine classes, tables or cardinalities.

Preserve original identity/value/context alongside proposed reconciliation. Represent partial chains, missing evidence, monitoring not yet applicable and work not committed without treating them as failed performance. Review-state history and partner responsibilities remain design needs, not implemented capabilities.

## Remaining evidence and review gaps

- MS-02/MS-03 full methods/results, fitted models and detection/exclusion assumptions remain unverified. MS-03 sources retain 578 narrative, 576 placement-total and 569 tracking-ID counts; reconcile before analysis. Taxon labels, tag changes and substrate metric direction also need review. No vital rates were recalculated.
- Steamboat final feature/design/installation identity and usable local mussel observations have not been assembled; no local effect or designer adoption of SC-08 is established.
- Production observation storage, cross-system identity rules, exact cardinalities, review ownership and sustainable update practices remain unresolved.
- Final strategic-plan version, comprehensive source coverage, scientific applicability/SME review and comparative usefulness/curation-burden evaluation remain outstanding. No numeric acceptance thresholds are agreed.

These gaps limit scientific claims and implementation decisions; they do not block representing known objects, relationships and unknowns in a draft conceptual model.

## Next safe action

The user requested the conceptual-model walkthrough on 2026-10-22. [The review draft](../../architecture/steamboat-conceptual-model.md) now walks existing EMMA/GIS anchors, scientific objects, concrete relationships and rechecked organizational reuse. It recommends distinguishing expected benefit, finding, hypothesis and applicability judgment, with data granularity and identity/cardinality decisions open. No recommendation has been accepted merely by presenting it. Continue discussion from that draft rather than recreating the entity list.

Prepare the [conceptual-model review](../../goals/goals-requirements-crosswalk.md#next-milestone-conceptual-model-review-from-the-pilot) from existing records: define candidate objects and boundaries, relationship meanings and context, organizational reuse and production anchors; expose identity/cardinality decisions; walk through US-02, US-03 and US-05. Trace proposed model elements back to R/L entries and evidence. Request further source work only where it resolves a consequential ambiguity; do not make cohort reconciliation or another report draft the default next milestone.

## Technical state and other work

The R-centered workflow follows the reviewed fluvgeo pattern: reusable summaries/renderers, parameterized R Markdown, gt/ggplot2 and self-contained HTML snapshots. [The feature](../../features/research-question-dashboard.md) and [processing workflow](../../workflows/document-processing.md) hold implementation detail. Latest code checks on 2026-10-21 passed source/instance provenance, ranks/edition guards, HTML escaping, warning rejection, cache restoration, non-overwrite and input preservation. The three source-file fingerprints and CSV dimensions/counts were checked separately. The documentation pass does not claim a new software test run.

The renderer fixes the inaccessible Sass profile cache by using a temporary render-local cache. Command-line verification used supported process-local Windows UTF-8 locale settings and Positron Pandoc. No persistent machine settings changed. Full browser layout remains unqualified; three figures were inspected in the earlier draft and plotting code was unchanged. There is no DESCRIPTION/NAMESPACE, installed-package qualification or R CMD check result.

Generated HTML/acquisitions are ignored and need regeneration or separate preservation in a fresh clone. Maintained sources/manifest and scripts remain available. Existing uncommitted work is preserved; inspect Git status before edits. No production writes, platform selection, UMRR ontology publication, new monitoring obligation or source-data correction is approved.

The [FY27 Markdown proposal](../../goals/proposal-fy27.md) remains a separate draft: $100,000 in-house USACE labor over 12 months, practical pilot deliverables and a learning-opportunity action plan. Budget/task allocations and scope counts are proposals, not funded commitments. Use "report" and "science and restoration integration component of EMMA". Do not generate PDFs unless explicitly requested. No scheduled work or reminder was requested.
