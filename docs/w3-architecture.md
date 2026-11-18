W3 · Architecture

Status: Working architecture proposal
Research basis: W1 · Research Framing; W2 · Threat Model
Assurance status: Theory only · No implementation · Not audited.

1. Purpose

W3 translates the research questions and threat model into a candidate system architecture. It does not define a complete cryptographic protocol, claim implementation readiness, or establish that the proposed design is secure.

The architecture must support:

* Endpoint-controlled plaintext and private keys.
* Confidentiality and authenticated sender identity as distinct properties.
* An intermediary that can coordinate and transport messages without possessing the sole means of decryption.
* A first-class transport-route layer, including image-carried message capsules as a required route and other routes as comparison profiles.
* Route-specific carrier adapters, with concealment treated as optional and separate.
* Reliable identification and validation of multipart message sets.
* Explicit replay, expiry, revocation and recovery semantics.
* Testable boundaries between components and their responsibilities.

The architecture is deliberately divided into responsibilities rather than prematurely committed to a particular deployment topology. The [multi-message linkage and steganographic carriage analysis](multi-message-linkage-and-steganographic-carriage.md) defines the distinctions between protected logical messages, fragment sets, redundant carriers, conversations, retries and cross-route copies. Its package sequence is conceptual, not a final wire format.

**Transport-independence clarification (working architectural rule):** The protected-message core, carrier encapsulation, transport and orchestration are distinct responsibilities. Endpoint protection creates a logically protected object whose cryptographic meaning is independent of its delivery route. Encapsulation adapts that object to a carrier and reverses the packaging; transport adapters move it; optional orchestration may coordinate selection, sequencing, retrieval or retries and may itself also be a transit participant. Orchestration does not define agnostic delivery and is not mandatory. A single service may perform multiple roles, but each role, authority, input, retained state and observer view must be analysed separately. Image carriage is required as a research comparison route, not as a mandatory runtime route. Telegram, InspiroBot and any onward hop are examples only. Multi-hop routes must declare every hop and its added observations; extra hops do not inherently improve privacy. The protected object should remain invariant across routes unless an explicit, authenticated protocol conversion is specified. AEAD nonce uniqueness, salt purpose, identity/context binding and replay rules remain protocol decisions, not properties to improvise around a carrier.


2. Architectural principles

2.1 Endpoints own cryptographic authority

Plaintext creation, encryption, decryption, private-key custody and peer verification belong to participant-controlled endpoints.

The intermediary may coordinate delivery, but must not become the authority that can independently decrypt messages or establish participant identity.

2.2 Separate security properties

The architecture treats the following as separate requirements:

* Confidentiality: unauthorised parties cannot read message contents.
* Sender authentication: a message is cryptographically associated with a signing identity.
* Identity verification: participants establish that a cryptographic identity belongs to the intended person or entity.
* Integrity: unauthorised alteration is detected.
* Concealment: the presence of a message may be obscured, subject to separate evaluation.

A successful encryption operation does not, by itself, establish the sender’s human identity.

2.2a Confidence, evidence and verifier boundaries

The architecture should expose evidence that allows an endpoint or reviewer to make bounded judgements about specific claims. It must not create a new central authority that declares messages or participants "trusted". Evidence is interpreted by a verifier in a stated role and context. Where useful, a local claim record can identify the proposition, scope, evidence/provenance, mechanism, assumptions, threat model, freshness, unresolved alternatives and disposition. The record is a conceptual research artefact, not yet a message field, wire format or mandatory telemetry event.

The design must distinguish endpoint-verifiable facts from service assertions and observer inference. Cryptographic validation may establish that data validates under a key; a separate process is needed to bind that key to a participant. An authenticated fragment manifest may support membership and completeness checks; it does not prove publication or delivery. Transport acceptance is not endpoint receipt, and endpoint receipt is not decryption, display, reading or comprehension. The full semantics and privacy limits are set out in the [confidence and evidence model](confidence-and-evidence-model.md).

Confidence records should default to endpoint-local storage and minimum necessary disclosure. A stable receipt, central evidence ledger or globally visible relationship identifier could undermine the privacy objectives by creating a correlation surface. Any shared evidence mechanism requires an explicit purpose, recipient, retention policy and observer analysis.

2.3 Transport routes and carrier adapters

The transport-route layer carries a protected message between endpoints. It is a first-class architectural concern because routes determine packaging, capacity, transformation exposure, routing metadata, ordering, delivery behaviour and extraction failure modes.

Image carriage is a required research comparison profile, not a mandatory runtime route. File/attachment, conventional messaging and mixnet-backed routes are also candidates. No route is presumed superior.

Each route adapter must preserve the opaque protected message or detect when it cannot. Route-specific handling must not silently change authenticated content or message context. Image-specific encoding and extraction belong to the image adapter. Optional steganographic concealment is a separate sub-layer within that route and is not a substitute for encryption, authentication or integrity.

An image is a transport container. It is not a key, identity credential, source of guaranteed entropy, or substitute for authenticated encryption. The protected capsule must remain meaningful independently of optional concealment.

2.4 Passenger topology, encapsulation and the standalone train

The participant-side cryptographic topology is the primary security architecture. Each participant performs the necessary endpoint role in the agreement/key-establishment, message-protection, authentication and validation process. The intended "anonymous agreement" property requires a precise definition and protocol analysis; this architecture does not claim anonymity merely by naming it.

The train is a standalone transport element with a narrow service contract: carry an already protected object over a selected route. It may apply route-specific carriage handling. Optional orchestration may select or sequence routes and coordinate delivery, but it is a distinct function and may itself also act as a transit participant. It does not establish participant trust, negotiate or own cryptographic keys, encrypt or authenticate messages, decide message validity, or hold decryption authority. It is a transport aid, not a cryptographic participant.

The encapsulation boundary sits between the protected message/capsule and the train. It packages the opaque protected object for carriage, supplies bounded framing and route information, and supports detection of truncation, substitution, malformed extraction or route failure. It must not reinterpret or silently modify authenticated message semantics. Encapsulation alone is not a security primitive: any security-relevant fields or bindings must be authenticated by the endpoint protocol.

The train may be low-fidelity and untrusted. It may be inspected, copied, delayed, reordered, transformed, substituted, or unavailable. The passenger-side security topology must remain conceptually intact if the train is replaced or removed. Image carriage remains a required route; steganography or another image technique is a route mechanism within the train, not part of the passenger security topology.

### Multi-message package encapsulation boundary

**Reference-implementation comparison:** The inspected MRAS/DRAS public code places embedding and extraction inside a per-image carrier operation. It does not provide the thesis's proposed package-level relationships across carriers. In the conceptual architecture, any protected-object/fragment-set manifest and its authenticated membership semantics therefore sit above the carrier-specific embedding routine; the carrier method only transports its assigned payload. This is an analytical separation, not a claim that a manifest format or cryptographic binding has been designed. The architecture must not collapse a logical message, a protected object, a fragment set, a carrier capsule, an image object and a conversation into one generic "message" or "multipart" object. The following is a conceptual packaging sequence for analysis, not a selected wire format or cryptographic construction:

1. **Logical message:** endpoint-authored content and its intended recipient/context.
2. **Endpoint-protected object:** the cryptographically protected representation, with sender/recipient/session context authenticated according to the eventual protocol.
3. **Message-set context / manifest (when fragmentation is used):** an authenticated description of the set, including the fields ultimately required to bind set identity, version, logical object length, fragment count/index, coding or redundancy policy, and any content commitments. Exact fields, canonical encoding and cryptographic binding remain open.
4. **Fragment capsule(s):** bounded pieces or coded blocks associated with that protected object and authenticated set context. Each fragment must be rejected if its membership, index, length or content is inconsistent with the authenticated set.
5. **Carrier encapsulation:** a route-facing wrapper that frames the capsule or fragment for a particular carrier, with bounded route metadata and declared lengths. It is not an authentication layer; fields that affect security decisions must be covered by endpoint-authenticated context.
6. **Optional image steganographic embedding:** a distinct image-adapter operation that attempts to conceal the presence of the carrier payload. It may be absent. It neither encrypts nor authenticates the capsule.
7. **Image carrier and route events:** the resulting image is published, discovered, retrieved and extracted. Platform transformations and event metadata are route-specific observations.
8. **Endpoint decapsulation and validation:** extraction and bounded framing checks precede endpoint cryptographic validation; the endpoint authenticates the manifest and fragments, enforces completeness/replay policy, reconstructs the protected object and only then accepts the logical message.

A single logical message may use one carrier or several fragment carriers. Redundant carriers may encode repeated or coded information for loss tolerance. Several independent logical messages may be sent in one batch without becoming one fragment set. A conversation may link distinct messages through authenticated session continuity, but that link must not be confused with fragment-set membership. A retry is a new delivery event for the same logical object unless the endpoint protocol explicitly creates a new message.

> **DEFINITION · Encapsulation versus authentication**  
> Encapsulation supplies carrier framing, bounded parsing and route adaptation. Authentication establishes cryptographic authority over content and security-relevant context. A wrapper, filename, image metadata field, fragment index or carrier identifier is not authenticated merely because it is present in the package.
>
> **DEFINITION · Message-set identifier versus conversation identifier**  
> A message-set identifier groups fragments needed to reconstruct one logical protected object. A conversation/session identifier relates distinct logical messages over time. Reusing one value for both can create unnecessary linkability and ambiguous replay/order semantics.
>
> **COMPARISON · Fragmentation versus redundancy**  
> Fragmentation divides an object into distinct pieces; redundancy repeats or codes information so reconstruction may tolerate loss. Redundancy can improve recovery while increasing carrier count, repeated signal and collection-level detection opportunities. Neither technique is threshold secret sharing.
>
> **Illustrated diagram placeholder · W3-F01 — Multi-message package and encapsulation layers**  
> **Placement:** Beside this subsection, before the unique-envelope and decapsulation discussion.  
> **Prompt for later illustration:** Create a layered, publication-ready architecture diagram from logical message through endpoint-protected object, authenticated manifest/message-set context, fragment capsules, route-specific carrier encapsulation, optional steganographic embedding, image carriers, publication/discovery/retrieval, decapsulation and endpoint validation. Show a single-carrier path and a multi-carrier fragment-set path, plus a separate branch for several independent messages in one conversation. Use different visual treatments for authenticated endpoint objects, unauthenticated outer framing and optional concealment.  
> **Must not imply:** That the manifest or outer wrapper is already specified, that steganography provides encryption/authentication, or that the conversation identifier is the fragment-set identifier.
>
> **Illustrated diagram placeholder · W3-F02 — Message-set, conversation and retry relationships**  
> **Placement:** Beside the architecture's message lifecycle and retry discussion.  
> **Prompt for later illustration:** Show two or more distinct logical messages linked by an authenticated conversation/session relationship; show one of those messages divided into multiple indexed fragment capsules across separate image carriers; show an identical retry as another delivery event for the same logical message; show optional redundant carriers; and show a cross-route copy of the same protected object. Label every relationship distinctly and indicate which edges are endpoint-authenticated versus merely observable/inferable.
>
> **DEFINITION · Animated carrier versus separate carrier set**  
> An animated GIF is one route carrier object containing an ordered frame sequence. Redundancy across its frames is an internal carrier-level technique (SRC-049); it is not equivalent to distributing fragments across separate image objects or linking distinct protected messages. If evaluated, frame extraction and frame ordering belong to the image adapter; authenticated message-set membership and conversation continuity remain endpoint protocol concerns. Any per-frame keys or decoder seeds are separate side information whose distribution and endpoint binding must be specified; the SRC-049 demo's local key files are not a recipient-discovery or authenticated-manifest protocol. The inspected demo's raw ChaCha20 code path has no visible authentication tag and is not a protocol primitive recommendation.
>
> **COMPARISON · Sanitizer as route adversary**  
> A route may apply routine media transformations or an active sanitization process intended to remove hidden data (SRC-036, SRC-046–SRC-047). SRC-048 describes a keyed sender-side adaptation to a known sanitiser. These are external carrier conditions, not new trusted architecture components. A recovered carrier payload still requires endpoint authentication and validation.
>
> **Illustrated diagram placeholder · W3-F03 — Animated carrier and sanitizer boundary**  
> **Placement:** Beside the image-adapter description and after W3-F01/F02.  
> **Prompt for later illustration:** Show one GIF container with internal frames and optional cross-frame redundancy, beside a separate multi-image fragment-set route. Add a route-adversary branch for passive recompression and active sanitization, and a separate research-only keyed counter-adaptation path. Keep endpoint-protected object, package encapsulation, carrier framing and optional concealment visually distinct.  
> **Must not imply:** That GIF is a selected route, that frames are separate posts, that sanitizer-aware embedding is part of the proposed architecture, or that carrier extraction authenticates the message.
>
#### Relationship authority and receiver acceptance
Endpoint authentication must not be used as shorthand for every identity claim. Integrity/authenticity under a symmetric key proves only that an entity with the relevant key could have produced the authenticated object; it does not distinguish among multiple key holders. A signature or authenticated session can support attribution to a protocol key/session, while attribution to a person remains dependent on the separate peer-key verification and identity-assurance process. Manifest and fragment-membership checks must identify which key/session authorises the relationship. This is a protocol obligation; no sender-authentication construction is selected here.


The package manager and route adapters must preserve a strict distinction between endpoint-authenticated relationships and transport observations. The endpoint owns the authoritative graph linking logical messages, protected objects, fragment sets, fragments, conversations, retries and cross-route copies. A carrier's filename, metadata, public set token or claimed index is only an untrusted assertion until checked against authenticated endpoint context. A route observer may infer relationships from timing, size, account, provenance or retrieval patterns; those inferences are not protocol state and must not drive endpoint acceptance.

The receiving path must keep its states distinct: carrier observed → retrieved → bounded extraction/framing → endpoint authentication → fragment membership validation → set completeness → reconstruction and object validation → replay/freshness decision → logical-message acceptance. Publication, service acknowledgement, retrieval or extraction must never be treated as endpoint delivery or acceptance. Incomplete sets remain bounded and unaccepted; conflicting duplicates are rejected or quarantined. This is a design obligation, not a selected state machine encoding or wire format. See [the thesis relationship-authority analysis](../thesis.md#731-relationship-authority-what-the-endpoint-knows-and-what-the-route-reveals) and [multi-message linkage analysis](multi-message-linkage-and-steganographic-carriage.md).

2.4.1 Unique image envelopes, variable placement and decapsulation

The train may generate or obtain a distinct image carrier object for each carriage instance and vary that carrier's publication or retrieval placement. Here, "unique" means that a carrier object is not reused for another carriage instance under the proposed policy; it does not mean cryptographic uniqueness, secret entropy, randomness, unpredictability or guaranteed unlinkability. The carrier is not a nonce, key or identity credential. At the receiving side, a transport decapsulation function discovers or obtains the selected carrier, extracts the encapsulated protected object, checks transport framing and extraction completeness, and hands the result to the participant endpoint. The endpoint, not the train, performs cryptographic authentication and acceptance.

This creates a transport-level unlinkability objective: reduce straightforward correlation based on reuse of the same carrier or a stable, predictable publication location. It is a separate contribution of the train and does not replace the participant-side cryptographic topology. It must not be described as guaranteed anonymity. Timing correlation, access logs, network identifiers, hosting metadata, image fingerprints, repeated patterns, and the discovery/rendezvous mechanism may still reveal relationships. This is a carrier/object-level variation, not a traffic-analysis defence. Research comparators such as Loopix use explicit mixing and cover traffic under a defined observer model; those mechanisms introduce additional infrastructure, bandwidth, delay and usability assumptions and are not part of the current proposal (see SRC-016 and SRC-018–SRC-019 in the source register).

Variable placement requires a recipient-discovery mechanism. The design must explain how the intended recipient learns where and when to retrieve a carrier without introducing a stable locator or observable side channel that defeats the intended benefit. Random placement alone is not a delivery protocol.

Discovery must be treated as a separate protocol function with its own privacy and availability contract. Candidate families include: (a) recipient-side scanning of a shared feed, which can hide a query at the cost of bandwidth, storage and client work; (b) a stable authenticated locator or rendezvous service, which is efficient but may expose repeated recipient and access relationships; (c) short-lived or one-use capabilities delivered through a separately authenticated channel, which can reduce identifier reuse but still expose retrieval to the service receiving the request; and (d) private or oblivious retrieval, which aims to hide which item is retrieved from the service but introduces cryptographic, computation, communication and abuse-resistance costs. Liu and Tromer (2022) show that this is a formal message-retrieval problem, not merely URL randomisation; their bulletin-board construction is a comparator, not a selected component. No candidate is adopted here. The comparison must record who observes publication, capability delivery, lookup, download and retries, plus locator lifetime, query linkability, collusion, denial-of-service exposure, bandwidth and usability. The carrier should be treated as disposable and replaceable; decapsulation failure must produce a bounded failure, never silent acceptance of partial or ambiguous content.

The discovery boundary should be decomposed further so that unlike properties are not reported as one “private discovery” result: (1) bootstrap and authentication of the initial key, locator or capability; (2) publication and indexing of candidate carriers; (3) candidate enumeration by scanning or querying; (4) recipient pertinence and retrieval authorisation; and (5) endpoint association with an authenticated fragment set or conversation. OMR/GOMR primarily address recipient-message pertinence; Oblivious Signaling changes the cost placement to sender-side uniform updates; Remise adds two-server access-pattern privacy subject to non-collusion and out-of-band token distribution; Echomix/Pigeonhole provides a stronger integrated capability-derived storage and asynchronous messaging comparator. StOMR adds a stateful OMR family in which OMR-KEM establishes shared state without prior communication; the receiver public key is sent to the sender and detection key to the detector. Its full paper models passive receiver privacy, not active malicious publication or authenticated human identity binding; the inspected artifact implements the local matching/compression/decode core, not a networked service or visible OMR-KEM flow (SRC-050). UnifOMR relates strong detection-key unlinkability to PIR and uses a two-round batch-PIR construction (SRC-051, primary paper directly reviewed). Its detector scans the board clues, the recipient performs local range checks, then issues a fixed-capacity batch-PIR query. The paper separates malicious-detector privacy from completeness/soundness, which assume an honest-but-curious detector, and leaves malicious single-server integrity open. Algorithm 1 randomly truncates candidate sets larger than k̄, but the formal completeness bound covers true pertinent messages and does not explain how false-positive candidates fit that capacity; record this as a primary-text ambiguity, not a demonstrated defect. SRC-053 is a secondary assessment now cross-checked against the primary paper. A third-party integration demonstrates explicit digest completeness, slot-to-height mapping, whole-height truncation, cursor retry and PIR/fallback composition (SRC-052); these are service/application semantics, not an UnifOMR paper guarantee or a generic multi-carrier transaction. These mechanisms protect different events and rely on different assumptions. Signal's pinned public server snapshot adds a concrete product/service comparator: per-device mailboxes, client acknowledgement before queue removal, conditional server delivery receipts and queue-drained signalling, with same-recipient transaction grouping but no global transaction across all recipients when writes span shards/chunks (SRC-038). Dropbox adds owner/editor-visible activity and configurable viewer information whose omissions depend on role, plan, guest status and preview/download path, rather than a cryptographic retrieval protocol (SRC-039). The architecture must not infer publication privacy from private retrieval, sender anonymity from receiver-pertinence privacy, endpoint-authenticated conversation continuity from a capability or locator, or global backend observability from a UI receipt/log. For every stage, record its authority, observer view, retained metadata, bootstrap dependency, collusion assumptions and availability failure modes. See [the thesis discovery decomposition](../thesis.md#discovery-is-a-composition-of-distinct-functions) and [the multi-message linkage analysis](multi-message-linkage-and-steganographic-carriage.md#47-discovery-is-not-a-single-lookup).

This boundary also needs an explicit adversarial service model. A bootstrap channel may be substituted before the peer/key/locator binding is trusted; a publisher may inject false or stale carriers; an index may equivocate or omit candidates; and a retrieval service may replay, substitute, delay or selectively withhold results. The endpoint can authenticate an object it receives, but cannot infer from that success that the candidate view was complete or that all intended objects were published. Nor can it infer from silence why an expected object is absent. A service-reported event establishes, at most, the service's own stated action within its authority. If publisher, index and retrieval roles collude, their account, object, capability, source, timing, size and retry records may form a joined observer view. The architecture therefore records role ownership, operator independence, plausible collusions, retention and clock uncertainty as route properties; it does not assume that nominally separate services are non-colluding. Unknown internal behaviour remains unknown, and no index-consistency, transparency or deletion mechanism is selected by this analysis.

Metadata minimisation is part of the image-carriage processing path. Before publication, remove unnecessary embedded image metadata and identifying file-level properties, retaining only fields demonstrably needed for carrier decoding, compatibility or safe handling.

The allowlist must distinguish descriptive identity-bearing fields from structural and signal-level properties. EXIF/IPTC/XMP descriptions, creator/location/device identifiers and filenames are candidates for removal unless a documented function requires them. Format headers, codec parameters and other structures needed to decode the image or extract the carrier must instead be validated and normalised according to the selected format. Optional colour/rendering profiles may affect compatibility or appearance and require explicit tests. Platform-specific resizing, recompression and conversion can also leave signal- or codec-level traces even when descriptive metadata is removed (SRC-021). The route must therefore test both metadata output and the transformed image signal; a metadata-clean file is not necessarily an uncorrelatable file. The route profile must document its metadata allowlist and verify the produced carrier rather than assuming a metadata-stripping operation succeeded. This operation cannot remove hosting-provider logs, network identifiers, externally observed timestamps, access records or other metadata generated outside the carrier; those require distinct controls and remain potential observations.

The transport's privacy analysis must include the human interaction around publication and retrieval. Stable schedules, response latency, platform/device preferences, language and formatting habits, repeated image styles and predictable reactions can create behavioural linkability. Social-engineering prompts may deliberately exploit those patterns. These are cross-cutting privacy and threat-model concerns; they do not belong solely to the image codec or cryptographic protocol.

2.5 Password-derived keying as an evaluated alternative

The earlier password-derived model was selected for the exploratory one-to-one image-message concept because a shared passphrase is familiar, portable with the protected object, and avoids requiring an identity directory or key-distribution service at the outset. With a fresh salt and appropriately configured Argon2id, it can derive a key for authenticated encryption while keeping the password itself out of the carrier. This was a pragmatic usability and research-scope decision, not a claim that a password authenticates the sender or supplies strong entropy.

The model has important limits: password quality governs resistance to offline guessing; the salt and KDF parameters are public metadata rather than protection against weak passwords; a shared secret does not distinguish which participant sent a message; and password distribution, rotation, compromise response, multi-device use, and forward secrecy require additional design. It is therefore suitable only under explicit assumptions, such as a small set of participants who already share a sufficiently strong secret through a separate trusted channel.

The current architecture adopts endpoint-controlled identity and authenticated session establishment because the research scope now includes peer verification, sender authentication, per-session context, and key lifecycle. Password-derived encryption remains a documented alternative or narrow mode, not the identity model or an implicitly combined part of the current design. Any future hybrid must specify the role of each input, context binding, key separation, and failure behaviour before evaluation.

2.6 Complexity must earn its place

Every component must have a traceable responsibility and a demonstrable benefit against a research objective or identified threat.

A component that merely adds another layer, service, key or recovery participant without improving a stated property should not be included by default.

3. Logical component boundaries

The following components describe responsibilities. They do not require separate services, processes or deployment units.



3.1 Participant endpoint

Responsible for:

* Creating and displaying plaintext.
* Holding participant private keys.
* Verifying peer identity material.
* Establishing authenticated cryptographic sessions.
* Encrypting and decrypting message payloads.
* Maintaining local replay and lifecycle state.
* Applying local secret-handling rules.

The endpoint is the principal trust boundary. Endpoint compromise remains a residual risk.

3.2 Identity and key-management boundary

Responsible for:

* Representing cryptographic identities.
* Binding signing and agreement keys to those identities.
* Supporting explicit first-contact verification.
* Managing key rotation, replacement and revocation information.
* Distinguishing identity keys from session keys and recovery material.

A platform username, account ID or bot-issued identifier may assist routing but cannot independently prove human identity.

The exact identity model, first-contact ceremony and key-change procedure remain unresolved.

3.3 Session establishment

Responsible for establishing shared cryptographic context between intended participants.

It must provide:

* Authenticated key establishment.
* Key confirmation where required.
* Explicit peer and session binding.
* Separation between long-term identity keys and derived session or message keys.

Candidate mechanisms may be evaluated later. X25519, HKDF-SHA-256 and Ed25519 are candidates, not adopted protocol decisions.

3.4 Message protection and envelope

Responsible for transforming a plaintext message into a protected, versioned message object.

The protected object should bind the data necessary to prevent ambiguity or substitution, including as applicable:

* Protocol version.
* Sender and recipient cryptographic identities.
* Session or context identifier.
* Unique message identifier.
* Payload type and length.
* Multipart manifest reference.
* Freshness or expiry information.
* Authenticated ciphertext and associated metadata.

The exact canonical encoding, field layout, algorithm suite, nonce construction and signature arrangement are open protocol decisions.

Authenticated encryption with associated data is a candidate mechanism for confidentiality and integrity. The final construction must be selected and reviewed as a complete protocol, not assembled from algorithm names.

3.5 Capsule and multipart manager

Responsible for dividing a protected message into one or more transportable capsules and reconstructing the original protected object.

Each capsule must be bound to a message set through authenticated context. The design must distinguish:

* Message-set identity.
* Capsule index and total count.
* Capsule content and integrity.
* Protocol version.
* Manifest or equivalent reconstruction information.

Transport arrival order must be distinguished from authenticated logical order. Capsules may arrive out of sequence and still be safely reassembled when the manifest or equivalent authenticated context binds the message-set identity, expected count, unique indices and capsule contents. Reordering alone is therefore not an invalid-message condition.

The receiver must not silently accept incomplete sets, conflicting content for the same index, cross-message or cross-recipient mixtures, altered manifests, invalid indices, unsupported versions or ambiguous reconstructions. Duplicate delivery requires an explicit rule: an identical repeated capsule may be handled idempotently or rejected, but must never be counted as an additional distinct piece; conflicting duplicates must fail closed. Resource limits and timeout behaviour remain part of the parser/reassembly specification.

Fragmentation is a transport and packaging mechanism. It is not a cryptographic recovery scheme.

3.6 Encapsulation boundary, standalone train and transport-route adapters

This logical component group defines three connected but distinct responsibilities. They need not be separate services or processes.

**Encapsulation and decapsulation boundary**

The sender-side encapsulation function packages an already protected capsule or capsule set for carriage. Its service contract is limited to bounded framing, route-format identification, length and extraction context, and any minimal operational fields required by the selected route. It must not reinterpret the protected message or create a new source of cryptographic authority.

At the receiving side, decapsulation obtains the selected carrier, extracts the encapsulated object, checks structural framing, declared lengths, format/version support and extraction completeness, and returns the recovered protected capsule to the participant endpoint. Structural checks can detect malformed or truncated carriage; they do not establish authenticity or prove that the object is the intended message. Any security-relevant binding must be authenticated by the endpoint-controlled protocol and checked there.

The encapsulation format must define bounded lengths, parser limits, unsupported-version behaviour, duplicate handling, truncation behaviour and safe failure. It must not allow route metadata to override authenticated sender, recipient, session or message context.

Resource bounds are a first-class part of this contract, not a later implementation detail. The specification must set justified limits for total encoded size, per-capsule size, fragment count, manifest/header length, nesting, decompression expansion, aggregate memory and disk, CPU/time budget, concurrent incomplete sets and their expiry. The parser should reject inconsistent or excessive declarations before allocation or expensive decoding, use bounded streaming where appropriate, and release temporary resources on every failure path. Go's multipart parser resource-exhaustion incident (SRC-023) is an illustrative implementation case; it does not establish that this capsule format shares the same vulnerability or parsing model. Numerical values remain open pending a target-device and route profile.

**Standalone train**

The train is a replaceable, low-fidelity carriage element. It may select a route, coordinate publication and retrieval, associate transport objects with operational delivery references, and report limited delivery state where observable. It carries opaque protected objects and does not hold plaintext, participant private keys, sole decryption capability or authority to accept a message.

Recipient discovery is a separate requirement, not something solved by random placement. The recipient needs an authenticated means to learn where and when to retrieve the relevant carrier. The locator, discovery channel, publication schedule and access pattern may themselves expose relationships. Their design remains open and must be evaluated against the observer model.

**Transport-route manager and carrier adapters**

The route manager selects and describes a supported carriage profile. Each adapter handles route-specific encoding, transport constraints, metadata exposure, extraction and failure reporting. The research compares image-platform, encrypted file/attachment, conventional end-to-end messaging and mixnet-backed messaging profiles. Image carriage is a required subject of investigation, not a mandatory runtime route or privileged default.

Each route adapter must preserve the protected object's authenticated semantics or explicitly reject the route as incompatible. The image adapter places the encapsulated object into an image carrier and extracts it. Optional concealment is a separate image-route sub-layer, not a general transport guarantee. Only the image route invokes image-specific metadata handling: apply a documented, format-aware allowlist, remove unnecessary embedded metadata and identifying file-level properties, and verify the produced carrier. Successful invocation of a stripping operation is not proof that all intended fields were removed. File/attachment adapters instead record filename, MIME/container structure, sharing identifiers, access controls, host-side activity and retention. Messaging and mixnet profiles retain their native protocol, identity, discovery and delivery semantics; they must not be forced into image-style processing.

These boundaries must not:

* Generate or substitute cryptographic identity.
* Create security from obscurity.
* Alter authenticated content without endpoint detection.
* Treat framing checks as cryptographic integrity or sender authentication.
* Assume that platforms preserve image bytes or metadata state.
* Claim anonymity or resistance to steganalysis without appropriately bounded evidence.

If a carrier is transformed, damaged, unavailable or unsupported, the route must report extraction failure rather than silently accept corrupted, incomplete or ambiguous content.

The train's responsibility split must be compared with integrated systems such as [Echomix/Katzenpost](echomix-katzenpost-comparator.md), using the [route comparison framework](route-comparison-framework.md), which separates gateways, mix nodes, service nodes, couriers and storage replicas while coordinating traffic coupling, anonymous storage access and reliability. The existence of multiple components is not itself a distinction. The comparison must state what each actor can observe, which identifiers cross boundaries, how discovery capabilities are issued, how retries are signalled, and what collusion combinations reveal. BACAP's capability-derived pseudorandom box IDs are a substantive discovery design, not equivalent to a changing public locator. No mixnet component is assumed to be part of the proposed architecture.

3.7 Coordinator and transport intermediary

Responsible for permitted delivery coordination, routing and capsule-set handling.

It may:

* Receive routing instructions.
* Associate transport objects with delivery references.
* Coordinate multipart delivery.
* Report delivery state where observable.
* Apply retention and operational policies.

It must not be trusted to:

* Read plaintext.
* Hold the only decryption capability.
* Establish participant identity solely through platform identifiers.
* Guarantee delivery, availability, confidentiality of metadata or carrier preservation.

The coordinator’s exact knowledge and permissions must be minimised and documented.

3.8 Lifecycle and local state

Responsible for tracking message freshness, replay status, key changes, expiry and revocation.

Lifecycle state must distinguish between:

* A message no longer accepted for a new decryption attempt.
* A key or identity no longer trusted for future communication.
* A session or message key that has been retired.
* Plaintext or keys already copied, observed or retained elsewhere.

Expiry and revocation cannot remotely erase knowledge or copies already obtained by a recipient or attacker.

3.9 Optional recovery boundary

Recovery is not part of the minimum architecture.

If later research justifies threshold-controlled recovery, it must be specified as a separate mechanism with explicit:

* Recovery authority and authorisation.
* Share creation and distribution.
* Participant authentication.
* Threshold and collusion assumptions.
* Share protection and lifecycle.
* Auditability and failure handling.

No recovery topology should be adopted merely because it is technically possible. It must solve a demonstrated problem without introducing disproportionate risk.

3.10 Protocol composition and state obligations

The architecture does not select a cryptographic protocol. Before a protocol can be specified, it must define identity verification and transcript binding, key hierarchy and purpose separation, HKDF salt and context inputs, AEAD nonce uniqueness, authenticated message context, replay and ordering state, and downgrade-resistant failure behaviour. These are endpoint protocol responsibilities, not properties supplied by a carrier, route adapter or coordinator.

The [protocol boundary analysis](protocol-boundary-analysis.md) records the current obligations and the limits of relevant references. RFC 5869 distinguishes non-secret HKDF salt from context-specific `info` (SRC-041). RFC 9180 provides a compositional KEM/KDF/AEAD reference and stateful nonce handling, but leaves ordering, loss detection and broader replay protection to the application and does not provide recipient-compromise forward secrecy (SRC-042). Neither RFC is a selected project protocol.

At minimum:
* Separate identity, session, directional, message and route-local state; derive cryptographic keys with explicit purpose and direction separation.
* Bind protocol version, suite, roles, verified identity references and ephemeral key material through an authenticated transcript.
* Guarantee nonce uniqueness for every encryption under a given key, including retries, concurrency, crash recovery, rollback and multi-device state.
* Authenticate canonical message context and multipart manifests; distinguish visible AAD from encrypted fields and unauthenticated route hints.
* Maintain explicit replay, ordering, expiry and duplicate state; route retry and fallback must not bypass it.
* Fail closed on malformed, truncated, unauthenticated, stale or unsupported data; never silently downgrade or re-encrypt with a reused key/nonce pair.

4. Message lifecycle

The following is a logical lifecycle, not an implementation sequence. It separates endpoint protection, carriage preparation, transport/discovery and receiving-side validation.

1. Identity preparation: participants establish and verify the relevant cryptographic identities.
2. Session establishment: participants establish authenticated shared cryptographic context.
3. Message creation: the sender creates plaintext and the message context.
4. Message protection: the endpoint protects the message and authenticates the required context.
5. Capsule formation: the protected object is packaged as one capsule or an authenticated multipart set.
6. Encapsulation: the sender-side boundary adds bounded carriage framing and route-format context without claiming cryptographic protection.
7. Route-specific encoding: the selected adapter packages the encapsulated object for the declared profile. For image carriage, this may include image-carrier encoding and optional concealment as a distinct image-route sub-layer; other routes use their own native file, attachment, messaging or mixnet framing.
8. Route-specific handling and publication: apply only the metadata, access-control and publication operations relevant to the selected profile. Image metadata minimisation is image-specific; file hosts and messaging services require their own identifier, account, activity and retention analysis.
9. Transport coordination and discovery: the route carries the object; any coordinator may assist but is optional. The intended recipient obtains the locator, capability or retrieval instruction through the profile's separately evaluated discovery mechanism.
10. Retrieval and route-specific decoding: the receiving-side adapter obtains the route object and recovers the framed protected capsule, checking structural completeness and parser limits.
11. Capsule-set validation: the endpoint validates the authenticated manifest and message-set context, reassembling valid pieces independently of arrival order while rejecting incomplete, conflicting, substituted or ambiguous sets.
12. Cryptographic validation and local acceptance: the endpoint verifies authenticity, integrity, peer/session context and freshness before decrypting and presenting plaintext.
13. Lifecycle handling: replay state, expiry, key rotation and relevant local retention rules are applied.

A failure at any validation stage must not result in silently presenting an incomplete or incorrectly associated message as valid.

5. Trust and data boundaries

| Boundary | Trusted responsibility | Not assumed |
|---|---|---|
| Sender endpoint | Plaintext creation and key custody | Endpoint is invulnerable |
| Recipient endpoint | Verification and decryption | Recipient cannot copy plaintext |
| Identity boundary | Verified key-to-identity binding | Platform ID proves identity |
| Message protection | Confidentiality and integrity under stated assumptions | Encryption hides metadata |
| Capsule manager | Authenticated set formation and validation | Fragmentation provides recovery or arrival order defines logical order |
| Encapsulation/decapsulation | Bounded framing, extraction and structural completeness checks | Framing proves origin, authenticity or cryptographic integrity |
| Train and route adapter | Opaque carriage, route handling and carrier extraction | Transport is trusted, reliable, anonymous or metadata-free |
| Coordinator | Delivery coordination | It is confidential, reliable or identity-authoritative |
| Recovery boundary | Only explicitly authorised recovery | Threshold design is automatically safe |

6. Security responsibilities and threat mapping

W2 threat	Architectural response	Remaining work
First-contact key substitution	Identity verification boundary	Define verification ceremony
Platform ID treated as identity	Cryptographic identity binding	Define identity lifecycle
Ciphertext or metadata alteration	Authenticated message protection	Specify complete envelope
Replay	Message IDs and freshness state	Define replay policy and storage
Fragment mixing, conflicting indices or invalid set construction	Authenticated manifest and capsule context; allow safe reconstruction independent of arrival order	Define manifest, duplicate and rejection rules
Missing or duplicate capsules	Strict completeness and uniqueness checks	Define failure and retry behaviour
Image transformation	Separate carrier boundary and fail-safe extraction	Test realistic platform transformations
Metadata correlation	Minimise carrier metadata and coordinator data; document platform, host, network and access observations	Define metadata allowlist, recipient discovery and retention model
Behavioural correlation	Treat timing, routines and social-engineering probes as cross-cutting side channels	Define observer scenarios and proportionate mitigations
Intermediary compromise	Endpoint-held keys and least privilege	Review coordinator permissions
Secret leakage in logs	Endpoint and service secret-handling boundaries	Define and inspect logging policy
Recovery collusion or theft	Optional isolated recovery boundary	Do not adopt before threat and protocol specification
Endpoint compromise	Explicit residual-risk boundary	Define device and key-compromise response
Expiry or revocation overclaim	Local lifecycle semantics	Define precise acceptance and retirement rules

These responses are architectural intentions, not demonstrated mitigations.

7. Candidate topology

The minimum logical topology is:

Sender endpoint → protected message/capsules → sender-side encapsulation → route adapter/carrier → standalone train and untrusted intermediary → recipient discovery/retrieval → route adapter/decapsulation → recipient endpoint validation.

The recipient endpoint, not the train or decapsulation function, performs authenticated set validation, cryptographic verification and decryption.

The cryptographic protection boundary remains between the participant endpoints. Carrier processing and transport sit outside that boundary.

The architecture does not currently require:

* A central key server with decryption authority.
* A trusted message relay.
* A separate microservice for each logical component.
* Distributed threshold recovery.
* A blockchain or public ledger.
* An anonymity network.

Any of these would require a specific research justification and threat analysis before inclusion.

8. Architectural decisions and status

Decision	Current position	Status
Plaintext and private-key custody	Participant endpoints	Proposed
Intermediary trust	Untrusted for plaintext confidentiality and sole decryption	Required design constraint
Identity	Explicit cryptographic identity verification	Required design constraint; method open
Session establishment	Authenticated key establishment	Required capability; protocol open
Message protection	Authenticated encryption with bound context	Candidate construction
Sender authentication	Separate, explicit cryptographic responsibility	Required capability; construction open
Carrier	Image is a transport container	Proposed boundary
Concealment	Optional and separately evaluated	Deferred
Multipart	Authenticated manifest/set validation; safe out-of-order reconstruction	Required capability; format open
Encapsulation/decapsulation	Bounded framing and structural extraction only	Required transport boundary; format open
Standalone train	Replaceable opaque carriage and discovery coordination	Required conceptual separation; service contract open
Recipient discovery	Authenticated retrieval instruction without a stable exposed locator	Open research problem
Expiry and revocation	Honest local/future-access semantics	Required capability; policy open
Recovery	Separate optional mechanism	Deferred
Deployment topology	Minimal logical topology first	Proposed

9. Evaluation implications for W4

W4 must evaluate the architecture against the W2 threat model, not merely confirm that its components exist.

At minimum, evaluation should address:

* Whether an intermediary can obtain plaintext or sole decryption capability under the stated assumptions.
* Whether first-contact identity substitution is detectable.
* Whether sender, recipient, session and message context are cryptographically bound.
* Whether valid out-of-order capsules are reconstructed from authenticated logical indices, while altered, replayed, incomplete, conflicting, substituted and mixed sets fail safely.
* Whether encapsulation/decapsulation enforces bounded framing and safe extraction without being mistaken for cryptographic authentication.
* Whether recipient discovery, metadata minimisation and route placement meet the stated observer assumptions.
* Whether realistic image transformations cause safe failure.
* Whether logs, diagnostics and operational metadata expose secrets or sensitive content.
* Whether key rotation, expiry and revocation behave according to their stated limits.
* Whether optional recovery, if retained, withstands its stated theft and collusion scenarios.

Acceptance thresholds and test methods remain to be specified in W4.

10. Open protocol decisions

W3 intentionally does not settle:

1. Authenticated key-establishment protocol and key confirmation.
2. First-contact verification and identity-key change procedure.
3. Exact cryptographic suite and protocol versioning.
4. Canonical message encoding and authenticated field layout.
5. Nonce generation, uniqueness and key-use limits.
6. Sender authentication construction and signing context.
7. Replay-state persistence and freshness policy.
8. Multipart manifest, digest and reconstruction rules.
9. Carrier formats and realistic transformation tolerance.
10. Metadata minimisation, retention and operational visibility.
11. Expiry, revocation, device replacement and compromise response.
12. Whether recovery is justified, and if so, its threat model.
13. Recipient discovery/rendezvous, locator privacy and access-pattern exposure. The current [observer/property matrix](observer-property-matrix.md) compares OMR/GOMR, oblivious signaling and two-server DORAM as distinct retrieval/access families. None is assumed to be a drop-in component. Their setup, collusion, cover-traffic, bearer-token, integrity and network-observer assumptions must be compared against the intended route before any mechanism is selected.
14. Carrier metadata allowlist, verification of removal and platform-added metadata.
15. Observer models for transport unlinkability and behavioural correlation.
16. Whether any traffic-obfuscation, padding, delay, batching, cover-traffic or mix-network mechanism belongs in scope, and what costs it would impose.

These decisions require protocol-level research and evaluation before implementation.

11. W3 conclusion

The research supports a modular, endpoint-controlled architecture in which cryptographic authority remains with participants and the intermediary is restricted to transport and coordination.

The image carrier is deliberately subordinate to the cryptographic message format. The train and its encapsulation/decapsulation boundary are replaceable carriage mechanisms, not cryptographic authorities. Multipart handling is treated as an integrity and context-binding problem: valid out-of-order arrivals may be reconstructed, while ambiguous or conflicting sets fail safely. Lifecycle semantics are constrained by what endpoints can actually enforce.

The architecture therefore establishes responsibilities and trust boundaries before fixing a protocol or deployment topology. It also treats confidence as a verifier's evidence-bounded judgement rather than a system-wide badge: claims must expose their scope, provenance, assumptions, freshness and unresolved alternatives, while minimising the metadata generated by verification. Further complexity remains conditional on evidence that it improves a stated research objective.

Theory only · No implementation · Not audited.