# Minimum durable record for a prospective science–restoration linkage

- Started: 2026-10-28
- Status: user-accepted working conceptual pattern for further validation on 2026-10-28; not an approved form, schema, ontology profile, or partner workflow
- Basis: [prospective linkage review](prospective-study-linkage-review.md), [Steamboat test record](../goals/steamboat-prospective-study-linkage.md), [relationship analysis](science-restoration-relationships.md), and [requirements crosswalk](../goals/goals-requirements-crosswalk.md)

## Result of the first test

The Steamboat record demonstrates that the proposed distinctions are useful: it can retain an externally informed opportunity without reporting a locally adopted hypothesis, completed study, installed treatment or observed effect. Its full narrative is appropriate for review, but too large to be the minimum unit that future contributors must recreate for every connection.

The smallest reusable pattern is therefore an **attributed linkage record**, supported by references to existing source and production systems. It should record a claim about a connection, not duplicate the full contents of a project, paper, GIS feature, dataset or EMMA monitoring task.

The user accepted this pattern for further validation. That acceptance establishes the design direction and does not settle the exact relationship vocabulary, field structure, cardinalities, storage location, review workflow, ontology alignment or partner responsibilities.

## Proposed minimum pattern

| Component | Proposed minimum content | Why it is needed | What should remain a reference or attachment |
| --- | --- | --- |
| Link assertion | The two linked records and a precise relationship meaning | A graph edge without meaning cannot distinguish motivation, planned evaluation, applicability, adoption or demonstrated effect | Full source text and all related artifacts |
| Attribution and evidence | Source/version/locator or named contributor; explicit source statement versus analyst inference | Lets a future reviewer recover why the link exists and distinguish documented program intent from retrospective interpretation | Extracted passages, publication files and source-system metadata |
| Scope | Relevant place, time, ecological/implementation conditions and intended response where applicable | Prevents a general finding or practice label from being silently transferred to a different setting | Full spatial geometry, raw measurements and discipline-specific context |
| Lifecycle and review | Planned/actual/unknown relationship state; reviewed-by/when or explicit unreviewed state; supersession/change reference | Supports handoff and correction without overwriting what was previously believed | Detailed review correspondence and organization-specific workflow mechanics |
| Responsible contributor | Partner, role or system that can clarify or update the linkage | Makes distributed stewardship visible without requiring a single centralized owner | Contact details or access-controlled personnel information |

This common envelope applies to all four prospective connections. It meets the provenance, scope, review-history and distributed-stewardship needs in R-01, R-03, R-09, R-13, R-15 and R-17 without deciding physical storage.

## Connection-specific minimums

The shared envelope alone is not enough. Each relationship needs a small, distinct scientific or operational statement.

| Connection | Minimum statement beyond the common envelope | Deliberately excluded from the minimum |
| --- | --- | --- |
| Priority question → hypothesis | Why this proposition responds to the question, hypothesis wording, expected relationship and stated conditions | A numeric priority threshold, a claim of confidence, or proof the question has been answered |
| Hypothesis → study design | Intended response, unit/comparison, spatial/temporal scope and intended inference limit | Full protocol text, all analytical code, or a requirement that every study be experimental |
| Study design → planned evidence collection | Collection/data-source role, method/timing reference, responsible contributor and execution state | Duplicate EMMA task details, raw data ingestion, or an assertion that collection was completed because it was planned |
| Study design → restoration implementation | Implementation role in the design, practice/feature reference, planned/actual state and relevant place/time/condition | Reclassification of the feature globally, automatic identification of a GIS geometry as a treatment, or a causal-effect claim |

## Candidate refinements from the Steamboat test

1. **Keep the hypothesis distinct from the expected benefit.** SC-08 is a proposition about an expected ecological relationship; the Steamboat mussel benefit is a documented project rationale. They can be linked, but do not need the same identity or review path.
2. **Treat a study design as a referenceable plan or reconstruction.** MS-03 shows that an existing study can be described through its design without treating its publication or dataset as the design itself. Where no local design exists, record a design gap rather than a placeholder design.
3. **Make implementation role a qualified relationship.** A feature may serve as an intervention in one study, contextual exposure in another, and only a future opportunity in a third. That role should belong to the linkage and its scope, not permanently to the feature.
4. **Use references instead of replication.** A linkage should point to EMMA task/event records, Restoration Features records, ScienceBase releases, protocols and documents where available. This limits duplicate entry and preserves existing systems of record.
5. **Record unknowns at the link level.** “Not yet adopted,” “specific implementation not identified,” and “no dedicated monitoring commitment located” describe different incomplete connections. They should not be collapsed into a single project-level status.

## Stewardship burden test

| Proposed practice | Expected benefit | Burden limit to preserve |
| --- | --- | --- |
| Create a linkage only when a source, contributor or reviewable rationale is available | Preserves traceability and avoids speculative graph growth | Do not require comprehensive back-entry before a useful new linkage is recorded |
| Reference existing systems and artifacts | Keeps EMMA, GIS, ScienceBase and partner holdings authoritative for their content | Do not copy raw observations, feature geometries or full protocols solely to create the linkage |
| Require an explicit review state | Makes analyst proposals visible and supports later correction | “Unreviewed” must be a valid state; lack of review cannot block preservation of a well-attributed candidate |
| Name a responsible role or contributing system where known | Supports handoff across organizations and careers | Do not infer a person or create a centralized approval role when responsibility is unknown |
| Preserve changes/supersession | Retains why prior design or interpretation differed | Do not require a fixed workflow, cadence or software implementation before capturing meaningful history |

The pattern appears proportionate for a pilot because it limits new information to the meaning and provenance of a connection. It needs partner review against actual planning and monitoring workflows before it can be treated as sustainable at program scale.

## Second validation and refinement

The [Steamboat performance-evaluation record](../goals/steamboat-performance-evaluation-linkage.md) supplies a contrasting artifact path: formal objective → planned criterion → planned evaluation, without an explicit scientific hypothesis or performed evaluation. It confirms that the common envelope can support both science-planning and performance-assessment paths without merging them.

The second test adds a candidate distinction for later review: an evaluation's lifecycle state must remain separate from the states of its criterion, monitoring task, implementation and objective. The tests do not yet validate a source-backed installed feature, performed monitoring task, observation storage or cross-project reuse.

The next external validation should use a deliberately contrasting project or study artifact when convenient, preferably one with either a source-backed installed feature and evaluation record or an explicit study design. Do not select a case only because it is complete; the purpose is to test ordinary fragmentation without adding duplicate records or forcing false completeness.
