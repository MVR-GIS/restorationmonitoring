# Development context

This directory contains durable, repository-owned context for human and agentic development. `AGENTS.md` routes tasks here; the artifacts below hold the detail.

**The user recognized the coherent Steamboat case-report milestone on 2026-10-22.** The reports are means to reason through data modeling. Conceptual work now includes a Bertom historical-evidence walkthrough, while scientific conclusions and model specifications remain provisional. Start with the [next-chat handoff](checkpoints/current/next-chat-handoff.md) for current resumable state.

For current purpose and design status, start with [project foundation](goals/project-foundation.md). The [data model design report](architecture/data-model-design-report.md) consolidates the proposed objects, relationships, existing-system anchors, Bertom test and open decisions for review. The [crosswalk](goals/goals-requirements-crosswalk.md#requirements-clarified-by-the-steamboat-pilot) captures pilot-derived requirement clarifications. The [relationship analysis](architecture/science-restoration-relationships.md#pilot-implications-for-conceptual-model-review) identifies concrete modeling questions. Detailed source reviews are conditional evidence references, not sequential prerequisites.

The [science and adaptive-management tooling watch](goals/science-am-tooling-watch.md) screens concrete implementations and models against the user's clarified requirements; its [repeatable workflow](workflows/science-am-tooling-watch.md) maintains the watch. It supersedes the priorities of the broader [landscape review](goals/existing-models-tools-landscape-review.md).

- `goals/`: scope, outcomes, and success criteria
- `architecture/`: system structure and ownership boundaries
- `decisions/`: accepted architectural decision records
- `governance/`: artifact authority and lifecycle rules
- `workflows/`: repeatable procedures
- `schemas/`: exact structural contracts
- `features/`: cohesive capability specifications
- `checkpoints/`: concise resumable state
- `scripts/`: supporting development automation

Chat transcripts and generated output are not canonical project context.

The [research question report](features/research-question-dashboard.md) describes the Steamboat prototype and earlier Bertom walkthrough. The [Bertom multi-entry prototype](features/bertom-multi-entry-prototype.md) tests selectable views and a hypothetical assessment using a curated fixture; maintained source reviews remain the evidence basis. Follow the [R-centered document-processing workflow](workflows/document-processing.md) for extraction and reporting and the [R package workflow](workflows/r-package-development.md) for package and local pkgdown development.

The [workshop research-priority review](goals/workshop-research-priorities.md) and [question register](goals/workshop-research-question-register.json) capture the partnership's supplied learning agenda and reach-specific rankings for EMMA's science and restoration integration component.
