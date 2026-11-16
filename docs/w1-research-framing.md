# W1 · Research Framing

**Project:** The Invisible Postman  
**Subtitle:** A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage  
**Researcher:** @robotard  
**Version:** 1.0 working draft  
**Status:** Theory only · No implementation · Not audited

## 1. Research problem

Secure messaging systems must protect message contents while often relying on intermediary services for delivery, storage, coordination, or media handling. Image carriage is a required transport route in this research. Other carriage routes may be modelled for comparison. Optional steganographic techniques may conceal the presence of message material within an image. Neither the carrier nor concealment itself provides cryptographic confidentiality, sender authentication, or trustworthy identity.

The research problem is to describe and critically evaluate an architecture in which cryptographic protections remain anchored at the communicating endpoints while an intermediary is treated as untrusted for plaintext confidentiality and participant impersonation. Message carriage is a first-class transport-route layer; image carriage is a required route profile, and alternative routes provide comparison points. The design must also account for route-specific transformations, multipart delivery, lifecycle policy, and optional recovery arrangements. The research further separates the primary participant-side cryptographic topology from a standalone, low-fidelity transport element ("train"). The train carries an already protected object; a bounded encapsulation layer prepares it for carriage without taking on the passengers' security roles.

## 2. Central research question
### Transport-independence principle

The research does not assume that a particular transport, platform, bot or image source is necessary. Endpoint protection defines the protected message; encapsulation adapts its outer representation; optional transport adapters carry it; optional orchestration may coordinate delivery and may itself participate in transit. These functions can share an implementation but must remain distinct in the threat model. Image carriage is a required research comparison route, not a mandatory runtime route. The comparison must preserve protected-message semantics or explicitly identify and analyse any protocol conversion.



**How can an endpoint-controlled messaging architecture protect message contents and authenticate communicating participants while using untrusted intermediaries and image-based carriage, and what security, privacy, usability and reliability limits remain across the complete communication lifecycle?**

This is an architectural research question. It does not assume that the proposed design has been implemented, formally proven, empirically evaluated, or independently audited.

## 3. Supporting research questions

1. **Identity and trust:** What does it mean to verify a participant's cryptographic key, and what does that process not prove about a real-world identity?
2. **Cryptographic composition:** Which endpoint responsibilities are required for authenticated key establishment, confidentiality, sender authentication, integrity, replay resistance and key lifecycle?
3. **Intermediary exposure:** What can bots, platforms, hosts, storage providers and network observers learn, alter, correlate or deny?
4. **Message structure:** How should message context, envelopes, multipart capsules and manifests be bound and validated?
5. **Carriage methods:** What changes when protected material travels as an image, an encrypted file, an attachment or through a conventional end-to-end messaging route?
6. **Concealment:** Does optional steganographic concealment address a distinct and measurable threat, and under which transformations does it fail?
7. **Discovery and collection:** How can a recipient discover and collect a changing carrier without creating a stable rendezvous point or access pattern that defeats the intended privacy benefit?
8. **Human behaviour:** How can routines, timing, language, platform habits and social-engineering probes create linkability even when carriers and locations vary?
9. **Lifecycle and recovery:** What can expiry, revocation, key rotation and recovery realistically achieve, and what assumptions do they introduce?
10. **Evaluation:** What evidence is needed to assess the stated architectural objectives, and what would show that a design choice is unsuitable?

## 4. Intended contribution

The intended contribution is a transparent, theory-led architecture and design rationale for authenticated cryptographic messaging with an explicit transport-route layer and a required image-carriage route. It aims to:

- separate cryptographic confidentiality, sender authentication, identity verification, carrier formatting, and optional concealment;
- make trust boundaries and intermediary capabilities explicit;
- document design refinements and the reasons for them;
- identify assumptions, failure modes, lifecycle limits, and unresolved protocol decisions;
- propose testable acceptance criteria and questions for independent review; and
- distinguish established cryptographic mechanisms from unvalidated architectural choices.

The value of the work is not that images are inherently secure or that concealment makes encryption stronger. It is that the system's claims, boundaries, and limitations are made explicit enough to examine and challenge. The [working prior-art comparison](prior-art-comparison.md) is used to test the candidate contribution against the closest identified systems; it does not establish originality by itself.

The closest integrated comparator now includes Echomix/Katzenpost. Its global/active adversary model, traffic coupling, capability-derived discovery, asynchronous messaging, reliability and collusion analysis materially narrow any broad claim to a newly integrated delivery-privacy architecture. The remaining comparative question is whether ordinary image-platform carriage introduces distinct, measurable transformations or observables when carrying the same endpoint-protected message semantics. This is a route comparison target, not an assumed contribution. See [the Echomix comparator](echomix-katzenpost-comparator.md) and [route comparison framework](route-comparison-framework.md).

## 5. Scope

The thesis considers a proposed endpoint-controlled messaging architecture in which image carriage is a required research route and other carriage methods are comparison profiles. It considers:

- endpoint-held keys and plaintext;
- authenticated key agreement and sender authentication as distinct requirements;
- an intermediary that should not possess plaintext or the sole ability to decrypt;
- optional steganographic concealment as a separate image-route layer;
- distribution, recipient discovery, collection, decapsulation and route-specific failure behaviour;
- discovery/retrieval privacy comparisons across recipient-side scanning, stable authenticated locators, short-lived capabilities and private/oblivious retrieval, without prematurely selecting a mechanism;
- format-specific metadata classification that separates descriptive EXIF/IPTC/XMP fields from required container/codec structures and signal-level platform traces;
- resource-bounded multipart parsing and reconstruction, including explicit size, count, time and memory limits;
- carrier metadata minimisation, platform/network metadata exposure and human behavioural linkability;
- evidence limits for social-engineering and behavioural claims, including the distinction between qualitative perpetrator accounts and measured recipient susceptibility;
- linked image capsules, authenticated message-set integrity and safe reconstruction independent of transport arrival order;
- distinct models for a single message, fragmented message, redundant fragment carriage, independent messages, conversation/session continuity, retries and cross-route copies;
- policy-based expiry and revocation, with realistic limits;
- optional threshold-controlled recovery as a separate mechanism requiring explicit assumptions; and
- qualitative threat analysis, proposed acceptance criteria, and an evaluation plan.

Candidate primitives may be discussed as design options, but their presence in this document is not a complete protocol specification or evidence of security.

The image-platform route is not an empty research area. Recent work studies robust JPEG steganography under social-network recompression (MRAS and DRAS), practical social-network transmission, active removal of hidden payloads and steganalysis. These sources are recorded as SRC-033–SRC-037. The research must not frame image payload robustness, concealment or platform survival alone as a novel contribution. SRC-043 directly studies fragmented covert communication across many images with redundant fragment carriage and reconstruction; SRC-044 studies pooled steganalysis across batches. These sources rule out broad novelty claims around multi-image fragmentation and show why per-image detector results are insufficient. See [multi-message linkage and steganographic carriage](multi-message-linkage-and-steganographic-carriage.md). Its comparison must separate carrier extraction, detectability, endpoint authenticity/integrity, discovery privacy, observer leakage and operational cost. The central research question remains comparative and open: whether the complete endpoint-protected delivery route has measurable, decision-relevant properties that differ from established alternatives.

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

> **DEFINITION · Message multiplicity:** A *fragment set* is the pieces needed to reconstruct one logical protected message. A *conversation* links distinct logical messages. A *retry* repeats delivery of the same logical message or protected object. *Redundant carriage* repeats or codes data to tolerate loss. These relationships must not share one ambiguous "multipart" label.

> **COMPARISON · Concealment versus linkage:** Per-image steganographic concealment concerns whether an individual carrier reveals embedded data. Set-level linkage concerns whether several carriers or events can be grouped through identifiers, manifests, timing, provenance, embedding artefacts or retrieval patterns. Hiding one does not establish hiding the other.

> **Illustrated diagram placeholder · W1-F01 — Research scope and evidence map**
> **Placement:** After §3 Supporting research questions.
> **Prompt for later illustration:** Create a clean, publication-ready conceptual diagram connecting the research questions to endpoint message protection, message/capsule structure, carrier encapsulation, route profiles, discovery/retrieval, observer exposure and evaluation evidence. Show image carriage as a required comparison profile, not a mandatory runtime route; show steganography as an optional image-route sub-layer. Use labelled relationships and clear responsibility boundaries.
> **Must not imply:** That any route is selected or superior, that the architecture is implemented, or that any security property has been demonstrated.

> **Illustrated diagram placeholder · W1-F02 — Message, fragment-set and conversation distinctions**
> **Placement:** Beside §7 Core framing and terminology.
> **Prompt for later illustration:** Show one logical message represented by one protected object; the same object optionally divided into indexed capsules and carried by multiple image objects; a separate conversation containing several distinct protected messages; and a retry as another delivery event for the same logical message. Use separate visual shapes/labels for message identity, fragment-set membership, conversation continuity, redundancy and carrier identity.
> **Must not imply:** That a fragment set is a conversation, that carrier identifiers authenticate membership, or that redundancy provides confidentiality or guaranteed recovery.


## 8. Research discipline

The work should distinguish three categories throughout the thesis:

1. **Established mechanisms:** Properties supported by the relevant cryptographic constructions and their specifications, when used correctly.
2. **Proposed design choices:** Architectural decisions that still require complete specification and evaluation.
3. **Unverified claims:** Statements requiring implementation, empirical evidence, formal analysis, or independent review before they can be asserted.

No claim of security should rely on the obscurity of the design. Public documentation should include the threat model, rationale, limitations, candidate mechanisms, and review questions while excluding genuine secrets and sensitive personal or operational data. An initial [research source register](source-register.md) records technical specifications, protocol comparators, metadata standards and evidence gaps; it is a starting bibliography, not a completed literature review or independent validation.

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

The related-work comparison has been extended to Group Oblivious Message Retrieval (GOMR) and Remise. These systems show that group recipient privacy, anonymous publication, access-pattern hiding and authorised reader access/revocation are already substantial research areas. The intended contribution must not be framed as introducing private retrieval or a whole delivery lifecycle. The [observer/property matrix](observer-property-matrix.md) records the current cross-system comparison; originality remains unestablished.

## 10. Status

W1 is a research-framing working draft. It is intended to guide the next waypoint, the threat model (W2), and should be reconciled against the complete thesis before being treated as final.

**Implementation:** None claimed.  
**Independent security audit:** None claimed.  
**Security claims:** Proposals and research questions only, unless separately evidenced.

**Project status:** Theory only · No implementation · Not audited.
