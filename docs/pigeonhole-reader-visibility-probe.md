# Pigeonhole Reader-Visibility Probe

**Status:** Test design only. Not implemented or executed.  
**Purpose:** Resolve the specification/implementation gap recorded in SRC-040 without converting source inspection into a vulnerability claim.

## 1. Question

Pigeonhole's specification claims reader-side AllOrNothing semantics for a copy stream: the recipient should not observe a successful prefix of an associated set if a later write fails. The pinned v0.0.90 courier path processes decoded envelopes sequentially, persists each successful dispatch independently, and returns failure on a later rejected write without an observed rollback path. Whether a recipient can actually read that prefix is unknown.

**Falsifiable question:** when envelope 1 has been accepted and persisted, but envelope 2 is rejected, can a recipient holding the destination ReadCap observe envelope 1 before or after the sender receives CopyStatusFailed?

Do not infer reader visibility from sender status or direct database inspection alone.

## 2. Pinned source basis

Repository: katzenpost/katzenpost, tag v0.0.90, commit d5a6349a34c4a2d4bca587f4be86ce92f2873b12.

| Source | Pin / location | What it establishes |
|---|---|---|
| courier/server/plugin.go | blob ef60bf2c6fdc98a7b9252a1c0de35e2f45b8eaa0; processCopyCommand at line 880; sequential envelope loop at 903–944; failure index at 895–897 and 919–938; tombstone cleanup at 952–962 | The courier decodes and dispatches envelopes in order, increments envelopesProcessed after each successful dispatch, and reports the next failed envelope index. Tombstones are best-effort after destination writes; no rollback is shown in this path. |
| courier/server/plugin.go | dispatchCopyEnvelope at line 991; semantics/comments at 965–990 | Each envelope is sent to two intermediate replicas. The dispatch returns success if at least one intermediate reply indicates success; a non-success replica reply aborts the copy. |
| courier/server/copy_dispatch_test.go | blob c7a481d0e5a0a3fcccd8fa86fe3168aabe0b0566; tests at 117–167 | Unit tests cover one-envelope dispatch rejection and the “one success counts as success” case. They do not run a multi-envelope stream with a later failure and concurrent reader. |
| courier/server/copy_status_propagation_test.go | blob 77dc561652858f9fab0a948faf515dda866d27c1; tests at 32–64 and 95–142 | Status/error/index propagation and concurrent polling are tested using a stubbed processCopyCommand. This does not test destination visibility or rollback. |
| client/pigeonhole.go | blob 06dae7d74339c4b7925546f796fdcf0b4fd7dc8b | The inspected thin-client sender path starts/polls Copy and relays status/error/index. It exposes no recipient-side commit control. |
| replica/state.go | blob fdafeaf7050f78a4eb6c5d304b62fbfb8529bc06; handleReplicaWrite at line 366 | Replica write/persistence path to instrument for per-envelope acceptance and durable-write timing. |

The protocol specification's reader-side AllOrNothing claim and the source observations above must remain separate. The source review establishes sequential dispatch and no rollback in the inspected path; it does **not** establish that a concurrent reader can see a prefix.

## 3. Test topology and fixture

Use a valid two-envelope CopyStream with two distinct destination boxes, A and B, under one WriteCap. The recipient holds the corresponding ReadCap(s) before the test begins.

- Envelope E1 writes destination A.
- Envelope E2 writes destination B.
- Both envelopes are valid in the success control.
- For the later-failure case, force E1 to receive the success condition used by dispatchCopyEnvelope, then force E2 to fail on both intermediate replicas (or exhaust the transport retry budget). A single successful intermediate reply makes that envelope count as successful, so one rejection alone is not a deterministic failure injection.
- Prefer a real local courier/replica test topology with a fake connector or deterministic replica fault injector. Do not stub processCopyCommand itself: that would bypass the sequential decode/dispatch loop under test.
- Add a test-only barrier after E1's successful dispatch and before E2's dispatch, or use a fake connector that blocks E2 replies. While the barrier is held, poll the recipient ReadCap through the normal reader API.
- Use the replica topology required by the specific protocol claim. Record the configured number of replicas and the two intermediate replica IDs for each envelope. A reduced topology may be useful diagnostically but must not be presented as the full deployment condition.

## 4. Cases

| Case | E1 | E2 | Reader observation | Purpose |
|---|---|---|---|---|
| C0 · Success control | succeeds | succeeds | Poll before, during and after; eventually both A and B must be readable | Establish normal completion and reader path |
| C1 · First-write failure control | fails | not attempted | Poll A and B | Confirm no successful prefix exists when the first dispatch fails |
| C2 · Later-write rejection | succeeds and persists | both intermediate replicas reject | Poll while paused after E1, immediately after E2 failure, and after terminal sender status | Primary AllOrNothing reader-visibility test |
| C3 · Later-write timeout | succeeds and persists | no qualifying reply before retry budget expires | Poll during retry and after terminal failure | Distinguish replica rejection from transport uncertainty |
| C4 · Retry after failure | repeat C2, then retry the same WriteCap/stream according to supported client semantics | record idempotent/conflict result and reader view | Determine whether retry changes visibility or only terminal status |

For C2, the deterministic failure should be a replica rejection such as InvalidSignature or a controlled destination conflict, with the exact error code and per-replica replies recorded. Do not use an uncontrolled network interruption as the only failure case.

## 5. Observation schedule and evidence

At each time point, capture the sender, replica and reader views independently:

- **T0:** before Copy begins.
- **T1:** after E1 is accepted/persisted and before E2 is dispatched.
- **T2:** after E2 is rejected or times out, before the sender receives/polls the terminal status.
- **T3:** after CopyStatusFailed is returned, including ErrorCode and FailedEnvelopeIndex.
- **T4:** after any permitted retry or eventual cleanup/retention interval.

Record three evidence ledgers:

1. **Sender/service:** CopyCommand request ID; WriteCap hash; CopyStatus; ErrorCode; FailedEnvelopeIndex (expected 2 in the C2 two-envelope case); per-envelope dispatch result; both intermediate replica IDs/replies; retries and timestamps.
2. **Replica persistence:** envelope hash; replica ID; accepted/rejected status; durable-write timestamp; idempotent retry/conflict result. Direct storage inspection is diagnostic evidence, not a substitute for the reader API.
3. **Recipient endpoint:** ReadCap/API result for A and B at T0–T4; returned envelope IDs and digests; authentication/decryption/validation outcome; explicit endpoint acceptance/rejection state.

The primary observation is the recipient's normal ReadCap path while the test barrier is held. Record a failed read, empty result, timeout and unavailable replica separately; do not silently classify them as “not present”.

## 6. Interpretation rules

| Outcome | Interpretation |
|---|---|
| Neither A nor B is reader-visible during C2 or after failure; both become visible only after a successful complete retry | Consistent with reader-side atomic visibility for this tested path and topology. It does not prove the property for all configurations. |
| A is reader-visible at T1 while B is absent | Reader-visible prefix; inconsistent with the stated reader-side AllOrNothing expectation for this tested path. |
| A remains reader-visible after C2 has returned Failed with FailedEnvelopeIndex=2 | Strong evidence of partial reader-visible persistence after a failed copy. Preserve the full trace before drawing a conclusion. |
| Replica storage contains A but ReadCap cannot expose A until the set completes | Storage is not atomic, but reader-level visibility may still be gated elsewhere. Identify and test that gate. |
| Sender reports Succeeded but the recipient cannot read/validate both objects | Sender/courier completion is not endpoint acceptance; investigate eventual consistency, retention and reader path separately. |
| Reader observation is unavailable or timing cannot be controlled | Inconclusive. Do not infer atomicity or its absence. |

A source-level absence of rollback is a reason to run C2, not proof of a reader-visible violation.

## 7. Separate katzenqt application-gate test

Run a distinct application-level test with the same two-piece logical chain:

- Deliver/store E1 but omit E2 and the terminal F marker.
- Confirm whether the piece is stored and whether the conversation log remains unchanged.
- Deliver E2 and the terminal F marker with a complete contiguous decodable chain.
- Confirm the application dispatches the completed message only after its chain rule is satisfied.
- Repeat with a duplicate, conflicting index and reordered arrival.

This tests katzenqt's application continuity gate. It must not be reported as Pigeonhole storage atomicity, and raw ReadCap visibility must not be inferred from the conversation log.

## 8. Existing coverage and remaining gap

The pinned courier tests exercise single-envelope dispatch outcomes, error propagation, and concurrent polling of Copy status. The status tests stub the worker; they do not observe destination reads. No inspected test covers E1 success followed by E2 failure while a recipient concurrently reads both destinations.

The new test should therefore retain the real sequential processCopyCommand loop and real recipient ReadCap path. If a test seam is required, inject only the second-envelope replica outcome or a barrier; do not replace the worker whose sequencing is under test.

## 9. Completion criteria

The probe design is complete when the test can:

1. deterministically make E1 succeed and E2 fail after E1 persistence;
2. pause between the writes and poll the normal recipient ReadCap path;
3. capture the terminal Copy status and FailedEnvelopeIndex;
4. distinguish replica persistence from reader visibility and application display;
5. reproduce C0 and C1 controls; and
6. report an outcome as consistent, inconsistent or inconclusive without extrapolating beyond the tested topology.

**Execution status:** not run. No implementation, deployment, benchmark, security proof or independent audit is claimed.
