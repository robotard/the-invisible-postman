# Route Comparison Framework: Common Message Semantics Across Carriage Profiles

**Checkpoint:** 2026-11-16  
**Roadmap alignment:** W0.3 source reconciliation · W6 comparative evaluation  
**Status:** Theory only · No implementation · Not audited.

## 1. Purpose

This framework turns the current route-comparison intention into a reproducible research structure. It compares how the same *logical, endpoint-protected message task* behaves across materially different carriage profiles:

1. Image carriage through an ordinary image platform (required research route).
2. Encrypted file or attachment carriage.
3. A named conventional end-to-end messaging system, with version and configuration fixed before evaluation.
4. A mixnet-backed messaging baseline represented by Echomix/Katzenpost and its published design.

The comparison is not a claim that these routes are interchangeable or that each can carry the same wire object unchanged. Where a route has native message, identity, discovery or storage semantics, those must be described and preserved. The common unit is the communication task and the endpoint security objectives, not a forced common protocol implementation.

## 2. Common comparison unit

For each profile, define the same logical task:

- Two or more participants have independently verified cryptographic identities.
- A sender creates a message with explicit recipient, session and message context.
- The sender-side endpoint protects the message and authenticates the required context.
- The route publishes, stores, relays or otherwise carries the protected communication.
- The recipient discovers and retrieves it.
- The receiving endpoint validates, reconstructs where necessary, authenticates and decrypts it.
- Delivery failure, retry, expiry and deletion are treated as observable protocol events, not invisible implementation details.

Record where the profile cannot provide an equivalent task. Do not silently substitute a route's account identity for cryptographic identity or its delivery receipt for endpoint-confirmed receipt.

## 3. Observer and actor register
### 2.1 Functional roles and route composition

Record these functions separately even when one service performs several: **message protection** (endpoint creation and validation of the protected object), **encapsulation** (route-specific packaging/extraction), **transport** (each service that carries, stores, publishes, relays or retrieves the object), and **orchestration** (optional coordination of route selection, sequencing, delivery references, retries and state). Orchestration is not what makes delivery transport-agnostic and need not be deployed. It may also carry or relay data; if so, record its transit role and observer view separately from its coordination role. External carrier-generation services are additional dependencies, not sources of cryptographic entropy or trust.

The comparison unit is the complete declared route, including every hop and transition. For each boundary, record whether the observer sees the protected object, a transformed carrier, a locator, a delivery reference or only timing/metadata. More hops add observation and failure surfaces; they do not inherently improve anonymity, confidentiality or reliability. Keep the endpoint-protected message semantics constant across profiles where a valid comparison permits it. Any route-specific conversion that changes the protected object requires explicit protocol definition and security analysis.



| Observer / actor | Minimum observation to record | Additional active capability to consider |
|---|---|---|
| Sender endpoint | Plaintext, keys, route selection, publication and retry timing | Compromise, local logging/backup exposure |
| Recipient endpoint | Retrieval timing, local state, plaintext and validation outcome | Compromise, forced or deceptive interaction |
| Intermediary / coordinator | Identifiers, object references, status, timing and service permissions | Delay, suppress, duplicate, substitute, reorder |
| Image platform / file host | Account, upload/download events, object identifiers, media metadata, transformations and retention | Recompress, resize, transcode, moderate, remove, correlate accounts |
| Conventional messaging provider | Account/device identifiers, service metadata, delivery/read events, attachment processing and retention | Delay, suppress, alter service state, expose records |
| Mixnet gateway | Client connection, IP address and traffic volume/patterns as specified by the system | Drop, corrupt, duplicate or selectively delay |
| Mix nodes | Hop-local packet observations and timing | Compromise, collude, manipulate traffic |
| Service / storage replica | Requests, box/object identifiers, read/write times and stored material within its role | Withhold, misreport, correlate |
| Courier / relay | Envelopes, retry rates, response timing and route-local identifiers | Delay, suppress, repeat, collude |
| Contact / authorised reader | Message receipt and interaction timing | Malicious probing, online-state inference |
| Local network / ISP | Connection endpoints, timing, volume and service usage | Block, shape or selectively disrupt |
| Global passive observer | Available network-wide connection and traffic metadata | Longitudinal statistical correlation |
| Colluding observer set | Union of the relevant role-specific views | Correlate events across roles and time |

For every profile, state which actors exist, which are absent, which roles are combined, which are independently operated, and which collusion combinations are inside or outside scope.

## 4. Lifecycle event ledger

Every profile should map the following events to its actors and retained observations:

| Event | Required fields / questions |
|---|---|
| Identity preparation | What authenticates the participant? What is visible to a platform or service? |
| Session establishment | Who sees the key exchange, peer binding, timing and network endpoint? |
| Message protection | What is authenticated, encrypted, signed or otherwise protected? |
| Publication / send | What object, account, destination, size, timestamp and status are exposed? |
| Discovery / rendezvous | How does the recipient learn where to look? Who can link the lookup to the recipient or sender? |
| Retrieval / read | What query, access pattern, polling rate, receipt or read state is visible? |
| Transformation | What bytes, pixels, metadata, identifiers or content properties change? |
| Decapsulation / reconstruction | What is checked before the protected object reaches the endpoint protocol? |
| Validation / acceptance | Which endpoint checks determine authenticity, completeness, freshness and correct context? |
| Retry / reliability | What acknowledgements, retransmissions, backfills or user actions reveal state? |
| Expiry / deletion | Which copies, caches, logs, backups or replicas remain? What is actually removed? |
| Human interaction | What routine, timing, language, prompt or device habit can correlate participants? |

## 5. Profile-specific comparison requirements

### 5.1 Image carriage through an ordinary image platform

Record the named platform, application version, account configuration, privacy settings, image format, dimensions, colour profile, metadata before and after upload, server-side transformations, download path, file/object identifiers, moderation outcomes, visibility, retention and retrieval interaction.

Measure or record:

- Byte-level and pixel-level changes.
- Metadata fields removed, rewritten or introduced.
- File size and dimension changes.
- Extraction success/failure and error classification.
- Time from publication to discoverability and retrieval.
- Account, post, engagement and access records visible to each observer.
- Whether image transformations alter the protected carrier payload or only descriptive metadata.

Do not equate successful metadata stripping with absence of platform-side records. Do not infer anonymity from per-carriage image uniqueness.

Recent prior art makes the image-carriage evaluation a particularly demanding baseline. Robust social-platform steganography already addresses JPEG recompression and reports tests on real services (SRC-033, SRC-034, SRC-035). Active image processing intended to remove hidden payloads has also been studied (SRC-036), while the broader embedding/detection literature is surveyed in SRC-037. Therefore, this project must not treat image payload survival, recompression tolerance or concealment alone as a differentiator.

For each named route, distinguish at least four independent outcomes: (1) payload extraction after the observed transformation chain; (2) detectability under a declared steganalysis model; (3) endpoint authenticity/integrity of the recovered message; and (4) privacy leakage to platform, network and human observers. A successful extraction test does not establish undetectability, sender anonymity, recipient privacy or authenticated delivery. A failed extraction test does not establish that the platform intentionally removed the payload.

### 5.2 Encrypted file or attachment

Record filename, MIME type, file metadata, storage model, access control, sharing-link lifetime, account identity, scanning/transformation, download events, retention, backups and access logs.

Measure capacity, upload/download interruption, link disclosure, duplicate retrieval, file replacement, access revocation and residual server metadata. This is a serious baseline: a simpler file route may satisfy endpoint confidentiality without image-specific fragility.

### 5.3 Conventional end-to-end messaging

Select one named system and freeze its documented version/configuration. Record its identity/key verification, session/group model, server-visible metadata, delivery/read receipts, attachment handling, multi-device synchronisation, backups, retention, retry and deletion semantics.

Do not generalise one service's guarantees to all end-to-end messaging. Do not treat service delivery status as proof of endpoint authentication or recipient comprehension.

### 5.4 Mixnet-backed messaging (Echomix/Katzenpost baseline)

Record the paper/software version, topology, gateway/mix/service/courier/replica roles, directory authority assumptions, cover/application traffic coupling, capability distribution, storage and retention model, retry/acknowledgement policy, collusion model, latency, bandwidth and client online assumptions.

The comparison must include the paper's own residual observations: global observers see network participation and traffic patterns; contacts can infer activity within latency windows; replicas and couriers see role-specific request and retry metadata; certain colluding role pairs can combine observations; human online routines remain relevant. Preserve the system's native cryptographic and messaging semantics rather than pretending an image-carriage object can be inserted without adaptation.

## 6. Comparison dimensions and recorded outcomes

For every route, complete the following fields:

1. **Confidentiality:** what content is hidden from each actor?
2. **Peer identity and sender authentication:** what is verified, by whom, and when?
3. **Integrity and context:** what binds sender, recipient, session, message and logical order?
4. **Discovery privacy:** what does the lookup or rendezvous actor learn?
5. **Access-pattern privacy:** who sees reads, writes, retries, timing and repeated access?
6. **Carrier/media transformation:** what changes and what survives?
7. **Metadata:** separate embedded metadata, file-level identifiers, platform records and network observations.
8. **Availability/reliability:** what can be dropped, delayed, duplicated, suppressed or backfilled?
9. **Human factors:** what interaction patterns or prompts create correlation?
10. **Lifecycle:** what expires, rotates, revokes or remains in copies and logs?
11. **Operational cost:** latency, bandwidth, storage, compute, platform dependence and user effort.
12. **Evidence maturity:** published design claim, formal analysis, measured result, independent reproduction or unresolved assumption.

Use one of four outcomes per field: **supported by source**, **measured in the defined evaluation**, **not established**, or **not applicable under the stated profile**. Do not convert missing evidence into a positive security claim.

## 7. Evaluation sequence

1. Fix the logical communication task and endpoint security requirements.
2. Name each route, platform, version and configuration.
3. Define the actor set and observer capabilities before collecting data.
4. Map each lifecycle event to the observations available to each actor.
5. Record route-native protections and assumptions without flattening them into a common score.
6. Execute platform transformation tests only where an actual platform and permitted test environment are available.
7. Measure extraction, integrity, delivery, timing, size, resource use and user effort with declared procedures.
8. Compare residual leakage and operational costs across profiles.
9. Record negative results, non-comparable dimensions and route-specific failure cases.
10. Revise the research scope if the image route produces no distinct decision-relevant finding.

## 8. Current analytical judgement

Echomix substantially narrows any broad claim to a newly integrated privacy-aware messaging lifecycle. The project should now focus on whether ordinary image-platform carriage introduces distinct, measurable properties or costs when compared with established file, conventional messaging and mixnet-backed routes under common endpoint objectives.

This is a narrower and more demanding question. It may show that image carriage is useful for a particular deployment constraint, that it introduces avoidable fragility, or that a simpler route is preferable. All three outcomes are valid research results.

## 9. Source dependencies

- [SRC-016 · Loopix](source-register.md)
- [SRC-020 · OMR](source-register.md)
- [SRC-025 · Oblivious Signaling](source-register.md)
- [SRC-026 · Dead-drop covert messaging](source-register.md)
- [SRC-030 · GOMR](source-register.md)
- [SRC-031 · Remise](source-register.md)
- [SRC-032 · Echomix](source-register.md)
- [SRC-033–SRC-037 · Social-platform steganography and steganalysis](source-register.md)
- [Echomix / Katzenpost comparator](echomix-katzenpost-comparator.md)
- [Observer/property matrix](observer-property-matrix.md)
- [W4 risks and evaluation](w4-risks-and-evaluation.md)

**Theory only · No implementation · Not audited.**
