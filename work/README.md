# Temporary thesis-development work area

**Role:** the temporary store of work to be done to bring the thesis to its intended research standard.

The thesis is the product. `thesis.md` is the single active manuscript in development (staging) and the source of the released thesis. Staging and production are lifecycle states of the same thesis, not separate products or parallel thesis identities. A production release is a frozen, versioned release of the thesis after evidence reconciliation, quality checks and substantive peer scrutiny; it must not silently diverge from the staged manuscript.

`/work/` contains the temporary machinery and actionable work required to develop, scrutinise, explain and release that thesis. It is disposable after release, but its work must first be completed, transferred into enduring research records where substantive, or explicitly closed as unnecessary.

## What belongs here

- `PROJECT_STATE.md`: verified current position and exact continuation point.
- `WORKPLAN.md`: research-development sequence, dependencies and gates.
- `WORK_LOG.md`: chronological work and verification evidence.
- `SESSION_DIGEST.md` / `SESSION_DIGEST.json`: compact continuation indexes.\n- `CHATGPT_PROJECT_INSTRUCTIONS.md`: concise, copy-ready operating instructions for the external ChatGPT Project settings; repository copy is authoritative for intended text, but does not itself change those settings.
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


## Commit checkpoint contract

A commit is a completed work checkpoint, not a loose save. Use one commit for one coherent work unit; group related file edits instead of creating micro-commits. Do not split a task merely to make activity look busy.

**Before each commit**
1. Fetch the current `main` head and the files that will be changed. Reconcile the task key in `lookup/TASKS.json` (canonical) and its Markdown index.
2. Do the actual research/thesis/supporting-document work first. Update the affected enduring research files, not just the work register.
3. Update the task's next action/status and record the actual changes, evidence, limits and intended commit scope in `WORK_LOG.md`. Reconcile `PROJECT_STATE.md` to the real position. Change `WORKPLAN.md` only if sequence, priority, dependency or workflow changes.
4. Run the checks relevant to the change. Do not label a result verified before it has been read back.
5. Use a structured commit message/body with stable key/value fields: `checkpoint`, `task_keys`, `intent`, `changed_paths`, `evidence`, `precommit_checks`, `postcommit_checks`. Keep the commit subject concise and task-centred.

**After each commit**
1. Fetch the commit and every changed file from the new branch head.
2. Verify the exact saved content and changed-path set; run any post-write checks that apply.
3. Record the commit SHA, read-back result, checks and any limitations in the next work-log/checkpoint update. A commit is not reported as complete until this post-commit verification succeeds.
4. If verification fails, keep the task open, correct the saved content and make a corrective checkpoint. Never silently mark the failed attempt complete.

**Status discipline**
- `ready`: unblocked and not yet started.
- `in_progress`: work is actively being done.
- `blocked`: a specific dependency/access/decision prevents progress; record it.
- `deferred`: intentionally postponed by a recorded dependency or gate.
- `complete`: the defined outcome is achieved, reconciled into its enduring destination, and post-commit read-back verified.
- A task may remain `in_progress` across multiple coherent commits. Do not create a commit solely to flip a status if that update can accompany the next substantive checkpoint.

**Checkpoint identity**
Use the task key(s) as the stable lookup identity, plus a dated checkpoint label when one unit spans multiple commits. Internal IDs remain private work handles. Commit metadata and the work log provide provenance; do not create a second parallel task taxonomy.

**Digest timing**
The two session digests are refreshed only at a handover/close checkpoint, after state, plan and log are reconciled. Refresh Markdown first and JSON last. Verify both against the source records. Do not refresh both digests after every tiny edit.

This is the single commit discipline for research, thesis, supporting documents and operational changes. No commit is exempt.
