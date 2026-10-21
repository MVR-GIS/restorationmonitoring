# Research question dashboard report

Updated: 2026-10-20. Status: first R Markdown reporting implementation for user review; not a validated conceptual schema or accepted scientific assessment.

User review on 2026-10-20: the report and walkthrough are sufficient for now; the user paused the effort. Follow the [resume checkpoint](../checkpoints/current/science-restoration-design.md). The walkthrough identified a useful next proposal: expand SC-03 into a source-traceable study/design/observation/analysis/finding instance before refining its relationship to SC-08. No further work is active during the pause.

## Purpose

The dashboard makes a research question, scientific entities, findings, evidence links and restoration context reviewable. It is a design aid for future database development and science/restoration reporting. The first example uses the existing mussel and Steamboat Island worksheets; no new science extraction or SME validation is implied.

## R centered implementation

Follow the [document-processing workflow](../workflows/document-processing.md), established by the user's correction to the earlier Python/PDF approach. The inspected fluvgeo pattern is reusable R summaries and renderers, parameterized R Markdown templates in `inst/reports/`, shared gt tables and ggplot2 figures, and generated snapshots under ignored `dev/outputs/`.

- [Summary and renderer](../../R/research_question_report.R) read the two existing worksheets, check IDs and source/derivation references, and keep scientific content distinct from presentation.
- [Presentation helpers](../../R/report_presentation.R) provide readable gt tables with protected raw HTML and a ggplot2 diagram of supplied derivation links only.
- [Template](../../inst/reports/research_question_report.Rmd) presents the question, entity inventory, assertions, derivations, restoration context, objectives, publication links and provenance.
- [Example driver](../scripts/mussel-research-report.R) supplies the proposed local question and candidate entity distinctions. They are report inputs, not new persistence contracts.
- [Focused checks](../scripts/check-research-report.R) cover unknown references, supplied links, escaped source text, an embedded figure, non-replacing publication and worksheet-byte preservation.

Current review output: [self-contained HTML](../outputs/research-question/mussel-research-20261020.html). Generated artifacts are ignored; a fresh clone must rebuild them. Existing snapshots are refused as destinations. The former PDF is retained only as a superseded artifact under `dev/outputs/research-question/superseded/`; the Python generator is removed.

## Reporting boundaries

The local question and SC-08 are assistant formulations, not verbatim author hypotheses or documented designer adoption. Source statements, interpretations, applicability judgments and observed outcomes remain distinguishable. Counts describe worksheet scope, not independent studies or scientific confidence.

Mussel habitat remains an ancillary benefit, not a formal Steamboat objective. Formal performance monitoring not yet applicable differs from dedicated mussel surveys not committed under the reviewed plan. Missing evidence is not failed restoration or contrary evidence. Observation storage and cross-system production identities remain unverified. Candidate entity groups do not imply one new class or table per group.

Input fingerprints, generation time and software versions accompany each report. Rendering is read-only and does not acquire new evidence, approve claims or change production records. HTML is the qualified initial output; PDF and Word exports need separate layout review. This checkout still lacks DESCRIPTION/NAMESPACE, so functions are source-development interfaces rather than installed package exports.

## Verification and next review

R 4.6.1 successfully rendered the example using installed jsonlite/rmarkdown/knitr/htmltools/gt/ggplot2 and Positron's Pandoc. Focused checks passed for referenced identities, supplied derivations, HTML escaping, embedded figure, overwrite refusal and unchanged source worksheets. Locale startup warnings remain. Browser screenshot qualification did not complete: the available headless browser failed to attach and a command-line attempt stalled. Actual desktop/narrow-width visual review remains pending; HTML render success does not establish that review. These are focused development checks, not R CMD check or full scientific validation.

Next review should establish whether this report structure supplies the right visual and scientific detail. Then deepen MS-02/MS-03 and the local applicability bridge through the existing worked example. The framework does not approve a database schema, ontology module, new monitoring obligation or numerical acceptance threshold.
