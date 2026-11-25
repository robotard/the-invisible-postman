# Continue a GitHub-Driven Work Cycle

A practical guide to keeping shared work moving across people, AI assistants, and sessions.

Here, **CI** is used loosely for a continuous cycle of inquiry and improvement recorded in GitHub. It does not imply that every step is automated or that GitHub Actions are running. The point is a simple, durable rhythm: recover context, choose a useful next step, do the work, preserve what was learned, and leave the next person able to continue.

## The working agreement

The human brings purpose, priorities, domain knowledge, judgement, and decisions that change direction. The AI helps recover the recorded context, find the next useful action, examine evidence, draft or revise material, and keep the record coherent. The human remains responsible for the work and its claims; the AI should make its reasoning and uncertainty reviewable.

Treat this as collaboration between distinct viewpoints, not as agreement by default:

- The human can correct context, set boundaries, choose among material alternatives, and decide whether a proposed change is worth its cost.
- The AI should surface relevant evidence and counterevidence, distinguish fact from inference, challenge unsupported assumptions, and revise when the record warrants it.
- Neither agreement, a confident tone, nor a completed document is evidence by itself.
- Preserve unresolved questions, useful disagreement, rejected options, and why a decision was made.

## Keep GitHub as the durable record

Use the live repository as the source of truth for project state. Chat is useful context, but it is not the only record and should not be needed to reconstruct settled decisions.

Give each document one job. A small project may use different names, but the roles should stay distinct:

| Record | Job |
| --- | --- |
| Bootstrap / `START_HERE` | Entry point and ordered resume instructions |
| Project instructions | How an assistant should operate in this workspace |
| State | Current verified position, constraints, and next action |
| Plan | Stable priorities, sequence, dependencies, and gates |
| Task registry | Actionable work items, status, owners or targets, blockers, and completion criteria |
| Work log | Dated account of work performed, findings, limits, and handoff |
| Session digest | Compact retrieval aid for a new session |
| Substantive files | The actual deliverables, evidence, reasoning, and decisions |

Do not make the operational records a second copy of the substantive work. Put durable reasoning and evidence where they belong; let coordination records point to them.

## The continuous cycle

### 1. Re-enter from the record

Start at the bootstrap file. Follow its read order. Read the current state, plan, log, and task registry, then inspect only the substantive files needed for the next action.

Check the live branch and recent history when they could change your understanding. Treat summaries and digests as navigation aids; verify important details against the current files.

### 2. Reconcile before choosing

Compare the plan and task registry with the actual deliverables. Look for unfinished work, new evidence, contradictions, stale references, unmet gates, and useful work that is not represented in the task list.

Choose the next unblocked action that best advances the agreed purpose. A backlog is a guide, not a reason to ignore a material issue in the work itself. Keep optional investigations from becoming new workstreams by accident.

### 3. Do useful work in the same session

Make the change in the appropriate substantive file where possible. Do not stop at a status report or plan if the next action is clear and authorized. If one line of inquiry is blocked, continue other independent work.

Keep scope changes visible. Before changing the agreed purpose, deliverables, priorities, sequence, or dependencies, bring the human a concise proposal with:

- the evidence and reason for the change;
- the expected benefit and cost to current work;
- practical alternatives, including no change; and
- whether the change is necessary or simply promising.

Routine corrections that preserve the agreed direction can proceed without reopening the whole plan.

### 4. Make evidence and uncertainty legible

For each material claim or finding, record what supports it, what could contradict it, the scope and assumptions, and what remains unknown. Distinguish at least:

- proposed from established;
- source inspection from execution;
- drafted from saved;
- saved from read-back verified;
- tested or reproduced from merely reasoned about; and
- internal review from independent review.

Record negative results and access limits too. Do not upgrade a claim because it is repeated, cited, or written fluently. Do not claim testing, reproduction, implementation, approval, or independent review unless it happened and the record supports that description.

### 5. Update only the records affected

Update task status when the work actually changes it. Update state and the log for material outcomes. Change the plan only when priorities, dependencies, sequence, or workflow change. Refresh session digests at handoff, after reconciling the state, plan, and log.

This keeps the record useful without turning the process into bookkeeping.

### 6. Save and verify

For every repository write:

1. Make the intended change on the agreed branch or review path.
2. Read the saved file back from GitHub.
3. Confirm the saved content matches the intended change.
4. Record the resulting commit and what was, and was not, verified.

A successful write response is not a substitute for checking the saved file. For consequential changes, prefer a reviewable branch and pull request where the repository’s practice supports it.

### 7. Leave a clear handoff

End a work session with a concise record of:

- what changed and where;
- the evidence or reasoning that motivated it;
- what remains uncertain or blocked;
- the verification actually performed; and
- the next unblocked action.

A later session should be able to continue from GitHub without asking the human to repeat settled context.

## A lightweight task record

Use a task record only when work needs tracking across steps or sessions. Keep it small:

```yaml
id: TASK-###
title: A concrete outcome
status: ready | in_progress | blocked | deferred | complete
purpose: Why this work matters
targets:
  - path/to/deliverable.md
depends_on: []
blocker: null
next_action: One specific action
completion: Outcome integrated, limits recorded, and saved content verified
```

Use stable identifiers and never recycle them. A blocked task should name the specific blocker and whether other work can continue. “Complete” should describe an achieved outcome, not just an attempted action.

## A lightweight work-log entry

```markdown
## YYYY-MM-DD · Short description

### Work performed
- What changed, with links or paths.

### Evidence and limits
- What supports the finding, what was checked, and what was not established.

### Verification
- Saved-file read-back, review, test, or reproduction actually completed.

### Next
- The next unblocked action, or the specific decision needed.
```

## When to ask the human

Ask when the missing information or decision materially affects correctness, scope, access, or an external action, and cannot be resolved from the record. Make the question specific and show the relevant options and consequences.

Otherwise, state a reasonable assumption, continue useful work, and make the assumption visible in the record if it affects the result. Do not ask the human to reconstruct information already stored in GitHub.

## Quick continuation checklist

- [ ] Started at the project bootstrap and followed its read order.
- [ ] Checked live GitHub records rather than relying on chat memory.
- [ ] Reconciled task records with the substantive work.
- [ ] Chose an unblocked action within the agreed scope.
- [ ] Kept evidence, uncertainty, and contributor roles clear.
- [ ] Updated only records changed by the work.
- [ ] Read every changed file back from GitHub.
- [ ] Left the next session a concrete continuation point.

The process is working when each cycle leaves the shared work more useful and the next step easier to see.
