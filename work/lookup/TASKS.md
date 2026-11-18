# Internal work backlog and continuation keys

**Project maturity:** Theory only · No implementation · Not audited.  
**Scope:** Internal task coordination only; task status does not imply implementation, testing, audit or independent review.

**Canonical registry:** [TASKS.json](TASKS.json)  
**Schema:** `tip.work.registry.v3`  
**Rule:** JSON is the keyed source for task lookup; this file is its human-readable index. The thesis and enduring research records remain authoritative for substantive work.

Task keys are immutable internal lookup handles, not thesis references, source IDs, evidence identifiers or publication metadata. A task is complete only when its outcome is reconciled into the thesis and/or enduring research records, its evidence limits and disposition are recorded, and the commit has passed exact post-commit read-back verification. IDs are never recycled.

| Key | Type | Task | Status | Priority |
|---|---|---|---|---:|
| T-001 | source_review | Complete full-text/source review of SRC-033, SRC-034 and SRC-036 | in_progress | 2 |
| T-002 | source_review | Review SRC-046–SRC-048 full texts and SRC-047 implementation where available | in_progress | 3 |
| T-003 | source_review | Review SRC-049 paper, formal security argument and complete results | in_progress | 4 |
| T-004 | route_analysis | Pin versioned Dropbox, Signal and Katzenpost/Pigeonhole profiles | in_progress | 5 |
| T-005 | protocol_analysis | Reconcile protocol-boundary analysis into W2/W3/W4, decisions and thesis | complete | 5 |
| T-006 | research_synthesis | Reconcile new route/source findings into W1–W4 and thesis | in_progress | 1 |
| T-007 | thesis_synthesis | Final thesis alignment and cross-document consistency review | blocked | 7 |
| T-008 | diagram_work | Stabilise diagram arguments and reconcile figure briefs with thesis | blocked_until_research_stable | 8 |
| T-009 | diagram_work | Create and verify contextual editable thesis diagrams | deferred | 9 |
| T-010 | peer_review_preparation | Prepare a coherent thesis candidate and scoped peer-review materials | deferred | 10 |
| T-011 | peer_review | Conduct and reconcile substantive independent peer review | not_started | 11 |
| T-012 | release_integrity | Verify thesis release integrity and remove disposable work area | deferred | 12 |

## Current execution

**Current active task:** T-006. The documentary route/fault/evidence matrix is created and linked. The OMR cells distinguish native incomplete/divergent candidate views from wrapper-level duplicate/conflict/order/replay semantics; StOMR's 32-bit signal-collision and state-rollback questions and SRC-053's UnifOMR candidate-capacity question are explicitly bounded. Next: audit the image-specific transformation cells, then the Signal, Dropbox and Pigeonhole evidence boundaries. Keep protocol claims separate from product/service behaviour, and mark which outcomes are documentary versus requiring controlled accounts/deployments. Candidate C is a reproducible evaluation method only, conditional on a result that changes a route decision or exposes a material gap beyond prior art.

**Parallel evidence work:** T-001–T-003 remain in_progress for source access where it materially resolves claims. T-004 is now in_progress: public Dropbox/Signal/Katzenpost release and documentation snapshots are pinned, but actual account, installed-client/backend and running-deployment configurations remain unavailable. Continue other unblocked work around these access limits.

## Status meanings

- `ready`: unblocked and not started.
- `in_progress`: active work; may span multiple coherent commits.
- `blocked`: a specific dependency, access barrier or decision prevents progress; record it in the keyed value.
- `deferred`: intentionally postponed by a recorded gate/dependency.
- `complete`: outcome integrated, limits recorded and post-commit read-back verified.
- `not_started` / `blocked_until_research_stable`: reserved for future gated work.

## Sequence and dependencies

T-006 thesis-first synthesis; T-001–T-003 source review in parallel where material; T-004 route evidence; T-005 protocol analysis (complete); T-007 final coherence review gated on stable synthesis; T-008–T-009 diagrams only after research stabilises; T-010–T-011 peer-review preparation and actual review; T-012 release integrity and eventual disposal of `/work/`.

Detailed next actions, targets, blockers and dependencies are stored once in the keyed JSON values. Do not duplicate a second task plan here.
