# Temporary thesis-development work area

**Role:** the temporary store of work to be done to bring the thesis to its intended research standard.

The thesis is the product. `thesis.md` is the single active manuscript in development (staging) and the source of the released thesis. Staging and production are lifecycle states of the same thesis, not separate products or parallel thesis identities. A production release is a frozen, versioned release of the thesis after evidence reconciliation, quality checks and substantive peer scrutiny; it must not silently diverge from the staged manuscript.

`/work/` contains the temporary machinery and actionable work required to develop, scrutinise, explain and release that thesis. It is disposable after release, but its work must first be completed, transferred into enduring research records where substantive, or explicitly closed as unnecessary.

## What belongs here

- `PROJECT_STATE.md`: verified current position and exact continuation point.
- `WORKPLAN.md`: research-development sequence, dependencies and gates.
- `WORK_LOG.md`: chronological work and verification evidence.
- `SESSION_DIGEST.md` / `SESSION_DIGEST.json`: compact continuation indexes.
- `lookup/TERMS.*`: internal concept lookup keys.
- `lookup/TASKS.*`: actionable work register covering research, source review, route analysis, thesis synthesis, diagrams, peer review and release checks.
- Concise task-specific working notes or review-process records only when they directly support a registered task and do not duplicate enduring research.

## What does not belong here

- Thesis argument, formal definitions, evidence, citations or research conclusions that belong in `thesis.md` or enduring `docs/` research records.
- A second or alternative thesis, a separate production thesis, or competing source of truth.
- Thesis-facing reference IDs. Internal `C-###` concept and `T-###` task keys are private navigation aids only.

## Boundaries

1. The thesis is the sole research product. It remains itself through staging, review, revision and release.
2. Staging means active development of the thesis manuscript, not a lesser or disposable thesis.
3. Production means a specific, frozen release of that same thesis, with provenance and review state recorded.
4. Peer review must be substantive, scoped and traceable. Preserve reviewer comments/evidence, author responses, dispositions, unresolved dissent and resulting changes. Do not imply independent review until it has occurred.
5. Thesis citations, source identifiers (for example `SRC-049`), section references, figure references and substantive cross-references retain their authoritative forms.
6. Internal keys shorten our own lookup and continuation. They never replace thesis terminology, citations or evidence.
7. At release, transfer substantive outcomes to permanent locations, verify no enduring document depends on `/work/`, then remove `/work/` in full.

The registries and work records are coordination aids, not competing sources of truth. The thesis and substantive research documents govern.
