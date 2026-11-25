#!/bin/sh
# Install a minimal GitHub-backed continuation workspace in a repository.
# Usage: sh install-work-docs.sh [repository-root]
set -eu

root=${1:-.}
root=$(CDPATH= cd -- "$root" && pwd)
work="$root/work"

if [ -e "$work" ]; then
  printf '%s\n' "Refusing to overwrite existing path: $work" >&2
  exit 1
fi

mkdir -p "$work/lookup"

cat > "$work/START_HERE.md" <<'EOF'
# Start Here

This repository is the durable project record. Begin each new or resumed work session here.

## Resume sequence

1. Read `PROJECT_STATE.md`, `WORKPLAN.md`, `WORK_LOG.md`, and `lookup/TASKS.json`.
2. Check the current GitHub branch and recent commits when they affect the work.
3. Inspect only the deliverable files needed for the next task.
4. Reconcile recorded tasks with the actual deliverables; choose the next unblocked action.
5. Do useful work within the agreed scope, update affected records, and verify saved changes.
6. Leave a dated log entry and one concrete next action.

The human sets purpose, priorities, domain judgement, and material decisions. An AI assistant helps recover context, examine evidence, carry out authorized work, and keep records coherent. Ask the human only for decisions or information that cannot be resolved from the repository.
EOF

cat > "$work/PROJECT_STATE.md" <<'EOF'
# Project State

**Updated:** YYYY-MM-DD  
**Current focus:** Describe the active outcome in one sentence.  
**Next action:** Name one unblocked, concrete action.  
**Blockers:** None, or name the exact blocker and whether other work can continue.

## Verified position

- Record current facts and constraints briefly.
- Link to deliverables and evidence; do not duplicate their content.
- Separate confirmed findings from assumptions and open questions.
EOF

cat > "$work/WORKPLAN.md" <<'EOF'
# Workplan

## Purpose
State the project's current purpose and intended outcomes.

## Priorities
1. Highest-value current work.
2. Next work, including dependencies.
3. Later work or explicit gates.

Change this plan only when priorities, scope, dependencies, or workflow actually change. Put detailed actions in the task registry.
EOF

cat > "$work/WORK_LOG.md" <<'EOF'
# Work Log

Record material work by date. Keep entries concise and link to changed deliverables.

## YYYY-MM-DD · Short description

### Work performed
- What changed and where.

### Evidence and limits
- What supports the result, what was checked, and what remains unknown.

### Verification
- Saved-file read-back, review, test, or reproduction actually completed.

### Next
- The next unblocked action or the specific decision needed.
EOF

cat > "$work/lookup/TASKS.md" <<'EOF'
# Task Registry

Use stable IDs. Keep status, next action, dependencies, blockers, and completion criteria aligned with `TASKS.json`. Record substantive reasoning in the deliverables and work log.

| ID | Task | Status | Next action |
| --- | --- | --- | --- |
| T-001 | Replace this example with the next concrete outcome | ready | Define the deliverable and start |
EOF

cat > "$work/lookup/TASKS.json" <<'EOF'
{
  "schema": "work.tasks.v1",
  "updated": "YYYY-MM-DD",
  "tasks": [
    {
      "id": "T-001",
      "title": "Replace this example with the next concrete outcome",
      "status": "ready",
      "targets": [],
      "depends_on": [],
      "blocker": null,
      "next_action": "Define the deliverable and start",
      "completion": "Outcome integrated, limits recorded, and saved content verified"
    }
  ]
}
EOF

cat > "$work/SESSION_DIGEST.md" <<'EOF'
# Session Digest

**Updated:** YYYY-MM-DD  
**Checkpoint:** One-sentence verified checkpoint.  
**Next action:** One concrete unblocked action.

## Context
- Short retrieval notes only; authoritative details remain in project state, plan, log, task registry, and deliverables.
- Keep this Markdown view aligned with SESSION_DIGEST.json.
EOF

cat > "$work/SESSION_DIGEST.json" <<'EOF'
{
  "schema": "work.session-digest.v1",
  "updated": "YYYY-MM-DD",
  "checkpoint": "One-sentence verified checkpoint.",
  "next_action": "One concrete unblocked action.",
  "read_first": [
    "work/START_HERE.md",
    "work/PROJECT_STATE.md",
    "work/WORKPLAN.md",
    "work/WORK_LOG.md",
    "work/lookup/TASKS.json"
  ]
}
EOF

printf '%s\n' "Created starter work records in $work"
printf '%s\n' "Edit the project purpose, replace the example task, then commit the work/ directory."
