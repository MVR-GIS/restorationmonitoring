# Extraction quality, evaluation and reprocessing plan

Updated 2026-11-05. Status: proposed quality framework, not a validated production process. The user requires high scientific standards, traceability, evolving evaluation methods and repeatable updates as source collections and techniques change. The [relational vertical slice](relational-vertical-slice.md) proposes records for preserving the corresponding evidence and decisions.

## Traceable, replaceable stages

Treat source registration, text/OCR, segmentation, indexing, retrieval, extraction, validation, expert review and publication as separately versioned stages with explicit inputs and outputs. Record source byte hashes and rights/access; page/section/table locators; text extraction method/version; segmentation policy; index content and corpus version; query and filters; retrieved ranks and scores; model/provider and available revision; prompt/schema version; code/dependency/environment revision; parameters and random seed where meaningful; candidate content; review decisions; and resulting record versions. Protect restricted information and credentials. Model output and candidate provenance are retained subject to enterprise policy.

Use a documented adapter contract so retrieval, extraction and evaluation tools can be replaced without changing domain meaning or erasing prior runs. Intermediate JSON or other serialization can transport structured proposals; the accepted domain records and relationships remain governed relational data. Record unavailable model versions and nondeterminism rather than claiming exact replay when a hosted model or OCR pipeline cannot reproduce its output. Versioned inputs and configurations enable a documented rerun; **bit-for-bit reproducibility is not guaranteed**.

## Reference set and review

Construct a small, source-located evaluation set from permitted program and scientific material, stratified across document genres, historical periods, OCR quality, tables, conflicting interpretations and known absences. Include Bertom and Steamboat as development examples, but reserve other documents and later versions as a held-out set. Group related passages, editions and near-duplicate documents into the same split to limit leakage. No sampling plan or numerical acceptance thresholds are established yet.

Have trained domain reviewers independently annotate a subset using versioned instructions; record source spans, entity types, relation direction, scope, negation, uncertainty and absence where it can be established. Preserve independent judgments, disagreements and adjudication; measure agreement using metrics suitable to the annotation unit, and document ambiguous cases. The [methodological extraction pilot](https://pmc.ncbi.nlm.nih.gov/articles/PMC10148349/) illustrates independent annotation and span/document agreement; its setting is not evidence of this project's performance.

## Evaluate each failure boundary

| Boundary | Measures and evidence | Important interpretation |
| --- | --- | --- |
| Text/OCR and segmentation | Page and table coverage, extraction failures, locator recovery and sample accuracy | Missing or misread source text can prevent retrieval regardless of model quality. |
| Retrieval | Recall at k and coverage of known supporting passages per question; precision/rank and missed-passage review | Compare keyword, semantic and hybrid candidates on the same corpus and held-out cases. Results depend on the reference set and k; absence from retrieved results is not proof no evidence exists. |
| Entity extraction | Precision, recall and F1 by entity type; span and attribute accuracy | Specify exact versus partial span matching, evaluation unit and denominator; report false positives and false negatives. |
| Relationship extraction | Precision/recall by relation, direction and endpoint identity; evidence-span correctness, negation and scope | A correct pair with wrong direction, provenance or temporal applicability is not an unqualified success. |
| Review and record promotion | Source-grounding and citation correctness, unsupported/contradictory claims, reviewer correction and adjudication, review time | Maintain separate counts for human-reviewed outcomes and automated metrics; avoid converting an LLM's confidence into approval. |
| End-to-end outputs | Correctness, traceability, coverage, omissions and task usefulness for representative report questions | Evaluate separately from retrieval and extraction; a fluent answer may hide errors. Include historical incomplete cases and explicit negative controls. |

Report sample size, source coverage, missing labels, subgroup breakdown and uncertainty intervals where defensible; do not claim precision/recall without an annotated denominator. Track quality and manual review burden over successive method and corpus versions. Automated or LLM-as-judge evaluations are useful screening tools only after local validation against independent human judgments, and do not substitute for expert source review. [Open information extraction evaluation](https://aclanthology.org/C18-1289/) and [RAG evaluation research](https://arxiv.org/abs/2407.11005) demonstrate relevant evaluation concerns, not performance guarantees for this project.

## Incremental updates and change control

1. Register a new document, a changed source version or an updated extraction method; never overwrite a prior version. Compare hashes to identify byte changes, while tracking metadata corrections separately.
2. Use dependency records to find affected text, passages, indexes, retrieval results, candidates, reviews and downstream reports. Record the scope and version of each reprocessing run. A changed prompt, segmenter or retriever may require reprocessing even when document bytes do not change.
3. Generate new candidates in staging and compare them with prior reviewed records. Distinguish unchanged candidates, additions, changed interpretations, missing candidates and identity ambiguities. A missing result in a new run is not evidence that a previous finding was false.
4. Queue material changes and conflicts for qualified review. Preserve previous assertions and decisions with their source/method versions; only promote through an auditable, authorized transition. Invalidate or refresh downstream reports according to explicit stewardship rules, not silent overwrite.
5. Re-evaluate against a frozen held-out reference set and relevant regression cases when the corpus, method, index or underlying model changes. Store per-case outcomes and configuration; compare like with like and identify affected cohorts. Schedule full reprocessing only when justified; retain a reproducible manifest either way.

## Initial acceptance questions

Before choosing a production method or setting thresholds, agree with practitioners on entity/relation scope, source handling, adjudication responsibility, required accuracy by use, treatment of missing/contrary evidence, access controls and cost/review capacity. Begin with a small manually reviewed source-located benchmark and record actual results. The system can assist reviewers, but accuracy, scientific interpretation and decisions remain accountable to designated human stewards.
