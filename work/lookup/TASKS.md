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
| T-007 | thesis_synthesis | Final thesis alignment and cross-document consistency review | complete | 7 |
| T-008 | diagram_work | Stabilise diagram arguments and reconcile figure briefs with thesis | blocked_until_research_stable | 8 |
| T-009 | diagram_work | Create and verify contextual editable thesis diagrams | deferred | 9 |
| T-010 | peer_review_preparation | Prepare a coherent thesis candidate and scoped peer-review materials | deferred | 10 |
| T-011 | peer_review | Conduct and reconcile substantive independent peer review | not_started | 11 |
| T-012 | release_integrity | Verify thesis release integrity and remove disposable work area | deferred | 12 |
| T-013 | research_model | Formalise privacy-preserving verifiable message-set closure (Candidate D) | in_progress | 1 |

## Current execution

**Current active work:** T-013 Candidate D formalisation is in progress. The prior-art comparison now includes APIR (SRC-054), full AAD (SRC-055), range APIR (SRC-056, indexed-text only because the PDF returns 403), vPIR (SRC-057), multi-query vPIR (SRC-058), VPRQ (SRC-059, abstract/introduction only) and Basudan/Alamer's leakage-suppressed range scheme (SRC-060, full paper reviewed). Generic private/verifiable range retrieval is prior art; the remaining hypothesis is narrower: OMR-specific hidden-predicate completeness over a dynamic authenticated publication snapshot, sender-authenticated admission and multi-carrier manifest closure, with controlled access-volume, cross-epoch and selective-failure leakage. T-007 was complete for the previous checkpoint and must be rerun after T-013 integration. T-001–T-004 remain blocked on full papers/artifacts or live route configurations. T-006 remains complete for the current evidence set.

**Next:** formalise the adversary/collusion and admission model, exact soundness/completeness/closure statements, leakage function and cost model; test whether the nearest prior art already satisfies the model before proposing a construction. Full SRC-056 PDF and SRC-059 technical paper remain inaccessible; preserve their indexed/abstract-only status. Then rerun T-007 consistency checks.
## Status meanings

- `ready`: unblocked and not started.
- `in_progress`: active work; may span multiple coherent commits.
- `blocked`: a specific dependency, access barrier or decision prevents progress; record it in the keyed value.
- `deferred`: intentionally postponed by a recorded gate/dependency.
- `complete`: outcome integrated, limits recorded and post-commit read-back verified.
- `not_started` / `blocked_until_research_stable`: reserved for future gated work.

## Sequence and dependencies

T-006 thesis-first synthesis (complete for current evidence set); T-013 Candidate D formalisation (in_progress); T-001–T-003 source review where material; T-004 route evidence (blocked on controlled access); T-005 protocol analysis (complete); T-007 final coherence review (complete for prior checkpoint; rerun after T-013 integration); T-008–T-009 diagrams only after research stabilises; T-010–T-011 peer-review preparation and actual review; T-012 release integrity and eventual disposal of `/work/`.

Detailed next actions, targets, blockers and dependencies are stored once in the keyed JSON values. Do not duplicate a second task plan here.
