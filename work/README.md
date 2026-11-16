# Temporary research work area

**Purpose:** disposable coordination and lookup machinery for developing the thesis.

This directory is deliberately agnostic of the thesis architecture and research content. It may be deleted in full at thesis release without changing the thesis, its citations, its substantive research documents, or their meaning.

## Contents

- `PROJECT_STATE.md`: verified current position and exact continuation point.
- `WORKPLAN.md`: stable research sequence and dependencies.
- `WORK_LOG.md`: chronological activity and verification evidence.
- `SESSION_DIGEST.md` / `SESSION_DIGEST.json`: compact continuation indexes.
- `lookup/TERMS.md` / `lookup/TERMS.json`: internal concept lookup keys.
- `lookup/TASKS.md` / `lookup/TASKS.json`: internal task and subtask lookup keys.

## Boundary rules

1. Nothing in `/work/` is a thesis requirement, protocol component, runtime feature or research claim.
2. Internal IDs exist only to shorten our own lookup, navigation and continuation. Do not insert them into the thesis or research documents.
3. Thesis citations, source identifiers (for example `SRC-049`), section references, figure references and substantive cross-references remain in their existing research locations and formats.
4. An internal key points to an enduring thesis/research location; it never replaces that location's proper citation or reference.
5. Keep definitions and task records concise. The thesis remains the sole destination for the finished argument.
6. At full thesis release, verify that no enduring document depends on `/work/`, then remove this directory as disposable scaffolding.

The registries are navigation aids, not competing sources of truth. Where an entry conflicts with a thesis or research document, the latter governs.
