# Shared scientific infrastructure: intended scope and current state

## Intended relationship accepted by the user

Restoration Monitoring connects hypotheses and research designs with observations, analyses, conclusions, assessments, and adaptive-management decisions. It supports ecosystem restoration programs including UMRR and NESP, across disciplines and generations.

FluvialGeomorph contributes specialized fluvial measurement and analysis and also needs the shared scientific infrastructure. It is one contributing suite, not the boundary of the broader project.

Authority: [maintained project foundation](../goals/project-foundation.md), extracted from explicit user statements. These are intended responsibilities, not implemented capabilities or a selected technical architecture.

## Observed repository state on 2026-10-07

- Repository: restorationmonitoring, nested under the workspace directory.
- Git branch: main, tracking origin/main; sole recorded commit at inspection was f6318d5, Initial commit, containing LICENSE.
- AGENTS.md and dev/ were untracked user-added scaffold material at inspection. They have been preserved.
- The scaffold manifest records reproducibleai 2026.9.4 with base and r-package profiles.
- No application code, R package DESCRIPTION or NAMESPACE, dependency configuration, tests, database implementation, or scientific datasets were present.
- The initial transcript was the only substantive scientific framing source available locally; authoritative program evidence has not yet been reviewed.

## Candidate concepts requiring evidence and review

Earlier assistant proposals distinguish measurement provenance from scientific reasoning provenance; observations from conclusions; objectives from hypotheses and success criteria; reusable practices from installed treatments; planned from actual conditions; and observed change from treatment attribution.

These may help the foundation review, but they are not accepted entities, schema contracts, or interface requirements. Likewise, the assistant's earlier single-project-first proposal was superseded by the user's explicit program-first direction.

Database implementation remains deferred pending grounded, reviewed goals and requirements. No storage engine, ontology, table design, or FG integration mechanism is selected.
