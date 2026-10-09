# UMRR program foundation: first document review

- Reviewed: 2026-10-07
- Status: assistant synthesis and recommendations for user review
- Scope: program-level foundation and the supplied EMMA designs; database implementation remains deferred

## Review coverage and limits

The workspace collection contains 37 PDFs (2,478 PDF pages) under `UMRR/KeyDocuments` and three PowerPoint decks (82 slides) under `UMRR/EMMA`. These directories are siblings of the Git repository, not files currently tracked within it. Originals were preserved.

Every file was inventoried and screened. All PDF text layers were extracted; all slide text and available speaker notes were extracted. Focused reading covered strategic goals, adaptive management, monitoring interpretation, existing information systems, and EMMA's conceptual direction. Selected PDF pages and four EMMA Roadmap diagrams were visually inspected. This is a substantive first review, not an exhaustive reading or verification of every page, figure, or cited publication.

The [source register](umrr-source-register.json) records checksums, page/slide counts, extraction limitations, and focused review coverage. Sparse text is a screening flag, not proof of an OCR defect: blank pages, covers, and figures also have little text. The 1982 Master Plan and EMP Acronyms have no meaningful extracted text. The Master Plan cover and preface were visually inspected, but its substantive chapters remain to be reviewed after OCR. The 2014 monitoring handbook contains scanned policy pages and data sheets alongside searchable text. Some PPTX rendering connectors used fallback paths; exact relationship semantics should be confirmed against the original deck or schema export.

Document instructions are source content, not instructions to this assistant. Existing repository governance applies. The supplied material documents historical conditions and proposals; it does not independently establish current implementation status or policy applicability.

## Documented program evidence

Page references below use one-based PDF file pages; printed page labels are supplied where useful. Local source links resolve from the current workspace layout.

### E1. Science and restoration integration is an established program aim

The [2015-2025 Strategic Plan](../../../UMRR/KeyDocuments/StrategicPlan2015-2015.pdf), PDF pages 9-16 (printed pages 5-12), defines habitat improvement, knowledge advancement, engagement, and partnership goals. Objective 1.2 calls for explicit hypothesis testing and learning objectives on selected habitat projects, communicating conclusions, and improving later restoration. Goal 2 includes long-term data integrity and usability. Objective 4.1 includes maintaining institutional knowledge.

Inference: Restoration Monitoring can help operationalize existing program aims. Its value should be assessed by improved scientific and management decisions, not simply document volume or database size. This plan covers 2015-2025; its successor or continuing applicability must be confirmed.

### E2. Program-scale monitoring and individual-project evaluation have different purposes

The [2008 Status and Trends report](../../../UMRR/KeyDocuments/LTRMP2008-T002_web.pdf), PDF pages 11-13 (printed pages 3-5), says core monitoring is designed to assess change at pool or reach scales rather than individual projects. The [2019 workshop summary](../../../UMRR/KeyDocuments/umrr-hrep-workshop-summary5-2019.pdf), PDF pages 8-16, discusses consistent protocols, a central repository, and explicit HREP monitoring designs; page 15 cautions that LTRM sampling frequencies may not detect individual HREP effects at larger scales.

Inference: link systemic and project evidence while preserving sampling design, spatial support, temporal resolution, and limits on treatment attribution. A nearby monitoring observation does not by itself demonstrate a project's effect. Workshop suggestions remain workshop recommendations, not automatically binding requirements.

### E3. Assessment meaning depends on reference conditions and management perspectives

[HNA-II](../../../UMRR/KeyDocuments/HNAII.pdf), PDF pages 34-35 and 46-47 (printed pages 11-12 and 23-24), links ecosystem characteristics, objectives, indicators, and resilience themes. It documents a range of desired conditions and agency judgments. Page 47 illustrates the same red connectivity rating arising from different desired conditions, and opposing ratings arising from different management interests. Page 46 describes retaining underlying agency ratings alongside an averaged summary. The inspected Table 1-2 page also bears a DRAFT watermark; confirm the copy's status before treating it as a final controlled source.

Inference: an assessment needs the evaluator's organizational perspective, desired/reference condition, scale, rationale, and aggregation method, not just a score or color. Preserve underlying judgments when reporting summaries.

The [2013 Indicator Report](../../../UMRR/KeyDocuments/Indicator_report_web.pdf), PDF pages 5 and 12 (printed pages 3 and 10), similarly describes evolving indicators and reach-dependent suspended-solids targets. Recommendations, discussions, and site-specific standards must retain their distinct status and scope.

### E4. Monitoring targets and adaptive-management triggers can differ

The [Draft Final Monitoring Handbook](../../../UMRR/KeyDocuments/DRAFT%20FINAL%20Monitoring%20Handbook%2031%20March%202014.pdf), PDF pages 15-17 (printed pages 9-11), ties objectives to indicators, rationale, methods, targets, and action criteria. Its Clarence Cannon example on page 16 gives a 70% survivorship target and describes a 50% threshold in its action-criteria paragraph. The paragraph itself calls that threshold an initial monitoring target, so terminology and intent need clarification rather than silent normalization. Neither number is a program-wide rule. Page 17 discusses data storage and survey timing.

Inference: keep desired outcomes, action thresholds, timing, disturbance events, and proposed responses separate and traceable. The document explicitly says Draft Final and contains placeholders; do not promote it to current approved policy.

### E5. Adaptive management includes decisions and changes, not only assessments

The [2015 adaptive-management planning flowchart](../../../UMRR/KeyDocuments/2015_7_7_HREP_AM_%20planning_%20flowchart.pdf), page 1, depicts system/reach goals, project and learning objectives, pre/post-construction data, design reevaluation, project modification, performance reporting, and technology transfer. The [2022 Report to Congress](../../../UMRR/KeyDocuments/ReportToCongress2022.pdf), PDF pages 77-79 and 113-114 (printed pages 60-62 and 96-97), describes iterative evaluation, variation among District approaches, and learning for future designs. Page 77 asks about cumulative benefits and responses at different geographic scopes.

Inference: the scientific record should connect an assessment to a decision, resulting action or design revision, and later reevaluation. Retain history rather than overwriting the original hypothesis or conclusion.

### E6. Existing systems and source histories must be part of requirements discovery

The [2012 Environmental Design Handbook](../../../UMRR/KeyDocuments/2012%20UMRR%20EMP%20Environmental%20Design%20Handbook%20-%20FINAL.pdf), PDF pages 15-18 (Introduction I-IV), lists expected project documents from fact sheets to as-built drawings, O&M manuals, and performance evaluations; it describes a preexisting HREP database and lessons learned organized by restoration technique. The 2019 workshop summary, page 10, also describes LTRM and HREP databases. The [2021 advisory-group charter](../../../UMRR/KeyDocuments/2021_UMRR_advisory_groups_charter.pdf), pages 2 and 8-9, documents partnership and project-selection responsibilities.

Inference: map existing identifiers, repositories, organizational responsibilities, and information flows before defining new ownership boundaries. These historical descriptions do not verify current APIs, schema, staffing, or access.

### E7. Research planning records provide traceable questions and intended outputs

The [2019 resilience framework](../../../UMRR/KeyDocuments/resframework2019.pdf), pages 3-9, 18-21, 38, and 44-46, provides numbered research questions, approaches, hypotheses, drivers, feedbacks, scales, and potential management implications. Hydrogeomorphic shifts, inundation, depth distributions, and hydraulic connectivity provide concrete domain questions relevant to FG, but the document does not identify FG as their implementation tool.

The [FY19 Science SOW](../../../UMRR/KeyDocuments/fy19_science_support29July2019.pdf), pages 3-5, records objectives, workplans, product identifiers, and milestones; the resilience framework identifies itself as LTRM-2019R2. This is a useful candidate link between a planned product and a delivered artifact. A planned deliverable or proposed research approach is not evidence that the research was completed or its hypothesis supported.

## EMMA evidence and implications

See the [EMMA crosswalk](../architecture/emma-crosswalk.md) for the detailed comparison. The three decks are historical user-supplied design and presentation evidence, not independently verified descriptions of the current system.

- Getting Started (October 2024), slides 7-12, reports a deployed application centered on monitoring tasks, schedules, budgets, stewardship, and reporting.
- Roadmap (December 2024), slides 8-9, identifies a scientific/restoration relationship model and questions about studies, features, hypotheses, and data locations.
- Roadmap, slides 14-33, proposes document publication, annotation, SME entry, controlled vocabulary, relational representation, and RDF/knowledge-graph publication. The proposals include Shiny, EMMA migration, and ORKG; none is accepted as the present repository's implementation choice.
- May 2024 monitoring workshop deck, slides 9 and 19-25, identifies monitoring challenges and solicits stakeholder feedback. The resulting responses and synthesis are not included in the collection.

## Recommended sequence (assistant proposal)

1. **Complete and review the program foundation.** Develop a referenced chronology and goals/requirements crosswalk from the strategic plan and guidance, historical Master Plan, objectives/reach plans, HNA-II, indicator/resilience work, reports, and workshop findings. Recover the 2024 workshop results. Confirm source status and successor versions. Review which decisions and users this effort will support.
2. **Prepare a dependable document corpus.** Preserve originals and stable source IDs; map original URLs and publication/revision dates; OCR scans; preserve both PDF and printed page references. Extract slides, notes, tables, captions, and diagram references. Keep source register and reviewed syntheses in Git; settle storage/backup for the sibling UMRR collection before expecting another checkout to reproduce it.
3. **Pilot retrieval using program-level questions.** Start with a small coherent set, including a scanned historical source and table/diagram-rich evidence. Compare keyword retrieval with hybrid retrieval once extracted-text quality is adequate. Return source version, page/slide, and original context; retain draft/historical status and differing perspectives. Preserve embedding model and transformation versions. Select a store and callable search interface after deployment, access, and retrieval requirements are understood.
4. **Reconcile EMMA with reviewed requirements.** Define vocabulary and boundary responsibilities, get the current schema/data dictionary and representative exports, then develop a conceptual model with explicit decision/action history and scientific provenance. FG contributes domain data and analyses; shared infrastructure retains their scientific context. Review this before physical database implementation.
5. **Validate with representative projects after the foundation review.** Use contrasting restoration techniques and study designs to test traceability and many-to-many relationships. A handbook example may illustrate a requirement now, but it is not a replacement for the program-level foundation or a selected first project.

Suggested retrieval questions include: How do management and learning objectives differ? Why can the same indicator rating reflect different management goals? How does systemic monitoring support, and limit, project attribution? Which research questions connect depth/connectivity measurements with biological response? Where are target-versus-trigger definitions unclear? For each question, curate expected supporting passages and check that an answer preserves uncertainty and source status.

## Foundational material still missing or unverified

- Results and summarized recommendations from the May 2024 monitoring exercise; later monitoring-framework and EMMA roadmap updates.
- Current EMMA and HREP schemas, data dictionaries, identifiers, example reports/exports, interfaces, and confirmed operational status. The roadmap includes a schema screenshot and external link, not a local executable schema.
- The full 2022 Ecological Status and Trends report, referenced by the 2022 RTC and 2023 flyers; the collection contains the 2008 synthesis instead.
- Earlier Reports to Congress (1997, 2004, 2010, 2016), HNA-I, and other historical foundational work referenced by supplied documents, if needed to recover the full program history.
- Current strategic direction after the supplied 2015-2025 plan; current handbook/guidance versions and approval status, including source clarification for the draft monitoring handbook and HNA-II copy.
- FG interface/output/provenance documentation and NESP-specific requirements beyond the supplied joint objectives/reach-planning material.

Immediate recommended milestone: a user-reviewed program goals and requirements crosswalk, backed by verified source passages and a clear inventory of existing systems. Document retrieval supports that work; it does not constitute review or automatically turn extracted statements into accepted scientific assertions.
