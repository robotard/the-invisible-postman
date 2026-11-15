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

The architecture is deliberately divided into responsibilities rather than prematurely committed to a particular deployment topology.

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

2.3 Transport routes and carrier adapters

The transport-route layer carries a protected message between endpoints. It is a first-class architectural concern because routes determine packaging, capacity, transformation exposure, routing metadata, ordering, delivery behaviour and extraction failure modes.

Image carriage is a required route profile in this research. Other routes, such as file/attachment carriage and conventional messaging transport, may be modelled as comparison profiles. Their inclusion does not displace the image route or imply that one route is superior.

Each route adapter must preserve the opaque protected message or detect when it cannot. Route-specific handling must not silently change authenticated content or message context. Image-specific encoding and extraction belong to the image adapter. Optional steganographic concealment is a separate sub-layer within that route and is not a substitute for encryption, authentication or integrity.

An image is a transport container. It is not a key, identity credential, source of guaranteed entropy, or substitute for authenticated encryption. The protected capsule must remain meaningful independently of optional concealment.

2.4 Passenger topology, encapsulation and the standalone train

The participant-side cryptographic topology is the primary security architecture. Each participant performs the necessary endpoint role in the agreement/key-establishment, message-protection, authentication and validation process. The intended "anonymous agreement" property requires a precise definition and protocol analysis; this architecture does not claim anonymity merely by naming it.

The train is a standalone transport element with a narrow service contract: carry an already protected object over a selected route. It may select a route, apply route-specific carriage handling, and coordinate delivery. It does not establish participant trust, negotiate or own cryptographic keys, encrypt or authenticate messages, decide message validity, or hold decryption authority. It is a transport aid, not a cryptographic participant.

The encapsulation boundary sits between the protected message/capsule and the train. It packages the opaque protected object for carriage, supplies bounded framing and route information, and supports detection of truncation, substitution, malformed extraction or route failure. It must not reinterpret or silently modify authenticated message semantics. Encapsulation alone is not a security primitive: any security-relevant fields or bindings must be authenticated by the endpoint protocol.

The train may be low-fidelity and untrusted. It may be inspected, copied, delayed, reordered, transformed, substituted, or unavailable. The passenger-side security topology must remain conceptually intact if the train is replaced or removed. Image carriage remains a required route; steganography or another image technique is a route mechanism within the train, not part of the passenger security topology.

2.4.1 Unique image envelopes, variable placement and decapsulation

The train may generate or obtain a distinct image carrier object for each carriage instance and vary that carrier's publication or retrieval placement. Here, "unique" means that a carrier object is not reused for another carriage instance under the proposed policy; it does not mean cryptographic uniqueness, secret entropy, randomness, unpredictability or guaranteed unlinkability. The carrier is not a nonce, key or identity credential. At the receiving side, a transport decapsulation function discovers or obtains the selected carrier, extracts the encapsulated protected object, checks transport framing and extraction completeness, and hands the result to the participant endpoint. The endpoint, not the train, performs cryptographic authentication and acceptance.

This creates a transport-level unlinkability objective: reduce straightforward correlation based on reuse of the same carrier or a stable, predictable publication location. It is a separate contribution of the train and does not replace the participant-side cryptographic topology. It must not be described as guaranteed anonymity. Timing correlation, access logs, network identifiers, hosting metadata, image fingerprints, repeated patterns, and the discovery/rendezvous mechanism may still reveal relationships. This is a carrier/object-level variation, not a traffic-analysis defence. Research comparators such as Loopix use explicit mixing and cover traffic under a defined observer model; those mechanisms introduce additional infrastructure, bandwidth, delay and usability assumptions and are not part of the current proposal (see SRC-016 and SRC-018–SRC-019 in the source register).

Variable placement requires a recipient-discovery mechanism. The design must explain how the intended recipient learns where and when to retrieve a carrier without introducing a stable locator or observable side channel that defeats the intended benefit. Random placement alone is not a delivery protocol. The carrier should be treated as disposable and replaceable; decapsulation failure must produce a bounded failure, never silent acceptance of partial or ambiguous content.

Metadata minimisation is part of the image-carriage processing path. Before publication, remove unnecessary embedded image metadata and identifying file-level properties, retaining only fields demonstrably needed for carrier decoding, compatibility or safe handling. The route profile must document its metadata allowlist and verify the produced carrier rather than assuming a metadata-stripping operation succeeded. This operation cannot remove hosting-provider logs, network identifiers, externally observed timestamps, access records or other metadata generated outside the carrier; those require distinct controls and remain potential observations.

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

**Standalone train**

The train is a replaceable, low-fidelity carriage element. It may select a route, coordinate publication and retrieval, associate transport objects with operational delivery references, and report limited delivery state where observable. It carries opaque protected objects and does not hold plaintext, participant private keys, sole decryption capability or authority to accept a message.

Recipient discovery is a separate requirement, not something solved by random placement. The recipient needs an authenticated means to learn where and when to retrieve the relevant carrier. The locator, discovery channel, publication schedule and access pattern may themselves expose relationships. Their design remains open and must be evaluated against the observer model.

**Transport-route manager and carrier adapters**

The route manager selects and describes a supported carriage profile. Each adapter handles route-specific encoding, transport constraints, metadata exposure, extraction and failure reporting. Image carriage is required in this research; file/attachment and conventional messaging routes remain comparison profiles.

The image adapter places capsules into image carriers and extracts them. Optional concealment is a separate image-route sub-layer, not a general transport guarantee. Before publication, the image processing path must apply a documented metadata allowlist and remove unnecessary embedded metadata and identifying file-level properties. The produced carrier must be checked; successful invocation of a stripping operation is not proof that all intended fields were removed.

These boundaries must not:

* Generate or substitute cryptographic identity.
* Create security from obscurity.
* Alter authenticated content without endpoint detection.
* Treat framing checks as cryptographic integrity or sender authentication.
* Assume that platforms preserve image bytes or metadata state.
* Claim anonymity or resistance to steganalysis without appropriately bounded evidence.

If a carrier is transformed, damaged, unavailable or unsupported, the route must report extraction failure rather than silently accept corrupted, incomplete or ambiguous content.

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

4. Message lifecycle

The following is a logical lifecycle, not an implementation sequence. It separates endpoint protection, carriage preparation, transport/discovery and receiving-side validation.

1. Identity preparation: participants establish and verify the relevant cryptographic identities.
2. Session establishment: participants establish authenticated shared cryptographic context.
3. Message creation: the sender creates plaintext and the message context.
4. Message protection: the endpoint protects the message and authenticates the required context.
5. Capsule formation: the protected object is packaged as one capsule or an authenticated multipart set.
6. Encapsulation: the sender-side boundary adds bounded carriage framing and route-format context without claiming cryptographic protection.
7. Carrier encoding: the selected route adapter places the encapsulated object into an image carrier; optional concealment is applied only as a distinct image-route sub-layer.
8. Metadata minimisation and publication: unnecessary carrier-embedded metadata and identifying file-level properties are removed and the output is checked before publication.
9. Transport coordination and discovery: the train coordinates carriage; the intended recipient obtains the locator or retrieval instruction through a separately evaluated discovery mechanism.
10. Retrieval and decapsulation: the receiving-side route adapter obtains the carrier and decapsulation extracts the framed protected capsule, checking structural completeness and parser limits.
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
13. Recipient discovery/rendezvous, locator privacy and access-pattern exposure.
14. Carrier metadata allowlist, verification of removal and platform-added metadata.
15. Observer models for transport unlinkability and behavioural correlation.
16. Whether any traffic-obfuscation, padding, delay, batching, cover-traffic or mix-network mechanism belongs in scope, and what costs it would impose.

These decisions require protocol-level research and evaluation before implementation.

11. W3 conclusion

The research supports a modular, endpoint-controlled architecture in which cryptographic authority remains with participants and the intermediary is restricted to transport and coordination.

The image carrier is deliberately subordinate to the cryptographic message format. The train and its encapsulation/decapsulation boundary are replaceable carriage mechanisms, not cryptographic authorities. Multipart handling is treated as an integrity and context-binding problem: valid out-of-order arrivals may be reconstructed, while ambiguous or conflicting sets fail safely. Lifecycle semantics are constrained by what endpoints can actually enforce.

The architecture therefore establishes responsibilities and trust boundaries before fixing a protocol or deployment topology. Further complexity remains conditional on evidence that it improves a stated research objective.

Theory only · No implementation · Not audited.