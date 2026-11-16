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
### 3.1 Functional roles and route composition

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
| IMG-MRAS-2026 | MRAS JPEG social-platform profile (SRC-033) | Publisher-indexed text describes DCT stabilisation, lattice embedding, post-processing, BOSSbase payload/recompression experiments and LinkedIn testing; exact app/client configuration is not pinned | Author-reported design and metric families (extraction error, PSNR/SSIM, steganalysis classification error), named comparator set and claimed platform test | Direct full-text access blocked; exact dataset split/payload values, full result tables, LinkedIn path/configuration and limitations remain unverified |
| IMG-DRAS-2026 | DRAS downward-recompression profile (SRC-034) | Publisher-indexed text describes RoLoS quantisation-table coefficient selection, CARE predictive channel modelling, Q95→Q85/Q80/Q75 evaluation and WhatsApp/LinkedIn/X testing; exact client/server versions are not pinned | Author-reported comparison with PMAS, extraction-error/runtime metrics, 87% error-reduction and order-of-magnitude speed claims | Full methods, exact data/payload settings, baseline tables, platform paths/configurations and limitations remain unverified |
| FILE-DROPBOX-LINK | Dropbox shared-link file carriage (SRC-039) | Official help documentation inspected 5 November 2026; link permissions and activity features depend on account/configuration | File activity, owner/editor observations, optional viewer information, link permission/download-control behaviour | Pin actual plan, account settings, link type, client version and retention; application-layer protected-object handling is a test condition, not a Dropbox E2E guarantee |
| E2E-SIGNAL-PROTOCOL | Signal protocol reference, not a Signal app deployment (SRC-038) | PQXDH revision 3 plus Double Ratchet revision 4; 1:1 asynchronous protocol reference | Published key-establishment, ratchet, skipped-message and protocol replay semantics | Pin client/service version and separately source server metadata, delivery receipts, attachments, backups, multi-device and retention before claiming a product-level route |
| MIX-ECHOMIX-PIGEONHOLE | Echomix paper with current Katzenpost/Pigeonhole documentation (SRC-032, SRC-040) | Echomix arXiv v2 plus current public Pigeonhole specification/project documentation; no mutually compatible release set pinned here | Published architecture, BACAP/Pigeonhole capabilities, courier/replica roles, asynchronous storage and route/network separation | Pin compatible repository release tags, deployment topology, directory config, client version, retention and underlying network before an executable comparison |

### Profile-selection rule

1. A *literature profile* reproduces a paper's stated experimental conditions and findings; it does not claim to represent the current service.
2. A *protocol reference profile* supports analysis of the protocol specification only; it does not fill in product/service metadata or operational behaviour.
3. A *service profile* requires a named product, pinned client/release, relevant account and privacy settings, route configuration, and sources for the service-side lifecycle.
4. A *deployed evaluation profile* additionally requires a declared, permitted test setup and captured observations. None is claimed at this checkpoint.

The first usable comparison can therefore be a structured documentary comparison across the six rows above, while explicitly leaving service-level unknowns blank. Do not collapse these profiles into a single score or imply that the different evidence types are directly comparable.

## 5.6 Initial documentary comparison (not a scored ranking)

This table records only what the named sources support. “Not established” means the inspected source set does not answer the question; it is not evidence that the service lacks the property.

| Dimension | IMG-QIAO-2023 / MRAS / DRAS | FILE-DROPBOX-LINK | E2E-SIGNAL-PROTOCOL | MIX-ECHOMIX-PIGEONHOLE |
|---|---|---|---|---|
| Endpoint cryptographic authority | The cited image-steganography studies evaluate hidden-payload embedding/recovery and do not establish the proposed endpoint identity, authenticated session or message-context protocol. | A client-side protected object could be carried as a file, but this is a comparison condition; Dropbox shared-link documentation does not specify this project's endpoint cryptography. | PQXDH establishes a shared secret from public-key/prekey material; Double Ratchet evolves message keys. PQXDH revision 3 warns that its mutual authentication is not post-quantum secure. | Echomix/BACAP/Pigeonhole provide system-specific cryptographic and capability semantics. They are not the same endpoint protocol as the proposed capsule and must be compared on native terms. |
| Discovery and access | Qiao's experiment transfers images through named social platforms; it does not define private recipient discovery or retrieval privacy. MRAS/DRAS indexed publisher text concerns embedding/recompression performance and platform tests, not those properties. | Shared-link access is the documented discovery mechanism. Link possession/access settings are not anonymous retrieval. Host activity and optional viewer information may expose events. | Protocol specifications do not define Signal service discovery, server-side routing or product-level access logs. | BACAP capabilities derive box identifiers and distinguish read/write authority; Pigeonhole mediates operations through couriers and replicas. Read-capability distribution and underlying network determine important trust/privacy boundaries. |
| Provider/observer visibility | The social platform is the carrier and processes uploaded/transmitted images; the Qiao study does not provide a complete account of provider logs or every observer. | Dropbox documents file activity, sharing changes and optional viewer information. Owners/editors can inspect activity; link settings do not prevent all forms of saving. | Signal protocol specifications do not provide a complete service-side metadata/retention model. Do not infer app-level metadata privacy from protocol cryptography alone. | Mix gateways/nodes, couriers and replicas have distinct observations; anonymity properties depend on the Echomix topology, traffic coupling, adversary and collusion assumptions. |
| Media/file transformation | Qiao reports that simulated JPEG compression is not a sufficient proxy for its tested social-platform paths; results differ by platform/mode. MRAS/DRAS target JPEG recompression but remain abstract-level evidence here. | The inspected Dropbox help sources do not establish content transformation behaviour for the selected file route. Preview, download and file-version behaviour require a pinned service/configuration. | Attachment transformation and storage behaviour are outside the two cited protocol specifications. | Fixed-size padded boxes and protocol framing are part of Pigeonhole's native design; image transformation is not the relevant carrier question. |
| Reliability and ordering | Qiao measures extraction/recovery, not complete messaging lifecycle, delivery acknowledgements, retries, expiry or authenticated ordering. | File activity and shared-link permissions do not establish delivery guarantees, recipient acknowledgement, retention or recovery semantics. | Double Ratchet specifies skipped-message handling and a bounded MAX_SKIP parameter; application delivery, attachment and expiry semantics are outside the cited protocol text. | Pigeonhole specifies asynchronous streams, courier/replica mediation and storage semantics; the mix network and application add separate latency, reliability and retention assumptions. |
| Evidence maturity | Qiao full text inspected; MRAS and DRAS abstract/highlight only; no independent reproduction. | Current official help documentation inspected; no account/workflow test. | Official protocol specifications inspected; no Signal application/service profile or implementation test. | Echomix paper plus current project/specification documentation inspected; no pinned compatible release build or independent reproduction. |

### Documentary synthesis

1. The image studies provide the strongest direct evidence about media-carrier survival, but little about private discovery, endpoint identity, message lifecycle or provider-side observer records.
2. Dropbox supplies a concrete shared-link/file-host reference for access and activity visibility. It does not, on the inspected evidence, supply a complete endpoint-protected messaging protocol.
3. Signal's specifications supply a mature protocol-level E2E reference for key establishment and ratcheting, but they do not specify the full service and attachment route. Product-level comparison remains open.
4. Echomix/Pigeonhole provide a much richer integrated asynchronous messaging and privacy comparator. The Pigeonhole storage abstraction and the anonymity properties of its underlying network must remain separate in the analysis.
5. There is no honest single scalar ranking across these profiles yet. Their evidence concerns different layers, and missing service-level evidence must remain explicitly missing.

## 5.7 Initial lifecycle/event observer ledger

This ledger is a documentary baseline, not a claim that every route has been fully characterised. “Unknown” is retained where the cited source does not specify the service behaviour.

| Lifecycle event | IMG-QIAO-2023 / MRAS / DRAS | FILE-DROPBOX-LINK | E2E-SIGNAL-PROTOCOL | MIX-ECHOMIX-PIGEONHOLE |
|---|---|---|---|---|
| Identity and session preparation | The image-carriage studies do not define cryptographic participant identity or an authenticated message session. | A shared-link permission controls access to a file; it is not proof of the intended human recipient's cryptographic identity. An endpoint-protected object would require a separate protocol. | PQXDH uses identity keys and signed prekeys; manual fingerprint/QR comparison is one possible verification ceremony and is outside the protocol itself. PQXDH revision 3 does not provide post-quantum mutual authentication. | BACAP capabilities provide distinct read/write authority; the application must distribute capabilities securely. Mix-network client identity and service access follow the Echomix/Katzenpost model, not the proposed identity scheme. |
| Message creation and protection | Hidden bits are embedded in image media. These studies do not establish authenticated sender/recipient/session context for the thesis's message object. | A client-side encrypted capsule could be stored as a file, but this is a hypothetical common-object condition. Dropbox documentation cited here does not specify that cryptographic wrapper. | PQXDH establishes shared session material; Double Ratchet derives evolving message keys. Application-level message format/context and product details require separate specification. | BACAP/Pigeonhole supplies its own signed/encrypted box and capability semantics. Do not assume direct wire-object compatibility with the thesis capsule. |
| Publication or send | Qiao's study uploads images to Facebook/Twitter and transfers images through WeChat under its test configuration. MRAS/DRAS abstracts report named-platform tests but lack inspected full configurations. | The sender creates/stores a file and distributes a shared link. Dropbox documents file and sharing activity; exact account/plan/link configuration must be pinned. | Protocol documents do not specify the complete Signal service send path, server logs, delivery receipts or attachment storage. | Clients send through mix-network paths to services/couriers; Pigeonhole operations are mediated by couriers and storage replicas. The precise deployed topology must be pinned. |
| Recipient discovery | The published image experiments demonstrate carriage, not privacy-preserving discovery or recipient lookup. | The recipient obtains a shared URL or invitation. Link possession and access restrictions do not make retrieval anonymous. | Server-side recipient addressing and product discovery are outside the cited protocol specifications. | A read capability and starting/index information are shared out of band; BACAP derives identifiers for stream boxes. The capability distribution channel is a separate trust boundary. |
| Retrieval and access observation | The study retrieves/downloads or receives the transmitted image, then measures extraction. It does not provide a full provider-side access-log model. | Shared-link access is visible through the host's documented activity features; viewer information is optional. Owners/editors have activity visibility under the documented conditions. | Product-level retrieval events and service-side access records are not established by the protocol references. | Courier/replica and mix-network roles observe different parts of requests and traffic. The combined observer view depends on the underlying network and collusion set. |
| Carrier or transport transformation | Qiao directly compares simulated JPEG channels with its tested social-platform paths; results vary by platform/mode. MRAS/DRAS target recompression but remain partial reviews. | The inspected Dropbox sources do not establish file-content transformation for this selected route. Preview/download/version behaviour requires service-specific evidence. | Attachment processing and file transformation are not specified by PQXDH or Double Ratchet. | Pigeonhole uses fixed-size padded boxes and protocol-defined framing; mix-network packet processing is not image-carrier transformation. |
| Validation and acceptance | Extraction/recovery metrics do not establish sender authentication, message freshness, recipient binding or safe endpoint acceptance. | File download/access does not establish that the recovered file is authentic or complete; the endpoint wrapper would need to validate it. | Ratchet decryption and protocol state provide cryptographic checks within the specified protocol; product-level receipt/acceptance semantics remain distinct. | Read capabilities permit retrieval/verification/decryption under Pigeonhole semantics. Application-level acceptance and the trustworthiness of the underlying network remain separate. |
| Fragment-set membership and reconstruction | SRC-043 demonstrates numbered fragments and redundant multi-image reconstruction through robust DFT/DCT watermarking; image-platform studies do not establish this project's endpoint-authenticated set semantics. | No fragment-set protocol is specified by the cited shared-link documentation; a client-side manifest would be an additional protocol. | The cited ratchet specifications protect protocol messages and state, not arbitrary image-carried fragment manifests. | Pigeonhole has its own box/capability semantics; do not assume compatibility with the proposed fragment-set format. |
| Redundant carriage and loss tolerance | SRC-043 uses redundant copies and majority voting under its evaluated watermarking method; no general guarantee transfers to other embedding methods or platform pipelines. | File copies/versioning are not equivalent to authenticated erasure coding or fragment redundancy. | Protocol retransmission and skipped-message handling are not equivalent to multi-carrier redundancy. | Pigeonhole's reliability/backfill mechanisms are native system semantics; distinguish them from application-level duplicate fragments. |
| Independent messages and conversation continuity | The image-carriage studies do not define authenticated conversation/session continuity or prove that a group of images represents one dialogue. | Shared links may expose file access relationships; no endpoint conversation semantics are specified. | Double Ratchet provides evolving per-session message-key state, but service-level thread metadata and complete product semantics are outside the cited protocol specifications. | Echomix/Pigeonhole provides native asynchronous stream/capability semantics; compare those directly rather than mapping them onto an assumed image conversation ID. |
| Retry, duplicate and cross-route linkage | The cited image studies measure carrier transmission/extraction, not application retries, duplicate acceptance or cross-route equality correlation. | Host activity may record file/share changes or access; the cited documents do not define application-level retry or cross-route semantics. | Skipped-message handling is protocol state, not proof of service delivery retry behaviour; distinguish retransmission from a new logical message. | Acknowledgements, retries and backfills are part of the comparator's reliability design; analyse what each courier/replica/network observer can correlate. |
| Collection-level steganalysis and carrier clustering | SRC-044–SRC-045 provide batch-detection and bounded capacity theory under explicit assumptions; SRC-043's robust watermarking reconstruction is not a generic stealth benchmark. Current platform collections remain untested here. | Not an image-steganalysis profile; host-visible file activity and link access are separate collection/metadata observations. | Not an image-steganalysis profile; protocol specifications do not establish platform-side or network-side traffic-analysis resistance. | Not an image-steganalysis profile; the mixnet's traffic-analysis model and collusion assumptions are a separate comparator. |
| Retry, ordering and reliability | Qiao measures extraction success/error, not delivery retries, acknowledgements, backfill or message-set ordering. | The cited activity/link documents do not specify application delivery acknowledgements, retries or complete-message semantics. | Double Ratchet includes skipped-message handling and bounded skipped-key storage; this is not a general service delivery/retry guarantee. | Echomix/Pigeonhole has explicit asynchronous storage and reliability semantics, including courier/replica roles, acknowledgements/backfills and tombstones as described in SRC-032/SRC-040. |
| Expiry, deletion and retention | Not established by the image-steganography experiments reviewed. | The cited help pages do not establish a universal retention or secure-deletion guarantee; version history, copies and recipient saves require separate investigation. | Protocol specifications do not define all service retention, backup or deletion behaviour. | Pigeonhole storage is ephemeral under the documented design; exact retention and garbage-collection policy must be pinned to the deployed release and configuration. |
| Human and network observation | Social-platform accounts, upload timing and interaction are plausible observation sources; the cited paper does not quantify the complete social graph or network observer view. | Link sharing, account activity and optional viewer information create host-side observations; network and human correlation remain outside the help-page scope. | The protocol specifications do not characterise all application, device, network or human behavioural observations. | Global/active network observers, contact activity windows and role collusion are explicit in Echomix; residual human routine leakage remains part of the comparator. |

### Message multiplicity and observer-ledger discipline

The ledger treats the following as separate event/relationship types, not interchangeable forms of "multipart":

- **Fragment-set membership:** authenticated endpoint relationship between pieces required to reconstruct one protected object.
- **Redundant carriage:** repeated or coded carriers that contribute to loss-tolerant recovery; additional events may also create pooled detection opportunities.
- **Independent messages:** separate protected objects that happen to be published in one batch or time window.
- **Conversation continuity:** authenticated relationship between distinct logical messages; not necessarily visible as a stable carrier identifier.
- **Retry/duplicate:** a new delivery event for the same logical message or capsule; distinguish identical retransmission from a newly protected message.
- **Cross-route copy:** the same protected object carried over another route; ciphertext equality, timing or shared discovery can create correlation.
- **Collection-level steganalysis:** detection or clustering across multiple carriers/events; state collection size, acquisition window, detector, cover dependencies, side information and observer vantage.

For every proposed evaluation, record endpoint ground truth separately from observer-inferred links. A successful reconstruction does not show that an observer cannot link carriers; a low per-image detection score does not establish collection-level concealment; and a hidden set identifier does not hide timing, provenance or retrieval patterns.

### Ledger discipline

- Record each statement as source-supported, measured in a named evaluation, not established, or not applicable.
- Do not promote protocol-level facts into product-level claims.
- Do not promote file-host activity documentation into claims about all Dropbox plans or settings.
- Do not treat extraction, decryption, delivery receipt, user-visible acceptance and human receipt as the same event.
- Extend this ledger only when a new source or declared test supplies the missing evidence; retain unknown cells rather than filling them by analogy.

### Multi-carrier and multi-message evidence boundary

The image profile must distinguish a single protected message in one carrier, a fragmented protected object across carriers, redundant fragment carriage, multiple independent messages, conversation/session continuity, retransmission and cross-route copies. These are not interchangeable meanings of "multipart". See the dedicated [multi-message linkage and steganographic carriage analysis](multi-message-linkage-and-steganographic-carriage.md).

SRC-043 is direct prior art for fragmented covert communication across many images: it embeds fragment numbers and content in multiple images, redundantly carries each fragment and reconstructs by majority voting over copies. Its carrier mechanism is robust DFT/DCT watermarking; the authors explicitly distinguish watermarking from steganography. This rules out generic novelty claims for multi-image fragmentation, redundant image-carried fragments or subset reconstruction, but does not establish stealth for ordinary steganographic methods. SRC-044 studies pooled detection across a fixed batch. SRC-045 proves an asymptotic square-root capacity bound under explicit assumptions, including equal cover capacities, shift-hypothesis detector response, independent per-cover errors and known batch size. Neither source supplies a universal quantitative prediction for current platform images, dependent collections or sequential acquisition.

For every image-carriage evaluation, record:
- Whether one carrier contains a complete protected object, one fragment, multiple fragments or redundant coded data.
- Whether the unit being linked is a fragment set, independent message, conversation/session, retry or cross-route copy.
- Which identifiers, manifests, indices, counts, capabilities or sequence values are visible, encrypted, authenticated-visible or route-local.
- Whether redundancy improves recovery while increasing carrier count, repeated signal, event volume or pooled detection evidence.
- Per-image extraction/detection outcomes and collection-level detection/clustering outcomes separately.
- Whether the observer's collection is account-scoped, platform-scoped, time-windowed, source/device-correlated or longitudinal; state dependence assumptions.
- Whether image method is steganography, robust watermarking or hybrid, and which claim each experiment tests.

Do not infer that distributing a fixed payload over more images reduces detectability. Do not infer that a hidden fragment index hides the publication/retrieval relationship. An authenticated manifest can prevent fragment mixing without hiding the existence of a set from observers who see its linkage metadata.

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

## 8.1 Image-carriage evidence constraints from SRC-033–SRC-037 and SRC-043–SRC-045

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
