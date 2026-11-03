# Repeatable science and adaptive-management tooling watch

Use this lightweight procedure to keep the [watch register](../goals/science-am-tooling-watch.md) current while design work proceeds. This is a manual workflow, not an automation or a request to contact anyone.

## When and how much

Recheck high-priority entries about every six months **when a team member chooses to do so**, or sooner when a relevant release, schema, publication or program relationship appears. This is a suggested cadence, not a scheduled task. Allocate a short bounded pass (for example, 60–90 minutes); spend more only when new concrete evidence changes a decision. Check parked entries annually or on a specific trigger. Preserve previous observations and dates so lack of change is explicit.

## Procedure

1. **Start with decisions, not broad AM searches.** Identify the current model/report question (for example, revisions to evidence-linked assessments) and the candidates that could answer it. Check the latest program needs and [data-model report](../architecture/data-model-design-report.md).
2. **Inspect primary artifacts.** Look at the named repository's releases, commits, license and schema/data dictionary; current application and API documentation; software release/archive; and peer-reviewed implementation paper. Note version/tag/commit, date and exact artifact. Check actual license for each component, hosted service, example dataset and dependency being considered. Do not treat public code, website claims, open data or paper licenses as proof of software rights.
3. **Screen function and provenance.** For each candidate record evidence of: research questions/hypotheses; projects/implemented interventions; studies and observations; analysis and sources; authored findings, assessment, decision/deferral and action; cross-project relationships; attribution, competing evidence, uncertainty, revisions and dates; discovery from more than one entry; and preservation/export. Record **documented**, **demonstrated**, **not supported** (only with affirmative evidence), or **not yet verified**, with source and version for each relevant claim.
4. **Assess practical reuse.** Check deployment, roles, APIs/import/export, data ownership, interoperability with EMMA and Restoration Features, identifiers, source code and licenses, dependencies, maintenance/activity and portability. Distinguish desktop from hosted services. Open and active do not automatically mean sustainable across generations.
5. **Run a bounded use-case check when justified.** Use the same source-attributed Bertom fixture from the register, including the absent task and a clearly synthetic insufficient-evidence finding, assessment, decision and revision. Start from question, study and project. Track steps, information loss and provenance; use a disposable local or otherwise authorized environment. A documentation-only pass must not be labeled a demonstration. Do not enter program data into third-party systems without authorization.
6. **Decide and record.** Assign `strong contender`, `partial component`, `research lead`, `parked`, or `retired` and state why, what was actually checked, exact gaps, next trigger and next review. A strong contender needs inspectable implementation or model, a relevant substantial function, plausible reuse path and evidence sufficient to justify an actual fit test. Do not promote a project merely for using AM terminology. Record negative searches as bounded searches, not proof of nonexistence.
7. **Update project context only when material.** Amend the watch register and, if a finding changes the model or implementation direction, link it from the relevant architecture or handoff document. Keep observed facts, inference and proposals separate. Do not silently overwrite earlier dated assessments.

## Entry template

```text
Name / organization / component:
Status and previous status:
Checked on / reviewer or source of check:
Primary artifact, exact version or commit, URL:
Software/model and license per component; license evidence:
Implemented functions and evidence; deployment/operating context:
Relevant UMRR chain and lifecycle slice:
Known limits / not yet verified / access restrictions:
Maintenance and preservation signals (with dates):
Relevance or concrete use case:
Change since last check and decision impact:
Next trigger / suggested review date:
```

For discovery, combine a specific data object or lifecycle function (`hypothesis`, `assessment`, `decision history`, `evidence provenance`) with `restoration`, `conservation`, `data model`, `schema`, `software`, `GitHub` or `USGS`. Search the existing register first and stop when the bounded pass produces no additional concrete artifacts. Do not send outreach or create recurring schedules unless separately requested.
