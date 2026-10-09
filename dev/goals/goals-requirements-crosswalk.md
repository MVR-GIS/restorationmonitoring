# Goals and requirements crosswalk

- Started: 2026-10-08
- Status: revised around accepted user purpose and four user stories; specific requirements awaiting review
- Evidence: [program review](umrr-program-review.md), [source register](umrr-source-register.json), [EMMA review](../architecture/emma-crosswalk.md)
- Boundary: program foundation first; database implementation deferred

## Meaning and authority

[Project foundation](project-foundation.md) records accepted user directions. Evidence references E1-E7 below resolve to specific documents and page locators in the program review. G-00 and US-01 through US-04 record explicit user direction from 2026-10-08. Other goals, requirements, and acceptance tests are assistant proposals translating evidence and those needs into project scope. A source citation does not automatically make a requirement approved. Historical documents do not establish current policy applicability.

Goal IDs identify intended outcomes; requirement IDs identify needed capabilities. Preserve IDs through revisions and record review outcomes. User acceptance establishes project direction, not official program endorsement. Priorities and implementation ownership remain unassigned.

## Proposed goals

**G-00 — accepted central purpose:** Systematically link science and restoration by institutionalizing rigorous, traceable hypothesis evaluation across the program, careers, decades, and generations. The enabling goals below support this purpose.

| ID | Intended outcome | Basis | Intended users and decisions |
| --- | --- | --- | --- |
| G-01 | Make accumulated knowledge usable in setting scientific and restoration priorities | User's program-first direction; E1 institutional knowledge; EMMA Roadmap slides 9, 22 | Program science and restoration leads identify established knowledge and consequential gaps |
| G-02 | Connect restoration expectations to defensible scientific conclusions | Accepted scientific evidence-chain purpose; E1 hypothesis testing; E2 study-design limits | Scientists and practitioners judge evidence supporting hypotheses and identify additional study needs |
| G-03 | Make performance assessments understandable in ecological and management context | E3 reference conditions and perspectives; E4 indicators and targets | Practitioners and partners interpret success, uncertainty, and possible responses |
| G-04 | Carry learning into management changes and future restoration | Accepted adaptive-management purpose; E5 iterative evaluation and modification | Managers and designers decide what to change and which lessons apply elsewhere |
| G-05 | Connect disciplines and existing systems while preserving specialized methods and institutional continuity | Accepted FG contributor/consumer relationship and UMRR/NESP scope; E6 existing systems; EMMA operations | Stewards, scientists, and future staff locate and interpret connected records |
| G-06 | Make project and program accomplishments and their evidentiary basis understandable to public decision makers and citizens | User stories US-01 and US-04; E1 engagement | Managers communicate results; citizens and funding bodies assess program value |

These infrastructure goals enable work toward program ecological goals; they do not replace those goals or imply this project independently delivers ecosystem improvement.

## User-provided stories and proposed interpretation

These four needs are supplied by the user. The interpretations and requirement mappings are proposals, not approved specifications.

| ID / user | User's question | Proposed information needed | Proposed requirements |
| --- | --- | --- | --- |
| US-01 / USACE program manager | How do I represent project and program accomplishments to funding agencies, the Executive and Legislative branches, and citizens? | Traceable accomplishments, ecological outcomes, evidence strength, unresolved questions, and defensible aggregation across projects | R-01, R-04, R-05, R-06, R-12 |
| US-02 / USGS researcher | How do I identify all of the HREPs that implemented treatments informing Hypothesis X? | Explicit hypothesis identity; treatment definitions and actual implementations; studies, findings, and coverage of the program record | R-02, R-03, R-08, R-09, R-10 |
| US-03 / USACE engineer | How do I assess the outcomes of Treatment X? | Intended response, actual treatment condition, study design, observations, analyses, context, uncertainty, and conflicting or inconclusive results | R-03, R-04, R-05, R-07, R-08, R-11 |
| US-04 / citizen | How do I determine if continued funding for this program is worthwhile? | Accessible account of goals, accomplishments, outcomes, resource use where available, evidence limits, and the reasoning behind program assessments | R-01, R-05, R-12 |

All stories depend on R-13 for continuity. Supporting a funding judgment does not establish a single automatic funding score or a required economic valuation method.

## Proposed requirements

Review tests describe observable acceptance evidence for later validation. They are not automated software tests or instructions to start individual-project analysis now.

| ID / goals | Capability | Evidence | Observable review test | Open question |
| --- | --- | --- | --- | --- |
| R-01 / G-01, G-05 | Locate source versions, publication context, exact passages, and review status | E1, E6; Roadmap slide 17 | Reviewer recovers the original passage and distinguishes historical, draft, proposed, and reviewed content | Authoritative versions and storage arrangements |
| R-02 / G-01, G-02 | Connect questions, hypotheses, studies, and outputs to program objectives and knowledge gaps | E1, E7; Roadmap slide 9 | Reviewer distinguishes an untested question, planned study, reported finding, and unresolved gap; absence of records remains unknown | How priorities are established and revised |
| R-03 / G-02 | Preserve comparison design, spatial/temporal scope, methods, and inference limitations | E2 | Reviewer explains whether evidence supports project attribution, broad trend assessment, or association, and why | Minimum scientific detail and discipline-specific needs |
| R-04 / G-03 | Distinguish management and learning objectives, indicators, desired targets, and action criteria | E1, E4, E5 | Reviewer identifies desired outcome versus management-response trigger; ambiguous source wording stays visible | Draft handbook terminology and applicability |
| R-05 / G-03 | Preserve reference condition, organizational perspective, assessment rationale, uncertainty, and aggregation basis | E3 | Reviewer reconstructs why identical ratings can mean different things and recovers judgments underlying a summary | Vocabulary and treatment of disagreement |
| R-06 / G-04 | Link assessments to decisions, resulting actions/revisions, and reevaluation without erasing prior interpretations | E5 | Reviewer reconstructs why a change occurred and compares original expectations with later interpretations | Which decisions and revisions need capture |
| R-07 / G-02, G-05 | Trace observations and analyses to source datasets, methods, and versions across FG and other tools | Accepted FG relationship; E2, E7 | Reviewer identifies data and derivations supporting a conclusion; unavailable data are explicit | FG conventions and existing identifiers/interfaces |
| R-08 / G-04, G-05 | Relate planned, built, maintained, and modified features to monitoring and scientific records | E6; Roadmap slide 8 | Reviewer identifies the feature condition/version addressed by an assessment and related monitoring | Current EMMA/HREP schema and feature histories |
| R-09 / G-02, G-05 | Make implicit hypotheses explicit, with expected response, rationale, relevant conditions, evidence source, and review history | User's central purpose; E1, E7 | Reviewer distinguishes an author's explicit hypothesis from a retrospective interpretation proposed by an analyst and identifies what evidence could evaluate it | Who formulates and reviews hypotheses; required detail |
| R-10 / G-01, G-02 | Find treatment implementations and studies relevant to a defined hypothesis, with program coverage and missing records visible | US-02; Roadmap slide 9 | Reviewer traces each returned HREP through its implemented treatment and relevant scientific evidence; an incomplete inventory cannot be reported as all HREPs | Hypothesis equivalence, treatment vocabulary, historical coverage |
| R-11 / G-02, G-03, G-04 | Synthesize treatment outcomes across studies while retaining site conditions, comparison design, uncertainty, and negative or inconclusive results | US-03; E2, E5 | Reviewer explains which outcomes can be compared, how they were derived, and where attribution or transfer to another setting is unsupported | Synthesis methods, comparability, treatment variants |
| R-12 / G-06 | Produce understandable, source-traceable accounts of accomplishments and program value for different audiences | US-01, US-04; E1 | Reviewer traces summary statements to underlying records, separates completed work from ecological outcomes, and identifies uncertainty and aggregation limits | Reporting measures, resource-use records, public access and audiences |
| R-13 / G-05 | Preserve scientific work, responsibilities, review state, and interpretation history through staff transitions | User's institutionalization purpose; E1 institutional knowledge | A successor reconstructs the scientific question, work completed, evidence, unresolved issues, and next evaluation without relying on the original individual's memory | Stewardship roles, review checkpoints, handoff practice |

## Proposed incremental sequence

1. Reconcile the program foundation with the four user stories and review the minimum scientific terminology and evidence needed for each. Use the accumulated program record before selecting validation cases.
2. Inspect existing EMMA objectives, performance criteria, and monitoring commitments as the operational starting point. Preserve existing identifiers and stewardship practices where suitable.
3. Specify the smallest useful extension linking those records to explicit hypotheses and treatment implementations. Record inferred legacy hypotheses as proposed interpretations until reviewed.
4. After the foundation and requirements are reviewed, validate those links with selected real program records. Expand into study designs, observations, analyses, conclusions, assessments, and management decisions as successive capabilities require them.
5. Demonstrate a user-story outcome at each increment and document remaining coverage. Physical implementation remains deferred pending the foundation review.

This sequence is an assistant proposal following the user's accepted stepwise direction. Retrieval can help discover evidence; an exhaustive cross-project query also requires reviewed relationships and an explicit coverage account.

## Worked entry: assessment interpretation

- **Documented evidence:** HNA-II PDF p47 (printed p24) illustrates different desired conditions behind an identical connectivity rating. See E3 for source scope and copy-status limits.
- **Practical question (proposed):** What does this rating mean, and why did the agency assign it?
- **Goal (proposed):** G-03 makes assessment meaning recoverable.
- **Requirement (proposed):** R-05 preserves reference condition, perspective, rationale, uncertainty, and aggregation context.
- **Acceptance evidence (proposed):** A future analyst explains the rating from its underlying judgment rather than inferring meaning from color alone.
- **Review needed:** Confirm importance, sufficient context, terminology, and scope. Acceptance of the requirement is separate from the authority of the source document.

## Review procedure

1. Select a program decision and intended users.
2. Inspect relevant source passages and their dates, scope, and authority. Retain competing or ambiguous evidence.
3. State the practical question and intended outcome, distinguishing ecological goals from enabling infrastructure goals.
4. Define the smallest meaningful capability and observable acceptance evidence before choosing technology.
5. Review with the user and appropriate SMEs. Record accepted, revised, deferred, or rejected entries with rationale. No entry is accepted merely because it appears here.
6. Prioritize accepted entries; check coverage across program goals. Identify existing capabilities, connections needed, and unknowns.
7. Reconcile accepted requirements with EMMA and FG and review the conceptual model. Individual-project validation and physical implementation follow the grounded foundation.

## Proposed milestone completion criteria

- Users, decisions, goals, boundaries, and priorities have been reviewed.
- Accepted requirements trace to source evidence or explicit user direction and have observable acceptance tests.
- Source status, disagreement, dependencies, and missing material are explicit.
- Existing-system responsibilities and coverage limits, including NESP and disciplines, are documented.
- Review outcomes are recorded; current coverage does not establish that the full historical foundation has been recovered.

## Review history

- 2026-10-08: Assistant drafted G-01 to G-05 and R-01 to R-08 from maintained review evidence. All entries proposed. User invited to select the first decision to review; no answer or priority inferred.
- 2026-10-08: User supplied the central institutionalization purpose, current EMMA accomplishments, incremental extension direction, and four user stories. Recorded G-00 and US-01 through US-04 as explicit user direction. Added proposed G-06 and R-09 through R-13 and a proposed incremental sequence. No specific requirement, ordering among user stories, or technology choice was approved.
