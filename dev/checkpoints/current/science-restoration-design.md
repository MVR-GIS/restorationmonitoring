# Checkpoint: science and restoration conceptual design

- Updated: 2026-10-20
- Status: paused at the user's explicit request

## Objective

Resume the inductive development of scientific entities and relationships connecting UMRR/NESP research, restoration practices, observations and assessments, using existing EMMA and Restoration Features systems and the USACE ontology baseline. Use the visual research-question report to test conceptual distinctions before database implementation.

## Current state

The user reviewed the HTML report walkthrough, considered it sufficient for now, and asked to pause. This is acceptance of the current stopping point, not approval of every proposed entity, relationship, scientific interpretation or report design. Do not continue research, implementation or report redesign until the user resumes.

Start with [project foundation](../../goals/project-foundation.md), then [dashboard feature](../../features/research-question-dashboard.md) and [document-processing workflow](../../workflows/document-processing.md). Avoid rereading the archived chat to recover routine context.

## Completed

- Program/document foundation, production EMMA exports, Restoration Features schema/book, and selected organizational ontology modules reviewed, with scope/version limits retained in their maintained reviews.
- Steamboat Island restoration extraction accepted as sufficient demonstration: four formal objectives, detailed criteria and source differences. Mussel habitat is an ancillary anticipated benefit, not a formal objective or dedicated monitoring commitment.
- [Science worksheet](../../goals/mussel-science-evidence.json) records six selected publications, seven source-based assertion records and one assistant-formulated local hypothesis (SC-08). Most research evidence remains abstract-level; no SME validation or local post-construction mussel effect is established.
- [Knowledge graph literature assessment](../../goals/knowledge-graph-literature-assessment.md) checks expectations against a focused ten-publication review of the 89-item collection, plus a supplementary source. It supports the approach conditionally, not a claim of demonstrated UMRR benefits.
- R-centered reporting established by user direction, following fluvgeo at reviewed revision `6eaefd4691b037fe104d94ff4e3612f04398e509`: reusable summaries/renderers in `R/`, parameterized R Markdown in `inst/reports/`, gt tables, ggplot2 figures and ignored HTML snapshots. The Python generator was removed; its PDF is superseded.
- [Current HTML](../../outputs/research-question/mussel-research-20261020.html) was generated and discussed. Its entity inventory is a set of candidate distinctions, not a fully populated research model. The diagram currently shows only SC-02 and SC-03 informing SC-08; it is not a complete causal or science/restoration network.

## Remaining

- Expand one scientific instance into source passage, study, design, context, observations/dataset, analysis, finding and hypothesis relationship. Several current assertion records combine methods, findings and interpretations; separate them only when the sources justify it.
- Review scientific applicability to the local design and feature identity. Do not infer that Steamboat designers adopted SC-08.
- Refine candidate entities/relationships and map meanings to the existing USACE ontology before proposing extensions. Twelve report groups do not require twelve tables or classes.
- Resolve source-depth gaps, especially MS-02/MS-03 full-paper methods/results, when needed for this instance. Publication identity does not establish independent study identity.
- Later evaluate answers/traceability and curation effort with intended users against current workflows. No numerical acceptance thresholds are agreed.
- Current strategic-plan final version, live production observation storage and cross-system identifiers remain unverified. These gaps do not require restarting foundation review.

## Evidence and verification

- Example driver: [mussel-research-report.R](../../scripts/mussel-research-report.R). Run from repository root with Rscript for a timestamped HTML; explicit existing destinations are refused.
- Focused checks: [check-research-report.R](../../scripts/check-research-report.R). Passed: source references, supplied derivation links, HTML escaping, embedded figure, non-overwrite and unchanged worksheet bytes.
- Runtime used: R 4.6.1 with installed reporting packages. For command-line rendering, `RSTUDIO_PANDOC` was set to `C:/Users/R1Suser/AppData/Local/Programs/Positron/resources/app/quarto/bin/tools`. Locale startup warnings remain.
- Browser screenshot qualification failed to complete; automated desktop/narrow-width visual review remains unverified. User discussion of the report does not retrospectively establish that check.
- The checkout has no DESCRIPTION/NAMESPACE. Current functions run from source; no installed-package or R CMD check qualification is claimed.
- Reporting framework files and associated documentation remain uncommitted at this pause. Inspect Git status before further edits; do not discard them. Generated HTML and superseded PDF are ignored under `dev/outputs/` and will not be available from a fresh clone without regeneration or separate preservation.

## Next safe action

When the user resumes, briefly confirm this stopping point and propose expanding **SC-03 (Newton et al. 2020, MS-03)** into one inspectable scientific instance, then assess how it informs SC-08. This was the assistant's suggested next increment, not a user-approved implementation task. Reuse the existing worksheets and R report; acquire full text only as needed, retain unknowns, and do not restart general framing or repeat the accepted restoration extraction.

## Blockers or decisions

Paused by user choice, not a technical impasse. Physical database implementation, production writes, publishing a UMRR ontology module and platform selection remain deferred. R-centric document processing is established direction; do not reintroduce Python generators where suitable R tooling exists. No reminder or automatic resumption was requested.
