# Agent instructions

## Identity and scope

`restorationmonitoring` is the current repository. Treat its code, tests, configuration, and maintained documentation as the authoritative evidence for repository-local behavior.

## Always-applicable rules

- Inspect repository and Git evidence before making consequential changes.
- Keep this file concise; route detailed knowledge into maintained artifacts under `dev/`.
- Preserve unrelated user changes and keep work within the requested repository scope.
- Distinguish verified evidence, reasonable inference, and unknowns.

## Conditional context routes

- Goals, scope, or success criteria: `dev/goals/`
- Architecture, dependencies, or ownership boundaries: `dev/architecture/`
- Scientific conceptual models and knowledge-graph design: use `dev/architecture/usace-ontology-alignment.md` and sibling `../usace-ukg-ontologies/` as the organizational baseline. Inspect current module definitions/IRIs before proposing new UMRR terms; reuse existing structure where meanings fit and record gaps as candidates. Follow sibling instructions if editing there; future UMRR module codification is separate from current design review.
- Consequential and durable choices: `dev/decisions/`
- Governance or artifact lifecycle: `dev/governance/`
- Repeatable development procedures: `dev/workflows/`
- Exact structural contracts: `dev/schemas/`
- Document extraction, processing, reporting, or publication: `dev/workflows/document-processing.md`. Prefer R-centric workflows and the reviewed fluvgeo pattern: reusable R summaries/renderers, parameterized templates in `inst/reports/`, shared gt/ggplot2 presentation, and ignored generated snapshots. Do not introduce Python generators when suitable R tooling is available.
- Written proposals and narrative deliverables: provide Markdown by default. Do not generate or deliver PDFs unless the user explicitly requests that format.
- Cohesive user-visible capabilities: `dev/features/`
- Resumable unfinished work: `dev/checkpoints/current/`
- R package API, implementation, documentation, or tests: `DESCRIPTION`, `NAMESPACE`, `R/`, `man/`, `tests/testthat/`, and `dev/workflows/r-package-development.md`
- Restoration Features GIS model documentation, feature definitions, attributes, or classification crosswalks: sibling repository `../umrs_rf/`; start with `_quarto.yml`, `index.qmd`, and `intro.qmd`, then the relevant `rf_*.qmd`, `rsf_*.qmd`, or crosswalk chapter. Consult its local agent instructions if present. Read authored Quarto sources; `docs/` is rendered output. Compare documented structure with `../UMRR/RestorationFeatures/` schema exports when needed, retaining version differences.

Full session transcripts are not normal context sources. Use maintained durable artifacts and concise checkpoints.

## Completion governance

Before declaring meaningful work complete, determine whether it changed goals, architecture, a durable decision, a schema or interface, a repeatable workflow, feature behavior, or resumable state. Update the applicable durable artifact. Create a checkpoint only when useful unfinished state remains.

## Verification and information governance

Run checks proportionate to the change, inspect Git status and diff, and confirm the change boundary. Never record secrets, credentials, PII, restricted data, or unnecessarily large logs in agentic-context artifacts.
