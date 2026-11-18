# W1 · Research Framing

**Project:** The Invisible Postman  
**Subtitle:** A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage  
**Researcher:** @robotard  
**Version:** 1.0 working draft  
**Status:** Theory only · No implementation · Not audited

## 1. Research problem

Secure messaging systems must protect message contents while often relying on intermediary services for delivery, storage, coordination, or media handling. Image carriage is a required transport route in this research. Other carriage routes may be modelled for comparison. Optional steganographic techniques may conceal the presence of message material within an image. Neither the carrier nor concealment itself provides cryptographic confidentiality, sender authentication, or trustworthy identity.

The research problem is to describe and critically evaluate an endpoint-only architecture in which the protected message is a self-contained object and cryptographic authority remains with the communicating endpoints. External routes are untrusted and replaceable means of conveying bytes, not architectural authorities. The design must account for route-specific transformations, multipart delivery, lifecycle policy and optional recovery without requiring an intermediary, coordinator or fixed address relationship. Image carriage is a required route profile for comparison; alternative routes provide comparison points.

## 2. Central research question
### Transport-independence principle

The research does not assume that a particular transport, platform, bot or image source is necessary. Endpoint protection creates a self-contained protected message; any route-facing encapsulation is local to the endpoint and adapts its outer representation. External platforms, hosts and networks merely convey, transform, delay or withhold bytes. No orchestration service, directory, database, fixed address or rendezvous entity is part of the message architecture. Image carriage is a required research comparison route, not a mandatory runtime route. The comparison must preserve protected-message semantics or explicitly identify and analyse any protocol conversion.



**How can an endpoint-controlled messaging architecture preserve authenticated message semantics across replaceable, untrusted carriage routes, including image-based carriage, and what can route-specific evidence establish about security, privacy, reliability and delivery under defined observer models?**

This is an architectural research question. It does not assume that the proposed design has been implemented, formally proven, empirically evaluated, or independently audited.

## 3. Supporting research questions

1. **Identity and trust:** What does it mean to verify a participant's cryptographic key, and what does that process not prove about a real-world identity?
2. **Cryptographic composition:** Which endpoint responsibilities are required for authenticated key establishment, confidentiality, sender authentication, integrity, replay resistance and key lifecycle?
3. **Intermediary exposure:** What can bots, platforms, hosts, storage providers and network observers learn, alter, correlate or deny?
4. **Message structure:** How should message context, envelopes, multipart capsules and manifests be bound and validated?
5. **Carriage methods:** What changes when protected material travels as an image, an encrypted file, an attachment or through a conventional end-to-end messaging route?
6. **Concealment:** Does optional steganographic concealment address a distinct and measurable threat, and under which transformations does it fail?
7. **Carrier acquisition and observer exposure:** What route-native or independently arranged means convey the protected object or its parts to the recipient, and what can platforms, hosts and network observers learn or disrupt? Compare discovery/retrieval systems such as OMR, Oblivious Signaling and Remise strictly as external prior art, including their service, setup and collusion assumptions; do not turn their directories, databases, locators or retrieval services into architecture components. Compare product-facing delivery evidence, including Signal's per-device queue/acknowledgement and receipt model and Dropbox's owner-facing file activity and viewer-information surfaces, without treating either UI as a complete backend event record (SRC-038–SRC-039).
8. **Human behaviour:** How can routines, timing, language, platform habits and social-engineering probes create linkability even when carriers and locations vary?
9. **Lifecycle and recovery:** What can expiry, revocation, key rotation and recovery realistically achieve, and what assumptions do they introduce?
10. **Evaluation and confidence:** What evidence is needed to assess the architectural objectives and each route's claims; how should the basis, scope and limits of confidence be made inspectable without conflating distinct properties or creating new privacy risks, and what evidence would show that a design choice is unsuitable?

> **Illustrated diagram placeholder · W1-F01 — Research scope and evidence map**
> **Placement:** After §3 Supporting research questions.
> **Prompt for later illustration:** Create a clean, publication-ready conceptual diagram connecting the research questions to endpoint message protection, message/capsule structure, carrier encapsulation, route profiles, discovery/retrieval, observer exposure and evaluation evidence. Show image carriage as a required comparison profile, not a mandatory runtime route; show steganography as an optional image-route sub-layer. Use labelled relationships and clear responsibility boundaries.
> **Must not imply:** That any route is selected or superior, that the architecture is implemented, or that any security property has been demonstrated.


## 4. Intended contribution

The intended contribution is not a new cipher, steganographic embedding method, anonymity network or complete messaging protocol. It is a theory-led account of how endpoint-protected message semantics should be separated from replaceable carriage, and how claims about that architecture can be compared and bounded by evidence. The proposed contribution has four connected parts:

1. **Endpoint-owned, self-contained message architecture:** define the boundary between endpoint identity/key handling, message protection, self-contained message/set structure, route-facing encapsulation and lifecycle functions. External carriage mechanisms convey bytes but do not coordinate, resolve or authorise message relationships. This is an organising architecture, not a novelty claim by itself.
2. **Common route-comparison method:** compare the same logical communication task across image-platform, file/attachment, conventional E2E and mixnet-backed profiles while preserving each route's native identity, discovery, delivery and observer semantics. A comparison table alone is insufficient; the analysis must identify decision-relevant differences and costs.
3. **Message-relationship and lifecycle analysis:** distinguish object validity, fragment membership, set completeness, reconstruction, conversation continuity, retries, cross-route copies and delivery events. The work must show what is authenticated at endpoints and what an external observer can only infer.
4. **Claim-centred evidence discipline:** connect each material claim to its verifier, scope, provenance, assumptions, observer vantage, freshness and unresolved alternatives. This is a research method to be challenged, not a security mechanism or a calibrated confidence score.

The required image-carriage route is examined without presuming it is superior. Optional steganographic concealment is assessed separately from confidentiality, authenticity and delivery. The thesis must identify where existing work already covers the proposed elements and narrow or withdraw any contribution claim that does not survive comparison.

The value of the work is not that images are inherently secure or that concealment makes encryption stronger. It is that the system's claims, boundaries, and limitations are made explicit enough to examine and challenge. A candidate organising principle is that confidence must be grounded in inspectable evidence, bounded by the verifier's vantage and assumptions, and explicit about what remains unknown. This is not a claim that confidence is a cryptographic property or that the phrase itself establishes originality; see the [confidence and evidence model](confidence-and-evidence-model.md). The [working prior-art comparison](prior-art-comparison.md) is used to test the candidate contribution against the closest identified systems; it does not establish originality by itself.

The closest integrated comparator now includes Echomix/Katzenpost. Its global/active adversary model, traffic coupling, capability-derived discovery, asynchronous messaging, reliability and collusion analysis materially narrow any broad claim to a newly integrated delivery-privacy architecture. The remaining comparative question is whether ordinary image-platform carriage introduces distinct, measurable transformations or observables when carrying the same endpoint-protected message semantics. This is a route comparison target, not an assumed contribution. See [the Echomix comparator](echomix-katzenpost-comparator.md) and [route comparison framework](route-comparison-framework.md).

## 5. Scope

The thesis considers a proposed endpoint-controlled messaging architecture in which image carriage is a required research route and other carriage methods are comparison profiles. It considers:

- endpoint-held keys and plaintext;
- authenticated key agreement and sender authentication as distinct requirements;
- an intermediary that should not possess plaintext or the sole ability to decrypt;
- optional steganographic concealment as a separate image-route layer;
- route-specific carrier acquisition, extraction, decapsulation and delivery-failure behaviour;
- discovery/retrieval privacy comparisons across recipient-side scanning, stable authenticated locators, short-lived capabilities, public-key OMR/PIR-style retrieval and stateful private retrieval, without prematurely selecting a mechanism;
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

The image-platform route is not an empty research area. Recent work studies robust JPEG steganography under social-network recompression (MRAS and DRAS), practical social-network transmission, active removal of hidden payloads and steganalysis. These sources are recorded as SRC-033–SRC-037. The research must not frame image payload robustness, concealment or platform survival alone as a novel contribution. SRC-043 directly studies fragmented covert communication across many images with redundant fragment carriage and reconstruction using robust DFT/DCT watermarking, not a general proof of steganographic stealth; SRC-044 studies pooled steganalysis across batches, while SRC-045 proves a bounded asymptotic capacity result under explicit assumptions. SRC-061 adds a separate historical comparison: robust video-watermark persistence and recipient-specific forensic attribution have different objectives from steganographic concealment, and attribution can increase linkability. The thesis narrative now introduces the author's reported Sony R&D context in §2.3 as historical perspective only, then develops the technical distinction at the start of §8.3. This is a reflective framing adjustment, not a claim that the author's work formed part of Galaxy, VWM or the Academy screener programme. SRC-046–SRC-047 add learned active sanitization; SRC-048 describes a keyed counter-adaptation to a known sanitizer; SRC-049 describes frame-level redundancy within one GIF object, not multi-post fragmentation. These sources rule out broad novelty claims around multi-image fragmentation and show why per-image detector results are insufficient. See [multi-message linkage and steganographic carriage](multi-message-linkage-and-steganographic-carriage.md). Its comparison must separate carrier extraction, detectability, endpoint authenticity/integrity, discovery privacy, observer leakage and operational cost. A source-code check now adds a useful boundary: the author-linked MRAS and DRAS MATLAB repositories (SRC-033/034, pinned in the source register) expose per-image embedding/extraction routines. Their inspected ten-image demos independently process each cover and locally simulate JPEG recompression; each call loads a sample-message prefix. The inspected code does not implement a cross-image fragment manifest, authenticated set reconstruction or conversation continuity. This narrows what those public implementations demonstrate, but it does not prove that the papers' separately reported platform experiments lack other components, nor establish a novel contribution for this thesis. The central research question remains comparative and open: whether the complete endpoint-protected delivery route has measurable, decision-relevant properties that differ from established alternatives.

> **DEFINITION · Carrier multiplicity levels**  
> Frames within one animated GIF are internal parts of one carrier object. Separate image objects may carry fragments or redundant copies of one protected message. Distinct protected messages may be linked by a conversation/session. These are three different multiplicity levels and must not be collapsed into "multiple images" or "multipart".
>
> **COMPARISON · Passive transformation, active sanitization and counter-adaptation**  
> Passive or routine platform processing may resize or recompress media. An active sanitiser is deliberately designed to remove hidden data while preserving image quality (SRC-036, SRC-046–SRC-047). A sender may adapt to a known sanitiser using a keyed receiver mechanism (SRC-048). These are different threat settings; none establishes what a named platform deploys.
>
> **Illustrated diagram placeholder · W1-F04 — Carrier multiplicity and adversarial image processing**  
> **Placement:** After the image-carriage prior-art discussion in §5 Scope and before §6 Non-goals.  
> **Prompt for later illustration:** Compare one animated GIF containing multiple frames with (a) cross-frame redundant payload recovery, (b) separate image objects carrying fragment capsules or redundant copies, and (c) separate protected messages linked as a conversation. Add a second panel showing passive recompression, active sanitization and a keyed counter-adaptation loop, with explicit trust/knowledge boundaries.  
> **Must not imply:** That GIF frames are separate posts, that cross-frame majority voting authenticates a message set, that sanitizer-aware optimisation defeats unknown platforms, or that any platform deploys a cited sanitiser.
>
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
- **Package encapsulation:** The bounded, route-facing framing of an already protected object or fragment capsule for carriage. It is distinct from endpoint authentication and does not make outer fields trustworthy.
- **Message-set context / manifest:** Authenticated context needed to establish fragment membership, count, order-independent reconstruction and completeness for one logical protected object; exact fields and encoding remain open.
- **Conversation/session linkage:** Authenticated continuity between distinct logical messages; it is not fragment-set membership and need not be exposed as a stable carrier identifier.
- **Confidence:** A verifier's evidence-bounded judgement about a specific proposition, scope and time; not a universal system score or a property the system can simply assert.
- **Assurance:** A justified argument that defined requirements are met within a stated scope and evaluation regime; it requires evidence and appropriate scrutiny.
- **Observer-inferred linkage:** A correlation hypothesis based on visible timing, size, provenance, media artefacts or access patterns; distinct from endpoint-authenticated linkage.
- **Expiry and revocation:** Policies that may restrict future access or sessions but cannot retrieve data already copied or learned.

> **DEFINITION · Message multiplicity:** A *fragment set* is the pieces needed to reconstruct one logical protected message. A *conversation* links distinct logical messages. A *retry* repeats delivery of the same logical message or protected object. *Redundant carriage* repeats or codes data to tolerate loss. These relationships must not share one ambiguous "multipart" label.

> **COMPARISON · Concealment versus linkage:** Per-image steganographic concealment concerns whether an individual carrier reveals embedded data. Set-level linkage concerns whether several carriers or events can be grouped through identifiers, manifests, timing, provenance, embedding artefacts or retrieval patterns. Hiding one does not establish hiding the other.

> **Illustrated diagram placeholder · W1-F02 — Message, fragment-set and conversation distinctions**
> **Placement:** Beside §7 Core framing and terminology.
> **Prompt for later illustration:** Show one logical message represented by one protected object; the same object optionally divided into indexed capsules and carried by multiple image objects; a separate conversation containing several distinct protected messages; and a retry as another delivery event for the same logical message. Use separate visual shapes/labels for message identity, fragment-set membership, conversation continuity, redundancy and carrier identity.
> **Must not imply:** That a fragment set is a conversation, that carrier identifiers authenticate membership, or that redundancy provides confidentiality or guaranteed recovery.

> **Illustrated diagram placeholder · W1-F03 — Protected-object package and image-carriage boundary**  
> **Placement:** Beside the message multiplicity definitions, after W1-F02.  
> **Prompt for later illustration:** Show the conceptual progression from logical message to endpoint-protected object, optional authenticated message-set manifest, fragment capsules, route-specific carrier encapsulation, optional steganographic embedding and one or more image carriers. Show the inverse extraction/decapsulation and endpoint validation path. Use clear visual boundaries for endpoint-authenticated material, untrusted outer framing and optional concealment.  
> **Must not imply:** That a final wire format has been selected, that outer encapsulation authenticates content, or that steganographic concealment is mandatory.
>

## 8. Research discipline

The confidence/evidence framing is governed by [the claim-centred model](confidence-and-evidence-model.md). In particular, distinguish cryptographic validity from identity binding and semantic truth; distinguish individual-object validity from fragment membership, set completeness and conversation continuity; and use delivery verbs only at the event level supported by evidence. Confidence records should remain scoped, provenance-aware and privacy-minimising. They must not become a universal score, central tracking ledger or substitute for independent assurance.

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

The related-work comparison includes OMR/GOMR, PerfOMR, SophOMR, InstantOMR, Oblivious Signaling, Remise, StOMR and UnifOMR. These works cover recipient pertinence privacy, group retrieval, stateful shared-state establishment, PIR-related efficiency limits, anonymous publication and authorised access. The intended contribution must not be framed as introducing private retrieval or a whole delivery lifecycle. Both StOMR and UnifOMR primary papers have been directly reviewed; selected StOMR artifact source is inspected, while no identifiable official UnifOMR implementation has been built or run. SRC-053 is a secondary full-paper assessment cross-checked against the UnifOMR primary text. A third-party experimental UnifOMR wallet integration (SRC-052) adds a concrete completeness-flag/cursor-recovery example, but is not production evidence. See SRC-050–SRC-053 and the [observer/property matrix](observer-property-matrix.md). Originality remains unestablished.

## 10. Status

W1 is a research-framing working draft. It is intended to guide the next waypoint, the threat model (W2), and should be reconciled against the complete thesis before being treated as final.

**Implementation:** None claimed.  
**Independent security audit:** None claimed.  
**Security claims:** Proposals and research questions only, unless separately evidenced.

**Project status:** Theory only · No implementation · Not audited.
