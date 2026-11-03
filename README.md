# Restoration Monitoring

**Connect restoration actions with the science, observations, and experience needed to learn from them—across projects, disciplines, and generations.**

River restoration unfolds over decades. A question raised by a scientist may influence a project designed years later; monitoring may reveal an unexpected response; a lesson from one reach may help shape a decision in another. The evidence for those connections lives in reports, datasets, maps, project systems, and the knowledge of people across a broad partnership. Making it discoverable and understandable over time is essential to learning from the work already done and making the most of future opportunities.

`restorationmonitoring` is an early-stage R package and design effort supporting the **science and restoration integration component of EMMA**. Its long-term aim is to help the Upper Mississippi River Restoration (UMRR) and Navigation and Ecosystem Sustainability Program (NESP) communities bring scientific inquiry and restoration practice into a shared, traceable view. It builds on the partnership's established expertise, information systems, and ways of working.

For a curated introduction to the project's cases, research findings, conceptual model and open questions, see the [research and design reader’s guide](https://github.com/MVR-GIS/restorationmonitoring/blob/main/RESEARCH-DESIGN-GUIDE.md).

## A more connected cycle of learning

The initiative is designed around a practical ambition: a researcher, biologist, engineer, manager, or partner should be able to follow the evidence behind a restoration question and see how it relates to work on the river. Questions worth asking include:

- Which projects and restoration practices could help investigate a particular ecological question?
- What was a project intended to achieve, what was implemented, and what evidence is available to assess it?
- What have monitoring and research found, under what conditions, and where do important uncertainties remain?
- How might a finding or lesson inform a future study, design, or adaptive-management decision?

Answering these questions requires more than a collection of documents. The intended network connects **questions and hypotheses, study designs, project objectives and criteria, restoration implementations, observations, analyses, findings, assessments, and decisions**. It retains the meaning and source of each connection, along with its place, time, review state, and limitations. A finding is not automatically a project-success judgment; a spatial overlap alone does not establish an ecological effect.

The goal is cumulative learning: make past work easier to find and understand, support stronger connections between research and restoration opportunities, and carry knowledge forward as projects and people change. Preserving the evidence and its context has value even when a particular question cannot yet be answered.

## Built on partnership and existing systems

UMRR's long-running partnership brings together federal, state, local, and nongovernmental expertise in restoration, monitoring, research, and management. This initiative seeks to support that distributed work, including the emerging Fish and Wildlife Working Group restoration-science research framework and the learning opportunities it aims to identify. The supplied UMRR 2025–2035 strategic plan is a draft; its directions inform the work without establishing a final implementation policy.

The design builds from existing sources and responsibilities:

- **EMMA** provides established project, objective, performance-criterion, and monitoring-task context. Its existing many-to-many objective–criterion and task–criterion relationships matter to the design.
- **Restoration Features** provides the production GIS anchor for planned and installed restoration practices, with spatial context that can be compared to study and monitoring locations.
- **Research and monitoring sources** provide the publications, datasets, methods, observations, and interpretations needed to understand ecological response. Program documents and partner knowledge add the history and context behind decisions.

The proposed integration approach references authoritative sources and records the basis for a relationship. It does not assume that matching names or geometry alone establish identity, applicability, or causation. Organizational ontology work provides a baseline for shared meaning; a UMRR ontology module and production integration remain future decisions.

## Learning from incomplete histories

Historical evidence is often uneven. EMMA did not back-enter monitoring tasks for older completed projects without future monitoring planned, and some records may be difficult or impossible to recover. A missing task should not prevent a practitioner from discovering and using a well-documented historical report. The design aims to retain what is known, identify what is unavailable or unverified, and limit a particular inference when the evidence it requires is missing—without inventing records to fill a chain.

Two examples are helping test these ideas:

- **Steamboat Island** explores the scientific basis and evaluation needs for an anticipated mussel-habitat benefit. Its report brings source-backed research and local restoration context together while distinguishing an expected benefit from a demonstrated local outcome.
- **Bertom and McCartney Lakes** connects historical rock habitat and mussel-bed objectives, a restoration channel, and a documented 2014 mussel survey. It illustrates how useful analysis can continue without a recorded EMMA monitoring task, while GIS segment matches and assessment methods remain to be reconciled.

These are bounded design and reporting examples, not comprehensive project assessments or evidence of program-wide coverage. Their purpose is to help practitioners review relationships and help the project team decide what information the future integration component needs to represent.

## What is available today

The package currently provides a small, source-oriented reporting foundation:

- `research_question_summary()` assembles a pilot summary from reviewed science and restoration worksheets, preserving source references, derivation links, and input fingerprints.
- `research_question_report()` renders a self-contained HTML report for the **Steamboat Island mussel pilot**. The current template expects that pilot's compatible inputs; it is not yet a general report for any project.
- A repository-local Bertom walkthrough illustrates a different evidence path. Its driver and inputs depend on this workspace and sibling UMRR source holdings; it is not yet an exported general-purpose interface.

The work remains in conceptual design and early package development. The reports are aids to discussion and model design, not approved scientific assessments. Partner and subject-matter review, source recovery, identity reconciliation, and decisions about sustainable stewardship are ongoing. The package does not connect to or update EMMA or Restoration Features.

## Getting started

Install the development package from GitHub with R:

```r
install.packages("remotes") # if needed
remotes::install_github("MVR-GIS/restorationmonitoring")
```

This requires access to the GitHub repository and its package dependencies. Rendering reports also requires Pandoc. Installing the package does not bundle the external program documents or all development inputs needed to reproduce the pilots. For the workspace-specific examples, input locations, and rendering instructions, see the [document-processing workflow](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/workflows/document-processing.md) and [report feature notes](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/features/research-question-dashboard.md). Existing report snapshots are not overwritten.

To develop and verify the package from a checkout:

```r
roxygen2::roxygenise()
testthat::test_local()
```

## Explore the work

- [Project purpose and accepted direction](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/project-foundation.md)
- [Requirements and practitioner needs](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/goals-requirements-crosswalk.md)
- [Science–restoration relationships](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/architecture/science-restoration-relationships.md)
- [Bertom evidence and linkage review](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/bertom-rock-habitat-linkage-review.md)
- [Strategic-plan and FWWG context](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/goals/strategic-plan-fwwg-review.md)
- [R package development workflow](https://github.com/MVR-GIS/restorationmonitoring/blob/main/dev/workflows/r-package-development.md)

The package is dedicated to the public domain under [CC0 1.0](https://github.com/MVR-GIS/restorationmonitoring/blob/main/LICENSE).
