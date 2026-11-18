# Route / Fault / Evidence Matrix

**Purpose:** Operational test sheet for prior-art comparison §10.3 and thesis §8.8.  
**Status:** Documentary design only. No route test, implementation, platform experiment or benchmark has been run.

This matrix turns the decision-relevance test into a small, falsifiable comparison. It does not force one common transaction onto routes whose native units differ. A single file, a per-message ratchet, a capability-addressed asynchronous copy, a multi-image fragment set and an OMR retrieval window are not interchangeable objects.

## 1. Common endpoint fixture

Use one deterministic protected logical object and one declared use case. The fixture is an evaluation aid, not a selected wire format.

Record before testing:

- Fixture ID/version; endpoint-held test-object digest.
- Sender and recipient test-key identifiers and the identity/session scope being asserted. A test key is not a human identity.
- Protected-object digest, authenticated context and endpoint validation policy.
- Freshness interval, replay state and expected stale/replay response.
- Resource limits: object size, fragment/carrier count, retrieval window, retry budget and maximum candidate count.
- A manifest only where fragmentation/set semantics are actually used. It declares expected unique member IDs, positions/count and protected-object digest. Single-file and per-message baselines do not receive an artificial manifest.
- Test-harness ground truth, kept distinct from endpoint evidence: intended/published object and member IDs, submission time and controlled availability window. The receiver endpoint separately records what it actually obtained, validated and accepted/rejected.

For the multi-image comparator use **S=2 fragments, r=4 redundant carriers per fragment (eight stego carriers)**. This is a small semantic fixture, not a reproduction of SRC-043's 1,000-image benchmark. Do not transfer its reported percentages to this fixture.

## 2. Native route baselines and evidence boundary

| Profile | Native unit | What current evidence supports | Still unpinned or unproven |
|---|---|---|---|
| **IMG-QIAO-2023** (SRC-035) | One image-carried payload under published social-image study paths | Published extraction/recovery outcomes for stated BOSSbase/JPEG and Facebook/Twitter/WeChat paths | Current app/server versions, account modes, repeated trials and independent reproduction |
| **IMG-MRAS-2026** (SRC-033) | Robust JPEG image payload under described social-platform/recompression method | Publisher-indexed description and claimed LinkedIn/recompression metric families | Full text, exact data/payload settings, result tables and pinned platform configuration |
| **IMG-DRAS-2026** (SRC-034) | JPEG payload under downward-recompression conditions | Publisher-indexed description of Q95→Q85/Q80/Q75 and named WhatsApp/LinkedIn/X paths | Full methods, datasets/payloads, baseline tables and pinned platform/client versions |
| **IMG-MULTI-SRC043** (SRC-043; supplemental set baseline) | One file divided into S numbered fragments, each redundantly carried in r images | Fragment numbering, majority vote, partial byte recovery and explicit missing-byte marker `?` | No authenticated endpoint manifest/set acceptance or global publication-completeness proof; benchmark not reproduced |
| **FILE-DROPBOX-LINK** (SRC-039) | One file object via direct invitation or view-only shared link | Documented permission/activity surfaces and distinction between direct invite and link access | Account plan, link settings, viewer-info option, recipient sign-in, retention and live event records |
| **E2E-SIGNAL-PROTOCOL** (SRC-038) | Individual authenticated protocol messages within PQXDH/Double Ratchet session state | Key establishment, message authentication/ratchet state, skipped-message and replay semantics at protocol level | Not an app/service deployment; delivery/read receipts, backend queue, account and linked-device state are not established by protocol documents |
| **MIX-ECHOMIX-PIGEONHOLE** (SRC-032, SRC-040) | Capability-addressed asynchronous storage/copy and stream relationships | Published role/observer model, capabilities, storage semantics and compatible pinned source versions | No running deployment, topology, directory state, service-event capture or reader-visibility experiment; AllOrNothing spec/source discrepancy unresolved |



The three single-image study profiles are separate literature configurations, not one common live platform deployment. A result from one paper or platform mode must not be copied into another profile.

**Separate discovery/retrieval comparators, not storage baselines:** OMR/GOMR, PerfOMR, SophOMR, InstantOMR, StOMR and UnifOMR (SRC-020, SRC-024, SRC-028–SRC-030, SRC-050–SRC-051; secondary assessment SRC-053) concern recipient pertinence, private retrieval, state and efficiency. SRC-052 is a third-party experimental UnifOMR wallet/server integration. Its service-range `complete` flag, slot map, whole-height truncation and cursor retry are retrieval-window semantics, not proof that a logical message's entire carrier set was published or accepted. StOMR's camera-ready paper and selected artifact source are directly reviewed; UnifOMR's primary paper remains inaccessible directly in this project, but SRC-053 provides a detailed third-party assessment based on a claimed full 56-page review. SRC-052's deployment/test claims are self-reported and not reproduced. StOMR's stateful counter and OMR-KEM bootstrap are relevant to persistent private retrieval, but its passive receiver-privacy model does not cover active detector deviation or service omission. Its 32-bit PRF signal outputs also require a concrete collision-margin caveat: the paper's Appendix C.1 all-pairs upper bound is about 0.5 at a 2^16-entry board, though this is not a target-specific false-match estimate. Do not treat the BFV ≥128-bit parameter claim as covering that separate tag-collision term. The UnifOMR assessment reports that malicious-detector privacy does not itself guarantee correct or complete candidate output; it also flags unresolved false-positive/capacity accounting (`T + F <= B`) without establishing a defect. Keep incomplete/divergent candidate-view faults native to the OMR retrieval comparison, but do not equate candidate selection with duplicate or conflicting authenticated message-set members.

## 3. Fault applicability matrix

Legend: **N** = fault maps to the route's native unit; **W** = meaningful only if a test wrapper adds set/version semantics; **?** = current source evidence does not establish route behaviour; **—** = not meaningful for the native unit. A mark describes applicability, not successful detection or mitigation.

| Fault | Single-image studies (Qiao/MRAS/DRAS) | SRC-043 multi-image set | Dropbox single file | Signal per-message | Pigeonhole storage/copy | katzenqt app assembler | OMR retrieval |
|---|---:|---:|---:|---:|---:|---:|---:|
| Baseline complete delivery | N | N | N | N | N | N | N |
| Delayed or withheld item | N | N | N | N | N | N | N |
| Missing object or route-native unit | N | N | N | N | N | N | N |
| Duplicate item | W | N | W | N* | W | N | W |
| False-positive candidate overflow / padded PIR capacity | — | — | — | — | — | — | N* |
| Signal-tag collision / false candidate | — | — | — | — | — | — | N* |
| Stateful counter rollback/fork or concurrent sender state | — | — | — | — | — | — | N* |
| Conflicting item at an existing position | W | N | W | W | W | N | W |
| Reordering | W | N | — | N* | W | N | W |
| Stale/replayed protected object or protocol message | W | W | W | N* | W | W | W |
| Incomplete or divergent candidate view | ? | ? | ? | ? | ? | ? | N |
| Service acknowledgement without endpoint acceptance | N | ? | N | ? | N | N | N |

* Signal's protocol state handles duplicate/replay and out-of-order message-key cases; this does not create an arbitrary multi-message transaction. N* applies to protocol messages, not arbitrary service responses or product-level delivery receipts. The OMR N* rows are source-specific: StOMR's 32-bit PRF signal outputs have an Appendix C.1 all-pairs upper bound of about 0.5 at a 2^16-entry board (not a target-specific false-match estimate), and its stateful counter model leaves production rollback/fork/concurrent-state recovery unspecified. SRC-053 reports an UnifOMR false-positive/candidate-capacity accounting question (`T + F <= B`); it is a secondary-source question, not an independently verified defect. OMR false positives/candidate selection are not equivalent to duplicated authenticated message-set members.

Apply only faults meaningful to the native route. Mark non-applicable cases rather than manufacturing a common transaction. Pigeonhole storage/copy and katzenqt application assembly are separate columns because a conflict or reordering fault may be meaningful only at the application chunk-chain layer. The raw Pigeonhole copy has no common fragment-position manifest in the inspected sender API.

### Image-specific transformation faults

These are separate from message-set faults and apply to image-carriage profiles only. The named study results are not interchangeable or a current universal platform characterisation.

| Transformation fault | Qiao | MRAS | DRAS | SRC-043 multi-image | Required observation |
|---|---:|---:|---:|---:|---|
| Resize/resampling | ? | ? | ? | ? | Dimensions before/after, interpolation and extraction result |
| Rotation / scaling / cropping | ? | ? | ? | N | Geometry before/after and extraction/reconstruction result |
| JPEG recompression / quality reduction | N | N | N | ? | Input/output quality, encoder/client, payload survival and extraction error |
| Format conversion / transcoding | ? | ? | ? | ? | Source/destination format, colour subsampling, metadata and extraction result |
| Metadata stripping/rewrite | ? | ? | ? | ? | Exact metadata fields changed; whether payload is in pixels or metadata |
| Moderation/removal/re-encoding | ? | ? | ? | ? | Post visibility/removal event, resulting bytes and independent service evidence |
| Carrier loss / unavailable object | ? | ? | ? | N | Missing carrier count, fragment coverage and endpoint acceptance result |

Here **N** means the cited study explicitly includes this transformation/loss as a comparison condition; **?** means the current source review does not establish it and a controlled test would be needed. Applicability alone does not mean a paper has tested the fault. The current matrix does not claim that any named platform applies a specific transformation universally.

For Dropbox, do not invent fragment order for a single file. For Signal, do not infer service receipts from protocol authentication. For Pigeonhole, separate sender/courier result from recipient-visible state. For OMR, separate private candidate retrieval from proof that the candidate view is globally complete.

### Minimum fault cases

1. Complete delivery.
2. Delayed or withheld item.
3. Missing item (for SRC-043: one redundant copy missing, then all copies of one fragment missing).
4. Duplicate item.
5. Conflicting item at an existing position.
6. Reordered item.
7. Stale/replayed protected object or protocol message (service-response replay only where that route exposes it).
8. Incomplete or divergent candidate view.
9. Service acknowledgement that precedes, or fails to imply, endpoint acceptance.

The Pigeonhole-specific atomicity probe is a later write delayed or rejected after an earlier destination write succeeds, with a recipient who already has the destination capability reading concurrently. Record whether the prefix is visible; do not infer it from the sender's error result. Test raw Pigeonhole and the katzenqt application assembler separately.

## 4. Three evidence ledgers

Keep the ledgers separate. One event may appear in more than one ledger, but its authority and meaning must not be silently promoted.

| Ledger | Required fields | What it can establish | What it cannot establish by itself |
|---|---|---|---|
| **A. Endpoint ground truth and authenticated transitions** | Fixture/trial ID; endpoint actor; object/manifest ID; expected/received members; authentication result; reconstruction digest; freshness/replay decision; accepted/rejected state; local timestamp and state transition | What the controlled endpoint received, validated and accepted under the declared policy | That a carrier was published without independent publication evidence; that a human saw or understood it |
| **B. Route/service reports** | Profile/version/config; reporting actor/service; operation/request ID; object or range scope; status/ack; completeness semantics; timestamps; retry/retention result; source/provenance | What the route/service claims it did, and the scope of that claim | Endpoint validation, global publication completeness, reader visibility unless directly observed, or human receipt |
| **C. Observer-visible and inferred events** | Named observer/capabilities; captured event; vantage/source; collection window; side information; collusion assumptions; uncertainty; absent vs not observed vs unavailable; inferred correlation | What a stated observer could see or infer under recorded conditions | Endpoint ground truth or proof that an unobserved event did not occur |

A service `complete` flag must be recorded with its precise scope (for example, service cache-range coverage), not copied into the endpoint ledger as message-set acceptance. Preserve **unknown**, **not observed**, **unavailable**, **failed** and **not applicable** as different values.

## 5. Decision output

For each profile/fault pair record:

- Does the route satisfy the declared use case under the endpoint policy? **Yes / no / conditional / unknown**.
- What happened at the route-native layer?
- What authenticated endpoint transition occurred?
- What evidence is available to each named observer, and what remains ambiguous?
- Does the result change a route choice, invalidate an assurance claim, or expose a failure/evidence gap not already explicit in prior art?
- Record latency, bytes, storage, processing, user effort and route-specific exposure only where actually measured. Do not fill documentary gaps with estimates presented as results.

Candidate C survives only if the matrix produces a reproducible, decision-relevant result or rigorous counterexample beyond prior art. If it only confirms that every route needs ordinary endpoint validation and exposes different native service evidence, retain the matrix as a useful comparison method, not as an original mechanism.

## 6. Execution boundary and smallest next experiment

**Can be completed now from public sources:** fill documentary cells, pin each source/version, state each route's native unit, and distinguish paper/protocol claims from product/deployment evidence. This document is that first-pass matrix.

**Requires controlled access or execution:** live Dropbox account/link configuration; Signal test accounts/devices and product/service behaviour; a compatible Pigeonhole deployment and concurrent-reader probe; repeated image-platform upload/download and transformation capture; and performance/latency/byte measurements. None is implied by this documentary matrix.

The smallest decision-relevant controlled fixture is:

1. One protected object and endpoint validation policy.
2. A single-file Dropbox baseline, a per-message Signal protocol baseline (or product test only if available), a raw Pigeonhole copy plus separate katzenqt assembler, and an SRC-043-style S=2/r=4 image fragment set.
3. Complete, delayed/withheld, missing, duplicate/reordered, stale/replayed and uncertain-acknowledgement cases, with only route-applicable faults injected.
4. The three ledgers above, captured independently.
5. A route-decision statement tied to the declared use case.

This is a test specification, not an executed experiment. Do not begin diagrams or raise contribution status on the basis of the matrix alone.

## 7. Links and source boundaries

- [Prior-art comparison §10.3](prior-art-comparison.md#103-decision-relevance-test-and-candidate-boundary)
- [Route comparison framework](route-comparison-framework.md)
- [Observer/property matrix](observer-property-matrix.md)
- [Multi-message linkage and steganographic carriage](multi-message-linkage-and-steganographic-carriage.md)
- [Source register](source-register.md)
- [Traceability register](traceability.md)
