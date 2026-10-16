# Steamboat Island mussel-habitat worked example

- Started: 2026-10-16
- Status: restoration extraction accepted as sufficient for this stage; initial [science-side review](mussel-science-worked-example.md) and organizational reuse analysis available, with evidence-depth limits
- Scope: MVR Steamboat Island HREP restoration artifacts and relevant mussel research; linkage is to be established from evidence, not assumed from shared subject matter
- Context: [foundation](project-foundation.md), [next milestone](goals-requirements-crosswalk.md#next-milestone-worked-extraction-from-fragmented-artifacts)

## User-supplied lifecycle context

The user reports that Steamboat Island is midway through construction. Baseline and construction monitoring have been completed; no post-construction performance monitoring has occurred. These statements describe project activity as supplied by the user, not an independent audit of received documents. They do not establish that the supplied feasibility/approval files contain the completed baseline or construction monitoring records.

The restoration focus is the feasibility study's formal objectives/criteria and the **ancillary mussel-habitat benefit** of installed/planned features. The user clarified that mussels are not a formal study objective; VI-1 and X-4 footnote 8 confirm this. The science focus includes UMESC research by Teresa J. Newton, Steven J. Zigler, and Kristen L. Bouska, discovered through ScienceBase and the larger Zotero mussels literature collection. See the [worked objective/criterion extraction](steamboat-island-objectives-criteria.md) and its structured records.

Post-construction performance evidence is **not yet applicable at the reported lifecycle stage**, rather than missing proof of success or evidence of failure. Planned monitoring, actual baseline observations, construction observations, research findings from other sites, and future performance evaluations must remain distinguishable.

## Local sources: access check

Files are in `UMRR/HREPs/SteamboatIsland/`, outside the Git repository. Originals were not altered.

| File | Pages | Readability check | SHA-256 |
| --- | --- | --- | --- |
| Approved Face Sheet for Steamboat Island.pdf | 6 | 3 pages have more than 50 extracted non-whitespace characters; low-text pages require visual inspection/OCR assessment | `6a8487ccd971751b28ee88d4a3d2a76a28493ca49f5b555e4b39cc6068933d20` |
| Steamboat Island HREP - Final Report w Appendices.pdf | 979 | First 85 pages sampled: all have more than 50 extracted non-whitespace characters. Mussel-related passages recoverable. PDF p3 (printed ES-II) rendered and visually inspected. Entire report/appendices not yet screened | `ce62f059ddf5c9a28feb60647e06093aa00c2572de10c6914390433d4d04544c` |
| SteamboatIsland_FinalReviewPlan_withletters.pdf | 23 | 20 pages have more than 50 extracted non-whitespace characters; low-text pages require visual inspection/OCR assessment | `54be38038f591b13608240e208073981d3e45687f48c9b4e1b9c58d66521c995` |

PDF p80 (printed III-14) of the main report starts section G, Project Goals and Objectives. PDF p3 (ES-II) includes mussel habitat among potential enhancement measures. These are navigation leads; exact objectives, criteria, selected measures, and monitoring commitments still need passage-level extraction and reconciliation across the report/appendices. No project outcome claim is drawn from the feasibility text.

## Zotero: access actually observed

The user provided group 4862069 (`USACE_EcoModeling`), collection `2SIRQ6RY` (`mussels`), with selected item `7LEGWGAJ`. The collection loaded read-only in the in-app browser without login. Its references include work by Newton and other mussel researchers; the selected initial item is Bouska et al. (2018), Developing a shared understanding of the Upper Mississippi River: the foundation of an ecological resilience assessment, DOI 10.5751/ES-10014-230206. Collection membership is discovery context, not proof of a Steamboat Island connection.

A second inspected item, `T5L6D83Y`, is Newton et al. (2020), Estimation of vital population rates to assess the relative health of mussel assemblages in the Upper Mississippi River, DOI 10.1111/fwb.13575. Its metadata and abstract are readable. The Attachments tab showed no listed files in this public view; that does not establish attachment availability for all items or authenticated users. No full paper PDF was retrieved.

The same DOI is independently listed by the [USGS Publications Warehouse](https://pubs.usgs.gov/publication/70215652). One creator differs between the inspected Zotero record (Patricia R. Schrank) and the USGS citation (Patricia R. Ries); retain both source records and resolve against the publication rather than silently changing the library. No Zotero records were edited.

Plain web fetches of the Zotero page/API failed, but browser access succeeded. The Zotero helper found no reachable Desktop API or detected profile in this session. Desktop synchronization/full-text retrieval has therefore not been established. This is not evidence that Zotero is uninstalled or that its public API is universally unavailable.

## Recommended processing and storage (proposal)

1. **Keep Zotero as the literature catalogue.** Retain group/item/collection keys, DOI, item version where available, and retrieval date. A read-only JSON snapshot from the collection API would support repeatable ingestion when accessible; it does not include article PDFs automatically. Zotero's [official API documentation](https://www.zotero.org/support/dev/web_api/v3/basics) describes group/collection/item/children routes, JSON responses, and access rules. No new account credential is presently needed for browsing this collection.
2. **Preserve original documents separately from derivatives.** Leave project originals in their current folder. For science papers, a proposed workspace location is `UMRR/Science/mussels/<ZoteroItemKey>/`, holding an available authorized PDF and a small metadata record linking its DOI, Zotero identity, source URL/version, acquisition date, and checksum. This path is not yet created or mandated. Use approved shared storage/backup for team preservation; workspace storage alone is not a backup strategy.
3. **Make full-text availability explicit.** Start with a few relevant papers, obtaining publisher/USGS full text or library attachments where accessible. A collection export plus available PDFs is a practical fallback if direct access remains unreliable. Do not substitute abstracts for a review of methods, detailed results, or limitations. No need to export the entire literature review before starting.
4. **Extract page-addressable derivatives.** Preserve PDF page index and printed page labels; use OCR only where needed and flag OCR-derived text. Retain figures/tables for visual checking. Search index/embeddings can later be regenerated; they are not source preservation or the reviewed scientific record.
5. **Produce the worked conceptual crosswalk.** Extract objectives, criteria, proposed/selected features, baseline/construction evidence where supplied, and candidate scientific entities from a few relevant papers. Record exact sources, explicit versus inferred relationships, applicability, and unconnected records. Findings from other sites may inform design without being Steamboat Island performance evidence.

Small reviewed extraction notes and conceptual-model revisions belong in the existing `dev/` structure; large PDFs, text dumps, and indexes remain outside the Git context. Physical schema and vector/database implementation remain deferred.

## Immediate next work

The first extraction is now available in the linked review: four formal objectives, eleven source-specific criterion assertions and five response-trigger groups. It also distinguishes mussel survey work not committed in the feasibility plan from broader performance monitoring not yet due. The user explicitly identifies evaluation of AI extraction ability as a project goal; this pilot demonstrates source-checked extraction but does not establish unattended accuracy or corpus-wide performance.

Review the completed restoration extraction and its unresolved source differences. Then select a few relevant research papers from the collection using titles/abstracts and acquire/check full text. Extract baseline/construction evidence separately; an embedded 2017 mussel-survey report has been located as a lead. The absence of post-construction performance monitoring does not block this example and is itself an important lifecycle condition for the model to represent.
