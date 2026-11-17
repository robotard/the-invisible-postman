# Protocol Boundary Analysis: Key Derivation, Context Binding, Nonces and Replay

**Status:** Research analysis and design constraints; no protocol selected.  
**Roadmap alignment:** W3 architecture · W4 evaluation · RQ1, RQ2, RQ4 and RQ9  
**Sources:** SRC-001–SRC-011, SRC-038, SRC-041 and SRC-042  
**Assurance:** Theory only · No implementation · Not audited.

## 1. Purpose and boundary

This document turns the open protocol questions into explicit design obligations. It distinguishes the properties supplied by a primitive or construction from the application protocol responsibilities that remain. It does not select a cryptographic suite, define a complete wire protocol or establish security.

The endpoint-protected object must retain the same authenticated meaning across image, file, messaging and mixnet-backed routes. Carrier identifiers, image uniqueness, filenames, URLs, transport sequence numbers and platform metadata are not cryptographic substitutes for protocol context, nonces, identity authentication or replay state.

The current candidate primitive list (X25519, HKDF-SHA-256, Ed25519 and XChaCha20-Poly1305) remains provisional. HPKE (RFC 9180) is added as a useful compositional reference, not as an adopted protocol or drop-in replacement. Its documented constraints make application responsibilities particularly visible (SRC-042).

## 2. Key hierarchy and scope

A future specification must define a key hierarchy before defining message fields. At minimum, it must distinguish:

1. **Identity keys:** long-lived keys whose public counterparts are associated with participant identities through an explicit verification process.
2. **Session-establishment material:** ephemeral or otherwise scoped inputs used to establish shared secret material between authenticated participants.
3. **Root/key-schedule material:** intermediate secrets from which purpose-specific keys are derived.
4. **Directional message-protection keys:** separate sender-to-recipient and recipient-to-sender material where bidirectional communication is required.
5. **Message or epoch keys:** keys scoped to a message, chain position, epoch or other explicitly bounded lifecycle unit.
6. **Non-cryptographic route state:** carrier references, publication locations, delivery attempts and adapter state. These are not keys and must not enter the cryptographic trust model by implication.

Key separation should be explicit and domain-separated. A key used for AEAD encryption must not silently double as a signing key, MAC key, nonce key, password verifier or key-encryption key. A KDF can derive distinct outputs from shared input material, but the protocol must specify unambiguous labels, output lengths, roles, direction, version and purpose. Reusing the same raw shared secret directly across functions creates avoidable cross-protocol and cross-purpose coupling.

A key's scope must answer: which participants, session, direction, protocol version, algorithm suite, message sequence and lifecycle period does it protect? Key rotation, device addition/removal, identity-key change, compromise and recovery must define when old keys stop being accepted and what happens to delayed messages.

## 3. HKDF salt and info are different inputs

RFC 5869 defines HKDF as extract-then-expand. Its `salt` is an optional, non-secret value (the default is a hash-length zero string); it can be reused and should be independent of the input keying material. The extract step concentrates existing entropy in input keying material; it does not create entropy. A salt is therefore not a password, key, nonce, identity proof or guaranteed source of randomness (SRC-041).

The `info` input serves a different purpose: binding derived output to application- and context-specific information. RFC 5869 gives protocol identifiers, algorithm identifiers and user identities as examples. In this project, candidate context fields could include protocol name/version, suite, sender and recipient identity references, session identifier, direction and key purpose. Their encoding must be canonical and their authenticity must be established by the authenticated key-establishment transcript or another specified mechanism. Merely placing an unauthenticated identity string in `info` does not prove that identity.

**Design consequence:** do not describe salt as the mechanism that binds a key to a user or session. Do not overload salt with message freshness or nonce duties. Specify salt generation/derivation, independence and reuse separately from the context-binding function of `info`.

## 4. Identity and transcript binding

A Diffie–Hellman result or HPKE base-mode shared secret does not, by itself, authenticate a human identity. The protocol must define how public keys are associated with participants, how first contact is verified, how key changes are detected, and whether the chosen key-establishment mode authenticates the sender, recipient or both.

The authenticated transcript should bind, using an unambiguous encoding, all fields whose substitution could change the security meaning of the session. Candidate fields include:

- Protocol identifier and version.
- Selected KEM, KDF and AEAD identifiers.
- Initiator and responder roles.
- Authenticated identity-key references and the relevant ephemeral public keys.
- Session or handshake identifier and any authenticated negotiation parameters.
- The intended application and key purpose.

A signature or authenticated key-exchange mechanism must cover the appropriate transcript. A separate key-confirmation step may be needed to demonstrate that both parties derived the expected session material. The exact mechanism and its deniability, forward-secrecy and post-compromise properties remain open.

RFC 9180's `info` input can influence HPKE key derivation and its authenticated modes provide specified forms of key-possession authentication, but neither feature removes the application need to define identity meaning, key verification, transcript construction and service-level discovery (SRC-042).

## 5. AEAD nonce uniqueness

The fundamental obligation is uniqueness of the nonce for every encryption performed with the same AEAD key, subject to the selected algorithm's precise requirements. A new carrier, image, URL, file or transport attempt does not make a repeated key/nonce pair safe.

There are several possible protocol strategies, none selected here:

- **Per-message keys:** derive a fresh, domain-separated message key for each authenticated message or chain position. Nonce requirements still apply within each key.
- **Stateful sequence:** maintain a sender-side counter or sequence within a key context, derive the nonce according to the selected AEAD construction, and define persistence, concurrency, crash recovery, rollback and overflow behaviour.
- **Random nonces:** use only where the algorithm's collision probability and message volume bounds are analysed and the random generator is within the threat assumptions. Randomness is not a substitute for a quantified uniqueness argument.
- **Ratchet-derived message keys:** evolve message keys so that each position has a distinct key, while specifying skipped-message, out-of-order, duplicate, state-loss and key-erasure behaviour.

The receiver must reconstruct the same nonce/key context from authenticated state. Concurrent sends, restored backups, process rollback, multi-device use, retry after uncertain delivery and sender state cloning are high-risk edge cases. The specification must say whether a retry retransmits the exact already-created ciphertext or creates a new encryption operation. If it encrypts again under the same key, it must not reuse the nonce.

The image/carrier uniqueness idea is explicitly excluded from this mechanism. A one-use carrier policy may be relevant to a narrow correlation hypothesis, but it does not establish AEAD nonce uniqueness, key freshness or unpredictability.

## 6. Associated data and authenticated message context

AEAD associated data (AAD) is authenticated but not encrypted. It is appropriate for fields that must be integrity-bound to a ciphertext but may remain visible, provided their disclosure is acceptable. Candidate fields include a canonical header containing protocol version, suite, sender/recipient references, session identifier, message identifier, direction, sequence/epoch, fragment-set identifier and declared message type.

The protocol must distinguish:
- Fields encrypted inside the protected plaintext.
- Fields exposed in the outer envelope.
- Fields supplied as AAD and therefore integrity-bound but visible.
- Route-local fields that are unauthenticated transport hints.
- Fields authenticated by a signature or key-establishment transcript rather than the message AEAD.

Every security-relevant field must have one declared source of authority. Canonical encoding, length limits, duplicate-field handling and parser behaviour must be specified. Ambiguous serialisation can cause sender/recipient disagreement about what was authenticated. A route adapter must not rewrite authenticated fields; if a conversion is necessary, it must be an explicitly authenticated protocol conversion.

AAD does not itself establish that a claimed identity is genuine. It binds bytes to a key; identity assurance depends on how that key was established and verified.

## 7. Replay, ordering, loss and message-set semantics

Encryption and integrity do not automatically provide application-level replay protection. The receiver needs a freshness and duplicate policy tied to authenticated state. A possible design vocabulary includes session identifiers, monotonically increasing sequence numbers, unique message identifiers, bounded replay windows, expiry policy and durable duplicate-detection state. The final protocol must justify the chosen combination.

Multipart messages add another layer. The manifest and each fragment must be bound to the same authenticated message-set context, including set identifier, total count, index, declared lengths and relevant content digest or equivalent integrity construction. Reassembly must reject conflicting duplicates, mixed sets, missing fragments and resource-exhaustion inputs. Out-of-order arrival may be supported, but acceptance must not occur until the complete authenticated policy is satisfied.

RFC 9180 is a useful warning against assuming that a low-level encryption context supplies a complete delivery protocol. Its multi-message context is stateful to avoid nonce reuse; the receiver is expected to process ciphertexts in the same order; the application must detect loss; and the RFC says its stream ordering supplies only a degree of replay protection, with no other general replay protection. It also states that HPKE is not forward secret against recipient compromise in any mode (SRC-042).

**Design consequence:** route retry, backfill, duplicate delivery, out-of-order retrieval and cross-route fallback must be reconciled with the endpoint protocol's replay and ordering rules. Do not inherit HPKE's stream constraints accidentally, nor claim HPKE alone solves the project's lifecycle requirements.

## 8. Safe route fallback and failure semantics

A route failure must not cause a weaker cryptographic mode to be accepted silently. The route layer may select another declared carrier while preserving the same protected object. If a new protocol envelope or cryptographic context is required, the transition must be explicit, authenticated and replay-safe.

Separate at least these outcomes:

- Carrier unavailable or undiscoverable.
- Carrier transformed or extraction failed.
- Encapsulation malformed, truncated or over resource limits.
- Protected object recovered but cryptographic authentication failed.
- Message authenticated but stale, duplicate, expired or out of policy.
- Message accepted by the endpoint.
- Recipient acknowledgement or human receipt, which are later and distinct events.

Failure must be closed: no plaintext release, partial acceptance, fallback to unauthenticated encryption, silent algorithm downgrade or reinterpretation of malformed data. A transport adapter must not retry by re-encrypting under an unchanged key/nonce pair. If a cryptographic re-encryption is necessary, it must use valid fresh nonce/key state and authenticated message semantics.

## 9. HPKE as a comparator, not a selection

RFC 9180 is a standards-track specification for a low-level hybrid public-key encryption construction. It supplies a defined KEM/KDF/AEAD composition, context setup, a stateful sequence-number mechanism for nonce uniqueness, `info` and AAD inputs, authenticated modes and a secret-export interface (SRC-042).

It also deliberately leaves application responsibilities open. The application must transport public parameters, identify which recipient key was used, ensure ordering, detect loss, handle downgrade risks and provide replay protection beyond the limited stream property. Its base mode does not authenticate the remote party. It does not provide recipient-compromise forward secrecy. These are not defects to be silently patched by route metadata; they are constraints to compare against the project's goals.

HPKE may be useful as:
- A compositional reference for separating KEM, KDF and AEAD roles.
- A reference for stateful nonce handling and exporter-based key separation.
- A checklist of application-level responsibilities and non-goals.
- A candidate building block only if a future design can satisfy identity, lifecycle, asynchronous delivery, replay, multi-device and recovery requirements.

It must not be described as the chosen protocol, a complete messaging protocol, a ratcheting replacement or proof that the proposed architecture is secure.

### 9.1 Comparative fit: Signal, MLS and HPKE

These references operate at different protocol layers and solve different communication problems. They are not interchangeable candidates in one flat algorithm list.

| Reference | Native scope and useful mechanism | Lifecycle/state semantics relevant here | Boundary for this thesis |
|---|---|---|---|
| **Signal PQXDH + Double Ratchet** (SRC-008, SRC-009, SRC-038) | PQXDH is an asynchronous initial key-agreement protocol for a 1:1 conversation using published prekey material. The Double Ratchet evolves message keys after the shared secret is established, with symmetric-key and DH-ratchet steps. | The Double Ratchet defines skipped-message handling and a bounded `MAX_SKIP` for out-of-order message decryption. PQXDH's specified mutual-authentication property in revision 3 is not post-quantum secure. | A protocol reference for 1:1 identity/session establishment and evolving message keys. Ratchet skipped-message state is not a multipart carrier manifest, fragment-set completeness rule, transport retry guarantee or platform-delivery receipt. The specifications do not describe the entire Signal service or establish its product-level metadata behaviour. |
| **MLS** (SRC-007) | An asynchronous group key-establishment and messaging protocol with group membership state, forward secrecy and post-compromise security goals. | Group epochs and membership changes are native protocol state; the application still has to provide delivery/transport behaviour and manage how protocol messages reach group members. | A group-protocol comparator, not a presumed fit for the current 1:1 exploratory scope. Group membership and epoch semantics are not equivalent to image-fragment membership, conversation identifiers or route orchestration. Its existence means group key establishment and group lifecycle cannot be claimed as novel here. |
| **HPKE** (SRC-042) | A lower-level KEM/KDF/AEAD composition with base, PSK, authenticated and authenticated-PSK modes, AAD, `info`, stateful contexts and exporter support. | Multi-message contexts use stateful sequence-derived nonces; applications must preserve required order, detect loss and add replay protection beyond HPKE's limited stream property. | A compositional building block/reference, not an asynchronous messaging protocol or ratchet. Base mode does not authenticate the remote party, and HPKE does not provide recipient-compromise forward secrecy. Its application responsibilities must not be mistaken for features supplied by the primitive. |

#### Obligations tested against these references

1. **Identity and transcript binding:** PQXDH and MLS show that authenticated key establishment has protocol-specific identity and group-context rules. A bare DH result, HPKE base-mode context or public identity string in KDF `info` is not a verified human identity. The project still needs an explicit first-contact/key-change process and a canonical authenticated context.
2. **Key evolution and compromise response:** The Double Ratchet and MLS provide established examples of evolving cryptographic state and compromise-recovery goals. HPKE does not replace those lifecycle mechanisms. The project must not claim forward secrecy or post-compromise security from selecting a KEM/KDF/AEAD composition alone.
3. **Ordering versus multipart reconstruction:** Double Ratchet skipped-message handling addresses decryption of ratcheted messages that arrive out of order. HPKE's stateful context has its own sequencing constraints. Neither should be conflated with the separate problem of collecting fragments of one protected object across multiple carriers, validating set completeness, or safely reconstructing after route-level loss/retry.
4. **Replay and delivery:** HPKE explicitly leaves general replay protection and loss handling to the application. Signal protocol state has its own replay/duplicate semantics, but does not thereby define the carrier service's publication, retrieval or delivery guarantees. MLS group-message processing likewise does not make an arbitrary carriage service reliable or private.
5. **Group versus 1:1 scope:** MLS is relevant if the thesis later adopts group messaging as a primary use case. It should not be forced into the current 1:1 comparison simply because it is a modern messaging standard. Conversely, a 1:1 design must not imply that its session semantics solve group membership or multi-recipient retrieval.
6. **Route independence:** None of these protocol references, by itself, establishes that a protected object can be moved unchanged through arbitrary image, file, conventional messaging and mix-network routes. That is an architectural invariant to specify and evaluate at the endpoint/carriage boundary, not a property to attribute to Signal, MLS or HPKE without a direct source and compatible deployment evidence.

**Comparative conclusion:** retain Signal as the 1:1 asynchronous messaging/ratchet reference, MLS as the group key-establishment reference, and HPKE as a lower-level composition reference. Do not select or combine them by name. The next protocol decision must begin with the intended communication topology and lifecycle requirements, then compare complete constructions, state handling, failure semantics and reviewability. The authenticated multi-carrier manifest, carrier discovery, route transformation, observer exposure and service-level delivery semantics remain separate application/transport concerns. This comparison is documentary analysis, not an implementation, protocol proof or suitability determination.

## 10. Open design decisions and falsifiable questions

| Decision area | Required question | Evidence or specification needed before closure |
|---|---|---|
| Identity binding | How are identity keys verified and bound to both roles in the handshake? | Threat model, verification ceremony, authenticated transcript and key-change policy |
| Key schedule | What exact inputs and domain-separation labels derive each key? | Canonical transcript, version/suite binding, direction and purpose separation |
| Salt | Is salt needed for the selected KDF inputs, how is it generated/derived, and what independence assumptions apply? | Explicit RFC 5869-aligned rationale; no entropy or identity claims |
| Nonce | What guarantees uniqueness under crash, rollback, concurrency, retries and multi-device operation? | Algorithm-specific bound, state model, overflow and recovery rules |
| AAD | Which fields are visible but integrity-bound, and which remain encrypted? | Canonical encoding, disclosure analysis and field-authority map |
| Replay | What prevents old valid messages or fragments being accepted again? | Persistent or bounded replay state, freshness policy and expiry semantics |
| Ordering/loss | Can delivery be out of order or incomplete, and what happens to session state? | Route-independent message sequencing and explicit context-reset rules |
| Fallback | Can a route change without changing the protected object or cryptographic context? | Authenticated transition policy and downgrade-resistant failure behaviour |
| Forward secrecy | What past messages remain decryptable after long-term key compromise? | Explicit key-erasure and ratchet model; HPKE limitation considered |
| Recovery | What state is backed up, restored, rotated or invalidated? | Device lifecycle and compromise analysis, including nonce/replay state |

These questions are not closed by choosing X25519, HKDF, Ed25519, XChaCha20-Poly1305 or HPKE individually. The complete composition, wire format, state machine, identity model, failure semantics and implementation require separate specification and review.

## 11. Current conclusion

The architecture can specify non-negotiable protocol boundaries now without pretending to have a complete protocol: endpoint-held cryptographic authority; explicit identity verification; domain-separated key scope; independent treatment of HKDF salt and context binding; nonce uniqueness under each key; authenticated message context; replay and ordering state; bounded multipart validation; and downgrade-resistant route fallback.

No primitive suite or protocol is selected. The next research step is to map these obligations into W2/W3/W4 and the traceability matrix, then compare candidate compositions against established messaging protocols without treating a low-level construction as a complete application design.

**Theory only · No implementation · Not audited.**
