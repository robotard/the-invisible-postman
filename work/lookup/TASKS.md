# Internal work backlog and continuation keys

**Project maturity:** Theory only · No implementation · Not audited.  
**Scope:** Internal task coordination only; task status does not imply implementation, testing, audit or independent review.

**Canonical registry:** [TASKS.json](TASKS.json)  
**Schema:** `tip.work.registry.v3`  
**Rule:** JSON is the keyed source for task lookup; this file is its human-readable index. The thesis and enduring research records remain authoritative for substantive work.

Task keys are immutable internal lookup handles, not thesis references, source IDs, evidence identifiers or publication metadata. A task is complete only when its outcome is reconciled into the thesis and/or enduring research records, its evidence limits and disposition are recorded, and the commit has passed exact post-commit read-back verification. IDs are never recycled.

| Key | Type | Task | Status | Priority |
|---|---|---|---|---:|
| T-001 | source_review | Complete full-text/source review of SRC-033, SRC-034 and SRC-036 | deferred | 2 |
| T-002 | source_review | Review SRC-046–SRC-048 full texts and SRC-047 implementation where available | deferred | 3 |
| T-003 | source_review | Review SRC-049 paper, formal security argument and complete results | deferred | 4 |
| T-004 | route_analysis | Pin versioned Dropbox, Signal and Katzenpost/Pigeonhole profiles | deferred | 5 |
| T-005 | protocol_analysis | Reconcile protocol-boundary analysis into W2/W3/W4, decisions and thesis | complete | 5 |
| T-006 | research_synthesis | Reconcile new route/source findings into W1–W4 and thesis | complete | 1 |
| T-007 | thesis_synthesis | Final thesis alignment and cross-document consistency review | complete | 1 |
| T-008 | diagram_work | Stabilise diagram arguments and reconcile figure briefs with thesis | blocked_until_research_stable | 8 |
| T-009 | diagram_work | Create and verify contextual editable thesis diagrams | deferred | 9 |
| T-010 | peer_review_preparation | Prepare a coherent thesis candidate and scoped peer-review materials | deferred | 10 |
| T-011 | peer_review | Conduct and reconcile substantive independent peer review | not_started | 11 |
| T-012 | release_integrity | Verify thesis release integrity and remove disposable work area | deferred | 12 |
| T-013 | comparative_prior_art | Formal model of server-dependent private/verifiable retrieval (former Candidate D) | complete | 1 |
| T-014 | prior_art_boundary | Audit APIR server dependencies against endpoint-only message architecture | complete | 1 |
| T-015 | design_synthesis | Integrate optional sender-controlled message granularity | complete | 2 |
| T-016 | packaging | Produce and verify the upload-ready working repository ZIP | blocked | 9 |

## Current execution

**Current position:** T-005–T-007 and T-013–T-015 were complete for their prior recorded scope; T-007 is reopened for the targeted 66-source consistency pass after SRC-062–SRC-066 integration. Former Candidate D is retired as an architecture/contribution candidate; APIR remains comparative prior art only. T-001–T-004 remain deferred optional evidence expansions. T-008 is blocked pending research stability; T-009 remains deferred; T-010–T-012 remain later review/release gates. T-016 records the requested working ZIP and is blocked on T-009. No ZIP has been generated.

**Next:** complete the post-commit 66-source consistency check, then continue thesis-first research where a defined claim or contradiction justifies it. Do not start T-016 until T-009 is complete. Keep `WORKPLAN.md` as the stable roadmap.

## Status meanings

- `ready`: unblocked and not started.
- `in_progress`: active work; may span multiple coherent commits.
- `blocked`: a specific dependency, access barrier or decision prevents progress; record it in the keyed value.
- `deferred`: intentionally postponed by a recorded gate/dependency.
- `complete`: outcome integrated, limits recorded and post-commit read-back verified.
- `not_started` / `blocked_until_research_stable`: reserved for future gated work.

## Sequence and dependencies

T-006 thesis-first synthesis (complete for current evidence set); T-013 former Candidate D comparative model (complete, prior-art only); T-014 APIR server-dependency audit (complete); T-007 final architecture-alignment/consistency review (complete); T-001–T-003 optional source review (deferred pending a claim-specific need); T-004 controlled route evidence (deferred, not a thesis dependency); T-005 protocol analysis (complete); T-008–T-009 diagrams only after research stabilises; T-016 working ZIP after T-009 and separate from T-012; T-010–T-011 peer-review preparation and actual review; T-012 frozen release integrity and eventual disposal of `/work/`.

Detailed next actions, targets, blockers and dependencies are stored once in the keyed JSON values. Do not duplicate a second task plan here.
