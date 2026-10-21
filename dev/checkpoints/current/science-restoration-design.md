# Checkpoint: science and restoration conceptual design

- Updated: 2026-10-21
- Status: active pilot report development, resumed at the user's explicit request on 2026-10-21

## Objective

Resume the inductive development of scientific entities and relationships connecting UMRR/NESP research, restoration practices, observations and assessments, using existing EMMA and Restoration Features systems and the USACE ontology baseline. Use the visual research-question report to test conceptual distinctions before database implementation.

## Current state

Latest authorized increment, 2026-10-21: user requested warning resolution and the next step. [The corrected report](../../outputs/research-question/steamboat-mussel-pilot-20261021-evidence.html) uses a render-local Sass cache and includes [an MS-03 scientific instance](../../goals/mussel-vital-rates-instance.json). Public ScienceBase metadata and both CSVs were inspected; full publisher text was inaccessible. Survival and growth findings are separated. Cohort totals (578 narrative, 576 plot placement sum, 569 tracking IDs), taxon labels, substrate metric direction and model/detection details require reconciliation. This is partial source-to-data expansion, not full-paper qualification or reanalysis. Prior warnings came from an inaccessible profile cache; startup locale warnings were separately resolved for command-line verification using supported Windows UTF-8 locale settings. Focused checks now refuse warning-bearing HTML and validate instance provenance.

The user paused after the HTML report walkthrough, then explicitly resumed pilot report development on 2026-10-21. After the first priority-aware draft, the user clarified that the **Steamboat Island mussel pilot is the report's focus; priorities are background**. The [current Steamboat-focused HTML](../../outputs/research-question/steamboat-mussel-pilot-20261021-evidence.html) leads with anticipated local benefit, scientific basis, proposed mechanism, evaluation gaps and next steps. A short priority note follows that narrative; full rankings, agenda, entities and formal project objectives are expandable supporting detail. No scientific conclusion or production implementation is approved by this report revision.

Subsequent authorized work: the user requested a one-page FY27 SOW proposal for approximately $100,000 in-house USACE labor over 6–9 months, then requested Markdown only and stronger program-manager/strategic-plan benefits. The [current Markdown proposal](../../goals/proposal-fy27.md) follows the archived five-section structure and supersedes the R Markdown/PDF draft. Its 20-artifact/two-HREP scope, budget allocations and milestones remain planning proposals. Alignment references the publicly reviewed 2025–2035 draft; final-plan numbering remains unverified. No new PDF should be generated or delivered unless explicitly requested. The earlier PDF remains only as a superseded ignored local artifact; its render script was removed. Proposal preparation does not resume paused science extraction or authorize production implementation.

Start with [project foundation](../../goals/project-foundation.md), then [dashboard feature](../../features/research-question-dashboard.md) and [document-processing workflow](../../workflows/document-processing.md). Avoid rereading the archived chat to recover routine context.

Latest terminology direction: call the effort the **science and restoration integration component of EMMA**, and call its reporting product a **report**, not a dashboard. Existing historical filenames are retained; use the new terminology when updating their content on resumption.

Additional authorized source review, 2026-10-21: the user supplied a workshop research-question ranking workbook and requested documentation updates. [The review](../../goals/workshop-research-priorities.md) and [derivative register](../../goals/workshop-research-question-register.json) now capture 49 questions, their restoration goal/objective context, four reach rankings and 20 recorded project associations. Use this existing learning agenda when resuming; do not invent a replacement question list or treat rank as confidence. The four sorted views reconcile with the main sheet; weighting inputs, workshop dates and `x` semantics remain missing. The mussel/Steamboat pilot is retained, with no claim that it is the highest-ranked Lower Impounded priority. This workbook/documentation task does not authorize production implementation or a switch to a forestry pilot.

Latest proposal steering: emphasize how EMMA connects workshop priorities to existing science, HREPs and available data to identify and pursue learning opportunities. The FY27 draft now includes comparing opportunities and preparing a staff-reviewed shortlist with proposed next actions, responsibilities, dependencies and costs. Those comparison criteria and deliverables remain draft scope, not an approved selection formula or funded study commitment. The user subsequently extended the planning period to 12 months while retaining the $100,000 budget and requesting a tighter one-page Markdown proposal. Current milestones are an interim briefing by Month 6 and final report, reusable evidence/tools and learning-opportunity action plan by Month 12.

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
- Runtime used: R 4.6.1 with installed reporting packages. For command-line rendering, `RSTUDIO_PANDOC` was set to `C:/Users/R1Suser/AppData/Local/Programs/Positron/resources/app/quarto/bin/tools`. Latest checks/rendering are warning-free with process-local supported Windows UTF-8 locale settings; the renderer also fixes the Sass cache path and rejects embedded warnings.
- Browser screenshot qualification failed to complete; automated desktop/narrow-width visual review remains unverified. User discussion of the report does not retrospectively establish that check.
- The checkout has no DESCRIPTION/NAMESPACE. Current functions run from source; no installed-package or R CMD check qualification is claimed.
- Reporting framework files and associated documentation remain uncommitted at this pause. Inspect Git status before further edits; do not discard them. Generated HTML and superseded PDF are ignored under `dev/outputs/` and will not be available from a fresh clone without regeneration or separate preservation.

## Next safe action

The earlier proposed SC-03 increment has now been started and documented. Resume with full methods/model and cohort reconciliation, then identify the local Steamboat feature and available mussel observations to assess applicability to SC-08. Read the completed-increment section of [the worked example](../../goals/mussel-science-worked-example.md) and its structured instance. Reuse the R report and inspection script; do not repeat the original restoration extraction or treat public study data as local post-construction evidence. Browser layout and SME review remain outstanding.

Review the corrected report's scientific instance and proposed evaluation needs. Priority background remains traceable through [mussel-workshop-question-links.json](../../goals/mussel-workshop-question-links.json), pinned to the workbook edition. Data-integrity checks passed, including pilot-first ordering, supporting-detail placement of priority graphics, warning rejection and source-instance consistency. All three figures were visually inspected in the previous draft and their plotting code is unchanged; full browser layout remains unqualified. Earlier HTML snapshots are preserved.

The **SC-03 (Newton et al. 2020, MS-03)** instance is partially populated from publication and dataset sources. Full methods, analysis and local transfer assessment remain unfinished. Reuse the existing worksheets and R report, retain unknowns, and do not restart general framing or repeat the accepted restoration extraction. No production implementation is authorized by this source review.

## Blockers or decisions

The reporting pause was lifted by explicit user instruction. Physical database implementation, production writes, publishing a UMRR ontology module and platform selection remain deferred. R-centric document processing is established direction; do not reintroduce Python generators where suitable R tooling exists. No reminder or scheduled work was requested.
