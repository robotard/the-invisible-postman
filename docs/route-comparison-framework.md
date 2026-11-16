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

## 5.5 Initial named profile register and evidence boundary

The following profiles are the current evidence-backed starting set. They are deliberately labelled as literature, protocol or documentation reference profiles where a live, pinned service configuration is not yet available. They are not a claim that a controlled cross-route experiment has been completed.

| Profile ID | Route/profile | Version or configuration boundary | What can be compared now | Still unresolved |
|---|---|---|---|---|
| IMG-QIAO-2023 | Social-image carriage as tested by Qiao et al. (SRC-035) | Published study configuration: 50 BOSSbase images, JPEG QF 85, stated payload 0.1; Facebook/Twitter upload-download and WeChat transfer; exact platform app/server versions are not pinned | Published method outcomes, extraction/recovery metrics, platform-specific differences and contrast with simulated JPEG channels | Not a current live platform profile; not all image formats, accounts, upload modes or platform versions; no independent reproduction |
| IMG-MRAS-2026 | MRAS JPEG social-platform profile (SRC-033) | Publisher abstract reports LinkedIn testing; article configuration/version not fully inspected | Author-reported approach and stated evaluation targets only | Full text, precise LinkedIn/client configuration, baselines, tables and limitations |
| IMG-DRAS-2026 | DRAS downward-recompression profile (SRC-034) | Publisher highlights report WhatsApp, LinkedIn and X tests; exact client/server versions and modes not yet inspected | Author-reported downward-recompression objective and headline result only | Full text, exact platform paths, test design, baselines and limitations |
| FILE-DROPBOX-LINK | Dropbox shared-link file carriage (SRC-039) | Official help documentation inspected 5 November 2026; link permissions and activity features depend on account/configuration | File activity, owner/editor observations, optional viewer information, link permission/download-control behaviour | Pin actual plan, account settings, link type, client version and retention; application-layer protected-object handling is a test condition, not a Dropbox E2E guarantee |
| E2E-SIGNAL-PROTOCOL | Signal protocol reference, not a Signal app deployment (SRC-038) | PQXDH revision 3 plus Double Ratchet revision 4; 1:1 asynchronous protocol reference | Published key-establishment, ratchet, skipped-message and protocol replay semantics | Pin client/service version and separately source server metadata, delivery receipts, attachments, backups, multi-device and retention before claiming a product-level route |
| MIX-ECHOMIX-PIGEONHOLE | Echomix paper with current Katzenpost/Pigeonhole documentation (SRC-032, SRC-040) | Echomix arXiv v2 plus current public Pigeonhole specification/project documentation; no mutually compatible release set pinned here | Published architecture, BACAP/Pigeonhole capabilities, courier/replica roles, asynchronous storage and route/network separation | Pin compatible repository release tags, deployment topology, directory config, client version, retention and underlying network before an executable comparison |

### Profile-selection rule

1. A *literature profile* reproduces a paper's stated experimental conditions and findings; it does not claim to represent the current service.
2. A *protocol reference profile* supports analysis of the protocol specification only; it does not fill in product/service metadata or operational behaviour.
3. A *service profile* requires a named product, pinned client/release, relevant account and privacy settings, route configuration, and sources for the service-side lifecycle.
4. A *deployed evaluation profile* additionally requires a declared, permitted test setup and captured observations. None is claimed at this checkpoint.

The first usable comparison can therefore be a structured documentary comparison across the six rows above, while explicitly leaving service-level unknowns blank. Do not collapse these profiles into a single score or imply that the different evidence types are directly comparable.

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

## 8.1 Image-carriage evidence constraints from SRC-033–SRC-037

The reviewed literature makes the image route comparison more specific, but does not establish that a particular platform currently applies any one transformation to every upload.

- Qiao et al. (SRC-035) compare simulated JPEG channels with tested Facebook, Twitter and WeChat paths. Their outcomes vary by platform and by WeChat original-image versus default sending mode; some methods that work in the simulated channel fail in platform tests. Their social-platform sample is 50 images under a defined test configuration, not a universal platform characterisation.
- MRAS (SRC-033) and DRAS (SRC-034) report methods aimed at JPEG recompression robustness. MRAS full methods/results and DRAS full text remain unreviewed here; their publisher abstracts/highlights are not enough to establish comparative superiority.
- Zhu et al. (SRC-036) describe active payload-destruction processing designed to preserve image quality. Full method/results remain unreviewed. Treat it as evidence that adversarial media transformation is a researched attack class, not evidence that a named platform deploys that method.
- Kombrink et al. (SRC-037) provide a broad taxonomy and identify limited generalisation in steganalysis. Their cross-paper performance ordering is not a common controlled benchmark.

For every image route profile, record at least: platform and app/web version; operating system/client; original versus compressed sending option; image format and dimensions; upload/post type and visibility; account state; retrieval/download route; transformations evidenced or measured; payload method and rate if relevant; extraction error and complete-message recovery; detector and false-positive/negative operating point; endpoint authentication/integrity outcome; and observer-visible metadata/events. Separate published evidence from proposed measurements and unknowns.

Do not equate robust extraction with stealth, and do not equate steganalysis resistance with confidentiality or anonymity. A payload that survives transformation but fails endpoint authentication must be rejected; a payload that is undetectable but unrecoverable is not a successful delivery route.

## 9. Source dependencies

- [SRC-016 · Loopix](source-register.md)
- [SRC-020 · OMR](source-register.md)
- [SRC-025 · Oblivious Signaling](source-register.md)
- [SRC-026 · Dead-drop covert messaging](source-register.md)
- [SRC-030 · GOMR](source-register.md)
- [SRC-031 · Remise](source-register.md)
- [SRC-032 · Echomix](source-register.md)
- [SRC-033–SRC-037 · Social-platform steganography and steganalysis](source-register.md)
- [SRC-038 · Signal PQXDH and Double Ratchet specifications](source-register.md)
- [SRC-039 · Dropbox file activity and shared-link permissions](source-register.md)
- [SRC-040 · Katzenpost Pigeonhole protocol and deployment documentation](source-register.md)
- [Echomix / Katzenpost comparator](echomix-katzenpost-comparator.md)
- [Observer/property matrix](observer-property-matrix.md)
- [W4 risks and evaluation](w4-risks-and-evaluation.md)

**Theory only · No implementation · Not audited.**
