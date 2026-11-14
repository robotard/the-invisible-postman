# W6 · Protocol Specification Dossier

**Project:** The Invisible Postman  
**Version:** 0.1 research draft  
**Date:** 14 November 2026  
**Status:** Protocol design dossier · decisions remain open  
**Assurance:** Theory only · No implementation · Not audited.

> This document narrows the protocol design space. It is not a final wire protocol, cryptographic construction, implementation specification or security assurance.

## 1. Purpose and boundary

W6 translates the W1 research questions, W2 threat model and W3 architecture into a protocol-level design dossier. It identifies the information that must be bound, the validation order, the key roles, and the decisions that must be resolved before implementation.

The protocol boundary begins with verified cryptographic identity material and ends when a recipient endpoint accepts and releases a plaintext message. Carrier encoding and coordinator delivery are outside the cryptographic trust boundary. They may transport, delay, duplicate, reorder, transform or suppress objects.

The protocol must not rely on the carrier, platform account, coordinator or image host for confidentiality, sender identity or integrity.

## 2. Design goals

The eventual protocol must:

1. Keep plaintext and decryption authority at participant-controlled endpoints.
2. Bind messages to verified cryptographic identities and the intended peer/session context.
3. Detect modification, substitution, malformed encoding and cross-context use.
4. Define safe handling of delayed, duplicate, replayed and out-of-order delivery.
5. Reconstruct multipart messages unambiguously and reject incomplete or conflicting sets.
6. Separate cryptographic protection from image packaging and optional concealment.
7. Expose metadata and availability limitations honestly.
8. Prefer reviewed protocol constructions over a bespoke handshake or cryptographic composition.

## 3. Explicit non-goals

W6 does not promise anonymity, traffic-analysis resistance, guaranteed delivery, universal carrier survival, steganographic undetectability, remote erasure or protection of a compromised endpoint.

It does not make a decision to use a particular cryptographic suite. X25519, HKDF-SHA-256, Ed25519 and XChaCha20-Poly1305 remain candidates only.

## 4. Operating model: synchronous or asynchronous

This is a foundational unresolved decision.

### 4.1 Synchronous session model

Both participants are available to establish an authenticated session before message exchange. A reviewed authenticated key-establishment protocol can bind the live handshake to the verified peer keys.

Advantages:
- simpler session-state reasoning;
- direct key confirmation can occur before sending application messages;
- fewer prekey and one-time-key lifecycle requirements.

Costs and limits:
- does not naturally support sending to an offline recipient;
- reconnects, device replacement and session resumption still need defined handling;
- a live transport path may be required during establishment.

### 4.2 Asynchronous message model

A sender can create a message while the recipient is offline. This generally requires a pre-established recipient key package or a reviewed asynchronous key-establishment design, with explicit rules for prekey publication, consumption, replenishment, replay and device identity.

Advantages:
- fits store-and-forward delivery and delayed image-carrier transport;
- sender and recipient need not be online simultaneously.

Costs and limits:
- more complex key lifecycle and state management;
- one-time key exhaustion, replay and concurrent initiation require explicit handling;
- server-side prekey storage may reveal metadata and creates an availability dependency;
- compromise and forward-secrecy properties depend on the selected protocol and its state evolution.

### 4.3 W6 position

Do not invent a custom handshake to bridge these models. First decide whether offline delivery is a core requirement. Then evaluate established, reviewed protocol designs that actually support the required operating model.

**Open decision D1:** Is asynchronous, recipient-offline sending a mandatory system requirement, or is an online session acceptable for the first research profile?

This decision blocks final selection of the session-establishment protocol.

## 5. Identity model and key roles

A platform account, username, bot identifier or image-host account is a routing attribute, not proof of a person's identity.

The protocol must distinguish at least:

| Key or identifier | Intended role | Trust rule |
|---|---|---|
| Human/entity identity record | Names the participant in the application's trust model | Must be verified through an explicit ceremony |
| Long-term identity/authentication key | Binds protocol credentials to a participant | Public key fingerprint must be verified; private key stays at endpoint |
| Key-agreement credential | Establishes shared secret material | Must be bound to the verified identity; never accepted solely from transport |
| Session/message keys | Protect individual sessions or messages | Derived for defined purposes; never reused across unrelated roles |
| Platform routing identifier | Helps locate a participant or delivery endpoint | Untrusted for identity; may change or be reassigned |

The design must decide whether identity and key agreement use separate key pairs, and how their binding is authenticated. Reusing one key for multiple cryptographic purposes must not be assumed safe.

### 5.1 First-contact verification

Before accepting a peer key as belonging to the intended participant, the endpoints need a defined verification ceremony. Candidate approaches include comparing a short authentication string or fingerprint through an independent authenticated channel, scanning a verified QR representation in person, or relying on a documented organisational identity authority.

The selected method must define:
- what exact key material or identity bundle is compared;
- how the comparison detects substitution;
- what happens when comparison cannot be completed;
- how key changes are displayed and re-verified; and
- how multiple devices are represented.

A platform-provided key directory may distribute key material, but distribution is not verification.

### 5.2 Key changes and compromise

Key replacement must be authenticated by a still-trusted prior key, a separate verified channel, or an explicitly defined recovery ceremony. If the prior key is suspected compromised, a signature by that key alone is insufficient proof of a legitimate change.

The protocol must define device addition/removal, key rotation, lost devices, suspected compromise and revocation. Revocation affects future trust decisions; it cannot retract plaintext already obtained.

## 6. Session establishment and sender authentication

These are related but not interchangeable.

### 6.1 Session establishment

The selected construction must provide authenticated key agreement, explicit peer binding, session context and key confirmation appropriate to the operating model. It must state which party authenticates which key and at what point the session is considered established.

A reviewed protocol framework should be preferred over a bespoke sequence of Diffie-Hellman operations, signatures and KDF calls. The candidate framework and exact pattern must be selected only after D1 is resolved.

### 6.2 Sender authentication semantics

The project must state what “authenticated sender” means:

- **Recipient authentication:** the recipient can determine that the message came from the peer associated with the session, under the protocol's trust assumptions.
- **Transferable signature:** a third party can verify that a particular signing key signed the message.
- **Human identity assurance:** the signing or session key is bound to the intended person through a separate identity-verification process.

A symmetric message-authentication key shared by both participants does not provide third-party proof that only the sender could have created a message: the recipient also knows the key and may be able to forge messages. A digital signature can provide transferable verification but creates different privacy, attribution and repudiation consequences.

**Open decision D2:** Is recipient-side peer authentication sufficient, or does the research require independently verifiable message signatures? Do not claim non-repudiation without a defined legal, operational and cryptographic model.

## 7. Protected message envelope

The envelope should have a canonical, versioned representation. Parsing must reject unknown critical fields, duplicate fields, invalid lengths, unsupported versions and non-canonical encodings rather than silently normalising ambiguous input.

### 7.1 Candidate logical fields

| Field | Purpose | Protection requirement |
|---|---|---|
| Protocol version | Selects the exact format and processing rules | Authenticated |
| Suite/profile identifier | Identifies the agreed cryptographic profile | Authenticated; unsupported profiles rejected |
| Sender identity reference | Associates the message with a verified peer | Bound to authenticated context |
| Recipient identity reference | Prevents cross-recipient substitution | Bound to authenticated context |
| Session/context identifier | Separates sessions and prevents cross-context use | Authenticated |
| Message identifier | Unique message-set and replay reference | Authenticated |
| Message type/content type | Selects safe interpretation | Authenticated; allow-listed |
| Creation/expiry metadata | Supports local lifecycle policy | Authenticated but not trusted as a clock |
| Multipart manifest reference | Binds the envelope to the expected set | Authenticated |
| Nonce/AEAD parameters | Required by the selected construction | Validated according to its specification |
| Ciphertext and authentication tag | Protected message payload | Verified before plaintext release |

This is a logical field inventory, not a final byte layout. The exact encoding, optionality, maximum sizes and canonicalisation rules remain open.

### 7.2 Authenticated associated data

The selected authenticated-encryption construction should bind all immutable context required to prevent substitution, including version/profile, sender and recipient references, session identifier, message identifier and the agreed multipart manifest fields.

Mutable transport attributes such as image URL, platform message ID, delivery timestamp or storage location must not be treated as trusted identity or cryptographic context unless a future design explicitly binds and validates them.

The exact associated-data byte sequence must be defined by the canonical encoding. Two endpoints must produce identical bytes for the same logical message.

### 7.3 Encryption and sender authentication

Authenticated encryption provides confidentiality and integrity under its key assumptions. It does not independently solve human identity verification or transferable authorship.

The protocol must choose and document whether sender authentication is supplied by directional session keys, a separate signature, or a reviewed protocol's defined authenticated channel semantics. It must not mix these models informally.

## 8. Key derivation, separation and nonce policy

The protocol must specify:
- the source and authentication status of input key material;
- the exact KDF and version;
- context strings and domain separation for each purpose;
- independent keys for each direction and function where required;
- key rotation and maximum key-use limits;
- nonce size, construction, uniqueness requirements and persistence behaviour;
- behaviour after state loss, backup restoration or concurrent sending; and
- secure retirement and deletion expectations.

HKDF-SHA-256 is a candidate KDF, not an adopted choice. XChaCha20-Poly1305 is a candidate AEAD, not an adopted choice. If selected, the nonce-generation procedure and per-key usage policy must follow the construction's specification and be reviewed. Randomness must come from a cryptographically secure operating-system source, not image pixels, timestamps, user-selected carrier files or a general-purpose pseudorandom generator.

No nonce may be reused with the same key where the selected AEAD requires uniqueness. The design must not rely on an informal assumption that collisions are “unlikely” without stating the nonce model and usage bounds.

## 9. Replay, ordering and freshness

Timestamps alone are not replay protection. A message may be delayed, duplicated or delivered out of order by the intermediary.

The protocol must define:
- a unique message identifier with adequate unpredictability or collision resistance;
- the scope in which uniqueness applies (sender, recipient, session and/or device);
- recipient-side acceptance state and duplicate handling;
- the treatment of legitimate out-of-order messages;
- state persistence and backup/rollback behaviour;
- how old or unknown session messages are handled; and
- whether expiry is advisory or a hard local acceptance rule.

A recipient should not release plaintext twice merely because the carrier or coordinator redelivers an object. If replay state is missing or cannot be trusted, the endpoint must fail closed or require an explicit recovery procedure rather than silently treating an old message as new.

## 10. Multipart manifest and reconstruction

The safest initial research profile is to protect the complete logical message first, then divide the resulting protected byte string into transport fragments. The carrier layer transports fragments; it does not define cryptographic trust.

A candidate manifest should include:
- protocol/profile version;
- message-set identifier;
- total protected-object length;
- fragment count;
- fixed fragment payload size or explicit per-fragment lengths;
- fragment index convention;
- message/session binding reference; and
- a digest or equivalent integrity reference for the complete protected object.

The manifest and its relevant fields must be bound into authenticated message context. The exact construction must avoid circular dependencies between ciphertext, manifest and associated data. One possible ordering is to determine plaintext length and fragment sizing first, derive the expected protected-object length (including fixed cryptographic overhead), construct the manifest, authenticate that manifest as context, then encrypt and split the resulting protected object. This ordering must be validated against the selected envelope and AEAD before adoption.

Receiver rules:
1. Enforce strict upper bounds on declared object size, fragment count and fragment length before allocating large resources.
2. Reject invalid indices, impossible lengths, inconsistent manifests and unsupported versions.
3. Treat identical duplicate fragments as duplicates, not additional data; reject conflicting duplicates.
4. Never combine fragments across message-set identifiers, senders, recipients or sessions.
5. Do not release plaintext from a partial set.
6. Reconstruct only when all required fragments are present and consistent.
7. Verify the complete protected object cryptographically before releasing plaintext.
8. On timeout or permanent loss, report an incomplete set; do not invent missing bytes or treat fragmentation as recovery.

Fragmentation does not provide redundancy, threshold secret sharing, forward secrecy or confidentiality by itself.

## 11. Error handling and resource limits

Externally visible errors should reveal no secret-dependent information. The endpoint may distinguish user-actionable states such as “incomplete set” from “invalid message”, but must not expose detailed cryptographic failure traces to an untrusted coordinator.

The specification must set defensible bounds for:
- total message size;
- fragment count and per-fragment size;
- parsing depth and field lengths;
- concurrent incomplete message sets;
- retention of incomplete sets;
- verification and decryption work; and
- retry frequency.

Malformed or oversized objects must be rejected before expensive processing. Limits must be consistent across endpoints and included in the versioned profile.

## 12. Downgrade, versioning and algorithm agility

The protocol version and cryptographic profile must be authenticated. An endpoint must not silently fall back to a weaker or older profile because a peer or intermediary requests it.

The specification must define:
- supported and deprecated versions;
- negotiation rules;
- handling of unknown critical fields;
- downgrade detection;
- key and message migration;
- minimum compatibility policy; and
- the retirement process for a compromised or obsolete suite.

Algorithm agility must not become an unrestricted negotiation surface. Each profile should be a reviewed, complete set of compatible choices, not an arbitrary mix of algorithms.

## 13. Metadata and coordinator knowledge

Encryption does not hide all traffic information. Depending on the transport, the coordinator or platform may observe account identifiers, destination, timing, frequency, object sizes, fragment counts, image dimensions, URLs, delivery status and retention patterns.

The next protocol revision must include a metadata inventory and data-retention model. The coordinator should receive only the routing and state information necessary for its function. No anonymity or unlinkability claim is made.

## 14. Candidate protocol profiles

No profile is selected in this draft.

| Candidate area | Options to evaluate | Main question |
|---|---|---|
| Authenticated session | Reviewed protocol framework and patterns appropriate to synchronous or asynchronous use | Does it match offline delivery and identity-verification requirements? |
| Identity authentication | Verified public-key fingerprints, signed identity bundles, or an explicit organisational trust model | How is key substitution detected and key change handled? |
| KDF | HKDF-SHA-256 | Are inputs authenticated and context-separated correctly? |
| AEAD | XChaCha20-Poly1305 or another reviewed construction | Are nonce rules, platform support and usage bounds acceptable? |
| Sender proof | Directional session authentication or separate digital signatures | Is recipient authentication enough, or is transferable proof required? |
| Encoding | Canonical, bounded binary encoding with explicit versioning | Can two implementations parse exactly the same message? |
| Multipart | Whole-object protection followed by bounded fragmentation | Can every malformed, incomplete or mixed set be rejected? |

Selection requires a written rationale, threat mapping, known limitations, independent cryptographic review and testable acceptance criteria.

## 15. Decisions register

| ID | Decision | Current status | Blocking consequence |
|---|---|---|---|
| D1 | Synchronous session or asynchronous/offline delivery | Open | Blocks session protocol selection |
| D2 | Recipient-side sender authentication or transferable signatures | Open | Blocks authentication semantics |
| D3 | Identity key and key-agreement key relationship | Open | Blocks identity bundle and verification ceremony |
| D4 | First-contact and key-change verification method | Open | Blocks peer identity acceptance rules |
| D5 | Canonical encoding and exact envelope layout | Open | Blocks interoperable message parsing |
| D6 | KDF, AEAD profile, key separation and nonce policy | Open | Blocks cryptographic profile selection |
| D7 | Replay-state scope, persistence and rollback response | Open | Blocks freshness acceptance rules |
| D8 | Authenticated multipart manifest and fragment sizing | Draft approach only | Blocks interoperable fragmentation |
| D9 | Metadata minimisation and retention | Open | Blocks coordinator data contract |
| D10 | Supported carrier formats and transformation profile | Open | Blocks carrier compatibility claims |
| D11 | Recovery and concealment necessity | Deferred | Not part of minimum protocol |

## 16. Minimum acceptance conditions before implementation

Implementation should not begin until the following are specified and reviewed:

- identity model, first-contact verification and key-change procedure;
- operating model for online/offline delivery;
- authenticated session-establishment protocol and peer binding;
- exact meaning and mechanism of sender authentication;
- canonical envelope encoding and authenticated context;
- cryptographic profile, key separation and nonce policy;
- replay and state-loss behaviour;
- multipart manifest, size limits and rejection rules;
- metadata inventory and coordinator permissions;
- versioning, downgrade and error-handling rules; and
- threat-led test cases with justified acceptance criteria.

## 17. Conclusion

W6 narrows the next research task from broad architectural responsibilities to explicit protocol decisions. It identifies asynchronous delivery, identity binding, sender-authentication semantics, canonical encoding, nonce and replay state, and multipart construction as interdependent design problems.

The project should not proceed by selecting familiar algorithm names and improvising a protocol around them. It should select an operating model, compare reviewed protocol constructions, specify the complete message and lifecycle rules, and invite specialist criticism before implementation.

**Theory only · No implementation · Not audited.**

## Related artefacts

- [W1 · Research framing](w1-research-framing.md)
- [W2 · Threat model](w2-threat-model.md)
- [W3 · Architecture](w3-architecture.md)
- [W4 · Risks and evaluation](w4-risks-and-evaluation.md)
- [Research traceability](traceability.md)
- [Critical review questions](../review/REVIEW_QUESTIONS.md)
- [Integrated thesis](../thesis.md)
