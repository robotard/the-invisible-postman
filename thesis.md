# The Invisible Postman
## A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging

**Researcher:** `@robotard`  
**Document:** Integrated architecture thesis, working draft  
**Checkpoint:** 2026-11-14  
**Status:** Theory only · No implementation · Not audited

> This is a proposed architecture and research programme, not a protocol specification, implementation, formal proof, or independent security audit.

## Abstract

The Invisible Postman investigates whether image-carried messaging can be designed so communicating endpoints retain control of plaintext and cryptographic authority while bots, messaging platforms, image hosts, and storage services act as untrusted intermediaries. Image carriage is a required transport route within the research. Other routes may be compared as distinct carriage profiles. Optional steganographic techniques may attempt to conceal the presence of encrypted material within an image, but do not provide cryptographic protection. Neither the carrier nor concealment provides cryptographic confidentiality, sender authentication, or identity assurance.

The architecture separates endpoint identity and key management, authenticated key establishment, message encryption, sender authentication, message-envelope integrity, multipart capsule handling, a first-class transport-route layer, carrier-specific processing, intermediary coordination, and lifecycle policy. Recovery is treated as a separate capability with explicit governance and collusion assumptions, not as a synonym for ciphertext fragmentation.

The intended contribution is a transparent architecture whose trust boundaries, assumptions, failure modes, and limitations can be examined. The design remains provisional. Its cryptographic primitives, message format, identity-verification process, recovery model, and carrier strategy require further specification and evaluation.

## 1. Research purpose and question

Secure messaging often relies on services that route, store, coordinate, or transform content. Those services may be useful without being trusted with plaintext or the sole authority to decrypt it. An image can carry encrypted material, and optional steganography may make that material less apparent. But concealment does not replace encryption, authentication, or identity verification. Encryption does not guarantee anonymity, metadata protection, or delivery.

**Central research question:** Can image-carried messaging be designed so that an untrusted intermediary transports or coordinates encrypted messages without being able to decrypt them or impersonate authenticated participants, while accounting explicitly for concealment, multipart delivery, expiry, revocation, and recovery?

Supporting questions concern endpoint trust; intermediary visibility and capabilities; the limited value and fragility of concealment; multipart integrity; lifecycle semantics; threshold recovery assumptions; and measurable evaluation criteria.

## 2. Scope, contribution, and non-goals

The research considers user-controlled endpoints, endpoint-held plaintext and private keys, authenticated key establishment, explicit peer verification, authenticated encryption, sender authentication, versioned message context, a transport-route layer with image carriage as a required route, optional concealment, untrusted coordination, expiry/revocation, and optional threshold-controlled recovery. Alternative carriage routes are comparison profiles, not substitutes for examining the image route.

The intended contribution is a theory-led architecture and rationale that separates security properties, makes trust boundaries explicit, records assumptions and failure modes, distinguishes fragmentation from secret sharing, and proposes testable acceptance criteria.

This work does not claim a functioning application, complete protocol, formal verification, independent audit, measured resistance to steganalysis, anonymity, guaranteed delivery, endpoint-compromise protection, remote deletion of obtained plaintext, or a complete recovery design.

The password-based model is retained as an intentional starting point and evaluated alternative. Its original rationale, limitations, and relationship to the current endpoint-controlled direction are set out in Section 2.1.

### 2.1 Design evolution: password-derived encryption to endpoint-managed keys

The password-based model was a deliberate starting point, not a design mistake to be erased from the research record. The original concept was a compact, user-operated exchange: a sender protects a message with a secret they can share with the intended recipient, embeds the encrypted payload in an image, and the recipient supplies the same secret to recover it. A password or passphrase offered a familiar interaction, required no account directory or central key service, and made the protected image portable between endpoints. It also allowed the early research to examine the separation between encryption and steganographic carriage without first designing a full identity and key-distribution system.

That choice was pragmatic for an exploratory, small-group or one-off exchange. It was not a claim that passwords are stronger than public-key cryptography, that a password proves the sender's identity, or that a shared secret is a complete messaging protocol. In the original model, Argon2id was proposed to derive a fixed-length key from a password and a fresh random salt; the salt and KDF parameters travel with the payload, while the password remains with the participants. A vetted authenticated-encryption construction then protects the message. The KDF raises the cost of password guessing, but cannot add entropy that the password does not contain.

The subsequent research question became broader. The project now asks how multiple communicating endpoints can retain cryptographic authority while an intermediary coordinates delivery without obtaining plaintext or the sole means of decryption. That brings requirements the simple shared-password model does not solve on its own: explicit peer identity verification, authenticated key establishment, sender authentication, per-session context, key rotation and compromise handling, and a defensible lifecycle across devices and conversations. A shared password can encrypt content, but by itself it does not establish which participant sent a message, bind a public key to a person, provide forward secrecy, or prevent offline guessing if an attacker obtains the encrypted carrier and its KDF metadata.

The architectural change is therefore a change in scope and security objectives, not a rejection of the useful properties of password-derived encryption. Password-based protection remains a legitimate option where participants already share a sufficiently strong secret through a separate trusted channel and accept the associated key-sharing, attribution, rotation, and compromise limitations. It may suit a self-contained encrypted object or a deliberately narrow mode. It is not treated as the identity model or the default key-establishment mechanism for the wider endpoint-controlled architecture.

The current direction places identity verification, private-key custody, and session establishment at the endpoints. Password-derived encryption is retained in the thesis as an evaluated alternative and as part of the project's design history. Any future hybrid that combines a password with endpoint key agreement would need an explicit protocol, a stated purpose for each input, context binding, key separation, and independent review; it must not be assembled informally.

| Design question | Password-derived starting model | Current endpoint-controlled direction |
|---|---|---|
| Initial usability | Familiar shared secret; low setup overhead | Requires identity/key setup and peer verification |
| Key source | Password-derived key via a password KDF and salt | Authenticated key establishment and endpoint-held key material |
| Intermediary authority | Can remain outside the password if endpoints handle it correctly | Explicitly excluded from plaintext and sole decryption authority |
| Sender identity | A shared password does not distinguish which participant sent a message | Requires authenticated peer/key binding and sender-authentication design |
| Lifecycle | Shared-secret distribution, rotation and compromise are difficult to govern at scale | Designed around endpoint identity and key lifecycle, still to be specified |
| Best-fit assumption | Small, pre-arranged group or self-contained protected object | Ongoing communication among independently verified endpoints |

This comparison records a design rationale, not a claim that either model has been implemented or validated. The endpoint architecture remains provisional, and the password-based option remains subject to the same threat-led evaluation discipline.

## 3. Conceptual architecture

The trust boundary is placed at communicating endpoints. Endpoints hold plaintext and private keys. Intermediaries may transport or coordinate opaque material but are not trusted with plaintext confidentiality or sole decryption authority. This is a target architecture, not a demonstrated property.

| Component | Responsibility | Trust position |
|---|---|---|
| Sender endpoint | Compose, protect, authenticate, envelope, prepare carriers | Holds sender plaintext and private keys |
| Recipient endpoint | Collect, validate, verify, decrypt, release plaintext | Holds recipient plaintext and private keys |
| Identity/key verification | Bind cryptographic keys to intended participants | Explicit process; platform IDs alone are insufficient |
| Cryptographic services | Key establishment, derivation, encryption, authentication | Endpoint-controlled |
| Envelope layer | Bind version, identities, message context and policy | Must be authenticated |
| Capsule layer | Fragment, identify, order and validate transport pieces | May traverse untrusted services |
| Carrier adapter | Encode/extract capsule bytes from images | No key or identity authority |
| Optional concealment | Attempt to obscure embedded data | No cryptographic confidentiality role |
| Intermediary | Route, store or coordinate delivery | Untrusted; may observe or disrupt |
| Optional recovery participants | Participate in separately governed recovery | Explicitly trusted only within defined assumptions |

Confidentiality, sender authentication, identity verification, integrity, replay resistance, availability, concealment, and metadata protection are distinct properties. A design may provide one while failing another.

### 3.1 Passenger topology and the standalone train

The participant-side cryptographic topology is the primary security architecture. The participants ("passengers") perform their own concise, necessary roles at their endpoints: the agreement/key-establishment process, message protection, authentication and validation required by the eventual protocol. The exact agreement construction, including what is meant by any anonymous agreement, remains open and must not be inferred from this architectural description.

The "train" is a separate, standalone transport element. Its job is deliberately narrower: carry an already protected object over a low-fidelity route, with route selection and carriage handling kept distinct from participant security. It does not establish trust, negotiate keys, authenticate participants, encrypt messages, or acquire authority over message meaning. It may be inspected, copied, delayed, transformed, substituted or unavailable without becoming the source of the participants' security.

A carrier-facing encapsulation boundary packages the protected object for carriage and preserves framing and route context. It may help detect truncation, substitution or extraction failure, but encapsulation alone does not create confidentiality, authentication, anonymity or integrity. Any security-relevant binding must be covered by the endpoint-controlled cryptographic protocol. The transport wrapper must not silently rewrite authenticated message semantics.

Image carriage remains a required route. Steganography or another image-carriage technique is a low-fidelity transport mechanism within the train, not part of the passenger security topology. Steganography remains optional and does not provide the underlying protection. The train is independently replaceable and assessable; the stronger participant topology must not depend on its trustworthiness.

The train may also provide a separate, bounded transport-anonymity contribution. Each carriage instance may be wrapped in a newly generated, unique image envelope, while the train varies where that envelope is placed for retrieval. A receiving-side decapsulation process locates or obtains the relevant carrier, extracts the protected object and returns it to the participant endpoint for its own cryptographic validation. This can reduce reliance on repeated carrier objects and predictable publication locations, making simple carrier-to-exchange correlation less straightforward. It is a transport-level unlinkability objective, not proof of participant anonymity.

Variable placement is useful only if the intended recipient can discover it without exposing a stable, easily correlated rendezvous point. The discovery mechanism, timing, access patterns, hosting metadata, image fingerprints, carrier uniqueness and decapsulation behaviour therefore form part of the threat model. Randomising placement without a viable recipient-discovery method would merely make delivery unreliable. The carrier remains an outer, disposable transport envelope; it does not become the cryptographic message or define the participants' security.

## 4. Trust model and adversaries

Participants control their endpoints and are responsible for local secret protection, peer verification, correct protocol execution, and plaintext handling. A bot, platform, image host, or storage provider may inspect, retain, transform, reorder, suppress, or remove media and metadata. Network observers may learn timing, volume, endpoints, and other metadata. Active attackers may read public carriers, modify or replay them, submit malformed capsule sets, mix fragments, attempt key substitution, or compromise an intermediary. A compromised endpoint may expose plaintext and keys before encryption or after decryption.

The design must not assume media-byte preservation, reliable delivery, hidden metadata, or human identity from a platform account identifier.

## 5. Conceptual message lifecycle

1. Participants establish cryptographic identities and complete explicit first-contact verification.
2. Endpoints perform authenticated key establishment. Key confirmation, identity binding, downgrade handling, and key-change behaviour remain to be specified.
3. Sender creates plaintext and a message context.
4. Sender encrypts the content and creates sender-authentication evidence as required by the final protocol.
5. An envelope binds protected content to relevant identities, version, message ID, and policy/context.
6. The envelope is represented as one or more linked capsules with a manifest.
7. Carrier processing encodes capsule bytes into supported images. Optional concealment remains a separate step.
8. An intermediary transports or coordinates carriers and references; it may observe metadata or disrupt delivery.
9. Recipient collects carriers, extracts capsule material, and validates completeness, uniqueness, ordering, and message binding.
10. Recipient verifies authentication and decrypts. Plaintext is released only after required checks succeed.
11. Endpoints apply expiry, revocation, and key-rotation policies within their actual limits.
12. Optional recovery, if ever enabled, follows a separately authorised and specified process.

## 6. Envelopes and linked capsules

A future versioned envelope may need protocol version, sender/recipient key references, session/context reference, message identifier, creation/expiry policy, algorithm identifiers, nonce and other public parameters, ciphertext/authentication data, capsule-set identifier, fragment index/count, integrity binding, and optional recovery-policy reference.

This is a field inventory, not a final wire format. Canonical encoding, field criticality, length limits, version negotiation, and downgrade behaviour remain open.

**Ciphertext fragmentation** divides transport data into pieces. It does not divide the decryption key and does not create threshold recovery. **Threshold secret sharing** distributes secret material among authorised participants under a threshold policy and introduces separate participant, collusion, storage, authorisation, and audit requirements.

The future protocol must detect missing, duplicate, reordered, mixed, altered, conflicting, oversized, expired, or replayed capsules. Ambiguous or invalid sets should be rejected or quarantined, not silently reconstructed as a different valid message.

## 7. Cryptographic responsibilities and candidates

The endpoints require authenticated key establishment. X25519, HKDF-SHA-256, Ed25519, and XChaCha20-Poly1305 may be evaluated as candidates, not as a selected or complete protocol. A final design must specify key confirmation, identity binding, transcript/context binding, key rotation, compromise response, downgrade handling, key separation, nonce rules, associated data, and safe error behaviour.

Encryption and sender authentication are distinct. A protocol must state whether sender authentication comes from an authenticated session, signatures, or another reviewed mechanism, and how it binds to identity and message context. A cryptographic key proves control of that key under stated assumptions; it does not independently prove a real-world identity.

Do not hand-build encryption by informally combining primitives. A candidate algorithm list is not evidence that a protocol is secure.

## 8. Carrier processing and concealment

An image is a transport carrier, not a key, identity credential, or guaranteed entropy source. Carrier adapters should process capsule bytes without owning cryptographic secrets. Optional steganography may be investigated as a separate concealment layer; it does not strengthen ciphertext or hide transfer metadata.

Platforms may resize, recompress, transcode, strip metadata, moderate, or otherwise transform images. Robustness must be measured against defined transformations. If extraction or integrity validation fails, partial or unauthenticated plaintext must not be released.

## 9. Expiry, revocation, and recovery

Expiry and revocation may restrict future sessions, future access, or acceptance of messages under defined policy. They cannot reliably retrieve plaintext, screenshots, copied ciphertext, keys, or other material already obtained.

A future specification must define clock assumptions, authenticated expiry representation, offline-device behaviour, revocation propagation, and local versus service-side enforcement.

Recovery is not a default property. If pursued, specify what secret is divided, threshold and participant count, participant authentication, share protection, reconstruction authorisation, collusion tolerance, lost/compromised-share handling, logging, and interaction with rotation/revocation. No threshold or trustee arrangement is selected here.

## 10. Risks and evaluation

| Risk | Consequence | Required treatment |
|---|---|---|
| First-contact key substitution | Peer impersonation | Explicit verification and key-change process |
| Platform ID treated as identity | False assurance | Treat IDs as routing identifiers, not identity proof |
| Ciphertext/context tampering | Corruption or substitution | Authenticated encryption and context binding |
| Replay | Old material accepted | Message IDs, freshness policy, replay state |
| Capsule mixing/reordering | Invalid reconstruction | Authenticated manifest and strict validation |
| Image transformation | Payload loss | Platform-specific testing and fail-safe rejection |
| Metadata correlation | Participant inference | Document visibility; no anonymity claim |
| Intermediary compromise | Routing/metadata abuse | Minimise privileges and retention |
| Diagnostic leakage | Secret exposure | Secret-safe logging and crash review |
| Recovery collusion/theft | Unauthorised reconstruction | Explicit threshold, authentication, and audit |
| Endpoint compromise | Plaintext/key theft | State as residual risk and define response |
| Expiry overclaim | False remote-erasure belief | State limits plainly |

Evaluation should cover identity/key binding; cryptographic correctness and nonce rules; envelope parsing and downgrade attempts; missing/duplicate/reordered/mixed/altered/replayed capsules; intermediary visibility and authority; image transformations and capacity; logs, crash reports, temporary storage and backups; expiry, revocation, offline devices and recovery; and independent cryptographic and implementation review.

Numerical thresholds, test harnesses, platform profiles, and formal methods remain to be selected. Passing tests is evidence only for tested conditions, not universal proof.

## 11. Open decisions and conclusion

Unresolved decisions include the exact key-establishment protocol; first-contact verification and key-change recovery; sender-authentication composition; canonical envelope encoding; replay-state model; manifest integrity construction; message/capsule limits; supported image formats and transformation profiles; whether concealment is appropriate; whether recovery belongs in scope; and measurable acceptance criteria.

The project should be evaluated as endpoint-controlled cryptographic messaging that may use images as carriers, not as an image-hiding trick with encryption added afterwards. Its credibility depends on explicit trust boundaries, verified identity binding, correctly composed cryptography, authenticated context, strict multipart validation, and honest lifecycle semantics.

## Appendix A. Terminology

- **AEAD:** Authenticated Encryption with Associated Data.
- **Carrier:** Image/media object used to transport capsule data.
- **Capsule:** Transport unit containing or referencing part of a protected message.
- **Ciphertext fragmentation:** Splitting ciphertext/envelope into transport pieces; not secret sharing.
- **Identity verification:** Process binding a cryptographic key to the intended participant.
- **Message envelope:** Versioned structure binding protected content to identity and message context.
- **Steganalysis:** Analysis intended to detect or characterise hidden data.
- **Threshold secret sharing:** Distribution of secret material so a defined threshold can reconstruct it.

## Appendix B. Claim discipline

Distinguish **established mechanisms** (properties supported by recognised constructions when correctly used), **proposed designs** (choices requiring specification and evaluation), and **unverified claims** (requiring implementation, evidence, formal analysis, or independent review). Never present the latter two as established security properties.

## Appendix C. Supporting documents

- `docs/w1-research-framing.md` — research problem, questions, scope, and contribution.
- `docs/w2-threat-model.md` — assets, actors, capabilities, security goals, and threats.
- `docs/w3-architecture.md` — components, lifecycle, envelope concepts, capsule handling, and open decisions.

The design-decision diagram is maintained at `diagrams/03-design-decisions.svg`. It includes the original password-derived choice, its rationale and the later architectural evolution. The figure is explanatory only and does not imply implementation or validation.


The ideation and design-evolution workflow is illustrated in `diagrams/01-ideation-and-design-evolution.svg`. It records the rationale for the initial password-derived model and the subsequent expansion of the research scope.

**Project status:** Theory only · No implementation · Not audited.
