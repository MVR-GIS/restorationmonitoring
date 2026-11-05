# A reader’s guide to restoration science and design

**How can a restoration program make its collective knowledge easier to
find, understand and use—across projects, disciplines and generations?**

This guide is a starting point for program managers, scientists,
restoration practitioners and partners who want to explore the work
behind that question. It brings together selected research and
development documents for the proposed science and restoration
integration component of the the Upper Mississippi River Restoration
(UMRR) Program’s **Environmental Monitoring and Management Application
(EMMA)**, supporting both UMRR and Navigation and Ecosystem
Sustainability Program (NESP) communities.

The guide leads directly into the working documents in `dev/`. Those
documents retain the evidence, design reasoning and unanswered questions
behind the project. You can read the guide in order or start with a
question that matters to you.

The report links below open draft HTML on the package website. When
reading this Markdown file on GitHub, use the adjacent **downloadable
snapshot** links and open the downloaded HTML in a browser. The reports
are dated design prototypes; they are not approved assessments,
live-system queries or comprehensive reviews.

## Start here

If you have ten minutes, these three documents give a useful overview:

1.  **[Project purpose and
    direction](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/project-foundation.md)**
    — Why the initiative exists, the program context and the design
    directions established so far. *Current project context.*
2.  **[Bertom: three ways into the same
    evidence](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/bertom-three-entry-model-test.md)**
    — A concrete example of starting from a research question, survey or
    project and following the connections among them. *Bounded case
    review.*
3.  **[Data model design
    report](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/data-model-design-report.md)**
    — The proposed information objects and relationships behind future
    reports, with examples and open decisions. *Working conceptual
    design.*

### How to read the status labels

- **Source review:** describes what was found in specified documents or
  data; its stated coverage and source limitations apply.
- **Case review:** uses selected evidence to explore a real example; it
  is not necessarily a complete project history or scientific
  assessment.
- **Working design:** a proposal for discussion and further validation,
  not an approved database schema or required workflow.
- **Prototype:** an early implementation for testing ideas; its
  documented scope is narrower than the envisioned future system.
- **Accepted for further validation:** a direction the project lead has
  accepted as a working pattern, with important details still open.
- **Deferred:** material saved for a later conversation when the people
  or information needed are available.

The documents themselves are the source for their detailed status. In
particular, a source-reported result, a proposed interpretation and an
approved program decision are different things.

Some reports and design notes also refer to structured JSON worksheets
and registers. The [guide to structured research and design
resources](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/structured-data-guide.md)
explains what each file contains, links to it and its companion review,
and shows how to interpret record references such as `SI-O3` and
`MS-03`.

## What is the initiative trying to accomplish?

The long-term vision is to help a practitioner begin with a question,
study, project or other starting point and follow relevant connections
toward both the ideas that motivated the work and the observations and
judgments that followed. A useful report would explain *why* each
connection appears and allow the reader to examine its supporting
evidence.

- **[Project purpose and
  direction](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/project-foundation.md)**
  — The initiative’s purpose, existing system anchors and current design
  boundaries. *Current project context.*
- **[Model-guided evidence
  reports](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/model-guided-evidence-reports.md)**
  — How different starting points could lead readers through connected
  institutional knowledge and back to sources. *Working design.*
- **[Strategic plan and FWWG
  review](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/strategic-plan-fwwg-review.md)**
  — How the work relates to the supplied draft 2025–2035 strategic plan
  and the Fish and Wildlife Working Group’s research-framework
  initiative. *Source review; the plan remains draft.*
- **[Workshop research
  priorities](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/workshop-research-priorities.md)**
  — What the supplied workshop workbook records about research questions
  and reach-specific priorities, including limits on interpretation.
  *Source review.*

## What might practitioners discover?

The cases use real program materials to test whether the emerging model
can reveal useful relationships while retaining the limits of the
evidence.

### Bertom and McCartney Lakes: learning from an incomplete history

Historical project objectives, a rock habitat channel and a documented
2014 mussel survey provide a way to explore connections between
restoration intent and monitoring. The user confirmed that EMMA has no
recorded monitoring task for Bertom. The case illustrates why a missing
task should not prevent people from using a historical report; it does
not establish target attainment or project success.

- **[View the DuckDB-backed question
  report](reports/bertom-duckdb-question-20261105.md)** — A
  question-to-finding report assembled from a local relational fixture
  at render time, with source and relationship status. *Draft snapshot;
  not a live query.* [Downloadable
  snapshot](https://github.com/MVR-GIS/restorationmonitoring/blob/main/pkgdown/assets/reports/bertom-duckdb-question-20261105.html)
  · [Design and reproduction
  notes](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/features/duckdb-question-report.md).

- **DuckDB multi-entry snapshots:** [Start from the
  question](reports/bertom-duckdb-multi-question.md), [2014
  survey](reports/bertom-duckdb-multi-survey.md), or
  [project](reports/bertom-duckdb-multi-project.md). These separate
  draft reports read the same local fixture at render time; candidate
  associations remain labeled. [Design and reproduction
  notes](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/features/duckdb-multi-entry-report.md).
  When reading this guide on GitHub, download the
  [question](https://github.com/MVR-GIS/restorationmonitoring/blob/main/pkgdown/assets/reports/bertom-duckdb-multi-question.html),
  [survey](https://github.com/MVR-GIS/restorationmonitoring/blob/main/pkgdown/assets/reports/bertom-duckdb-multi-survey.html)
  or
  [project](https://github.com/MVR-GIS/restorationmonitoring/blob/main/pkgdown/assets/reports/bertom-duckdb-multi-project.html)
  HTML snapshot.

- **[View the Bertom multi-entry
  prototype](reports/bertom-multi-entry-20261102.md)** — A curated
  evidence network with question, survey and project starting points;
  the optional future assessment is hypothetical. *Draft snapshot,
  2026-11-02.* [Downloadable
  snapshot](https://github.com/MVR-GIS/restorationmonitoring/blob/main/pkgdown/assets/reports/bertom-multi-entry-20261102.html).

- **[View the Bertom evidence
  walkthrough](reports/bertom-walkthrough-20261102.md)** — The earlier
  practitioner-oriented walkthrough of the same historical case. *Draft
  snapshot, 2026-11-02.* [Downloadable
  snapshot](https://github.com/MVR-GIS/restorationmonitoring/blob/main/pkgdown/assets/reports/bertom-walkthrough-20261102.html).

- **[Three starting points into one evidence
  network](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/bertom-three-entry-model-test.md)**
  — Follow the same bounded case from a question, a survey or a project.
  *Case review.*

- **[Bertom source and linkage
  review](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/bertom-rock-habitat-linkage-review.md)**
  — The supporting documents, source locators, candidate connections and
  unresolved identity and spatial questions. *Source review.*

- **[Bertom multi-entry report
  prototype](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/features/bertom-multi-entry-prototype.md)**
  — How the prototype presents selected views of a manually curated
  evidence network, including an optional, clearly hypothetical
  assessment. The page also gives instructions for generating the report
  locally. *Prototype; not live-system discovery or a comprehensive
  search.*

### Steamboat Island: connecting science to a restoration opportunity

The Steamboat example explores the scientific basis and evaluation needs
for an anticipated mussel-habitat benefit. It helps reveal the
connections needed among restoration intent, research, possible study
designs and evidence, without presenting an expected benefit as a
demonstrated local effect.

- **[View the Steamboat Island mussel
  report](reports/steamboat-mussel-20261103.md)** — A source-oriented
  case report connecting restoration intent, scientific evidence and
  evaluation questions, with links to its structured inputs. *Draft
  snapshot, 2026-11-03.* [Downloadable
  snapshot](https://github.com/MVR-GIS/restorationmonitoring/blob/main/pkgdown/assets/reports/steamboat-mussel-20261103.html).

- **[Steamboat worked
  example](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/steamboat-island-worked-example.md)**
  — The case setup and available source materials. *Case review.*

- **[Steamboat conceptual
  model](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/steamboat-conceptual-model.md)**
  — The concepts and relationships brought into focus by the case.
  *Working design.*

- **[Research-question report
  notes](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/features/research-question-dashboard.md)**
  — The Steamboat report and how the case-specific reporting work is
  produced and used in design. *Prototype documentation.*

### Other comparisons

- **[Cross-case linkage
  consolidation](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/cross-case-linkage-consolidation.md)**
  — What several cases reveal about representing connections across
  incomplete records. *Case synthesis and working design.*
- **[Marsh Lake linkage
  review](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/marsh-lake-mussel-monitoring-linkage.md)**
  — A comparison from another restoration context, with limits on
  cross-program interpretation. *Case review.*

## What information needs to be connected?

The proposed model brings together questions and hypotheses, study
designs, restoration actions, observations, analyses, findings and
subsequent judgments. It aims to make the meaning and basis of each
connection visible, while referring back to authoritative systems and
sources.

- **[Data model design
  report](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/data-model-design-report.md)**
  — A consolidated view of the proposed objects, relationships,
  existing-system anchors and open choices. *Working design.*
- **[Relational model and extraction
  roadmap](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/relational-model-and-extraction-roadmap.md)**
  — A first table-oriented logical sketch, enterprise and local
  prototyping boundaries, and retrieval-assisted document extraction.
  *Working design; not production DDL.*
- **[Relational vertical
  slice](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/relational-vertical-slice.md)**
  — Reviewable ERDs, proposed fields and constraints, and
  Bertom/Steamboat examples for DuckDB development and later enterprise
  review. *Working design.*
- **[DuckDB prototype and EMMA migration
  crosswalk](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/duckdb-mvp-and-emma-migration.md)**
  — Run the local relational example and see how its tables correspond
  to existing EMMA structures. *Local prototype; enterprise migration
  remains unverified.*
- **[Extraction quality and reprocessing
  plan](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/extraction-quality-and-reprocessing.md)**
  — Future options for source provenance, human review, evaluation and
  incremental updates. *Working design; detailed review and quality
  processes are deferred until after the MVP.*
- **[Science–restoration relationship
  analysis](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/science-restoration-relationships.md)**
  — The distinctions and relationships the cases suggest the model needs
  to preserve. *Working design.*
- **[Minimum attributed linkage
  record](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/prospective-study-linkage-minimum-record.md)**
  — A proposed way to describe a relationship together with its source,
  scope, review state and responsibility. The project lead accepted this
  pattern for further validation; its fields and implementation remain
  open. *Accepted for further validation.*
- **[EMMA
  crosswalk](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/emma-crosswalk.md)**
  and **[Restoration Features
  review](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/restoration-features-documentation-review.md)**
  — How the design relates to the existing project information and GIS
  anchors. *Source reviews and working crosswalks.*

## How can the program preserve learning and decisions?

Institutional learning depends on being able to recover not only data
and reports, but also what practitioners concluded, how confident they
were, what evidence they considered and how a decision evolved. The user
has identified EMMA as the likely system of record for these
practitioner-authored judgments **for design purposes**; the production
schema, ownership and workflow remain to be determined.

- **[Durable assessment and decision
  model](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/durable-assessment-and-decision-model.md)**
  — Proposed distinctions among findings, assessments, decisions and
  follow-up, and how they could remain tied to evidence. *Working
  design.*
- **[HREP, performance-evaluation and workshop
  review](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/hrep-per-workshop-review.md)**
  — Program artifacts and context relevant to performance evaluation and
  learning across a project lifecycle. *Source review.*
- **[FWWG learning-opportunity
  model](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/fwwg-learning-opportunity-model.md)**
  — A proposed way to relate questions, potential opportunities,
  evidence and coordination. *Working design, not an approved
  working-group process.*

## What have we learned from existing tools and models?

The project is looking for concrete ways to reuse existing work,
especially open-source data models and tools that support science and
adaptive-management information over time. A bounded review did not
establish a complete open replacement for the envisioned UMRR function,
but identified useful components and precedents.

- **[Science and adaptive-management tooling
  watch](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/science-am-tooling-watch.md)**
  — The candidate register, what was documented, what remains unverified
  and why each lead matters. *Targeted review.*
- **[Bertom mapping to existing
  models](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/bertom-tool-model-mapping.md)**
  — A limited comparison with AMMonitor, Miradi, SEPIO and AMModels,
  highlighting ideas for monitoring context, intended outcomes, evidence
  and analysis. *Documentation-based comparison; not a tested import or
  approved schema.*
- **[Repeatable tooling-watch
  workflow](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/workflows/science-am-tooling-watch.md)**
  — How the team can revisit promising implementations and licenses
  without repeatedly conducting a broad literature search. *Proposed
  manual workflow.*

## What is still open?

The [data model design
report](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/data-model-design-report.md)
records the detailed questions. Among the decisions still to resolve are
how records and identities will be managed across systems, how judgments
will be reviewed and revised, and which evidence and relationships are
needed for particular reports. Real cases also leave source, spatial and
historical gaps that affect what can be concluded.

The team would like to hear directly from practitioners about the
decisions and questions for which these reports would be useful. The
[FWWG practitioner discovery
prompts](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/fwwg-practitioner-story-prompts.md)
preserve questions for that future conversation. *Deferred; they are not
statements of members’ preferences or evidence that interviews
occurred.*

## How this guide relates to the agentic development framework

This repository also uses the `reproducibleai`-scaffolded agentic
context to help people and coding agents maintain continuity. The guide
gives human readers a curated view of that working material; it does not
replace or modify the routing system.

- **[AGENTS.md](https://github.com/MVR-GIS/restorationmonitoring/blob/main/AGENTS.md)**
  contains standing instructions and conditional routes: an agent starts
  with the documents relevant to its task instead of reading the entire
  project history.
- **[Development
  context](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/README.md)**
  explains the `dev/` structure and points to the maintained artifacts
  behind the work.
- **[Artifact
  lifecycle](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/governance/artifact-lifecycle.md)**
  describes how instructions, durable design material and checkpoints
  have distinct roles.
- **[Current
  handoff](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/checkpoints/current/next-chat-handoff.md)**
  is a concise resumption aid for a future development session; it is
  not a substitute for the underlying evidence and design documents.

The individual `dev/` documents remain the maintained records for their
topics. This guide is a curated orientation and should be updated when
its links, descriptions or status labels no longer match them. The guide
does not confer authority on a proposal or change the conditional routes
in `AGENTS.md`.
