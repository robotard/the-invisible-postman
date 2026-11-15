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

## D-10 · Transport routes are an explicit architectural layer

**Status:** Adopted as a scope clarification by the researcher · Detailed route taxonomy and evaluation remain open.

**Decision:** The architecture must explicitly include message carriage as a transport-route layer. Image carriage is a required research route and remains central to the project's identity and evaluation. It is not to be removed or reduced to a decorative example. The architecture should also describe and compare other carriage routes, such as ordinary file or attachment transport, without confusing the route with the cryptographic message itself.

**Rationale:** The message must travel through one or more transport routes. A route determines how protected capsules are packaged, carried, transformed, routed and recovered at the receiving endpoint. Different routes may expose different metadata, impose different size and ordering constraints, and tolerate different transformations. The route is therefore a first-class architectural concern, not an incidental implementation detail.

**Boundary:** Cryptographic protection and authenticated message semantics must remain independent of the carrier. Image-specific processing and optional steganographic concealment belong to image-route adapters. Concealment remains optional and must not be conflated with encryption, authentication or route reliability. Alternative routes are comparative profiles, not grounds for deleting the image-carriage research question.

**Open work:** Define a route abstraction and route-specific profiles; compare image, file/attachment and conventional messaging routes; assess capacity, transformations, metadata, ordering, delivery semantics, usability, interoperability and failure behaviour. No route's security or resilience is assumed.

**Source:** Researcher's explicit scope clarification, 2026-11-15.

## Assurance

**Theory only · No implementation · Not audited.**


## D-09 · Adapt established open-source and research-governance frameworks

**Status:** Adopted as a research-method direction for this repository · Framework itself remains proposed and unratified externally.

**Decision:** Do not invent a wholly bespoke governance process where mature models already offer useful components. Adapt, with explicit limits, the OpenSSF Best Practices Badge criteria, OpenSSF Scorecard's use of narrow automated checks, Apache's transparent asynchronous discussion and reasoned objections, IETF rough-consensus objection handling, CRediT contribution roles, and GitHub's versioned issue/pull-request review controls.

**What is adopted for the project method:**
- Evidence-backed, applicability-aware checklist rather than self-awarded badge.
- Public, asynchronous discussion and durable decision records.
- Written disposition of material objections, including unresolved dissent.
- Contribution roles mapped to accepted work and confirmed by contributors.
- Version-specific review and auditable merge records.
- Automation limited to deterministic process checks.

**What is explicitly not adopted:**
- OpenSSF badge or Scorecard as a thesis-quality, scientific-validity or cryptographic-security score.
- Apache lazy consensus or silence-as-consent as the project's decision rule.
- IETF "running code" as a condition for this theory-only research stage.
- Formal consortium, PMC, committer or standards-body status without the relevant community and governance.
- Automated truth judgement, popularity voting or automatic ratification.

**Rationale:** These frameworks solve related but distinct problems. Their mechanisms are useful only when adapted to this project's current scope, scale and authority. Borrowing mature practices is preferable to pretending the project has invented governance from scratch; clear boundaries prevent borrowed labels from implying credentials or assurance the project does not possess.

**Source basis:** See [Collaborative Research Governance Framework, section 13](collaborative-governance.md#13-existing-frameworks-borrow-adapt-and-refuse-carefully).

**Review trigger:** Reassess when independent reviewers participate, when the repository becomes a software project, or when a genuine multi-party consortium is formed.
