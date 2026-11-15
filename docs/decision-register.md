# Design Decision Register

**Project:** The Invisible Postman  
**Status:** Working register · Theory only · No implementation · Not audited

This register records why significant design choices were made, changed, narrowed, or rejected. A decision records reasoning and assumptions; it does not establish that a mechanism has been implemented or validated.

## D-01 · Password-derived encryption as the initial model

**Status:** Retained as design history and an evaluated alternative; not the identity model for the current architecture.

**Initial choice:** Use a user-supplied password or passphrase, derive a symmetric key with Argon2id and a fresh random salt, then protect the message with a vetted authenticated-encryption construction before embedding the payload in an image.

**Why it was chosen:** The original research concept was a small, direct exchange of a protected message. A shared password was familiar to users, portable across endpoints, did not require an identity directory or central key service, and allowed the project to examine encryption separately from image-carrier processing. The password could remain with the participants while the salt, KDF parameters, nonce and ciphertext travelled with the protected object. This was a pragmatic choice for the initial scope, not a claim that passwords provide sender identity or inherently stronger security.

**What the choice does provide:** A password-derived key can protect a self-contained message when participants already share a sufficiently strong secret through a separate trusted channel. A fresh salt prevents identical passwords from automatically deriving identical keys, while Argon2id can increase the cost of offline password guessing. Authenticated encryption can detect tampering when correctly specified and used.

**What it does not provide:** A KDF cannot create entropy absent from the password. A carrier and its public KDF metadata may permit offline guessing. A shared password does not identify which holder sent a message, authenticate a peer's public key, provide forward secrecy, or solve multi-device distribution, rotation and compromise response.

**Reason for architectural evolution:** The research scope expanded from a simple password-protected image message to communication among independently verified endpoints, with an untrusted intermediary, authenticated peer binding, sender authentication, per-session context and key lifecycle. Those requirements justify endpoint-controlled identity and authenticated key establishment as the current direction.

**Decision boundary:** Password-derived encryption remains a valid narrow alternative for participants who knowingly accept shared-secret distribution and lifecycle limitations. It is not silently merged into the endpoint key-establishment model. Any future hybrid must specify the role of each input, context binding, key separation, downgrade/failure behaviour and evaluation criteria.

## D-02 · Image hash as a key

**Status:** Rejected as a source of cryptographic key material.

**Rationale:** A public, shared, replaceable or transformable image is not dependable secret entropy. Hashing it does not make it secret or add entropy. Images remain carriers, not keys or identity credentials.

## D-03 · Double encryption as identity

**Status:** Reframed.

**Rationale:** Confidentiality and sender authentication are separate goals. Adding another encryption layer does not, by itself, prove who sent a message. Identity binding and authentication require explicit design.

## D-04 · Linked images as a distributed secret

**Status:** Separated.

**Rationale:** Splitting ciphertext into transport fragments is not threshold secret sharing. A manifest and integrity binding are needed to associate fragments; threshold sharing requires a separate secret, participant, threshold and collusion model.

## D-05 · Remote kill switch

**Status:** Narrowed.

**Rationale:** Expiry and revocation can constrain future acceptance or access under defined conditions. They cannot recall plaintext, keys, screenshots or copies already obtained.

## D-06 · Platform identifier as identity

**Status:** Rejected.

**Rationale:** A platform username or account ID is a routing identifier, not proof of a human identity or cryptographic key ownership. First-contact key verification must be explicit.

## D-07 · Steganography first

**Status:** Reordered.

**Rationale:** Specify and evaluate cryptographic protection before optional concealment. Steganography does not replace encryption, authentication or identity verification.

## D-08 · Collaborative research governance and adopted-practice baseline

**Status:** Proposed framework · Not externally ratified · No automated adoption enabled.

**Rationale:** The project needs a transparent method for reviewing, attributing and adopting reusable practices without mistaking popularity or agreement for evidence. The proposed [Collaborative Research Governance Framework](collaborative-governance.md) defines proposal states, review thresholds, consent-based attribution, dissent handling and a versioned project-wide baseline commit.

**Decision boundary:** A practice may become part of this project's adopted baseline only after its scope, evidence, limitations, independent review, attribution and ratification are recorded. Adoption is project-scoped, reversible and versioned; it is not a claim of universal best practice. Automation may validate process requirements but cannot determine truth or scientific adequacy. The framework itself remains a proposal pending review.

## Assurance

**Theory only · No implementation · Not audited.**
