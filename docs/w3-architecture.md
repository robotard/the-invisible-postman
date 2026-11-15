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
* Image-carried message capsules, with concealment treated as optional and separate.
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

2.3 The carrier is not the security boundary

An image is a transport container. It is not a key, identity credential, source of guaranteed entropy, or substitute for authenticated encryption.

The encrypted and authenticated capsule must remain meaningful independently of any optional steganographic layer.

2.4 Complexity must earn its place

Every component must have a traceable responsibility and a demonstrable benefit against a research objective or identified threat.

A component that merely adds another layer, service, key or recovery participant without improving a stated property should not be included by default.

3. Logical component boundaries

The following components describe responsibilities. They do not require separate services, processes or deployment units.

2.5 Password-derived keying as an evaluated alternative

The earlier password-derived model was selected for the exploratory one-to-one image-message concept because a shared passphrase is familiar, portable with the protected object, and avoids requiring an identity directory or key-distribution service at the outset. With a fresh salt and appropriately configured Argon2id, it can derive a key for authenticated encryption while keeping the password itself out of the carrier. This was a pragmatic usability and research-scope decision, not a claim that a password authenticates the sender or supplies strong entropy.

The model has important limits: password quality governs resistance to offline guessing; the salt and KDF parameters are public metadata rather than protection against weak passwords; a shared secret does not distinguish which participant sent a message; and password distribution, rotation, compromise response, multi-device use, and forward secrecy require additional design. It is therefore suitable only under explicit assumptions, such as a small set of participants who already share a sufficiently strong secret through a separate trusted channel.

The current architecture adopts endpoint-controlled identity and authenticated session establishment because the research scope now includes peer verification, sender authentication, per-session context, and key lifecycle. Password-derived encryption remains a documented alternative or narrow mode, not the identity model or an implicitly combined part of the current design. Any future hybrid must specify the role of each input, context binding, key separation, and failure behaviour before evaluation.

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

The receiver must reject incomplete, duplicated, reordered, conflicting or cross-message capsule combinations unless a specifically defined recovery rule applies.

Fragmentation is a transport and packaging mechanism. It is not a cryptographic recovery scheme.

3.6 Carrier encoder and decoder

Responsible for placing capsules into image or other supported media carriers and extracting them.

This boundary must not:

* Generate or substitute cryptographic identity.
* Create security from obscurity.
* Alter authenticated content without detection.
* Assume that platforms preserve image bytes.
* Claim resistance to steganalysis without appropriate testing.

The encoder and decoder must expose failures clearly. If a carrier is transformed or damaged, the system must fail safely rather than silently accept corrupted or ambiguous content.

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

The following is a logical lifecycle, not an implementation sequence.

1. Identity preparation: participants establish and verify the relevant cryptographic identities.
2. Session establishment: participants establish authenticated shared cryptographic context.
3. Message creation: the sender creates plaintext and the message context.
4. Message protection: the endpoint encrypts and authenticates the message, binding required metadata.
5. Capsule formation: the protected object is packaged as one capsule or a linked multipart set.
6. Carrier encoding: capsules are placed into supported image carriers. Optional concealment is applied only as a distinct layer.
7. Transport coordination: the intermediary routes or coordinates carrier delivery without becoming a plaintext authority.
8. Carrier extraction: the receiving endpoint extracts the capsule data and validates its structure.
9. Set validation: the endpoint checks completeness, ordering, uniqueness, version and message-set binding.
10. Cryptographic validation: the endpoint checks authenticity, integrity, context and freshness before releasing plaintext.
11. Local acceptance: valid content is decrypted and presented to the recipient.
12. Lifecycle handling: replay state, expiry, key rotation and relevant local retention rules are applied.

A failure at any validation stage must not result in silently presenting an incomplete or incorrectly associated message as valid.

5. Trust and data boundaries

Boundary	Trusted responsibility	Not assumed
Sender endpoint	Plaintext creation and key custody	Endpoint is invulnerable
Recipient endpoint	Verification and decryption	Recipient cannot copy plaintext
Identity boundary	Verified key-to-identity binding	Platform ID proves identity
Message protection	Confidentiality and integrity under stated assumptions	Encryption hides metadata
Capsule manager	Correct set formation and validation	Fragmentation provides recovery
Carrier layer	Encoding and extraction	Images survive transformation
Coordinator	Delivery coordination	It is confidential, reliable or identity-authoritative
Recovery boundary	Only explicitly authorised recovery	Threshold design is automatically safe

6. Security responsibilities and threat mapping

W2 threat	Architectural response	Remaining work
First-contact key substitution	Identity verification boundary	Define verification ceremony
Platform ID treated as identity	Cryptographic identity binding	Define identity lifecycle
Ciphertext or metadata alteration	Authenticated message protection	Specify complete envelope
Replay	Message IDs and freshness state	Define replay policy and storage
Fragment mixing or reordering	Authenticated set and capsule context	Define manifest and rejection rules
Missing or duplicate capsules	Strict completeness and uniqueness checks	Define failure and retry behaviour
Image transformation	Separate carrier boundary and fail-safe extraction	Test realistic platform transformations
Metadata correlation	Minimise coordinator data and document exposure	Define metadata and retention model
Intermediary compromise	Endpoint-held keys and least privilege	Review coordinator permissions
Secret leakage in logs	Endpoint and service secret-handling boundaries	Define and inspect logging policy
Recovery collusion or theft	Optional isolated recovery boundary	Do not adopt before threat and protocol specification
Endpoint compromise	Explicit residual-risk boundary	Define device and key-compromise response
Expiry or revocation overclaim	Local lifecycle semantics	Define precise acceptance and retirement rules

These responses are architectural intentions, not demonstrated mitigations.

7. Candidate topology

The minimum logical topology is:

Sender endpoint → optional carrier processing → untrusted coordinator/transport → optional carrier processing → recipient endpoint

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
Multipart	Authenticated manifest/set validation	Required capability; format open
Expiry and revocation	Honest local/future-access semantics	Required capability; policy open
Recovery	Separate optional mechanism	Deferred
Deployment topology	Minimal logical topology first	Proposed

9. Evaluation implications for W4

W4 must evaluate the architecture against the W2 threat model, not merely confirm that its components exist.

At minimum, evaluation should address:

* Whether an intermediary can obtain plaintext or sole decryption capability under the stated assumptions.
* Whether first-contact identity substitution is detectable.
* Whether sender, recipient, session and message context are cryptographically bound.
* Whether altered, replayed, incomplete, duplicate, reordered and mixed capsule sets are rejected.
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

These decisions require protocol-level research and evaluation before implementation.

11. W3 conclusion

The research supports a modular, endpoint-controlled architecture in which cryptographic authority remains with participants and the intermediary is restricted to transport and coordination.

The image carrier is deliberately subordinate to the cryptographic message format. Multipart handling is treated as an integrity and context-binding problem, not as an implicit recovery mechanism. Lifecycle semantics are constrained by what endpoints can actually enforce.

The architecture therefore establishes responsibilities and trust boundaries before fixing a protocol or deployment topology. Further complexity remains conditional on evidence that it improves a stated research objective.

Theory only · No implementation · Not audited.