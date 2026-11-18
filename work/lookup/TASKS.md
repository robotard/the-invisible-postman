# Internal work backlog and continuation keys

**Project maturity:** Theory only · No implementation · Not audited.  
**Scope:** Internal task coordination only; task status does not imply implementation, testing, audit or independent review.

**Canonical registry:** [TASKS.json](TASKS.json)  
**Schema:** `tip.work.registry.v3`  
**Rule:** JSON is the keyed source for task lookup; this file is its human-readable index. The thesis and enduring research records remain authoritative for substantive work.

Task keys are immutable internal lookup handles, not thesis references, source IDs, evidence identifiers or publication metadata. A task is complete only when its outcome is reconciled into the thesis and/or enduring research records, its evidence limits and disposition are recorded, and the commit has passed exact post-commit read-back verification. IDs are never recycled.

| Key | Type | Task | Status | Priority |
|---|---|---|---|---:|
| T-001 | source_review | Complete full-text/source review of SRC-033, SRC-034 and SRC-036 | blocked | 2 |
| T-002 | source_review | Review SRC-046–SRC-048 full texts and SRC-047 implementation where available | blocked | 3 |
| T-003 | source_review | Review SRC-049 paper, formal security argument and complete results | blocked | 4 |
| T-004 | route_analysis | Pin versioned Dropbox, Signal and Katzenpost/Pigeonhole profiles | blocked | 5 |
| T-005 | protocol_analysis | Reconcile protocol-boundary analysis into W2/W3/W4, decisions and thesis | complete | 5 |
| T-006 | research_synthesis | Reconcile new route/source findings into W1–W4 and thesis | complete | 1 |
| T-007 | thesis_synthesis | Final thesis alignment and cross-document consistency review | in_progress | 7 |
| T-008 | diagram_work | Stabilise diagram arguments and reconcile figure briefs with thesis | blocked_until_research_stable | 8 |
| T-009 | diagram_work | Create and verify contextual editable thesis diagrams | deferred | 9 |
| T-010 | peer_review_preparation | Prepare a coherent thesis candidate and scoped peer-review materials | deferred | 10 |
| T-011 | peer_review | Conduct and reconcile substantive independent peer review | not_started | 11 |
| T-012 | release_integrity | Verify thesis release integrity and remove disposable work area | deferred | 12 |
| T-013 | research_model | Formalise privacy-preserving verifiable message-set closure (Candidate D) | complete | 1 |

## Current execution

**Current active work:** T-007 post-T-013 consistency review is now active. T-013 is complete for the current evidence set: Candidate D's adversary/trust/collusion model, admission and snapshot boundaries, retrieval soundness/completeness, manifest closure, endpoint acceptance, fork/freshness, predicate privacy/selective failure, leakage function, cost model and pre-admission-omission indistinguishability proposition are integrated into thesis and supporting research. Generic private/verifiable range retrieval is prior art; Candidate D remains a conditional OMR-specific composition hypothesis, not a novelty claim. SRC-056 and SRC-059 remain partial. T-001–T-004 remain blocked on full papers/artifacts or live route configurations.

**Next:** audit all source IDs, internal links and heading anchors; reconcile stale prior-art section references/numbering and terminology; confirm thesis, source register, observer matrix, traceability, workplan and task state agree. Preserve partial-review boundaries.
## Status meanings

- `ready`: unblocked and not started.
- `in_progress`: active work; may span multiple coherent commits.
- `blocked`: a specific dependency, access barrier or decision prevents progress; record it in the keyed value.
- `deferred`: intentionally postponed by a recorded gate/dependency.
- `complete`: outcome integrated, limits recorded and post-commit read-back verified.
- `not_started` / `blocked_until_research_stable`: reserved for future gated work.

## Sequence and dependencies

T-006 thesis-first synthesis (complete for current evidence set); T-013 Candidate D formalisation (complete for current evidence set); T-001–T-003 source review (blocked on primary-source access); T-004 route evidence (blocked on controlled access); T-005 protocol analysis (complete); T-007 final coherence review (in_progress after T-013 integration); T-008–T-009 diagrams only after research stabilises; T-010–T-011 peer-review preparation and actual review; T-012 release integrity and eventual disposal of `/work/`.

Detailed next actions, targets, blockers and dependencies are stored once in the keyed JSON values. Do not duplicate a second task plan here.
