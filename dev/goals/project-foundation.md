# Restoration Monitoring: purpose and foundation

## Accepted user directions

Source: user statements in [initial conversation](../checkpoints/archive/initial_transcript.md), reinforced by the hand-off prompt in this chat on 2026-10-07. The transcript is historical evidence; this maintained artifact carries the extracted directions forward.

Restoration Monitoring supports shared scientific infrastructure for ecosystem restoration programs, including UMRR and NESP. It will connect hypotheses, research designs, systematic observations, analyses, conclusions, assessments, and adaptive-management decisions across disciplines and generations. The purpose includes assessing treatment outcomes over time and preserving evidence and reasoning for future practitioners.

First review UMRR's approximately 40 years of accumulated program knowledge and the user's existing work to define project goals using reproducibleai. The program age is user-provided context, not independently verified here. Individual-project analysis follows this foundation.

FluvialGeomorph (FG) is one contributing measurement and analysis suite. FG will also use the shared scientific infrastructure; the scope must accommodate other disciplines and tools.

Use the existing reproducibleai artifact structure. Defer database implementation until program goals and requirements have been grounded and reviewed.

## Current scope

### User clarification: inductive listing and linking

The user's accepted strategy is highly inductive: systematically examine the science and restoration artifacts accumulated across the program's 40+ years, extract their key elements (including hypotheses, observations, performance criteria, and objectives), and use documented details to connect those elements to projects, restoration features, and one another. This clarifies the earlier program-first direction: historical artifact examination and extraction are the means of grounding and refining the requirements. They need not wait for a fully predetermined conceptual model; physical database implementation remains deferred pending foundation review.

Comprehensive listing and linking is expected by the user to reveal descriptive patterns and enable subsequent inductive analyses tracing hypotheses through HREPs, observations, and conclusions. These discoveries are anticipated benefits, not guaranteed results. The resulting research network should preserve the distinction between source-documented relationships and interpretations proposed during extraction or later analysis.

Rigorous documentation and durable preservation of program work for future generations is an independently valuable intended outcome, even if new scientific insights do not emerge. Extracted records and links alone cannot prevent source-data loss: preservation must also address the underlying artifacts and datasets, versions, locations, and recoverability. Completeness is a goal to pursue and measure, not a claim established by the current collection.

### User clarification: support a mature distributed program

The user emphasizes an established, successful 40+ year program involving Federal partners (USACE, FWS, USGS), five states (MN, WI, IA, IL, MO), river municipalities, NGOs, and experienced interdisciplinary experts. Existing scientific methods and workflows have managed these issues fairly effectively and are characterized by the user as industry best practice. This account refines the earlier discussion of uneven formalization: the problem framing must recognize existing expertise and effective practice rather than imply that rigorous science is absent.

The accepted design direction is to buttress and coordinate existing workflows. The proposed infrastructure addresses the regional, disciplinary, organizational, and temporal complexity of scientific work, including long-running floodplain forest management studies. It must support distributed stewardship and preserve domain context without assuming one organization or application owns the entire scientific process.

The user identifies expected benefits: sustained study follow-through, stronger study design, visibility into unimplemented key study elements, identification of answered questions, application of lessons, avoidance of repeated mistakes, and confirmatory studies strengthening tentative conclusions. These are user-stated desired benefits and a belief about infrastructure's potential, not demonstrated outcomes of this repository. Detailed mechanisms and measures of improvement require review.

### User clarification, 2026-10-09

The user accepted the USGS researcher story (US-02) as the starting point for analysis and added the biologist story (US-05): evaluate collected monitoring data against specified performance criteria at intervals throughout the project lifecycle to assess achievement of project objectives and project success.

The user specified the existing EMMA conceptual relationships: HREPs have Project Objectives; Project Objectives have Performance Criteria; Performance Criteria have Monitoring Tasks; Monitoring Tasks have Observations. These are established user-reported relationships, not assistant candidate entities. Cardinalities, physical implementation, observation content, and interfaces remain uninspected.

The user identifies USGS UMESC as administering UMRR LTRM and specialized research and ScienceBase as the discovery platform for that body of research. The intended connection is explicit links between hypotheses discussed in those research outputs, planned/installed HREP restoration practices, and observed landscape outcomes. ScienceBase corpus coverage has not been independently audited; discovery location alone does not establish completeness or scientific relevance.

### User clarification, 2026-10-08

The central accepted purpose is to systematically link science and restoration by institutionalizing explicit, rigorous hypothesis evaluation across the scientific process, decades, and generations. Continuity must survive changes in the people occupying program roles. The user's expert account describes hypotheses embedded in existing work, uneven formalization and evaluation, and exemplary HREPs whose success depends on exceptional individuals. This is user-provided program experience, not an independently established finding about every HREP or the wider restoration community.

The user reports that EMMA (Environmental Monitoring and Management Application) already records HREP project data and lifecycle monitoring commitments, supported by data stewards entering legacy tasks. Budgeting, scheduling, staffing, reporting, project objectives, and performance criteria are accomplished capabilities. The accepted direction is to build outward incrementally from this investment into hypotheses, study designs, treatments, observations, assessments, and their connections, grounded in real program data. Current deployment details and schema have not been inspected.

The user supplied four needs: program managers communicate accomplishments; researchers identify all HREPs implementing treatments that inform a hypothesis; engineers assess treatment outcomes; citizens evaluate whether continued funding is worthwhile. These needs anchor the crosswalk. Specific requirements, priorities, review rules, and implementation choices remain proposals until reviewed.

Inventory foundational sources, recover program intent and experience, and develop source-linked goals and requirements for review. No database technology, physical schema, integration interface, or implementation architecture has been selected.

## Proposed foundation review criteria

These are assistant proposals for user review, not accepted program requirements:

- A referenced synthesis identifies program goals, accumulated lessons, existing scientific information systems, and unresolved gaps.
- Goals identify intended users, supported decisions, boundaries, and priorities, with links to evidence or explicit user direction.
- Requirements distinguish established practice from desired improvements and retain disagreements and unknowns.
- The user reviews the foundation before individual-project validation or database implementation begins.

## Open questions

- Which additional existing user synthesis should supplement the central framing supplied on 2026-10-08?
- Which UMRR documents and versions constitute the foundational program record?
- What NESP material is needed initially, and what can follow the UMRR foundation?
- Who should review goals and requirements, and what review evidence should be retained?

See [source inventory](source-inventory.md) for materials available and missing.

## Program evidence now available

The [goals and requirements crosswalk](goals-requirements-crosswalk.md) was started on 2026-10-08 and revised around the user's central purpose and five user stories. It distinguishes accepted user direction from proposed enabling goals and requirements; inclusion does not establish requirement acceptance or priority.

The supplied key documents and EMMA decks received a first review on 2026-10-07. See [program foundation review](umrr-program-review.md) for documented evidence, review limits, missing materials, and proposed next steps. Source-linked findings support the accepted direction to connect science and restoration, but the program goals/requirements crosswalk and conceptual architecture still require review. No assistant recommendation in that review is an accepted implementation decision.
