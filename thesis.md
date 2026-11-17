# The Invisible Postman
## A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage

**Researcher:** `@robotard`  
**Document:** Integrated thesis, working research draft  
**Checkpoint:** 2026-11-16  
**Status:** Theory only · No implementation · Not audited

> This is a proposed architecture and research programme. It is not a protocol specification, implementation, formal proof, empirical result, or independent security audit.

## Abstract

The Invisible Postman investigates how communicating endpoints can retain cryptographic authority over message contents and authenticated message semantics while relying on intermediaries and replaceable carriage routes. It began with a narrow proposal to protect a message with a shared secret and carry the result inside an image. That proposal exposed questions about encryption and concealment, but did not resolve participant authentication, message context, multi-message relationships, discovery, delivery or intermediary observation.

The thesis develops a theory-led architecture that separates endpoint identity and key verification, authenticated key establishment, message protection, carrier encapsulation, transport, optional orchestration and lifecycle handling. Image carriage is a required research route, not a presumed superior route or mandatory runtime dependency. File/attachment, conventional end-to-end messaging and mixnet-backed messaging provide comparison profiles. Optional steganographic concealment is treated separately from confidentiality and authentication.

The central argument is that transport independence is meaningful only when the protected message's authenticated semantics remain under endpoint control and route-specific transformations, observers, discovery events and failure states are made explicit. A common comparison framework is used to examine the same communication task across materially different routes without pretending that their native identity, discovery or delivery semantics are interchangeable. Multi-message handling is treated at several distinct levels: object validity, fragment membership, set completeness, reconstruction, conversation continuity, retries and cross-route copies.

The thesis also develops a claim-centred account of confidence. Confidence is not a cryptographic property or a score emitted by the system; it is a verifier's judgement about a specific proposition, based on evidence with stated provenance, scope, assumptions, observer vantage and freshness. This discipline is intended to prevent stronger claims about identity, completeness, linkage or delivery being inferred from weaker evidence. It must itself be assessed for usefulness and privacy cost; it must not become a central tracking ledger.

The work is a conceptual architecture and comparative research programme, not a completed protocol or evaluated system. Existing work on covert messaging, private retrieval, mix networks, multi-image carriage, steganalysis and platform sanitisation places substantial limits on any novelty claim. The thesis therefore treats originality as unresolved and identifies the evidence needed to determine whether its route-specific analysis and claim/evidence method add a defensible contribution. No implementation, experiment, formal proof or independent audit is claimed.

## 1. Research purpose and problem
### 1.1 Transport independence as a governing architectural distinction

The protected message must not depend on a particular carrier or delivery service. The architecture therefore separates endpoint message protection, carrier encapsulation, transport and optional orchestration. Endpoints create and validate the protected object. Encapsulation adapts its outer representation to a route and extracts it again; it must not silently alter authenticated message semantics. Transport adapters are optional ways to move the object. Orchestration may coordinate route selection, sequencing, retrieval or retries, but does not define transport independence and is not mandatory. A service may perform both orchestration and transit, but those roles create different authority and observer disclosures and must be assessed separately.

Image carriage remains a required research comparison route, not a mandatory runtime route. Telegram, an image-generation service such as InspiroBot, and any onward transit are illustrative optional participants, not architectural dependencies. A multi-hop journey must be modelled hop by hop; adding a transit service does not inherently improve anonymity or security. The same endpoint-protected object should remain logically and cryptographically invariant across routes unless an explicit, authenticated protocol conversion is specified and evaluated. Cryptographic details such as AEAD nonce uniqueness, salt purpose, key scope, identity/context binding and replay handling remain protocol-level decisions; they must not be selected merely to fit a carrier.



### 1.2 The problem

Secure communication is not only a matter of encrypting a string and sending it. A usable messaging system must establish who is communicating, determine which keys and sessions are trusted, protect message contents, authenticate relevant context, move data between endpoints, handle incomplete or duplicated delivery, and respond to device loss, key change and compromise. It must also account for what intermediaries can observe and what users reasonably expect the system to do.

Modern communication commonly depends on services outside the direct control of participants: bots, messaging platforms, file hosts, storage providers, content delivery networks and network operators. These services can be operationally useful without being trusted with plaintext or the sole ability to decrypt. Yet even a service that cannot decrypt may still observe relationships, timing, size, access patterns, media properties and user behaviour. It may also alter, reorder, delay, suppress or remove content.

The research explores whether a clear separation of responsibilities can make those boundaries understandable and testable. It does not assume that moving ciphertext through an image makes the system secure. Nor does it assume that a platform becomes harmless merely because it cannot read the message.

### 1.3 Central research question

**How can an endpoint-controlled messaging architecture preserve authenticated message semantics across replaceable, untrusted carriage routes, including image-based carriage, and what can route-specific evidence establish about security, privacy, reliability and delivery under defined observer models?**

**Provisional thesis proposition:** Transport independence is not established merely by placing ciphertext on different services. It requires a defined endpoint-protected message whose authenticated meaning is preserved across route-specific encapsulation and delivery, together with an explicit account of what each participant and observer can verify, infer or disrupt. The thesis examines this proposition through architecture, prior-art comparison, threat analysis and a claim-centred evidence framework. It does not assert that the proposition is novel or already demonstrated.

### 1.4 Supporting research questions

1. **Identity and trust:** What does it mean to verify a participant's cryptographic key, and what does that process not prove about a real-world identity?
2. **Cryptographic composition:** Which endpoint responsibilities are required for authenticated key establishment, confidentiality, sender authentication, integrity, replay resistance and key lifecycle?
3. **Intermediary exposure:** What can bots, platforms, hosts, storage providers and network observers learn, alter, correlate or deny?
4. **Message structure:** How should message context, envelopes, multipart capsules and manifests be bound and validated?
5. **Carriage methods:** What changes when protected material travels as an image, an encrypted file, an attachment or through a conventional end-to-end messaging route?
6. **Concealment:** Does optional steganographic concealment address a distinct and measurable threat, and under which transformations does it fail?
7. **Discovery and collection:** How can a recipient discover and collect a changing carrier without creating a stable rendezvous point or access pattern that defeats the intended privacy benefit?
8. **Human behaviour:** How can routines, timing, language, platform habits and social-engineering probes create linkability even when carriers and locations vary?
9. **Lifecycle and recovery:** What can expiry, revocation, key rotation and recovery realistically achieve, and what assumptions do they introduce?
10. **Evaluation and confidence:** What evidence is needed to assess the architectural objectives and each route's claims; how should the basis, scope and limits of confidence be made inspectable without conflating distinct properties or creating new privacy risks, and what evidence would show that a design choice is unsuitable?

### 1.5 Research approach

This is theory-led architectural research using conceptual decomposition, structured prior-art comparison, threat and observer modelling, lifecycle analysis and derivation of falsifiable evaluation questions. The same communication task is compared across route profiles, while route-native identity, discovery, delivery and observer semantics are preserved rather than forced into a false common protocol.

The method is iterative and adversarial rather than confirmatory. For each material design proposition, the thesis asks what problem it addresses, which assumptions it requires, what alternatives exist, what complexity or disclosure it introduces, what evidence supports it, and what observation would require revision or rejection. Claims are bounded by source quality and reviewer vantage. Publisher-indexed text, author-reported results, inspected source code, full-paper review, reproduced experiments and independent evaluation are different evidence classes and must not be treated as interchangeable.

The work is informed by W1–W4, the decision register, traceability and author-led self-review. These are supporting research artefacts, not independent validation. The [prior-art comparison](docs/prior-art-comparison.md) records current comparators and review limitations; it is not a settled originality finding. The [route comparison framework](docs/route-comparison-framework.md) records the common task, named profile requirements, lifecycle events and observer evidence. Product-version pinning and route-specific empirical evidence remain incomplete.

## 2. Origin and evolution of the research

### 2.1 The initial image-and-password model

The initial concept was deliberately compact: a sender protects a message with a password or passphrase shared with the intended recipient, places the resulting protected data into an image, and sends or publishes that image. The recipient obtains the image and uses the shared secret to recover the message.

This model was useful as an exploratory starting point. It was easy to explain, avoided an initial dependency on an identity directory, and made the distinction between message encryption and image concealment visible. It also raised immediate questions: whether the image was merely a carrier, whether the embedded material could survive ordinary image processing, what metadata remained exposed, and whether a shared secret was sufficient for the communication being proposed.

Argon2id was considered as a password-based key derivation function, with a fresh salt and recorded parameters. Argon2 is specified as a memory-hard password-hashing function, with parameter choices that must be matched to the deployment's resource constraints (Biryukov et al., 2021). The KDF can increase the cost of guessing, but it cannot create entropy absent from the password. The encrypted object would still need a vetted authenticated-encryption construction and correct nonce handling. The password model did not, by itself, prove who sent a message, bind a key to a human identity, provide a robust multi-device lifecycle or solve first-contact impersonation.

The starting model is retained as part of the research history. It is not rewritten as a failed idea: it was a useful narrow model whose limits became clearer as the research question expanded.

### 2.2 Why the research widened

The project moved from a self-contained protected object towards communication between independently verified endpoints. This changed the problem. The question was no longer only how to protect a message before placing it in an image. It became how participants establish and maintain trust, how sender identity is authenticated, how context is bound to ciphertext, how keys change, and how delivery can proceed through services that are not trusted with plaintext.

A shared password may remain appropriate for a narrow, pre-arranged exchange where participants accept its limitations. It is not automatically a participant identity system or a complete protocol for ongoing communication. A hybrid that combines passwords with endpoint key agreement would need a defined role for each input, explicit context binding and key separation, and independent review. Informal combinations of cryptographic primitives are not an acceptable substitute for protocol design.

### 2.3 Design evolution as evidence of changing assumptions

The design history matters because it records why the scope changed. It should not be mistaken for evidence that the later architecture is correct. The evolution from password-derived encryption to endpoint-managed keys reflects an expanded set of requirements, not a simple ranking in which one approach is universally superior.

**Illustration pointer:** [01 · From idea to architecture](diagrams/01-ideation-and-design-evolution.svg) shows the initial concept and the reasoning path that widened the research. It is a historical and conceptual map, not an implementation workflow.

**Illustration pointer:** [03 · Design decisions](diagrams/03-design-decisions.svg) records selected design choices and their rationale. It should be read alongside the decision register, which carries the fuller reasoning, alternatives and unresolved status.

## 3. Research question, scope and contribution

### 3.1 Architectural objective

The architectural objective is to keep cryptographic authority with the communicating endpoints while treating intermediary services as untrusted for plaintext confidentiality and sole decryption authority. Transport and carrier handling should be replaceable and should not silently acquire identity, key, authentication or message-semantic authority.

This is a design objective to be specified and evaluated, not a claim that the objective has been achieved. Its feasibility depends on correct cryptographic composition, endpoint security, identity verification, message binding, safe parsing, and transport choices that do not create unacceptable privacy or availability failures.

### 3.2 Intended contribution

The intended contribution is not a new cipher, steganographic embedding method, anonymity network or complete messaging protocol. It is a theory-led account of how endpoint-protected message semantics should be separated from replaceable carriage, and how claims about that architecture can be compared and bounded by evidence. The proposed contribution has four connected parts:

1. **Responsibility-separated architecture:** define the boundary between endpoint identity/key handling and message protection, route-facing encapsulation, transport, optional orchestration and lifecycle functions. This is an organising architecture, not a novelty claim by itself.
2. **Common route-comparison method:** compare the same logical communication task across image-platform, file/attachment, conventional E2E and mixnet-backed profiles while preserving each route's native identity, discovery, delivery and observer semantics. A comparison table alone is insufficient; the analysis must identify decision-relevant differences and costs.
3. **Message-relationship and lifecycle analysis:** distinguish object validity, fragment membership, set completeness, reconstruction, conversation continuity, retries, cross-route copies and delivery events. The work must show what is authenticated at endpoints and what an external observer can only infer.
4. **Claim-centred evidence discipline:** connect each material claim to its verifier, scope, provenance, assumptions, observer vantage, freshness and unresolved alternatives. This is intended to prevent evidence for a weaker event or property being used to imply a stronger one. It is a research method to be challenged, not a security mechanism or a calibrated confidence score.

The required image-carriage route is examined without presuming it is superior. Optional steganographic concealment is assessed separately from confidentiality, authenticity and delivery. The thesis must identify where existing work already covers the proposed elements and narrow or withdraw any contribution claim that does not survive comparison.

### 3.3 Scope

The research includes endpoint-controlled key custody and plaintext handling; explicit peer verification; authenticated key establishment; authenticated encryption; sender authentication; versioned message context; envelope and multipart validation; a first-class carriage layer; image carriage as a required route; comparison carriage profiles; optional steganographic concealment; intermediary coordination; metadata minimisation; discovery and collection; expiry, revocation and key rotation; and the possible inclusion of separately governed recovery.

### 3.4 Integrated anonymous-messaging comparators

Echomix/Katzenpost is a particularly important integrated comparator. Its published design combines a global and active adversary model, decoy/application traffic coupling, anonymous service access, capability-derived pseudorandom storage locations, asynchronous messaging, courier/replica separation, reliability and backfill semantics, and role-collusion analysis. This means the intended contribution cannot be framed as a new general integration of endpoint messaging, private discovery, anonymous delivery and lifecycle privacy. Those areas already have substantial integrated prior art.

The remaining route-specific question is narrower: how does a common endpoint-protected message object behave when carried through ordinary image platforms, including resizing, recompression, transcoding, metadata rewriting, moderation, file identifiers, hosting records and account/engagement observations? Echomix is not an ordinary social-image-carriage study, but that difference does not establish originality. The project must compare image carriage with file/attachment, conventional messaging and mixnet-backed messaging under explicit observer capabilities and route-native assumptions. See the [Echomix comparator](docs/echomix-katzenpost-comparator.md), [prior-art comparison](docs/prior-art-comparison.md) and [observer/property matrix](docs/observer-property-matrix.md).

Other prior art further limits the scope of any contribution claim. Oblivious Message Retrieval (OMR) and Group OMR already formalise recipient/message privacy in bulletin-board settings; PerfOMR, SophOMR and InstantOMR explore different computation, communication, throughput and latency trade-offs (Liu & Tromer, 2022; Liu et al., 2024; Lee & Yeo, 2026; Liang et al., 2026). Oblivious Signaling moves privacy work from recipient-side retrieval to uniform sender-side inbox updates, while Remise uses a two-server DORAM model for anonymous publication and authorised access (Shuhan et al., 2026; Ravi et al., 2026). These designs do not supply the proposed ordinary-image-platform carrier analysis, but they rule out broad claims to inventing private discovery, recipient unlinkability or anonymous asynchronous delivery.

Covert-messaging prior art also extends beyond embedding data in an existing image. The 2024 dead-drop pipeline studies generated covertext, fragmentation, rendezvous, retrieval and platform constraints; the 2025 image-diffusion construction studies a formally modelled covert channel in generated images while leaving recipient delivery outside its problem (Bauer et al., 2024, 2025). Together with multi-image fragmentation, active sanitization and pooled steganalysis, these works mean that neither whole-pipeline analysis nor image-based covert communication is a sufficient novelty claim. The remaining question must be framed as a narrower, evidence-backed comparison of route-specific transformations, observer visibility, endpoint-authenticated message relationships and lifecycle semantics.

### 3.5 Non-goals and exclusions

This thesis does not claim a functioning application, complete wire protocol, formal verification, measured steganographic robustness, guaranteed anonymity, elimination of metadata leakage, guaranteed delivery, endpoint-compromise resistance, remote erasure of material already obtained, or a complete recovery design. It does not claim that a unique image is inherently unpredictable, anonymous or unlinkable. It does not claim that removing image metadata removes network or hosting records.

## 4. Security properties and conceptual distinctions

A recurring research risk is treating the word "secure" as if it described one indivisible property. The architecture must instead state which property is intended, which mechanism is expected to support it, which assumptions are required, and what remains outside its protection.

| Property | Research meaning | Important limitation |
|---|---|---|
| Confidentiality | Unauthorised parties should not learn message contents | Does not hide that communication occurred or all metadata |
| Sender authentication | A receiver obtains cryptographic evidence tied to a sender-controlled key or authenticated session | Does not independently prove a human identity |
| Identity verification | Participants establish that a key belongs to the intended peer under a stated verification process | Platform names and account IDs alone are insufficient |
| Integrity | Alteration of protected content or authenticated context is detected | Does not guarantee delivery or prevent deletion |
| Replay resistance | Previously valid material is not accepted as a fresh message outside policy | Requires message identifiers, freshness rules and state |
| Availability | Participants can obtain the material when needed | An untrusted intermediary can still suppress or delay it |
| Concealment | The existence of embedded material may be made less apparent | Is not encryption, authentication or anonymity |
| Metadata minimisation | Unnecessary identifying information is reduced | Cannot erase independent network, platform or observer records |
| Unlinkability | Observations are made less useful for connecting events or participants | Must be defined against a specific observer and evidence model |
| Recoverability | A defined process may restore access after specified failures | Adds trust, collusion, authorisation and compromise risks |

The properties can interact, but one must not be used as a substitute for another. Encryption does not authenticate a person. A signature does not establish that a public key belongs to the intended person unless a binding process exists. Steganography does not strengthen ciphertext. A random-looking carrier does not conceal retrieval timing. A transport wrapper does not create authenticated integrity unless its relevant fields are bound by the endpoint protocol.

### 4.1 Confidence as an evidence-bounded judgement

The thesis uses the following provisional organising principle:

> **The Invisible Postman does not promise certainty. It makes the basis, boundaries and limitations of confidence explicit.**

This is not a claim that the system can manufacture certainty, that confidence is a cryptographic property, or that the phrase establishes originality. Confidence is a verifier's judgement about a specific proposition, based on evidence available to that verifier, within a stated scope, threat model and time. The system may provide mechanisms and evidence that support a judgement; it cannot make an unsupported inference valid.

Confidence must therefore remain attached to a claim rather than presented as one system-wide score. A useful claim record identifies the proposition, scope, verifier, evidence and provenance, mechanism, assumptions, observer vantage, freshness, plausible alternatives, missing evidence and current disposition. "Not checked", "unavailable", "failed", "unknown", "expired" and "not applicable" are different states. A missing check is not a successful check.

This framing requires strict distinctions:

- **Trust** is a decision to rely on an actor, key, device, service or process; it may include social and institutional judgement beyond cryptographic evidence.
- **Assurance** is a justified argument that defined requirements are met within a declared scope and evaluation regime. It requires evidence and appropriate scrutiny, not a reassuring interface label.
- **Authenticity** concerns attribution to a key or authenticated process; it does not independently establish a human identity or the truth of a statement.
- **Integrity** concerns detectable alteration under a mechanism; it does not prove completeness, delivery, freshness or semantic truth.
- **Discoverability** concerns locating an object; it does not prove its origin, completeness, authenticity or receipt.
- **Truth** is not established by cryptographic validity alone.

The distinction is especially important for multi-message communication. Validity of one protected object does not establish fragment-set membership; membership does not establish set completeness; a complete set does not establish conversation continuity; and endpoint-authenticated linkage is not equivalent to an observer's correlation based on timing, size, provenance or media artefacts. Likewise, a transport acknowledgement, service acceptance, endpoint receipt, successful decryption, display, open signal, human reading and comprehension are different events. The thesis must use only the strongest verb supported by the evidence actually available.

Evidence is also observer- and time-relative. An endpoint with keys and authenticated state may verify a relationship that a platform cannot see; a platform may observe publication and access events without knowing their cryptographic meaning. Key revocation, device compromise, stale logs or changed assumptions may alter the validity of an earlier judgement. The verifier and freshness of evidence must be explicit.

Finally, an evidence model can itself create surveillance. Verification records, stable identifiers, receipts and read signals may expose relationships and behaviour. The default research direction is endpoint-local verification and minimal disclosure, not a central confidence ledger or mandatory telemetry. Any shared evidence must justify its recipient, purpose, retention and linkability.

The proposed framework and claim/evidence fields are developed in [the confidence and evidence model](docs/confidence-and-evidence-model.md), which includes bounded examples from SRC-034 and SRC-036 to demonstrate how author-reported results, indexed evidence and missing full-text details should be represented. These examples are not independent validation. The model remains a conceptual proposal; usability, completeness and privacy costs have not been experimentally evaluated.

**Illustration pointer (planned):** A property-separation figure should show the different claims, their responsible mechanisms and their limits. It belongs beside this section, not as a decorative summary at the end of the thesis.

## 5. System model, trust boundaries and adversaries

### 5.1 Participants and endpoints

The sender endpoint composes plaintext, applies the selected cryptographic protocol, creates authenticated message context and prepares protected material for carriage. The recipient endpoint collects the material, validates its structure and cryptographic bindings, verifies the sender under the protocol and releases plaintext only after required checks succeed.

Endpoints hold plaintext and private keys. This does not make endpoints magically safe: malware, device theft, unsafe backups, compromised operating systems, user error and malicious applications may expose information before encryption or after decryption. Endpoint compromise is a residual risk requiring its own treatment.

### 5.2 Intermediaries

A bot, messaging platform, image host, storage provider or other intermediary may coordinate or carry opaque material. It may inspect, retain, copy, transform, reorder, delay, suppress or remove media and associated metadata. It may generate access logs and expose operational records. It must not be trusted with plaintext confidentiality or the sole ability to decrypt.

The architecture should minimise intermediary privileges and avoid relying on a single intermediary as the source of cryptographic truth. However, reducing authority does not eliminate the intermediary's ability to deny service or observe metadata.

### 5.3 Adversary classes

The threat model considers:
- passive observers of public carriers and communication metadata;
- network observers who may see endpoints, timing, volume and traffic patterns;
- curious or compromised platforms and hosts;
- active attackers who substitute, replay, reorder, mix or suppress material;
- attackers attempting first-contact key substitution or identity deception;
- social engineers probing user routines and delivery expectations; and
- attackers who compromise a participant endpoint.

These actors may collude. The thesis must state when an evaluation assumes independent observers and when combined observations are in scope.

### 5.4 Assets and security objectives

Assets include plaintext, private keys, session secrets, identity/key bindings, authenticated message context, capsule-set integrity, recovery material if any, and sensitive relationship or behavioural metadata. The research must distinguish direct compromise of message content from inference about who communicates, when, how often and through which services.

**Illustration pointer (planned):** A trust-boundary and observer-model diagram should place endpoints, cryptographic services, the transport element, hosts/platforms and observers on the same page, showing what each can hold, see, alter or deny. It should distinguish trust from mere operational involvement.

## 6. Endpoint cryptographic architecture

### 6.1 Identity and key verification

A cryptographic key demonstrates control of that key under the relevant assumptions. It does not independently prove a person's legal or real-world identity. First-contact verification therefore requires an explicit ceremony and a stated assurance goal. Possible approaches may include out-of-band comparison or other independently authenticated channels, but no specific ceremony is selected here.

The research must define what "verified peer" means, what users actually compare, how key changes are signalled, what happens when a device is replaced, and how recovery avoids becoming a key-substitution opportunity. Platform identifiers may help route a message but must not be treated as proof of identity.

### 6.2 Authenticated key establishment

Endpoints require an authenticated key-establishment process with clear identity binding, key confirmation and transcript/context binding. Established protocol designs provide useful comparators rather than components to copy without analysis: Signal's PQXDH specifies asynchronous initial key agreement using published prekey material (Kret & Schmidt, 2023/2024); the Double Ratchet specifies ongoing message-key evolution after a shared secret has been established (Perrin, 2025); and MLS specifies asynchronous group key establishment (Barnes et al., 2023). Their different settings and assumptions must be compared explicitly. None is selected for this project. The phrase "anonymous agreement" has appeared as an unresolved idea, but it is not sufficiently defined to assign it a protocol meaning. It must not be silently interpreted as anonymous key exchange, deniable authentication, private mutual authentication, participant unlinkability or an anonymity network.

These references are not interchangeable. Signal's PQXDH and Double Ratchet provide a 1:1 asynchronous establishment and message-key-evolution comparator; the ratchet's skipped-message handling concerns out-of-order ratchet messages, not the reconstruction of one fragmented protected object across carriers. MLS is a group key-establishment and group-lifecycle comparator, not a default fit for the present 1:1 scope. HPKE (Barnes et al., 2022) is a lower-level KEM/KDF/AEAD composition with stateful context and nonce handling, not a complete asynchronous messaging protocol: its application must handle ordering, loss and general replay protection, and its modes do not provide recipient-compromise forward secrecy. The project therefore retains Signal for 1:1 lifecycle comparison, MLS for group semantics and HPKE for composition analysis, without selecting or informally combining them. None of these references by itself defines the thesis's route-specific carrier discovery, authenticated multi-carrier manifest, platform transformation or service-delivery semantics. The detailed comparison and its evidence boundaries are recorded in the [protocol boundary analysis](docs/protocol-boundary-analysis.md).

### 6.3 Message protection and sender authentication

Authenticated encryption can protect message contents and associated data when correctly composed and used. Sender authentication is a separate design responsibility. The final protocol must explain whether it relies on an authenticated session, signatures or another reviewed construction, and how the evidence binds to the intended sender, recipient, session and message context.

Candidate primitives such as X25519, HKDF-SHA-256, Ed25519 and XChaCha20-Poly1305 may be evaluated. X25519 is a Diffie–Hellman function, not an authenticated protocol (Langley et al., 2016); HKDF is an extract-and-expand key derivation function (Krawczyk & Eronen, 2010); and Ed25519 is a signature scheme whose use does not itself verify a human identity (Josefsson & Liusvaara, 2017). RFC 8439 specifies the IETF ChaCha20-Poly1305 construction, not XChaCha20-Poly1305 (Nir & Langley, 2018). The latter is documented by libsodium with a 192-bit nonce, but the library documentation notes its more limited interoperability and lack of a formal IETF specification (libsodium, n.d.). These candidates are not a selected protocol and should not be assembled informally. A complete specification would need key separation, key confirmation, nonce rules, associated-data construction, version negotiation, downgrade handling, transcript binding, safe error behaviour, rotation and compromise response.

The composition obligations are treated separately from primitive selection. HKDF salt is not an identity-binding field or message nonce: RFC 5869 defines it as an optional, non-secret extraction input, while `info` is the context-specific expansion input (Krawczyk & Eronen, 2010). Any identity or session values supplied as context still require authenticated provenance and canonical encoding. AEAD nonce uniqueness must be maintained for each key across retries, concurrency, crashes, rollback and multi-device use. Associated data can integrity-bind visible header fields, but does not independently prove the identity represented by a key. Replay, ordering, loss, multipart-set validation and downgrade-resistant fallback remain application protocol responsibilities. RFC 9180 is a useful KEM/KDF/AEAD and stateful-context comparator, not a complete messaging protocol: it leaves ordering, loss detection and general replay protection to the application and does not provide forward secrecy against recipient compromise (Barnes et al., 2022). The [protocol boundary analysis](docs/protocol-boundary-analysis.md) records the obligations and unresolved decisions; no protocol is selected.

### 6.4 Endpoint authority and the transport boundary

The participant-side cryptographic topology is primary. The transport element carries already protected material and must not acquire key custody, identity authority, message authentication or decryption capability. Any transport metadata that affects security-relevant interpretation must be authenticated or checked by the endpoint protocol. A transport wrapper can help with framing and extraction checks, but its existence alone does not provide cryptographic integrity or authenticity.

**Illustration pointer (planned):** A layered responsibility diagram should distinguish identity/key verification, key establishment, message protection, authenticated envelope, capsule construction, carrier processing and intermediary transport. Arrows should identify which endpoint creates and verifies each binding.

## 7. Message envelopes, capsules and validation

### 7.1 Envelope purpose

A future versioned envelope may carry protocol version, sender and recipient key references, session/context reference, message identifier, creation or expiry policy, algorithm identifiers, nonce and public parameters, ciphertext/authentication data, capsule-set identifier, fragment index/count, integrity binding and any separately specified recovery-policy reference.

This is a field inventory, not a wire format. Canonical encoding, field criticality, length limits, version negotiation, downgrade behaviour and forward compatibility remain open.

### 7.2 Multipart carriage

A message may exceed the capacity or constraints of a single carrier. The architecture may therefore divide protected data into linked transport capsules. The manifest or equivalent structure must bind the set to one logical message and identify the expected pieces. It must distinguish transport arrival order from authenticated logical order: pieces may arrive out of sequence without being invalid, provided the final set is complete and its ordering/context are authenticated.

Missing, duplicate, conflicting, oversized, altered, substituted, mixed, expired or replayed pieces must not be silently accepted. Ambiguous sets should be rejected or quarantined. No partial or unauthenticated plaintext should be released merely because some pieces were successfully extracted.

The parser and reassembly path also needs explicit resource budgets. A syntactically valid set can still be hostile if it declares extreme lengths, contains excessive fragments or headers, triggers expensive decoding, expands disproportionately during decompression, or causes unbounded temporary storage. The Go project's multipart parser incident (CVE-2023-24536) is an implementation-level example of CPU and memory exhaustion caused by large numbers of parts and allocations; it does not demonstrate a flaw in this proposed capsule format, but it illustrates why limits must be part of the design rather than an implementation afterthought. Candidate limits include total encoded bytes, declared and actual per-capsule size, fragment count, manifest and header length, nesting depth, decompression ratio, aggregate memory/disk use, processing time, concurrent sets and incomplete-set lifetime. Limits must be checked before expensive allocation or decoding where possible. Numerical thresholds require a declared device and use-case profile, not arbitrary universal constants.

### 7.3 Multiple messages, fragment sets and carrier linkage

"Multipart" is not a sufficient description of the message model. A fragment set contains distinct pieces required to reconstruct one logical protected object. Redundant carriage repeats or codes information to tolerate carrier loss. A conversation links multiple distinct logical messages. A retry is another delivery attempt for the same logical message or protected object. A batch may contain several independent messages without linking them into one conversation. Cross-route carriage may repeat the same protected object through different adapters. These relationships have different integrity, replay, discovery and privacy requirements.

For fragmented carriage, the endpoint protocol must authenticate the message-set context and each fragment's membership, index, length and content commitment. It must distinguish completeness from mere receipt, tolerate permitted arrival reordering, define duplicate and conflicting-fragment behaviour, and reject cross-set mixing. A manifest or equivalent may support this, but its exact fields, canonical encoding, key scope, visibility and distribution mechanism remain open. A visible set identifier may make collection easier while giving observers a correlation handle; hiding it may require recipient-specific discovery or an authenticated out-of-band manifest, which creates separate access and timing observations.

Conversation continuity is separate. Distinct messages may be linked through authenticated session state or endpoint-local mapping. A stable conversation identifier exposed in carrier metadata or retrieval requests can create durable linkability. A fragment-set identifier must not be reused as a conversation identifier by convenience.

#### 7.3.1 Relationship authority: what the endpoint knows and what the route reveals

The architecture is best understood as a graph of typed objects and relationships, not as one undifferentiated multipart message. Its nodes may include a logical message, its endpoint-protected object, a fragment set, individual fragments, carrier objects, route events and a conversation/session. These relationships have different authorities and visibility boundaries.

| Relationship | Meaning | Basis for endpoint acceptance | Principal observer risk |
|---|---|---|---|
| Fragment membership | A fragment belongs to one protected-object set | Authenticated set context binds recipient/session scope, index, count and fragment content/length commitments | A visible set token, index or count groups carriers directly |
| Conversation continuity | Distinct logical messages belong to one authenticated session | Authenticated session state or verified endpoint-local mapping | Stable thread/session identifiers, timing and repeated access expose a durable relationship |
| Retry equivalence | A later route event carries the same logical object again | Endpoint duplicate/replay state and authenticated object context | Repeated carrier content, size, timing or publication patterns reveal retransmission |
| Redundant-carriage relation | Multiple carriers contribute repeated/coded information to one recovery outcome | Authenticated coding/set policy and validation of the reconstructed object | Repeated signal and extra events enlarge the collection available for correlation or pooled detection |
| Cross-route equivalence | The same protected object is carried through another route | Endpoint-local equivalence or explicitly authenticated route conversion; no public equality token is assumed | Ciphertext equality, stable fingerprints, timing or shared discovery may correlate routes |
| Observer-inferred association | An observer groups events using timing, size, account, provenance, media features or behaviour | No endpoint acceptance authority; it is an observer hypothesis, not authenticated protocol state | False positives/negatives and real relationship exposure |
| Outer-carrier assertion | A filename, image field, platform label, index or wrapper claims a relationship | None unless the endpoint protocol independently authenticates it | An attacker or intermediary can alter, replay or fabricate the assertion |

This is a responsibility and evidence model, not a selected identifier scheme. A relationship required by the recipient need not be exposed to the carrier. Encrypting a relationship value does not hide publication, retrieval or timing patterns that allow an observer to infer a similar edge. The endpoint's full relationship graph and an observer's partial projection must remain separate analytical objects.

#### 7.3.2 Acceptance is a state transition, not a transport event

A route event must not advance a message directly to "delivered" or "accepted". The conceptual receiver path is:

1. **Candidate observed:** a platform, host, courier or user exposes a possible carrier. This establishes only an observation.
2. **Carrier retrieved:** bytes or media are obtained. This establishes access to a carrier object, not valid payload extraction.
3. **Payload extracted and framed:** the route adapter performs bounded decoding and framing checks. Extraction success is not sender authentication.
4. **Fragment/object authenticated:** endpoint cryptographic checks validate the protected fragment/object and its security-relevant context. Unauthenticated outer fields remain untrusted.
5. **Set membership validated:** authenticated context binds the piece to the intended recipient/session and set. Conflicting, substituted or cross-set pieces are rejected or quarantined.
6. **Set completeness established:** required pieces or the permitted recovery threshold are present under the declared coding policy. Receipt of some valid fragments is not completeness.
7. **Protected object reconstructed and validated:** reconstruction is bounded and the resulting object passes endpoint authentication and replay/freshness policy.
8. **Logical message accepted:** only now may the application expose authenticated plaintext under its user and lifecycle policy.

The ordering is conceptual and does not prescribe a wire format. An implementation may authenticate each fragment before storing it and authenticate the reconstructed object again; it must not release partial plaintext or silently promote an incomplete set. Incomplete sets require bounded storage, explicit expiry and resource limits. A duplicate valid fragment may be idempotent under policy; a conflicting fragment for the same authenticated index is an error, not an invitation to choose whichever arrived last.

Publication, service acceptance, relay acknowledgement, carrier retrieval, successful extraction, endpoint receipt, set completeness, cryptographic validation, display, open signal and human acknowledgement are distinct events. Any receipt must name the event it proves, its observer and its evidence source. No transport service can establish endpoint acceptance merely by reporting that it stored or forwarded a carrier.

**Design consequence:** preserve two parallel records: endpoint-authenticated message/set/session state, and route-specific delivery observations. The endpoints may correlate them where justified, but the route must not authoritatively create or overwrite endpoint relationships. Keep records endpoint-local by default; shared receipts or stable identifiers require separate privacy justification.


The direct prior art is substantial. Wang et al. (2024) describe a fragmented covert-communication framework in which a text file is divided into fragments, fragment number and content are embedded in image carriers, each fragment is redundantly embedded across multiple images, and the receiver reconstructs the file after collecting sufficient carriers. Importantly, the paper explicitly distinguishes steganography from watermarking and uses a robust DFT/DCT watermarking method as its carrier mechanism. Its reported recovery results are author-reported experiments, not independent validation; they do not establish endpoint-authenticated message sets, sender identity, conversation semantics, or collection-level undetectability (SRC-043). This prior art rules out broad novelty claims for multi-image fragmentation, redundant fragment carriage and subset-based reconstruction.

Ker (2007) formalises batch steganography and pooled steganalysis: an observer may combine imperfect per-carrier detector evidence across a set, so evaluating each image in isolation is insufficient. That paper analyses fixed-batch pooling strategies and includes LSB-replacement simulations under stated detector assumptions (SRC-044). Ker's follow-up proves an asymptotic square-root capacity bound under explicit assumptions: equal cover capacities, a shift-hypothesis detector response with regularity conditions, independent per-cover detection errors and a batch size known to both parties (SRC-045). The theorem is mathematically important but its bounds can be loose; it does not establish a universal law for current platform images, dependent collections, robust watermarking or sequential/longitudinal acquisition. The source itself identifies these limitations.

Wang et al. (2026; SRC-049) add a separate animated-carrier comparator: the author-linked README and inspected code describe a 16-frame pipeline with intra-frame bit repetition and inter-frame majority voting. Each frame has separate key/nonce material in the PyCryptodome path; the sender code path writes frame PNGs, and the receiver reads a fixed 16-frame PNG set plus locally stored keys and ground truth. The receiver asserts a complete 16-frame/key set, so missing-frame erasure tolerance is not established by this code path. The inspected StreamCipher uses raw ChaCha20 without an authentication tag visible in this implementation path; its fallback is a 32-bit NumPy PRNG explicitly labelled TEST ONLY. The local group ID and key files are not an authenticated message-set or recipient-discovery protocol. These are code-reading observations, not a security audit; the paper's formal security argument and complete results remain unreviewed. This is frame-level redundancy within one carrier object, not a set of separate image posts or an endpoint-authenticated fragment set. The distinction reinforces that frame count, carrier count, fragment-set size and message count are different units.

Active sanitization is also established prior art. Zhu et al. (2021; SRC-036), Wei et al. (2022; SRC-046) and Zhu et al. (2023; SRC-047) describe learned image-processing approaches intended to remove robust hidden payloads while maintaining image quality; the 2023 abstract describes Scaling-Net and SC-Net. Zhu et al. (2025; SRC-048) describe a keyed counter-adaptation in which a secret-seed-conditioned decoder is considered jointly with a sanitizing network and the sender iteratively optimises the cover. These works establish an adversarial research setting, not deployment by any named platform or a universal sanitizer/bypass result. A fair evaluation must separate routine platform transformations, active sanitizer models and adaptation to a known sanitizer, and must still require endpoint authentication after extraction.

The [multi-message linkage and steganographic carriage analysis](docs/multi-message-linkage-and-steganographic-carriage.md) records the terminology, linkage alternatives, threat model, prior-art boundary and proposed collection-level evaluation. It is a research framework, not a selected capsule format or steganographic method.

> **DEFINITION · Package encapsulation**  
> The route-facing framing of an already protected object or fragment capsule for carriage. It is distinct from endpoint authentication and does not make outer fields trustworthy.
>
> **COMPARISON · Per-carrier concealment versus set-level linkage**  
> Per-carrier concealment asks whether one image reveals embedded data. Set-level linkage asks whether several carriers or events can be grouped through identifiers, manifests, timing, provenance, embedding artefacts or retrieval patterns. One property does not establish the other.
>
> **Illustration placeholder · Thesis-F07 — Multi-message package and observer linkage**  
> **Placement:** Beside §§7.2–7.3 and cross-referenced to the W3 package diagram brief.  
> **Prompt for later illustration:** Show the endpoint-authenticated logical message and optional manifest, fragment capsules, route encapsulation, optional image steganographic embedding and multiple image carriers; separately show a conversation containing distinct messages, retries and cross-route copies. Add observer-specific projections to show which relationships are explicit, authenticated, hidden or inferable.  
> **Must not imply:** That one fragment set equals a conversation, that a carrier identifier authenticates membership, or that concealment guarantees unlinkability.
>
### 7.4 Fragmentation is not secret sharing

Ciphertext fragmentation divides transport data into pieces. It does not divide the decryption key, create threshold recovery or make each fragment independently secret. Threshold secret sharing distributes secret material under a defined threshold policy and introduces different participant, collusion, storage, authorisation and audit assumptions. The two techniques must not be conflated.

**Illustration pointer (planned):** A multipart validation figure should show a logical message, its authenticated manifest, transport pieces arriving in arbitrary order, successful set validation, and rejection paths for missing, duplicated, mixed or conflicting pieces.

## 8. Transport methods and image carriage

Transport is a substantial part of the research, but it is one subsection of the full thesis rather than the organising principle for every security question. The cryptographic message should remain meaningful independently of the route used to carry it. Route choice changes how the protected object is packaged, distributed, discovered, retrieved and validated; it must not silently change the cryptographic meaning of the message.

### 8.1 The standalone train

The "passengers" are the participant-side cryptographic topology: endpoints and the processes that establish identity/key trust, protect messages, authenticate context and validate received content. The "train" is a separate, replaceable transport element. It carries an already protected object over a low-fidelity route. It may be inspected, copied, delayed, transformed, substituted, lost or unavailable without becoming the source of participant security.

A carrier-facing encapsulation boundary packages protected material for carriage and preserves framing and route context. It can support extraction and completeness checks. It cannot, by itself, create confidentiality, sender authentication, identity assurance, anonymity or cryptographic integrity. Any security-relevant binding must be authenticated by the endpoint-controlled protocol.

### 8.2 Carriage methods as comparison profiles

Image carriage is a required route in this research. It is not presumed superior simply because it is distinctive. The evaluation should compare it with at least:
- image-carried encrypted capsules without steganographic concealment;
- image-carried encrypted capsules with optional concealment;
- encrypted file or attachment carriage; and
- a named conventional end-to-end messaging protocol/service profile, where the evidence permits; and
- a mixnet-backed messaging baseline, represented by Echomix/Katzenpost.

The current profile register distinguishes literature profiles, protocol references, service documentation and deployed evaluations. For example, the Qiao et al. platform results are a bounded published experiment rather than a current service guarantee; Signal PQXDH/Double Ratchet specifications describe protocol mechanics but not the full Signal service; Dropbox shared-link documentation supports a file-host observation profile but does not establish end-to-end message protection; and Echomix/Pigeonhole documentation must be pinned to compatible releases before any deployed comparison. These boundaries and unresolved fields are recorded in the [route-comparison framework](docs/route-comparison-framework.md) and source register (SRC-038–SRC-040). The comparison should examine confidentiality boundaries, sender authentication, identity assurance, intermediary visibility, metadata exposure, capacity, transformations, ordering, delivery semantics, retrieval, failure behaviour, usability, accessibility, deployability, operational complexity and fallback. Comparisons must avoid pretending that different services offer identical delivery guarantees or threat models. The corresponding evaluation protocol is recorded in W4's route-comparison matrix. It defines the dimensions and conditions to investigate; it does not report comparative results or assume that any profile is superior.

The initial documentary comparison is summarised below. It records what the inspected sources support, not a measured ranking of deployed services.

| Comparison profile | What the current evidence supports | What it does not yet establish |
|---|---|---|
| **Image-platform carriage** | Qiao et al. (2023; SRC-035) provide full-paper evidence that tested platform paths and sending modes can produce materially different image-carrier outcomes from simulated JPEG channels. MRAS and DRAS (SRC-033/034) target recompression robustness; current evidence is publisher-indexed and author-code inspection, not full-paper verification or reproduction. | A general platform guarantee, private recipient discovery, complete provider-side logs, endpoint identity/authentication, message-set semantics or robust performance across untested platforms and versions. |
| **File/shared-link carriage** | Official Dropbox documentation (SRC-039) provides a concrete reference for shared-link access, sharing controls and activity visibility. It is useful for examining file-host and owner/editor observations. | Anonymous retrieval, endpoint-authenticated messaging, recipient-confirmed delivery, or a complete transformation/retention profile for a pinned client and account configuration. |
| **Conventional E2E messaging** | Signal's PQXDH and Double Ratchet specifications (SRC-038) provide protocol-level references for asynchronous key establishment and ongoing message-key evolution. | The full Signal service's metadata, attachment pipeline, product-level delivery/read semantics or the behaviour of a particular app release. Protocol specifications are not a substitute for service-level evidence. |
| **Mixnet-backed messaging** | Echomix and its Pigeonhole/BACAP design provide the strongest integrated comparator in the current set for global/active observer assumptions, traffic coupling, capability-based discovery, asynchronous storage, reliability and colluding-role analysis (SRC-040 and related records). | A directly comparable deployed route or a pinned compatible release/configuration in this project. Its native guarantees and assumptions cannot simply be transferred to the proposed architecture. |

The documentary comparison currently yields no honest overall winner. Image-platform studies provide the most direct evidence about media transformation, but the least evidence about private discovery and complete messaging semantics. Signal provides mature protocol comparators, but its cited specifications do not describe the full service route. Dropbox provides a concrete shared-link reference, not an anonymous or cryptographically complete messaging design. Echomix/Pigeonhole supplies a substantially richer integrated privacy baseline, but a product-level or implementation comparison has not been performed. The comparison therefore remains asymmetric by design: each profile is assessed on the properties and evidence its sources actually cover.

#### Evidence-bounded route profiles

The profile names below make the unit of comparison explicit. They are documentary reference profiles, not claims that six interoperable deployments have been configured or tested.

| Profile | Evidence class and version/configuration boundary | Supported comparison | Material unknowns |
|---|---|---|---|
| **IMG-QIAO-2023** | Literature profile: Qiao et al. (SRC-035), 50 BOSSbase images, JPEG QF 85, stated payload 0.1; Facebook/Twitter upload-download and WeChat transfer in the published study. Exact platform app/server versions are not pinned. | The paper's tested method outcomes, extraction/recovery measures and differences between simulated JPEG and named platform paths. | Current platform behaviour, other formats/accounts/upload modes, provider logs and independent reproduction. |
| **IMG-MRAS-2026** | Partial literature profile: MRAS (SRC-033); publisher-indexed text and pinned author-linked MATLAB demo inspected. Client/platform versions are not pinned. | Reported DCT stabilisation/lattice embedding approach, extraction-error, PSNR/SSIM and classifier-error metrics, named comparators and author-reported LinkedIn evaluation. | Full methods, parameter tables, dataset split, payload values, platform procedure, limitations and reproduction. |
| **IMG-DRAS-2026** | Partial literature profile: DRAS (SRC-034); publisher-indexed text and pinned author-linked MATLAB demo inspected. Client/platform versions are not pinned. | Reported RoLoS/CARE approach, Q95-to-Q85/Q80/Q75 scenarios, PMAS comparison and author-reported WhatsApp/LinkedIn/X evaluation. | Full methods, sample sizes, payload settings, complete tables, platform procedure, limitations and reproduction. |
| **FILE-DROPBOX-LINK** | Service-documentation profile: official Dropbox shared-link/activity documentation inspected 5 November 2026; no actual account, plan, link or client configuration pinned. | Documented link permissions, download controls, file activity and owner/editor observations, including conditional viewer information. | Exact plan/settings, client version, transformation behaviour, retention, backups and observed workflow. |
| **E2E-SIGNAL-PROTOCOL** | Protocol-reference profile: PQXDH revision 3 and Double Ratchet revision 4, 1:1 asynchronous protocol scope; not a Signal app deployment. | Published key-establishment, identity-key/signed-prekey, ratchet and skipped-message semantics. | Signal client/service versions, server metadata, delivery receipts, attachment path, backups, multi-device and retention behaviour. |
| **MIX-ECHOMIX-PIGEONHOLE** | Integrated literature/specification profile: Echomix arXiv v2 plus current public Katzenpost/Pigeonhole documentation; no compatible release set or deployment configuration pinned. | Published mix topology, BACAP/Pigeonhole capability semantics, courier/replica roles, asynchronous storage and stated observer/collusion model. | Compatible release tags, client, directory/deployment configuration, retention, underlying network and independently reproduced operation. |

A profile may be promoted from literature or documentation reference to a service profile only when the product/client release, relevant account and privacy settings, route configuration and service-side lifecycle evidence are pinned. A deployed-evaluation claim additionally requires a declared, permitted test setup and captured observations. None of the six profiles currently meets that latter threshold. Their evidence classes must not be normalised into one confidence score or treated as if they observe the same layer.

### 8.3 Image carrier and optional concealment

An image is a carrier, not a key, identity credential or guaranteed entropy source. Image processing belongs in a route-specific adapter that does not own cryptographic secrets. Optional steganography attempts to make embedded material less apparent. It is a separate sub-layer and must be evaluated against detection and transformation; it does not encrypt, authenticate or hide all transfer metadata.

Platforms may resize, recompress, transcode, strip metadata, moderate or otherwise transform media. Image-carriage analysis must also distinguish per-image extraction from set reconstruction and collection-level detection: multiple images can provide redundancy for recovery while also giving an observer more evidence to pool or correlate. Ker's batch-steganalysis work (SRC-044) establishes this as a distinct analytical problem under bounded assumptions; it does not supply universal quantitative predictions for current platforms. The research must define the tested image formats, payload capacity assumptions, transformation profiles and extraction failure behaviour. A route that only works when a platform preserves exact bytes may be unsuitable for that platform, even if a controlled laboratory demonstration succeeds.

### 8.4 Distribution, discovery and collection

Transport is not complete when a carrier is published. The intended recipient must discover where the relevant carrier is available, retrieve it, determine whether it is the correct carriage instance, extract the protected object and pass that object to endpoint validation.

These stages are coupled. A changing or randomised placement may reduce simple correlation with a predictable publication location, but the recipient needs a way to discover it. For a multi-carrier message, discovery must also identify which carriers belong to the same fragment set without unnecessarily exposing that relationship to hosts, platforms or network observers. The Wang et al. (2024) framework (SRC-043) demonstrates explicit fragment numbering and redundant image carriage; those same mechanisms make set reconstruction possible and create questions about identifier visibility, repeated signals and observer linkage. A stable locator or rendezvous point may reintroduce linkability. A highly variable discovery process may increase loss, delay, confusion or usability burden. The design must examine both sides rather than treating random placement as an unqualified privacy improvement.

The recipient-discovery problem is therefore a central open question for the transport route: what information must be shared, through which channel, under what authentication and privacy assumptions, and what can an observer infer from publication and retrieval? Tor's v3 onion-service design illustrates that rendezvous is explicit protocol machinery involving descriptors, introduction and rendezvous points, and defined cryptographic values; it is a comparator for the problem, not a mechanism whose anonymity properties can simply be transferred to this proposal (Tor Project, n.d.).

The related-work boundary is wider than single-recipient OMR. Liu, Tromer and Wang's *Group Oblivious Message Retrieval* formalises retrieval for ad-hoc and fixed recipient groups, including group privacy, detection-key unlinkability and denial-of-service properties. It still assumes suitably protected application payloads and leaves authenticated contact/key distribution and privacy-preserving board publication outside its scope. Ravi, Shukla and Vadapalli's *Remise* adds a two-server DORAM model for anonymous bulletin-board publication and authorised communication channels, including access-pattern hiding, cover traffic and revocable reader permissions. Its privacy depends on non-colluding servers, its integrity model assumes protocol-following servers, and read-token distribution is out of band. These systems materially narrow any generic claim to novel recipient privacy, anonymous publication, group retrieval or private access control. Their models do not, however, provide the proposed image-carrier transformation and forensic analysis, social-platform observation model, or endpoint capsule-decapsulation account. The [observer/property matrix](docs/observer-property-matrix.md) compares these systems across the complete lifecycle and records the precise inspection boundaries.

A further comparator makes the retrieval problem more concrete. Liu and Tromer (2022) formalise *oblivious message retrieval* for a bulletin-board setting: a recipient needs to identify and obtain messages intended for them without exposing message pertinence to the retrieval service. Their discussion shows why a long-lived detection key or a second, directly identifying retrieval query can recreate the very metadata exposure that content encryption leaves unresolved. This is not a drop-in design for image hosting. It is evidence that recipient discovery is a distinct privacy protocol problem with non-trivial computation, communication and denial-of-service trade-offs. OMR-family follow-on work makes the cost space more differentiated: PerfOMR improves communication/computation trade-offs, SophOMR applies SIMD-aware homomorphic compression, and InstantOMR targets low latency and parallelisability (Liu et al., 2024; Lee & Yeo, 2026; Liang et al., 2026). Oblivious Signaling adopts a different cost placement: senders update encrypted recipient inboxes uniformly, reducing retrieval-time scanning while increasing sender/server work and retaining stated timing and external-channel limitations (Shuhan et al., 2026). These are not interchangeable designs, and their assumptions, correctness models and leakage must be compared separately. The thesis should therefore compare, rather than prematurely select, at least four broad approaches: recipient-side scanning of a shared public feed; a stable locator or rendezvous service; short-lived or one-use retrieval capabilities distributed through a separately authenticated channel; and cryptographic private/oblivious retrieval. Each approach must be assessed for what the publisher, locator service, retrieval service, network observer and colluding observers can learn. A one-use capability may reduce repeated identifier reuse, but it does not hide the act or timing of retrieval from the service that receives the request.

### 8.5 Unique envelopes and bounded transport unlinkability

The transport may use a distinct, non-reused image carrier object for each carriage instance and vary where that object is placed for collection. Here, "unique" means non-reuse under a carriage policy; it does not mean cryptographic uniqueness, secret entropy, randomness, unpredictability or guaranteed unlinkability. This may reduce reuse-based correlation or fixed-location inference, but it addresses only a narrow carrier-level observation.

Traffic-analysis research demonstrates that encryption alone does not remove observable timing, size, flow and endpoint metadata. Bozorgi et al. (2023) evaluated timing- and size-based inference against encrypted instant-messaging traffic. Li (2026) examined pairwise metadata correlation in three instant-messaging call services under a specific ISP-level observer model. These studies support the need to model network-visible metadata, but they do not directly evaluate this project's image-carriage route. Li's experiment used two smartphones, three applications and 180 controlled call trials; its results should not be generalised to ordinary text messages, all platforms or other network conditions.

Mix-network research offers a more demanding comparison. Loopix uses Poisson mixing and cover traffic to resist traffic analysis under its stated adversary model, with deliberate delays and additional traffic as part of the design (Piotrowska et al., 2017). A low-fidelity train that varies image carriers or placement is not equivalent to a mix network. The current proposal does not specify cover traffic, network-level mixing or an anonymity service, and must not claim their properties.

The evaluation must distinguish:
- **uniqueness:** whether the same carrier object is reused;
- **randomness:** whether values are sampled from a defined random process;
- **unpredictability:** whether an observer can feasibly predict the next carrier or placement;
- **unlinkability:** whether an observer can connect two events under a specified observation model; and
- **anonymity:** whether an observer can identify a participant within a defined anonymity set.

These are different claims and require different evidence. A unique image may still have a recognisable generation style, similar dimensions, a repeated visual theme or a correlated timestamp. Placement may vary while retrieval timing remains highly predictable.

### 8.6 Metadata minimisation and its limits

Metadata minimisation is a baseline requirement for image carriage. The carrier-processing path should remove unnecessary embedded metadata, including avoidable EXIF, IPTC and XMP fields, and avoid identifying filenames, descriptive properties, thumbnails or other unnecessary file-level identifiers. Relevant metadata schemas are documented by CIPA's Exif specifications, the IPTC Photo Metadata Standard and Adobe's XMP specifications (CIPA, 2026; IPTC, 2025; Adobe, n.d.). The design should define an allowlist of fields demonstrably required for safe extraction, compatibility or handling, then verify the actual output rather than assuming removal succeeded.

The allowlist must not be interpreted as a crude instruction to erase every non-pixel byte. Image containers also carry structural and rendering information, while platform processing can alter dimensions, compression, quantisation and other signal-level characteristics. Pasquini, Amerini and Boato (2021) survey how resizing, recompression and platform-specific processing affect both forensic analysis and platform-provenance inference. The research should distinguish (1) descriptive or identifying metadata such as EXIF, IPTC and XMP properties; (2) structural/decoder information required by the selected format and carrier method; (3) optional rendering information whose removal may change appearance or compatibility; and (4) signal-level or codec traces that may remain observable even after descriptive metadata is stripped. Unknown descriptive fields should not be preserved by default, but format structures must be validated rather than blindly deleted. The final allowlist is route- and format-specific and remains unselected until the carrier encoding method and tested platforms are fixed.

Removing embedded metadata does not erase network identifiers, hosting-provider logs, access records, externally observed timestamps, traffic volume, file-size observations, platform-generated metadata or copies already retained by third parties. These require separate controls and remain possible observations. Stripping metadata may also affect compatibility or legitimate handling; the allowlist and transformation tests must make that trade-off explicit.

### 8.7 Human behavioural linkability and social engineering

Technical randomisation does not make human behaviour random. Repeated publication and retrieval schedules, predictable response intervals, habitual platform or device choices, language, phrasing, formatting, message length, image-generation style and reactions to familiar prompts may correlate exchanges even when each carrier is unique.

An adversary may probe those patterns through false delivery notices, urgency cues, staged extraction failures, timed contact, impersonation or prompts designed to elicit a predictable response. These are behavioural side channels and social-engineering threats, not failures of encryption itself. Research on encrypted messaging traffic shows that observable timing, message sizes and user-action scenarios can carry behavioural signatures (Bozorgi et al., 2023; Li, 2026). Steinmetz, Pimentel and Goe (2021) provide bounded qualitative support for treating deception as situated social activity: interviews with 37 social engineers identified planning, timing, rapport, network familiarity, authenticity and adaptation to a target's reactions as recurring themes. This is evidence about perpetrators' reported practices, not a quantitative measure of recipient susceptibility or a universal model. That evidence does not yet substantiate every interpersonal example listed here: language, phrasing, image-generation style and social-engineering probes remain unverified threat scenarios requiring dedicated usable-security and human-factors sources. The architecture should minimise unnecessary behavioural disclosure and avoid placing the entire mitigation burden on user vigilance. Privacy must not depend on unsafe, deceptive, exhausting or inaccessible behavioural camouflage.

Recent work directly addresses image payload survival on social platforms. MRAS (Kumar et al., 2026) studies JPEG steganography under social-network recompression and its publisher abstract reports LinkedIn testing; DRAS (Kumar et al., 2026) addresses downward recompression and its publisher highlights report tests on WhatsApp, LinkedIn and X. The publisher-indexed MRAS text describes DCT-coefficient stabilisation, lattice-based adaptive embedding and post-processing, with BOSSbase payload/recompression evaluation, extraction-error, PSNR/SSIM and steganalysis-classification metrics, plus LinkedIn testing. The publisher-indexed DRAS text describes RoLoS coefficient selection and CARE predictive channel modelling, Q95-to-Q85/Q80/Q75 scenarios, PMAS comparison and author-reported extraction-error/runtime improvements, with WhatsApp, LinkedIn and X tests. Direct full-text access was blocked or incomplete, so exact methods, data/payload settings, tables, platform configurations and limitations remain unverified; all platform and performance claims are attributed to the authors, not independently validated here. The authors' public MATLAB repositories are now additionally inspected at pinned commits (recorded in SRC-033/034): their exposed MRAS/DRAS routines are per-image embedding/extraction operations, and their ten-cover demo scripts simulate JPEG recompression locally with `imwrite`. Each demo call loads a sample-message prefix; the inspected code does not expose cross-image fragment-set manifests, set reconstruction or conversation/session linkage. This is code-level evidence about the published demo repositories only. It does not reproduce or negate the papers' separately reported LinkedIn/WhatsApp/X tests, and no code was executed.  Qiao et al. (2023) provide a full-text comparative study of robust methods under simulated and real social-network channels. Active sanitization is addressed by Zhu et al. (2021; SRC-036), Wei et al. (2022; SRC-046) and Zhu et al. (2023; SRC-047); the available indexed evidence describes attack/optimisation networks, image fusion/latent renewal and scaling-aware Scaling-Net/SC-Net paths. Zhu et al. (2025; SRC-048) describe a keyed counter-adaptation to a known sanitizer. Full methods/results remain incomplete for these sources, and none establishes deployment by a named platform or universal success. A 2024 ACM Computing Surveys review surveys a broad body of image-steganography and steganalysis work. Wang et al. (2026; SRC-049) describe cross-frame majority-vote redundancy in one animated GIF; this must not be conflated with separate-image fragmentation or conversation linkage. These sources make clear that image payload robustness, concealment and platform survival are established research topics, not a gap this thesis can claim by themselves. The route study must distinguish extraction reliability, steganalysis detectability, endpoint authenticity/integrity, discovery privacy, platform/network observer leakage and operational cost. A successful extraction is not evidence of anonymity or authenticated delivery; a failed extraction does not establish deliberate payload removal.

### 8.8 Transport evaluation

A meaningful route comparison records the observer model, route assumptions, payload capacity, transformations, metadata, publication and retrieval behaviour, timing, ordering, failure modes, user effort and operational dependencies. The comparison includes Echomix/Katzenpost as an integrated messaging baseline, not merely a network transport. Its global/active observer assumptions, traffic coupling, capability-derived discovery, courier/replica responsibilities, reliability signalling, human-routine leakage and operational costs must be compared on their native terms. A carrier-rotation-only baseline is distinct from any design that adds padding, cover traffic or network mixing; those mechanisms introduce different costs and assumptions.

The current documentary evidence can be summarised across the lifecycle as follows. The table is deliberately asymmetric: a protocol specification, service help page and image-steganography paper do not expose the same events. “Not specified” means the cited evidence does not establish the behaviour, not that the behaviour is absent.

| Lifecycle / observer question | Image-platform literature profiles | Dropbox shared-link profile | Signal protocol reference | Echomix/Pigeonhole profile |
|---|---|---|---|---|
| **Identity and session preparation** | The image-carriage studies define embedding and recovery experiments, not authenticated participant identity or a messaging session. | Link permissions govern file access; they do not prove the intended human recipient's cryptographic identity. Any protected capsule needs a separate endpoint protocol. | PQXDH uses identity keys and signed prekeys; a fingerprint/QR verification ceremony is a separate participant process. Revision 3 does not provide post-quantum mutual authentication. | BACAP capabilities distinguish read/write authority; secure capability distribution is a separate boundary. Mix-network client/service identity follows the comparator's own model. |
| **Publication / send** | Qiao's paper reports uploads/transfers through named platforms under its study conditions. MRAS/DRAS indexed claims name platform tests, but their inspected public demos use local JPEG recompression and per-image operations, not live platform APIs or a cross-image set protocol. | Sender stores a file and distributes a shared link. Dropbox documents file and sharing activity; exact account, plan and link configuration remain unpinned. | PQXDH/Double Ratchet specifications do not describe the complete Signal service send path, server logs or attachment storage. | Clients use mix-network paths to services/couriers; Pigeonhole operations are mediated by couriers and storage replicas. Deployed topology remains unpinned. |
| **Discovery and retrieval** | The published image experiments demonstrate carriage/recovery, not private recipient discovery or a complete provider-side access-log model. | Recipient obtains a URL or invitation; link possession and access controls do not make retrieval anonymous. Host activity and optional viewer information may expose access events. | Server-side addressing, product discovery and retrieval records are outside the cited protocol specifications. | Read capabilities and starting/index information are distributed out of band; couriers and replicas mediate requests. Network and role observers see different projections. |
| **Transformation** | Qiao shows that simulated JPEG channels do not stand in for its tested platform paths; outcomes vary by platform/mode. MRAS/DRAS target recompression, but their complete methods and platform configurations remain partially reviewed. | The inspected help documentation does not establish file-content transformation for a pinned workflow; preview/download/version behaviour requires service-specific evidence. | Attachment processing is outside PQXDH and Double Ratchet. | Fixed-size padded boxes and protocol framing are native Pigeonhole semantics; image transformation is not the corresponding carrier question. |
| **Validation, fragment membership and reconstruction** | Extraction success does not establish sender authentication, freshness, recipient binding or authenticated set completeness. SRC-043 demonstrates numbered fragments and redundant multi-image reconstruction through robust watermarking, not this thesis's endpoint-authenticated set semantics. | Download/access does not prove file authenticity or completeness; an endpoint wrapper and authenticated manifest would be additional design elements. | Ratchet decryption and protocol state provide cryptographic checks within the specified protocol, but do not specify arbitrary image-carried fragment manifests. | Pigeonhole has native capability and box semantics. These must not be assumed wire-compatible with the proposed capsule or its fragment-set model. |
| **Retry, ordering and continuity** | The cited image studies measure carrier transmission/extraction, not application retries, duplicate acceptance or conversation continuity. | The cited link/activity documentation does not define application-level retry, ordering or conversation semantics. | Double Ratchet's skipped-message handling is protocol state, not a general service delivery/retry guarantee or proof that a message was read. | Asynchronous storage, acknowledgements and backfill are part of the comparator's reliability design; exact observer correlation depends on courier/replica/network roles and configuration. |
| **Expiry, deletion and retention** | Not established by the reviewed image-steganography experiments. | The cited help material does not establish universal retention or secure deletion; version history, recipient saves and copies require separate investigation. | Retention, backups and deletion are not fully specified by the cited protocol documents. | Pigeonhole describes ephemeral storage, but deployed retention and garbage collection must be pinned to a compatible release/configuration. |
| **Observer visibility** | Platforms process uploaded/transmitted media and may associate account, timing and interaction data; the cited studies do not provide a complete provider-log or global-observer model. | Owners/editors may see documented activity and, under conditions, viewer information. Network and human correlation remain outside the help-page scope. | The protocol references do not characterise all application, device, network or human observations. | Gateways/nodes, couriers and replicas have role-specific views; global observers, traffic coupling, contact activity windows and collusion are explicit parts of the Echomix analysis. |

#### What is decision-relevant about image carriage?

The present evidence establishes a distinctive *research burden*, not a demonstrated system advantage. Qiao et al. show that tested social-platform paths and sending modes can differ materially from simulated JPEG channels. That makes platform-specific transformation testing necessary; it does not show that image carriage is more private, reliable or deliverable than file hosting or an integrated asynchronous messaging system. SRC-043 already demonstrates multi-image fragmentation, numbered fragments, redundant carriage and reconstruction using robust watermarking, so those mechanisms cannot be claimed as new contributions. Ker's batch-steganalysis work (SRC-044–SRC-045) further means that adding carriers can improve recovery while increasing the observer's collection and correlation surface.

Against the current integrated baseline, Echomix/Pigeonhole already supplies native asynchronous storage, capability-based access and a substantially richer observer/collusion analysis. The available documentary evidence does not show that image carriage improves those properties. Its decision relevance therefore remains conditional: it would need to provide a measurable benefit in a defined use case (for example, route availability, reachability or user accessibility) that outweighs transformation fragility, collection-level detection, discovery burden, metadata exposure, latency, storage and user effort. Those benefits and costs have not been measured here. Image carriage remains a required comparison subject, not a preferred route or a presumed runtime component.

The next defensible comparison is not a universal route score. It is a claim-by-claim account of which route meets a stated requirement, for which observer, under which version/configuration and with what evidence. Where a service profile is not pinned, its service-level result remains unknown. A protocol reference cannot fill that gap, and missing documentation cannot be interpreted as a privacy guarantee.

**Illustration pointer (planned):** A transport-method comparison figure should show the same already protected object passing through distinct route profiles, with route-specific packaging, publication, discovery, collection and extraction. It should make clear that endpoint cryptographic validation remains common to every route.

**Illustration pointer (planned):** A discovery-and-observation figure should show the coupled publication/discovery/retrieval process and the observations available to a platform, host, network observer and behavioural adversary. It must not imply that variable placement guarantees anonymity.

## 9. Lifecycle, expiry, revocation and recovery

### 9.1 Lifecycle semantics

A communication system needs explicit rules for session creation, key rotation, device replacement, compromise response, expiry, revocation and recovery. General key-management guidance treats key lifecycle and key protection as distinct design responsibilities (NIST, 2020). The applicable NIST guidance is itself evolving: Revision 6 was available as an initial public draft in the source check, so the final edition and status must be rechecked before publication. These policies must be authenticated and consistently interpreted. The system must define clock assumptions, offline-device behaviour, revocation propagation, local versus service-side enforcement and the consequences of stale state.

Expiry and revocation may restrict future sessions, future access or acceptance of messages under defined policy. They cannot reliably retrieve plaintext, screenshots, copied ciphertext, keys or other material already obtained. Claims of remote deletion or retroactive erasure would be misleading.

### 9.2 Recovery as a separate design choice

Recovery is not a default property of encryption or fragmentation. If threshold-controlled recovery is considered, the design must state what secret is divided, the threshold and participant count, how participants are authenticated, how shares are protected, who authorises reconstruction, what collusion is tolerated, how lost or compromised shares are handled, what is logged, and how recovery interacts with rotation and revocation.

The project has not decided whether threshold recovery belongs in scope. The choice should be justified against actual use cases and compared with simpler alternatives such as endpoint backups, device migration or re-establishing sessions. Recovery may reduce lockout risk while creating additional trusted actors and new attack surfaces.

**Illustration pointer (planned):** A lifecycle figure should distinguish normal session/key progression, expiry, revocation, device loss and optional recovery, with explicit boundaries around what cannot be recalled after plaintext or keys have been obtained.

## 10. Risks, evaluation and falsifiability

### 10.1 Evaluation principle

Evaluation must be capable of showing that a proposed design is ineffective, too costly, fragile or no better than a simpler alternative. It should not merely demonstrate that a chosen mechanism can work under favourable conditions. Each claim should be linked to a threat, a test method, an observable outcome and a stated limitation.

### 10.2 Evaluation domains

| Domain | Questions and candidate tests |
|---|---|
| Identity and key binding | Can first-contact substitution, key change and device replacement be detected and handled safely? |
| Cryptographic composition | Are key confirmation, context binding, nonce rules, key separation and sender authentication specified and reviewed? |
| Envelope and parsing | Are malformed, oversized, downgraded or ambiguous inputs rejected safely, within explicit byte, count, memory, disk, CPU, decompression and lifetime budgets? |
| Multipart validation | Are missing, duplicate, reordered, mixed, substituted, altered and replayed pieces handled correctly? |
| Intermediary authority | Can an intermediary obtain plaintext or sole decryption authority? What can it still observe or disrupt? |
| Image route | What capacity and extraction success remain after defined resizing, recompression, transcoding and moderation? |
| Concealment | Under which detection methods and transformations is concealment detectable or destroyed? |
| Metadata | Which fields are removed, retained or recreated, and what records remain outside the file? |
| Discovery and collection | What stable rendezvous, locator, timing or access-pattern information is exposed, and how do full-scan, locator/capability and oblivious-retrieval approaches compare? |
| Behavioural privacy | Which repeated human or platform patterns permit correlation, and what mitigations are realistic? |
| Lifecycle | What happens across expiry, revocation, offline devices, key changes and compromised endpoints? |
| Recovery | What are the collusion, authorisation, availability and share-compromise consequences? |
| Usability and accessibility | Can intended users understand verification, retrieval and failure states without unreasonable effort? |
| Operational safety | Do logs, crash reports, temporary files, caches and backups expose secrets or sensitive metadata? |

### 10.3 Comparative baselines

Image carriage should be compared against encrypted file/attachment carriage and conventional end-to-end messaging where the use case and assumptions permit a fair comparison. Concealment should be evaluated both enabled and disabled. The comparison must include the cost of extra components and user actions, not only the security property each route hopes to improve.

A route that adds complexity without measurable benefit may not justify its place in a practical system. Conversely, a route may remain a legitimate research contribution even if it is not the most deployable option, provided the thesis explains what it teaches and does not claim unsupported superiority.

### 10.4 Evidence maturity

The current work contains conceptual analysis and proposed evaluation criteria. It does not yet contain a complete protocol, implementation measurements, a formal model, a steganalysis study or an independent audit. Numerical thresholds, platform profiles, reproducible test fixtures and formal methods remain to be selected. Passing a test supports only the conditions actually tested.

### 10.5 Confidence and claim-evidence evaluation

The evaluation must test whether the architecture reports what its evidence actually establishes. For each material claim, an evaluator should be able to identify its scope, verifier, evidence provenance, mechanism, assumptions, threat model, freshness, alternatives and unresolved gaps. Evaluation should include:

- distinguish cryptographic validity from identity binding and semantic truth;
- distinguish individual-object validity, authenticated fragment membership, set completeness, reconstruction and conversation continuity;
- distinguish endpoint-authenticated linkage from observer-inferred correlation;
- distinguish service acceptance, relay, endpoint receipt, validation, decryption, display, open signal and human acknowledgement;
- represent missing, stale, revoked, contradictory and unavailable evidence without converting absence into success;
- test whether different observers receive only the evidence appropriate to their role;
- test whether evidence records create stable identifiers, access patterns or unnecessary behavioural telemetry; and
- examine whether users and reviewers interpret status labels and evidence limitations correctly.

A single numeric confidence score is not proposed. Any future quantitative model would need a defined proposition, calibration data, error costs, population, dependence assumptions and uncertainty bounds. Without those elements, a score would imply precision that the evidence cannot support. The current model is conceptual and has not been tested with users or independent evaluators.

**Illustration pointer (planned):** A claim-to-evidence traceability figure should connect research questions, security objectives, threats, architectural responsibilities, proposed tests and evidence maturity. It should visually distinguish proposed requirements from demonstrated results.

## 11. Discussion, limitations and unresolved reasoning

The architecture's strongest design objective is separation of responsibility: endpoints retain cryptographic authority, while the transport carries material without being trusted to interpret or decrypt it. This is conceptually useful, but separation alone does not prove correct protocol composition, trustworthy identity binding, safe endpoint behaviour or robust delivery.

The initial documentary route comparison does not support a single overall ranking. Image-platform studies provide direct but bounded evidence about media transformation and extraction; Dropbox documentation provides a file-host/shared-link observation reference; Signal specifications provide protocol-level key-establishment and ratcheting comparators without describing the complete service route; and Echomix/Pigeonhole supplies a richer integrated privacy and asynchronous-storage baseline whose deployment has not been reproduced here. These sources cover different layers and use different threat models. The comparison must therefore be evidence-asymmetric: it should compare like claims where possible, preserve route-native semantics, and mark a property as unknown when the inspected source does not establish it. Missing documentation is not proof that a service lacks a property, just as a protocol specification is not proof of deployed product behaviour.

The image route gives the project a distinctive and necessary research subject. Its value must be assessed against realistic alternatives. The research must not defend image carriage simply because it was the original inspiration. Equally, it should not discard the route before examining its properties, limitations and possible use cases. The correct conclusion may be conditional: useful in some environments, fragile in others, or valuable as a comparative study rather than a universal transport.

The transport privacy proposal is similarly conditional. Unique image envelopes, variable placement and metadata minimisation may reduce selected forms of correlation. Recipient discovery may reintroduce a stable signal; hosting and network records may expose independent information; human behaviour may remain recognisable. These are not peripheral caveats. They determine whether the proposed privacy contribution exists under a stated observer model.

The research scope is broad. Identity, cryptographic protocol composition, carrier engineering, steganalysis, distributed retrieval, privacy, usability and recovery could each become a substantial study. The thesis must keep a coherent central question and avoid claiming to solve every adjacent problem. Some matters may be bounded as assumptions, comparison dimensions or future work, provided their impact on the central proposition is made explicit.

The term "anonymous agreement" remains unresolved. It must be defined by the property sought, the adversary, the participants and the information each party or observer may learn. Until then it cannot responsibly be assigned a cryptographic mechanism or used as a security claim.

Other open questions include the identity-assurance level; exact authenticated key-establishment protocol; key-change and device-recovery ceremony; sender-authentication composition; canonical envelope and manifest format; replay-state model; message and capsule limits; image formats and transformations; metadata allowlist; recipient discovery and rendezvous; observer collusion; the meaning and measurable scope of transport unlinkability; whether concealment adds sufficient value; whether threshold recovery belongs in scope; and the evaluation thresholds needed to support any stronger conclusion.

## 12. Conclusion

The Invisible Postman is a research investigation into endpoint-controlled cryptographic messaging whose protected messages may travel through untrusted intermediaries and image-based carriage. Its central concern is not whether an image can hide bytes. It is whether a complete communication architecture can separate cryptographic authority from transport, make its assumptions visible, and withstand critical examination across identity, message protection, carriage, collection, lifecycle and human interaction.

Image carriage remains a required research route, but it does not define every layer of the system. The thesis must explain why the route is being examined, what it changes, how it compares with alternatives and where it fails. The transport element remains replaceable and subordinate to endpoint cryptographic authority. Its discovery and collection processes deserve explicit study because publication alone does not complete delivery and because retrieval can itself expose relationships.

The work advances only when claims become clearer, assumptions are tested, alternatives are fairly considered and weaknesses remain visible. The provisional contribution is therefore the disciplined separation of endpoint-protected semantics from route-specific carriage, combined with a comparison method that makes observer evidence and lifecycle claims explicit. Whether that combination yields a defensible original contribution remains unresolved, particularly against integrated systems such as Echomix and established work on private retrieval, covert messaging and multi-image carriage. The next substantive work is to complete source and route evidence, challenge the comparison against named and versioned profiles, and revise the argument where the evidence requires it. Only after that synthesis should the thesis settle its final contribution statement and explanatory illustrations.

## References · Working bibliography

The following sources are cited in the current working text. This list is provisional; the [research source register](docs/source-register.md) records source scope, status, limitations and outstanding review.

- Adobe. (n.d.). *XMP Specifications*. https://developer.adobe.com/xmp/docs/xmp-specifications/
- Dropbox. (2026, November 5). *How to view file activity in Dropbox*. https://help.dropbox.com/organize/file-activity
- Dropbox. (n.d.). *How to set shared link permissions*. https://help.dropbox.com/share/set-link-permissions
- Barnes, R., Beurdouche, B., Robert, R., Millican, J., Omara, E., & Cohn-Gordon, K. (2023). *The Messaging Layer Security (MLS) Protocol* (RFC 9420). IETF. https://www.rfc-editor.org/rfc/rfc9420
- Biryukov, A., Dinu, D., Khovratovich, D., & Josefsson, S. (2021). *Argon2 Memory-Hard Function for Password Hashing and Proof-of-Work Applications* (RFC 9106). IRTF. https://www.rfc-editor.org/rfc/rfc9106
- Bozorgi, A., Bahramali, A., Rezaei, F., Ghafari, A., Houmansadr, A., Soltani, R., Goeckel, D., & Towsley, D. (2023). I Still Know What You Did Last Summer: Inferring Sensitive User Activities on Messaging Applications Through Traffic Analysis. *IEEE Transactions on Dependable and Secure Computing, 20*(5), 4135–4153. https://doi.org/10.1109/TDSC.2022.3218191
- Camera & Imaging Products Association. (2026). *CIPA DC-008-Translation-2026: Exif Version 3.1; CIPA DC-010-2026: Exif metadata for XMP*. https://www.cipa.jp/e/std/std-sec.html
- IPTC Photo Metadata Working Group. (2025). *IPTC Photo Metadata Standard 2025.1*. https://www.iptc.org/std/photometadata/specification/IPTC-PhotoMetadata-2025.1.html
- Josefsson, S., & Liusvaara, I. (2017). *Edwards-Curve Digital Signature Algorithm (EdDSA)* (RFC 8032). IRTF. https://www.rfc-editor.org/rfc/rfc8032
- Krawczyk, H., & Eronen, P. (2010). *HMAC-based Extract-and-Expand Key Derivation Function (HKDF)* (RFC 5869). IETF. https://www.rfc-editor.org/rfc/rfc5869
- Wang, P., Zhong, H., Feng, Y., Gong, L., Tang, Y., Lu, Z.-M., & Wang, L. (2024). Covert Communication through Robust Fragment Hiding in a Large Number of Images. *Sensors*, 24(2), 627. https://doi.org/10.3390/s24020627
- Ker, A. D. (2007). Batch Steganography and Pooled Steganalysis. In *Information Hiding* (Lecture Notes in Computer Science, Vol. 4437, pp. 265–281). Springer. https://doi.org/10.1007/978-3-540-74124-4_18
- Ker, A. D. (2007). A Capacity Result for Batch Steganography. *IEEE Signal Processing Letters*, 14(8), 525–528. https://doi.org/10.1109/LSP.2006.891319
- Barnes, R., Bhargavan, K., Lipp, B., & Wood, C. (2022). *Hybrid Public Key Encryption* (RFC 9180). IETF. https://www.rfc-editor.org/rfc/rfc9180
- Kret, E., & Schmidt, R. (2023; updated 2024). *The PQXDH Key Agreement Protocol* (Revision 3). Signal. https://signal.org/docs/specifications/pqxdh/
- Langley, A., Hamburg, M., & Turner, S. (2016). *Elliptic Curves for Security* (RFC 7748). IETF. https://www.rfc-editor.org/rfc/rfc7748
- Li, C.-Y. (2026). Identity Leakage in Encrypted IM Call Services: An Empirical Study of Metadata Correlation. *Future Internet, 18*(1), Article 12. https://doi.org/10.3390/fi18010012
- libsodium. (n.d.). *ChaCha20-Poly1305 and XChaCha20-Poly1305 documentation*. https://doc.libsodium.org/secret-key_cryptography/aead/chacha20-poly1305
- National Institute of Standards and Technology. (2020). *Recommendation for Key Management: Part 1 – General* (SP 800-57 Part 1 Rev. 5). https://csrc.nist.gov/pubs/sp/800/57/pt1/r5/final
- Nir, Y., & Langley, A. (2018). *ChaCha20 and Poly1305 for IETF Protocols* (RFC 8439). IETF. https://www.rfc-editor.org/rfc/rfc8439
- Perrin, T. (Ed.). (2025). *The Double Ratchet Algorithm* (Revision 4). Signal. https://signal.org/docs/specifications/doubleratchet/
- Pasquini, C., Amerini, I., & Boato, G. (2021). Media forensics on social media platforms: a survey. *EURASIP Journal on Information Security, 2021*, Article 4. https://doi.org/10.1186/s13635-021-00117-2
- Piotrowska, A. M., Hayes, J., Elahi, T., Meiser, S., & Danezis, G. (2017). The Loopix Anonymity System. In *Proceedings of the 26th USENIX Security Symposium* (pp. 1199–1216). USENIX Association. https://www.usenix.org/conference/usenixsecurity17/technical-sessions/presentation/piotrowska
- Steinmetz, K. F., Pimentel, A., & Goe, W. R. (2021). Performing social engineering: A qualitative study of information security deceptions. *Computers in Human Behavior, 124*, Article 106930. https://doi.org/10.1016/j.chb.2021.106930
- Tor Project. (n.d.). *Tor Rendezvous Specification – Version 3*. https://spec.torproject.org/rend-spec/rendezvous-protocol.html
- Liu, Z., Tromer, E., & Wang, Y. (2024). Group Oblivious Message Retrieval. In *Proceedings of the 45th IEEE Symposium on Security and Privacy* (pp. 4367–4385). https://doi.org/10.1109/SP54263.2024.00115
- Ravi, R., Shukla, P., & Vadapalli, A. (2026). *Remise: Authorized Anonymous Communication Systems*. In *Proceedings of the 35th USENIX Security Symposium* (pp. 3199–3218). USENIX Association. https://www.usenix.org/conference/usenixsecurity26/presentation/ravi-rohan
- Kumar, R., Bansal, S., & Bansal, R. K. (2026). MRAS: a matching robust adaptive steganography scheme for JPEG images over social networking platforms. *Signal Processing*, article 110172. https://doi.org/10.1016/j.sigpro.2025.110172
- Kumar, R., Bansal, S., & Bansal, R. K. (2026). Dealing with downward recompression for robust steganography in high quality JPEG images. *Journal of Visual Communication and Image Representation*, 118, 104817. https://doi.org/10.1016/j.jvcir.2026.104817
- Qiao, T., Xu, S., Wang, S., Wu, X., Liu, B., Zheng, N., Xu, M., & Pan, B. (2023). Robust steganography in practical communication: a comparative study. *EURASIP Journal on Image and Video Processing*, 2023, 15. https://doi.org/10.1186/s13640-023-00615-y
- Zhu, Z., Li, S., Qian, Z., & Zhang, X. (2021). Destroying robust steganography in online social networks. *Information Sciences*, 581, 605–619. https://doi.org/10.1016/j.ins.2021.10.023
- Wei, P., Zhu, Z., Luo, G., Qian, Z., & Zhang, X. (2022). Breaking robust data hiding in online social networks. *IEEE Signal Processing Letters*, 29, 2682–2686. https://doi.org/10.1109/LSP.2022.3233539
- Zhu, Z., Wei, P., Qian, Z., Li, S., & Zhang, X. (2023). Image sanitization in online social networks: A general framework for breaking robust information hiding. *IEEE Transactions on Circuits and Systems for Video Technology*, 33(6), 3017–3029. https://doi.org/10.1109/TCSVT.2022.3224243
- Zhu, Z., Ba, Z., Li, G., Qian, Z., & Zhang, X. (2025). Covert communication in sanitized online social networks. *2025 IEEE International Workshop on Information Forensics and Security*, 144–149. https://doi.org/10.1109/WIFS66636.2025.00033
- Wang, H., Sun, L., Zhu, Z., Jiang, Q., Zhang, X., & Qian, Z. (2026). Provably secure and robust training-free GIF steganography. *IEEE Transactions on Multimedia*, 28, 12544–12554. https://doi.org/10.1109/TMM.2026.3718262
- Kombrink, M. H., Geradts, Z. J. M. H., & Worring, M. (2025). Image steganography approaches and their detection strategies: a survey. *ACM Computing Surveys*, 57(2), Article 33. https://doi.org/10.1145/3694965
- Infeld, E. J., Stainton, D., Ryge, L., & Threebit Hacker. (2025). *Echomix: a Strong Anonymity System with Messaging* (arXiv:2501.02933v2; paper dated October 2024). https://arxiv.org/abs/2501.02933
- Katzenpost. (n.d.). *Pigeonhole Protocol Specification*. https://katzenpost.network/docs/specs/pigeonhole/
- Liu, Z., & Tromer, E. (2022). Oblivious Message Retrieval. In *Advances in Cryptology – CRYPTO 2022*, Lecture Notes in Computer Science 13507, 751–781. https://doi.org/10.1007/978-3-031-15802-5_26

- Bauer, L. A., Howes IV, J. K., Markelon, S. A., Bindschaedler, V., & Shrimpton, T. (2024). Leveraging Generative Models for Covert Messaging: Challenges and Tradeoffs for "Dead-Drop" Deployments. *Proceedings of the ACM Conference on Data and Application Security and Privacy (CODASPY 2024)*, 67–78. https://doi.org/10.1145/3626232.3653264
- Bauer, L. A., Bao, W., & Bindschaedler, V. (2025). *Provably Secure Covert Messaging Using Image-based Diffusion Processes*. IEEE Conference on Secure and Trustworthy Machine Learning (SatML 2025). https://www.vbinds.ch/node/155
- Lee, K., & Yeo, Y. (2026). *SophOMR: Improved Oblivious Message Retrieval from SIMD-Aware Homomorphic Compression*. 35th USENIX Security Symposium, 3219–3238. https://www.usenix.org/conference/usenixsecurity26/presentation/lee-keewoo
- Liang, H., Liu, Z., Tromer, E., Xie, X., & Yu, Y. (2026). *InstantOMR: Oblivious Message Retrieval with Low Latency and Optimal Parallelizability*. 35th USENIX Security Symposium, 4227–4246. https://www.usenix.org/conference/usenixsecurity26/presentation/liang
- Liu, Z., Tromer, E., & Wang, Y. (2024). *PerfOMR: Oblivious Message Retrieval with Reduced Communication and Computation*. USENIX Security 2024. https://www.usenix.org/conference/usenixsecurity24/presentation/liu-zeyu
- Shuhan, M. K. B., Baldimtsi, F., & Ateniese, G. (2026). *Oblivious Signaling*. USENIX Security 2026, 4207–4226. https://www.usenix.org/conference/usenixsecurity26/presentation/shuhan
- Go project. (2023). *net/http, net/textproto, mime/multipart: denial of service from excessive resource consumption* (CVE-2023-24536), issue #59153. https://github.com/golang/go/issues/59153

## Appendix A. Terminology

- **AEAD:** Authenticated Encryption with Associated Data.
- **Carrier:** An image or other media object used to transport protected data.
- **Capsule:** A transport unit containing or referencing part of a protected message.
- **Fragment set:** Distinct authenticated pieces required to reconstruct one logical protected object.
- **Redundant carriage:** Repetition or coding of information across carriers to tolerate loss; not equivalent to fragmentation or threshold secret sharing.
- **Conversation/session linkage:** Authenticated continuity between distinct logical messages; not fragment-set membership.
- **Package encapsulation:** Bounded route-facing framing around an already protected object or fragment capsule; not an authentication mechanism.
- **Collection-level steganalysis:** Detection or clustering that pools evidence across multiple carriers or events rather than evaluating each image alone.
- **Ciphertext fragmentation:** Splitting protected transport data into pieces; not secret sharing.
- **Decapsulation:** Receiving-side extraction of the protected object from its carriage envelope.
- **Identity verification:** A process binding a cryptographic key to the intended participant under a stated assurance model.
- **Message envelope:** A versioned structure binding protected content to identity and message context.
- **Metadata minimisation:** Removing or avoiding unnecessary information while acknowledging records generated elsewhere.
- **Rendezvous mechanism:** A means by which a recipient discovers where or how to collect a relevant carrier.
- **Steganalysis:** Analysis intended to detect or characterise hidden data.
- **Threshold secret sharing:** Distribution of secret material so a defined threshold can reconstruct it.
- **Transport unlinkability:** A bounded objective of making specified transport events harder to correlate under a defined observer model.
- **Confidence:** A verifier's evidence-bounded judgement about a specific proposition, scope and time; not a universal system score.
- **Assurance:** A justified argument that defined requirements are met under a stated scope and evaluation regime.
- **Evidence provenance:** The origin, acquisition method and independent checkability of evidence supporting a claim.
- **Observer-inferred linkage:** A correlation hypothesis based on visible events or metadata, distinct from endpoint-authenticated linkage.

## Appendix B. Claim discipline

Distinguish **established mechanisms** (properties supported by recognised constructions when correctly used), **proposed designs** (choices requiring specification and evaluation), and **unverified claims** (requiring implementation, evidence, formal analysis or independent review). Never present the latter two as established security properties. Every important claim should eventually have a source, a stated assumption or a clearly marked status as an authorial proposal.

## Appendix C. Supporting research documents

- `docs/w1-research-framing.md` — problem, research questions, scope and contribution.
- `docs/w2-threat-model.md` — assets, actors, capabilities, trust boundaries and threats.
- `docs/w3-architecture.md` — components, lifecycle, envelope concepts, capsule handling and open decisions.
- `docs/w4-risks-and-evaluation.md` — failure modes, evaluation dimensions and acceptance criteria.
- `docs/decision-register.md` — design decisions, rationale and unresolved status.
- `docs/self-review-register.md` — author-identified challenges and evidence needs.
- `docs/traceability.md` — links between research questions, threats, components and evaluation.
- `docs/source-register.md` — authoritative technical sources, protocol comparators, metadata standards and claim-to-source gaps.
- `docs/prior-art-comparison.md`, `docs/observer-property-matrix.md` and `docs/echomix-katzenpost-comparator.md` — current prior-art synthesis and integrated messaging comparator.
- `docs/route-comparison-framework.md` — common event and observer ledger for route-specific evidence.
- `docs/protocol-boundary-analysis.md` — key derivation, identity/context binding, nonce uniqueness, replay, ordering and fallback obligations.
- `docs/multi-message-linkage-and-steganographic-carriage.md` — fragment-set semantics, redundant multi-image carriage, conversation linkage, package encapsulation, pooled steganalysis and prior-art boundaries.
- `docs/confidence-and-evidence-model.md` — claim-centred confidence, evidence provenance, multi-message relationship semantics, delivery-event boundaries and privacy constraints.

## Appendix D. Illustration guide

The current illustrations explain the research's origin and selected decisions. The wider thesis requires additional figures only after the substantive argument and architecture have stabilised. The planned figure set, contextual placement and status are maintained in [the diagram index](diagrams/README.md). Planned figures are not represented as existing or validated artwork.

**Project status:** Theory only · No implementation · Not audited.
