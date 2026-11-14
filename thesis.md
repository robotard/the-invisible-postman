# The Invisible Postman

## A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging

**Research thesis · Integrated working edition · 14 November 2026**

> **Theory only · No implementation · Not audited.**

## Abstract

This thesis examines whether image-carried messaging can be designed so that an untrusted intermediary transports or coordinates protected messages without gaining plaintext access or the ability to impersonate authenticated participants. It treats participant-controlled endpoints as the cryptographic trust boundary, while messaging platforms, bots, image hosts and storage providers remain untrusted for plaintext confidentiality.

The proposal separates five concerns that are often blurred together: confidentiality, sender authentication, identity verification, message integrity and concealment. Images are treated as carriers rather than cryptographic credentials. Optional steganography is therefore subordinate to a protected message format and is not assumed to survive media processing or resist detection.

The architecture also treats multipart delivery as an authenticated reconstruction problem, and treats expiry, revocation and recovery as lifecycle decisions with explicit limits. The result is a research architecture and evaluation agenda, not a completed protocol or implemented system.

## 1. Research problem

Messaging systems commonly rely on intermediary services for delivery, storage, coordination or media handling. Such services may be operationally useful without being trusted with message plaintext or cryptographic authority.

Image-carried messaging introduces additional questions. A carrier may be transformed, stripped, resized, recompressed, retained or inspected. A multipart message may be incomplete, reordered, duplicated or mixed with fragments from another message. Concealment may reduce casual visibility while creating fragility and no guarantee against steganalysis.

The central research problem is therefore not simply how to hide text in an image. It is how to define an endpoint-controlled messaging architecture in which protected message content remains confidential and authenticated across an untrusted transport path, while carrier processing and concealment remain separate, explicitly evaluated concerns.

## 2. Central research question

**Can image-carried messaging be designed so that an untrusted intermediary transports or coordinates encrypted messages without being able to decrypt them or impersonate authenticated participants, while accounting explicitly for concealment, multipart delivery, expiry, revocation and recovery?**

Supporting questions:

1. Which cryptographic responsibilities must remain at participant endpoints?
2. How are confidentiality, sender authentication, identity verification and key agreement distinguished?
3. What can an intermediary, platform or image host observe, alter, suppress or retain?
4. How can multipart capsules be bound to one message set and validated before reconstruction?
5. What can expiry and revocation actually enforce after data has left an endpoint?
6. Does optional concealment provide a defensible benefit under a defined adversary model?
7. What evidence would be needed to justify the architecture or reject it?

## 3. Scope and non-goals

The research addresses logical architecture, trust boundaries, threat modelling, message lifecycle, carrier handling, multipart integrity, metadata exposure and evaluation requirements.

It does not currently specify a complete cryptographic protocol, choose a final algorithm suite, define a complete identity ceremony, demonstrate robust steganography, provide anonymity, guarantee delivery, or establish secure remote deletion.

It does not claim a working application, formal verification, empirical security results or independent audit. Implementation is deliberately deferred until the protocol-level decisions are sufficiently specified and reviewed.

## 4. Security properties are distinct

The architecture must not treat the following properties as interchangeable:

- **Confidentiality:** unauthorised parties cannot read message contents under the stated cryptographic assumptions.
- **Sender authentication:** a protected message is cryptographically associated with a signing or authenticated sending identity.
- **Identity verification:** participants establish that a cryptographic identity belongs to the intended person or entity.
- **Integrity:** unauthorised alteration of protected content or bound context is detected.
- **Concealment:** the presence of a message may be made less apparent to some observers, subject to separate evaluation.
- **Availability:** messages can be delivered when services and networks permit; a malicious intermediary may still suppress or delay them.

Encryption alone does not establish a human identity. A platform username or bot account is not proof that a public key belongs to the intended person. Steganography does not encrypt or authenticate a message. Authenticated encryption does not conceal traffic timing, participants or message size.

## 5. Proposed trust model

The trust boundary is located at the participant-controlled endpoints.

### 5.1 Sender endpoint

The sender endpoint creates plaintext, holds private keys, verifies peer identity material, establishes authenticated cryptographic context, protects the message and forms capsule data.

### 5.2 Recipient endpoint

The recipient endpoint extracts carrier data, validates the capsule structure and message set, checks authenticity and freshness, decrypts protected content and applies local lifecycle policy.

### 5.3 Identity and key-management boundary

Cryptographic identities must be explicitly bound to verified peers. First-contact verification, key changes, device replacement, key rotation and compromise response remain protocol decisions requiring definition.

### 5.4 Untrusted coordinator and transport

A bot or coordinator may route references, coordinate capsule delivery and report observable delivery state. Messaging platforms, image hosts and storage providers may retain, inspect, transform, reorder, suppress or remove carrier objects and metadata.

No intermediary is trusted with plaintext confidentiality, sole decryption authority or the power to establish human identity merely through a platform identifier.

### 5.5 Residual endpoint risk

A compromised endpoint may expose plaintext before encryption or after decryption, as well as private keys and local state. Message encryption does not solve endpoint compromise.

## 6. Logical architecture

The architecture is divided by responsibility, not by a requirement to deploy separate services.

1. **Participant endpoint:** plaintext handling, private-key custody, peer verification and local policy.
2. **Identity and key management:** identity representation, key-to-identity binding, verification, rotation and revocation.
3. **Session establishment:** authenticated key agreement, peer/session binding and key confirmation.
4. **Message protection and envelope:** versioned message representation, encryption, authentication and context binding.
5. **Capsule and multipart manager:** message-set identifiers, manifest, fragment indexing, completeness and reconstruction.
6. **Carrier encoder/decoder:** carrier packaging and extraction, with optional concealment kept separate.
7. **Coordinator/transport:** least-privilege delivery coordination without plaintext authority.
8. **Lifecycle and local state:** replay tracking, expiry, key changes, retirement and local retention.
9. **Optional recovery boundary:** excluded from the minimum design unless a specific need and defensible trust model are established.

A component is justified only when it maps to a research objective or threat and provides a demonstrable benefit.

## 7. Message lifecycle

The proposed logical lifecycle is:

1. Participants establish and verify relevant cryptographic identities.
2. Endpoints establish authenticated cryptographic context.
3. The sender creates plaintext and message context.
4. The sender protects the message using a specified authenticated construction.
5. The protected object is packaged as one capsule or a linked multipart set.
6. Capsules are encoded into supported image carriers; optional concealment is a separate step.
7. An untrusted intermediary coordinates or transports carrier objects.
8. The recipient extracts capsule data and validates its structure.
9. The recipient validates message-set identity, completeness, uniqueness, ordering and version.
10. The recipient verifies authenticity, context and freshness.
11. Only after successful validation does the endpoint decrypt and release plaintext.
12. Local replay, expiry, key and retention policies are applied.

Invalid, incomplete or ambiguous input must not be silently presented as a valid message.

## 8. Message envelope and cryptographic decisions

A protected message is expected to bind the context necessary to prevent ambiguity or substitution, including as applicable:

- protocol version;
- sender and recipient cryptographic identities;
- session or context identifier;
- unique message identifier;
- payload type and length;
- multipart manifest reference;
- freshness or expiry information; and
- authenticated ciphertext and associated metadata.

The exact canonical encoding, field layout, algorithm suite, nonce construction, signature arrangement and key lifecycle are unresolved.

Candidate mechanisms for research include X25519 for key agreement, HKDF-SHA-256 for key derivation, Ed25519 for signatures where appropriate, and XChaCha20-Poly1305 for authenticated encryption. These are candidates, not adopted protocol decisions. The complete construction must specify identity binding, key confirmation, key separation, nonce policy, associated data, versioning, error handling and key-use limits.

A previous exploratory proposal considered password-derived Argon2id keys and a Python/Flask application. That model is not the current architecture: password-based single-user encryption does not, by itself, establish authenticated peer identity or endpoint-to-endpoint session security. Its algorithm choices may inform later comparison, but they are not silently carried forward as design decisions.

## 9. Multipart capsules

Multipart delivery is a transport and packaging concern, not a recovery guarantee.

A set must bind its message-set identity, version, total count, fragment indices and relevant content integrity through authenticated context or an authenticated manifest. The receiver must detect or reject missing, duplicate, conflicting, reordered and cross-message fragments according to explicit rules.

Fragmentation is not threshold secret sharing. It does not imply redundancy, confidentiality through distribution or recoverability after loss. The format and rejection rules remain to be specified.

## 10. Image carriers and optional concealment

An image is a carrier, not a key, identity credential or source of guaranteed cryptographic entropy. The protected capsule must remain cryptographically meaningful independently of the concealment method.

Carrier processing may resize, recompress, transcode, strip metadata or otherwise damage embedded content. Supported transformations must be defined and tested. Unsupported or corrupted carriers must fail safely.

No universal resistance to steganalysis or platform transformation is claimed. Concealment should be retained only if evaluation demonstrates a meaningful benefit against a clearly stated threat model that justifies its fragility and complexity.

## 11. Lifecycle, expiry and revocation

Lifecycle policy must distinguish:

- rejection of a message for a new decryption attempt;
- retirement or replacement of a cryptographic identity;
- retirement of a session or message key;
- local deletion of a particular copy; and
- plaintext or keys already copied, observed or retained elsewhere.

Expiry and revocation may constrain future acceptance or future communication. They cannot reliably recall plaintext already obtained by a recipient, intermediary or attacker.

Replay protection requires a defined freshness policy and state model. The design must account for state loss, rollback, delayed delivery and device replacement.

## 12. Recovery

Recovery is excluded from the minimum architecture.

If research later justifies threshold-controlled recovery, it must be specified separately, including authority and authorisation, share creation and distribution, participant authentication, threshold and collusion assumptions, share protection, lifecycle, auditability and failure handling.

Recovery must not be added merely because it is technically possible. It introduces additional secrets, participants and potential authorities, and may undermine endpoint control.

## 13. Threats and residual risks

The principal threats include:

- first-contact key substitution and identity impersonation;
- platform identifiers mistaken for verified identities;
- ciphertext or authenticated-context tampering;
- replay and stale-message acceptance;
- fragment mixing, omission, duplication and reordering;
- carrier transformation or extraction failure;
- metadata correlation and traffic analysis;
- intermediary compromise or excessive permissions;
- secret leakage through logs, diagnostics, backups or notifications;
- recovery-share theft or collusion, if recovery is introduced; and
- endpoint compromise.

The architecture proposes endpoint-held keys, explicit identity verification, authenticated context, strict multipart validation, least-privilege coordination and secret-safe handling as design responses. These are intentions requiring specification and evaluation, not demonstrated mitigations.

Availability against a malicious intermediary, anonymity, unlinkability, universal concealment, endpoint security and remote deletion remain outside the guarantees of this proposal.

## 14. Evaluation framework

Evaluation must be threat-led and capable of rejecting the architecture. It should address:

1. Whether an intermediary can obtain plaintext or sole decryption authority.
2. Whether first-contact key substitution is detectable.
3. Whether sender, recipient, session and message context are cryptographically bound.
4. Whether altered, replayed, incomplete, duplicate, reordered and mixed capsule sets are rejected.
5. Whether media transformations cause safe failure and whether any claimed transformation tolerance is reproducible.
6. Whether logs and diagnostics expose secrets or protected content.
7. Whether key rotation, expiry, revocation and replay state behave according to their stated limits.
8. What metadata remains observable and retained.
9. Whether optional recovery, if proposed, withstands its stated theft and collusion scenarios.

Each scenario should record preconditions, attacker capability, expected behaviour, observable evidence, pass/fail/inconclusive result, residual risk and resulting design change.

Evidence maturity must be reported honestly: proposed, specified, analysed, tested and independently reviewed are different states. A design intention is not a test result; a test suite is not an audit.

## 15. Open protocol decisions

Before implementation, the research must resolve:

1. Authenticated key establishment and key confirmation.
2. First-contact identity verification and identity-key change procedure.
3. Canonical message encoding, versioning and authenticated field layout.
4. Algorithm suite, key separation, nonce generation and key-use limits.
5. Sender authentication and signing context.
6. Replay-state persistence and freshness policy.
7. Multipart manifest, digest, reconstruction and rejection rules.
8. Metadata minimisation, retention and coordinator permissions.
9. Supported carrier formats and transformation tolerance.
10. Expiry, revocation, device replacement and compromise response.
11. Whether recovery or concealment is justified by evidence.

## 16. Conclusion

The research supports a minimal, endpoint-controlled architecture in which cryptographic authority remains with participants and intermediaries are restricted to transport and coordination. Image carriers are subordinate to a protected message format. Multipart delivery is treated as an integrity and context-binding problem. Concealment and recovery remain optional and evidence-dependent.

The architecture establishes responsibilities and trust boundaries before committing to a protocol or deployment topology. Its central claim remains a research proposition to be challenged through specification, adversarial evaluation and independent review.

**Theory only · No implementation · Not audited.**

## Related research artefacts

- [W1 · Research framing](docs/w1-research-framing.md)
- [W2 · Threat model](docs/w2-threat-model.md)
- [W3 · Architecture](docs/w3-architecture.md)
- [W4 · Risks and evaluation](docs/w4-risks-and-evaluation.md)
- [Traceability register](docs/traceability.md)
- [Critical review questions](review/REVIEW_QUESTIONS.md)
- [Editable architecture diagrams](diagrams/README.md)
