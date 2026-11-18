# The Invisible Postman: Project State

**Checkpoint:** 2026-11-18 · UnifOMR primary paper directly reviewed; candidate-capacity ambiguity integrated; T-006 source audit active  
**Branch:** `main`  
**Maturity:** Theory only · No implementation · Not audited.

## Resume contract

When the user says **continue**:

1. Read this file, `WORKPLAN.md`, `WORK_LOG.md`, both session digests, the task registry and relevant research documents.
2. Reconcile live repository state and commit history; GitHub is authoritative.
3. Select the next unfinished, unblocked substantive task. Do not stop after planning.
4. Ask the user only for material input, access, permission or decisions that cannot be obtained independently. Continue all other unblocked work.
5. Update research documents when the argument/evidence changes; update task records only when status or next action changes.
6. Fetch changed files back and verify saved content before claiming completion.

Operational documents have distinct roles: `PROJECT_STATE.md` is current state; `WORKPLAN.md` is the stable roadmap; `WORK_LOG.md` is chronology; `TASKS.md`/`TASKS.json` are the task registry; `SESSION_DIGEST.md`/`.json` are the compact handover. Avoid duplicating the same narrative across them.

## Current research position

- The active manuscript is `thesis.md`. Relationship authority, receiver acceptance, cross-route discovery and adversarial event-chain analysis are integrated across the thesis and W1–W4.
- The six named route profiles are IMG-QIAO-2023, IMG-MRAS-2026, IMG-DRAS-2026, FILE-DROPBOX-LINK, E2E-SIGNAL-PROTOCOL and MIX-ECHOMIX-PIGEONHOLE. SRC-043 is a supplemental multi-image fragment/redundancy baseline; OMR-family work is a separate discovery/retrieval comparator.
- The contribution boundary is now narrow: generic endpoint acceptance, authenticated manifests, completeness, whole-object integrity, freshness and replay handling are standard protocol obligations, not a novel mechanism. Candidate C survives only as a reproducible cross-route evaluation method if a controlled result changes a route decision, invalidates a material assurance claim or exposes a failure/evidence ambiguity not already explicit in prior art.
- Completeness is typed: carrier inventory, fragment-set completeness, byte reconstruction, storage atomicity, application continuity, retrieval-window coverage, endpoint logical-message acceptance, publication/index completeness and human receipt are not interchangeable.
- `docs/route-fault-evidence-matrix.md` is the first documentary test sheet. It records route-native units, fault applicability, three evidence ledgers and controlled-access boundaries. It is not an executed experiment.

## Material evidence boundaries

- **SRC-043:** multi-image file fragmentation and redundant carriage; majority-voted copies; partial byte recovery with missing bytes marked `?`. Its reported 61.1% at 80% carrier loss is a byte-recovery metric, not authenticated logical-message acceptance.
- **Pigeonhole / Katzenpost (SRC-040):** the specification claims reader-side AllOrNothing semantics; the pinned server source path writes destination envelopes sequentially without rollback on the inspected early-failure path. Concurrent reader visibility remains untested. `katzenqt 0.0.2` separately gates conversation-log dispatch on a complete contiguous chain; this is application-level gating, not atomic storage.
- **StOMR (SRC-050):** full camera-ready paper and selected CPU/GPU artifact source inspected. Its adversary is passive and protocol-following; OMR-KEM key delivery does not authenticate a human/contact identity; stateful group OMR is future work; the inspected artifact is a local synthetic matching/compression/decode harness, not a networked deployment or visible OMR-KEM integration. The evaluation uses 32-bit PRF signal outputs; Appendix C.1's all-pairs collision upper bound is approximately 0.5 at a (2^{16})-entry board. This is a loose global bound, not a target-specific false-match estimate, and is separate from the ≥128-bit BFV parameter claim. Production rollback/fork/concurrent-state recovery is not specified.
- **UnifOMR (SRC-051):** the complete 56-page primary paper is directly reviewed. It uses a two-round clue-detection plus batch-PIR flow; privacy against malicious/colluding parties is distinct from completeness/soundness under an honest-but-curious detector, and malicious single-server integrity is an open problem. Algorithm 1 randomly truncates candidate sets larger than k̄, but the formal completeness condition bounds true pertinent messages and does not reconcile false-positive candidates with that capacity. This is a primary-text accounting ambiguity, not a demonstrated failure. SRC-053 is a secondary assessment now cross-checked against the primary paper. The cited GitHub repository appears to be the older 2021 OMR proof of concept, not an identifiable UnifOMR artifact.
- **SRC-052:** third-party experimental wallet/lightwalletd integration, not the paper authors' official artifact or production evidence. It implements service-range completeness, slot maps, whole-height truncation, cursor retry, striped PIR and trial-decrypt fallback. Its default server build excludes OMR and funded end-to-end checks remain open.
- **Dropbox / Signal:** official documentation/protocol and public client release snapshots are pinned. No live Dropbox account/link configuration, Signal app/backend/account state or product service-event capture is available.
- **Image profiles:** Qiao full-text study evidence is recorded; MRAS/DRAS full-text access remains incomplete and claims are bounded to inspected publisher-indexed material.

## Active work, in priority order

1. **T-006 · Source-audit and test-design.** Image-specific transformation cells have been compared with SRC-035, SRC-033, SRC-034 and SRC-043; unsupported transformations remain unknown. Next, design the Pigeonhole successful-prefix/later-failure concurrent-reader probe from pinned v0.0.90 source and thin-client v0.0.23 API/tests. Then finish Signal and Dropbox product/service evidence boundaries. Keep protocol claims separate from product behaviour; preserve OMR candidate-view, StOMR collision/state and SRC-053 secondary-source distinctions.
2. **T-001–T-003 · Source access.** Continue full-text/code access where it materially resolves a thesis claim, including the incomplete image and sanitizer sources. Partial-review labels remain mandatory; inaccessible sources must not stall unrelated thesis work.
3. **T-004 · Route configuration evidence.** Public Dropbox/Signal/Katzenpost references are pinned. Actual Dropbox account/link settings, installed Signal client/backend/account configuration and a running Katzenpost deployment/service-event capture remain unavailable.
4. **T-007 · Coherence/review.** Terminology, citations, traceability and cross-document audit remain gated until substantive synthesis stabilises.
5. **Diagrams, external review and release** remain gated. Do not start illustration or release packaging merely because a matrix or checkpoint exists.

## Exact next action

1. Design the Pigeonhole successful-prefix/later-failure concurrent-reader probe from pinned v0.0.90 source and thin-client v0.0.23 API/tests. Specify the fault injection, reader timing, observable state, endpoint/service evidence and outcomes that distinguish specification-level AllOrNothing from reader-visible partial persistence. Do not claim the probe has been run.
2. Audit Signal protocol guarantees separately from product/service behaviour: message-key replay and out-of-order handling, delivery/read receipts, linked devices, backend queues and account state.
3. Audit Dropbox's direct-invitation and view-only-link paths, owner/editor-visible activity, configurable viewer information, plan-dependent history, Guest views and direct downloads; keep live account configuration explicitly unpinned.
4. Update the matrix and thesis only where findings change an evidence boundary or route decision. Keep all controlled tests gated on access to the relevant accounts/devices/deployments.

The next controlled tests require accounts, devices or deployments that are not currently available. Do not imply they have been run.