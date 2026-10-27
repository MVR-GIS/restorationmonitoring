# Research question report

Updated: 2026-10-22. Status: user recognizes coherent case-report milestone; report retained as a conceptual-model design aid, not a validated schema or accepted scientific assessment.

Latest user steering: focus the report on the **Steamboat Island mussel pilot**. Workshop priorities supply background, not the report's organizing structure. The current draft leads with local restoration intent, the proposed response mechanism, selected scientific contributions, evaluation gaps and next steps. A brief WQ-39 background note follows the pilot narrative; ranking figures, the full learning agenda, generic entity inventory and formal project objectives are retained in expandable supporting sections.

The user paused after the 2026-10-20 walkthrough, then explicitly resumed pilot report development on 2026-10-21. Follow the [current checkpoint](../checkpoints/current/science-restoration-design.md). The latest increment resolves embedded warnings and begins the SC-03 scientific instance using accessible publication and dataset sources, with full-method gaps retained.

## Purpose

The report makes a research question, scientific entities, findings, evidence links and restoration context reviewable. It is a design aid for future database development and science/restoration reporting. The first example uses the mussel and Steamboat Island worksheets, now supplemented by a source-located MS-03 instance; SME validation remains pending.

The user explicitly reaffirmed on 2026-10-22 that this report is a **means to reason through data modeling**. Its immediate success is a coherent case that makes necessary information and missing links visible. The next deliverable is the [conceptual-model review](../goals/goals-requirements-crosswalk.md#next-milestone-conceptual-model-review-from-the-pilot). Change the report when it helps test a model question; do not expand presentation or scientific synthesis as a substitute for defining entities and relationships. Report structure and JSON helpers are not persistence contracts.

The [pilot requirement matrix](../goals/goals-requirements-crosswalk.md#requirements-clarified-by-the-steamboat-pilot) captures lessons against the existing requirements. This report demonstrates source-traceable presentation of a partial case. It does not yet demonstrate all-HREP retrieval, a local treatment-effect evaluation, criterion attainment, multi-partner adoption or program-level outcomes.

## R centered implementation

Follow the [document-processing workflow](../workflows/document-processing.md), established by the user's correction to the earlier Python/PDF approach. The inspected fluvgeo pattern is reusable R summaries and renderers, parameterized R Markdown templates in `inst/reports/`, shared gt tables and ggplot2 figures, and generated snapshots under ignored `dev/outputs/`.

- [Summary and renderer](../../R/research_question_report.R) read the two existing worksheets, check IDs and source/derivation references, and keep scientific content distinct from presentation.
- [Presentation helpers](../../R/report_presentation.R) provide readable gt tables with protected raw HTML and a ggplot2 diagram of supplied derivation links only.
- [Template](../../inst/reports/research_question_report.Rmd) presents the question, entity inventory, assertions, derivations, restoration context, objectives, publication links and provenance.
- [Example driver](../scripts/mussel-research-report.R) supplies the proposed local question and candidate entity distinctions. They are report inputs, not new persistence contracts.
- [Focused checks](../scripts/check-research-report.R) cover unknown references, supplied links, escaped source text, an embedded figure, non-replacing publication and worksheet-byte preservation.

Current review output: [Steamboat Island mussel pilot evidence report](../outputs/research-question/steamboat-mussel-pilot-20261021-evidence.html). Earlier snapshots remain preserved, including the first Steamboat-focused draft whose embedded warnings are superseded by this corrected render. Generated artifacts are ignored; a fresh clone must rebuild them. Existing snapshots are refused as destinations. The former PDF is retained only as a superseded artifact under `dev/outputs/research-question/superseded/`; the Python generator is removed.

## Workshop priority artifact

[Priority context reader](../../R/workshop_priority_context.R) accepts the [reviewed register](../goals/workshop-research-question-register.json), original workbook and optional [proposed pilot links](../goals/mussel-workshop-question-links.json). The workbook defines recorded priorities; it is distinct from the six scientific publications and their source-based assertions. Explicit source fingerprints reject a changed workbook or links pinned to another edition. No question-to-pilot match is inferred automatically from wording or rank.

The report shows four candidate relevance links: WQ-39 (substrate/biological habitat), WQ-05 (restoration/substrate mechanism), WQ-40 (connectivity responses) and WQ-37 (possible adverse drawdown effects). It preserves exact wording, source cells, all four reach ranks and tied values; a ggplot2 figure and exact-value table present the same ranks without a program-wide aggregate. Link rationales are assistant proposals, not designer adoption or evidence that the question was tested.

Seven workbook project marks associated with selected WQ-39 appear with their source reach/cell/label. A workbook mark remains an association of unresolved meaning; blank Steamboat entries are not evidence of absent learning value. The full 49-question agenda, goal/objective context and ranks appear in an expandable supporting section. Source workbook, derivative register and pilot links join the input fingerprint table. Existing scientific assertion/derivation counts remain unchanged.

## Reporting boundaries

The local question and SC-08 are assistant formulations, not verbatim author hypotheses or documented designer adoption. Source statements, interpretations, applicability judgments and observed outcomes remain distinguishable. Counts describe worksheet scope, not independent studies or scientific confidence.

Mussel habitat remains an ancillary benefit, not a formal Steamboat objective. Formal performance monitoring not yet applicable differs from dedicated mussel surveys not committed under the reviewed plan. Missing evidence is not failed restoration or contrary evidence. Observation storage and cross-system production identities remain unverified. Candidate entity groups do not imply one new class or table per group.

Input fingerprints, generation time and software versions accompany each report. Rendering is read-only and does not acquire new evidence, approve claims or change production records. HTML is the qualified initial output; PDF and Word exports need separate layout review. This checkout still lacks DESCRIPTION/NAMESPACE, so functions are source-development interfaces rather than installed package exports.

## Verification and next review

The latest revision resolves the Sass cache warning at its cause with a render-local writable cache. A new check rejects warning-bearing HTML and verifies the cache option is restored after success/failure. Windows locale warnings were resolved for the verification process with supported process-local UTF-8 locale settings; no persistent machine settings changed. Earlier claims of successful rendering did not establish absence of embedded warnings.

The optional `study_instance_file` summary input validates source/assertion consistency and adds its fingerprint. The report now distinguishes MS-03 survival and growth findings, traces design/observations/data, and exposes the unresolved cohort totals. Checks cover invalid instance provenance, displayed counts and release DOI, alongside existing priority, escaping and publication checks. The R data inspection verifies three file hashes, two CSV dimensions, unique individual IDs and plot placement total. No biological rates were recomputed; full methods and statistical analysis remain unverified.

R 4.6.1 successfully rendered the example using installed jsonlite/rmarkdown/knitr/htmltools/gt/ggplot2 and Positron's Pandoc. Focused checks passed for referenced identities, supplied derivations, HTML escaping, embedded figure, overwrite refusal and unchanged source worksheets. Earlier locale startup warnings are resolved for the verification process as described above. Browser screenshot qualification did not complete: the available headless browser failed to attach and a command-line attempt stalled. Actual desktop/narrow-width visual review remains pending; HTML render success does not establish that review. These are focused development checks, not R CMD check or full scientific validation.

On 2026-10-21 the updated example rendered successfully. Extended checks passed for 49 agenda questions, four selected links, exact ranks/ties, seven selected workbook project marks, unknown-link rejection, source-edition mismatch rejection, optional no-priority compatibility, complete agenda output, escaped text, non-overwrite and unchanged inputs. The two PNG figures embedded in the actual HTML were extracted and visually inspected. Actual browser rendering at desktop/narrow widths remains unqualified; no new browser screenshot check is claimed.

The subsequent Steamboat-focused draft also rendered successfully. It adds a clearly proposed feature → local habitat conditions → expected mussel benefit diagram; no new scientific record or measured response is inferred. Focused checks additionally verify the pilot is the first report section, evaluation precedes priority background, and the rank figure is contained within supporting details. All three actual embedded figures were visually inspected. Full browser layout qualification remains outstanding.

Next review should use the report to define and test conceptual objects, relationships, identities and unresolved multiplicities. Full methods and local applicability gaps remain available as targeted evidence work when a particular model or inference question requires them. The framework does not approve a database schema, ontology module, new monitoring obligation or numerical acceptance threshold. The user's recognition of a coherent report is recorded separately from the still-outstanding browser-layout and SME qualifications.
