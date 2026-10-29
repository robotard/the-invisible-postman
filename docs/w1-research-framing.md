# W1 · Research Framing

**Project:** The Invisible Postman  
**Subtitle:** A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging  
**Researcher:** @robotard  
**Version:** 1.0 working draft  
**Status:** Theory only · No implementation · Not audited

## 1. Research problem

Secure messaging systems must protect message contents while often relying on intermediary services for delivery, storage, coordination, or media handling. An image can act as a carrier for message material, and optional steganographic techniques may conceal the presence of that material. Neither the carrier nor concealment itself provides cryptographic confidentiality, sender authentication, or trustworthy identity.

The research problem is to describe and critically evaluate an architecture in which cryptographic protections remain anchored at the communicating endpoints while an intermediary is treated as untrusted for plaintext confidentiality and participant impersonation. The design must also account for the practical complications introduced by image-carried messages, multipart delivery, lifecycle policy, and optional recovery arrangements.

## 2. Central research question

**Can image-carried messaging be designed so that an untrusted intermediary transports or coordinates encrypted messages without being able to decrypt them or impersonate authenticated participants, while accounting explicitly for concealment, multipart delivery, expiry, revocation, and recovery?**

This is an architectural research question. It does not assume that the proposed design has been implemented, formally proven, empirically evaluated, or independently audited.

## 3. Supporting research questions

1. **Cryptographic trust:** Which responsibilities must remain at endpoints, and how should confidentiality, sender authentication, identity binding, and key agreement be distinguished?
2. **Untrusted transport:** What can a bot, messaging platform, image host, or storage service observe, alter, replay, suppress, or correlate if it is not trusted with plaintext?
3. **Carrier and concealment:** What security properties come from encryption, and what additional, limited goals might optional steganographic concealment address?
4. **Multipart delivery:** How should a set of linked capsules be bound to one message, ordered, validated, and rejected when fragments are missing, duplicated, reordered, or mixed?
5. **Lifecycle policy:** What can expiry and revocation prevent, and what can they not undo after a recipient has obtained plaintext or key material?
6. **Recovery:** What assumptions, participant roles, thresholds, and collusion risks would need to be explicit if threshold-controlled recovery were included?
7. **Evaluation:** What acceptance criteria and adversarial tests would be needed before making stronger claims about the architecture?

## 4. Intended contribution

The intended contribution is a transparent, theory-led architecture and design rationale for authenticated, image-carried cryptographic messaging. It aims to:

- separate cryptographic confidentiality, sender authentication, identity verification, carrier formatting, and optional concealment;
- make trust boundaries and intermediary capabilities explicit;
- document design refinements and the reasons for them;
- identify assumptions, failure modes, lifecycle limits, and unresolved protocol decisions;
- propose testable acceptance criteria and questions for independent review; and
- distinguish established cryptographic mechanisms from unvalidated architectural choices.

The value of the work is not that images are inherently secure or that concealment makes encryption stronger. It is that the system's claims, boundaries, and limitations are made explicit enough to examine and challenge.

## 5. Scope

The thesis considers a proposed architecture for endpoint-controlled encrypted messaging whose transport may use images as carriers. It considers:

- endpoint-held keys and plaintext;
- authenticated key agreement and sender authentication as distinct requirements;
- an intermediary that should not possess plaintext or the sole ability to decrypt;
- optional steganographic concealment as a separate layer;
- linked image capsules and message-set integrity;
- policy-based expiry and revocation, with realistic limits;
- optional threshold-controlled recovery as a separate mechanism requiring explicit assumptions; and
- qualitative threat analysis, proposed acceptance criteria, and an evaluation plan.

Candidate primitives may be discussed as design options, but their presence in this document is not a complete protocol specification or evidence of security.

## 6. Non-goals and exclusions

This working draft does not claim to provide:

- a functioning implementation;
- a formally verified or independently audited protocol;
- measured resistance to steganalysis or platform media transformations;
- guaranteed anonymity or elimination of metadata leakage;
- proof that an intermediary cannot interfere with availability, delivery, ordering, or timing;
- revocation of plaintext or keys already obtained by a recipient;
- authentication of a human identity from a platform username or chat identifier alone; or
- a complete recovery protocol merely by proposing fragmentation or threshold sharing.

The distinction between ciphertext fragmentation and threshold secret sharing must remain explicit. Splitting encrypted data into parts does not, by itself, divide a secret key among trustees.

## 7. Core framing and terminology

- **Confidentiality:** Preventing unauthorized parties from learning message contents.
- **Sender authentication:** Providing cryptographic evidence that a message was produced by the holder of a particular signing or authentication key, subject to correct key binding.
- **Identity verification:** Establishing that a cryptographic key belongs to the intended person or entity through an explicit verification process. A platform identifier alone is insufficient.
- **Carrier:** The image or media object used to transport data. It is not itself a key or a guaranteed source of cryptographic entropy.
- **Steganographic concealment:** An optional attempt to obscure the existence of embedded data. It does not replace encryption or authentication.
- **Intermediary:** A bot, platform, host, or storage service that may coordinate or transport content but is not trusted with plaintext confidentiality.
- **Linked capsules:** Multiple pieces that must be validated as belonging to one message set, with explicit identifiers and integrity checks.
- **Expiry and revocation:** Policies that may restrict future access or sessions but cannot retrieve data already copied or learned.

## 8. Research discipline

The work should distinguish three categories throughout the thesis:

1. **Established mechanisms:** Properties supported by the relevant cryptographic constructions and their specifications, when used correctly.
2. **Proposed design choices:** Architectural decisions that still require complete specification and evaluation.
3. **Unverified claims:** Statements requiring implementation, empirical evidence, formal analysis, or independent review before they can be asserted.

No claim of security should rely on the obscurity of the design. Public documentation should include the threat model, rationale, limitations, candidate mechanisms, and review questions while excluding genuine secrets and sensitive personal or operational data.

## 9. Current limitations and open questions

This framing does not yet settle:

- the exact authenticated key-establishment and identity-verification protocol;
- key lifecycle, rotation, backup, compromise recovery, and device replacement;
- message format, canonical encoding, version negotiation, and downgrade handling;
- nonce generation and enforcement under the selected AEAD construction;
- replay prevention and binding of sender, recipient, message ID, capsule index/count, and expiry;
- what metadata remains visible to the platform and image host;
- whether concealment survives recompression, resizing, transcoding, moderation, or steganalysis;
- how threshold recovery participants are authenticated and what collusion is tolerated; or
- which evaluation methods and acceptance thresholds are appropriate.

These are open design questions, not details to silently fill with assumptions.

## 10. Status

W1 is a research-framing working draft. It is intended to guide the next waypoint, the threat model (W2), and should be reconciled against the complete thesis before being treated as final.

**Implementation:** None claimed.  
**Independent security audit:** None claimed.  
**Security claims:** Proposals and research questions only, unless separately evidenced.
