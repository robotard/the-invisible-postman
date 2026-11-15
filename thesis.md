# The Invisible Postman
## A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage

**Researcher:** `@robotard`  
**Document:** Integrated thesis, working research draft  
**Checkpoint:** 2026-11-15  
**Status:** Theory only · No implementation · Not audited

> This is a proposed architecture and research programme. It is not a protocol specification, implementation, formal proof, empirical result, or independent security audit.

## Abstract

The Invisible Postman examines how communicating endpoints might retain control of plaintext and cryptographic authority while using intermediaries for message coordination and carriage. The research began with a compact idea: protect a message with a shared secret and carry the protected material inside an image. That starting point exposed useful questions about encryption, concealment and portability, but it did not by itself address the wider requirements of authenticated communication between independently verified participants.

The research therefore develops a broader, endpoint-controlled architecture. It distinguishes identity and key verification, authenticated key establishment, message confidentiality, sender authentication, authenticated message context, multipart handling, transport, carrier processing, intermediary coordination, lifecycle policy and possible recovery. Image carriage remains a required research route and an important part of the project's identity. Other carriage methods provide comparison profiles. Optional steganographic concealment is examined separately from cryptographic protection.

A central architectural proposition is that the participant-side cryptographic topology must remain distinct from a replaceable, untrusted transport element. The transport can carry, publish, expose, delay, transform, lose or suppress protected material without becoming an authority for identity, keys, message meaning or decryption. The research also examines how distribution, discovery and collection create their own privacy and reliability questions. Unique image envelopes, variable placement and metadata minimisation may reduce some simple forms of carrier correlation, but cannot establish participant anonymity or erase platform, network and behavioural observations.

The intended contribution is a reasoned and challengeable architecture, a record of design evolution, an explicit threat model, a comparison of carriage methods, and a falsifiable evaluation programme. The work deliberately distinguishes established mechanisms from proposed design choices and unverified claims. Important protocol, identity, discovery, recovery and evaluation decisions remain open.

## 1. Research purpose and problem

### 1.1 The problem

Secure communication is not only a matter of encrypting a string and sending it. A usable messaging system must establish who is communicating, determine which keys and sessions are trusted, protect message contents, authenticate relevant context, move data between endpoints, handle incomplete or duplicated delivery, and respond to device loss, key change and compromise. It must also account for what intermediaries can observe and what users reasonably expect the system to do.

Modern communication commonly depends on services outside the direct control of participants: bots, messaging platforms, file hosts, storage providers, content delivery networks and network operators. These services can be operationally useful without being trusted with plaintext or the sole ability to decrypt. Yet even a service that cannot decrypt may still observe relationships, timing, size, access patterns, media properties and user behaviour. It may also alter, reorder, delay, suppress or remove content.

The research explores whether a clear separation of responsibilities can make those boundaries understandable and testable. It does not assume that moving ciphertext through an image makes the system secure. Nor does it assume that a platform becomes harmless merely because it cannot read the message.

### 1.2 Central research question

**How can an endpoint-controlled messaging architecture protect message contents and authenticate communicating participants while using untrusted intermediaries and image-based carriage, and what security, privacy, usability and reliability limits remain across the complete communication lifecycle?**

### 1.3 Supporting research questions

1. **Identity and trust:** What does it mean to verify a participant's cryptographic key, and what does that process not prove about a real-world identity?
2. **Cryptographic composition:** Which endpoint responsibilities are required for authenticated key establishment, confidentiality, sender authentication, integrity, replay resistance and key lifecycle?
3. **Intermediary exposure:** What can bots, platforms, hosts, storage providers and network observers learn, alter, correlate or deny?
4. **Message structure:** How should message context, envelopes, multipart capsules and manifests be bound and validated?
5. **Carriage methods:** What changes when protected material travels as an image, an encrypted file, an attachment or through a conventional end-to-end messaging route?
6. **Concealment:** Does optional steganographic concealment address a distinct and measurable threat, and under which transformations does it fail?
7. **Discovery and collection:** How can a recipient discover and collect a changing carrier without creating a stable rendezvous point or access pattern that defeats the intended privacy benefit?
8. **Human behaviour:** How can routines, timing, language, platform habits and social-engineering probes create linkability even when carriers and locations vary?
9. **Lifecycle and recovery:** What can expiry, revocation, key rotation and recovery realistically achieve, and what assumptions do they introduce?
10. **Evaluation:** What observations would support, weaken or falsify the architectural propositions, and what evidence would be required before stronger claims could be made?

### 1.4 Research approach

This is theory-led architectural research. It proceeds by making the proposition explicit, separating properties that are often conflated, examining alternatives, modelling adversaries and failure modes, and deriving evaluation questions from the resulting claims.

The method is iterative rather than confirmatory. A design choice is not treated as correct because it is elegant, familiar or already recorded in the repository. Each choice must state the problem it addresses, the assumptions it needs, the alternatives considered, the costs it introduces and the evidence that could challenge it. Where evidence is absent, the document must say so. Where a decision is unresolved, the thesis must preserve that uncertainty rather than fill it with an attractive guess.

The work is informed by the active research framing, threat model, architecture and evaluation documents, the decision register and author-led self-review. Those supporting documents are working research artifacts, not independent validation. Source reconciliation and a claim-to-source register remain necessary before the manuscript can be considered academically complete.

## 2. Origin and evolution of the research

### 2.1 The initial image-and-password model

The initial concept was deliberately compact: a sender protects a message with a password or passphrase shared with the intended recipient, places the resulting protected data into an image, and sends or publishes that image. The recipient obtains the image and uses the shared secret to recover the message.

This model was useful as an exploratory starting point. It was easy to explain, avoided an initial dependency on an identity directory, and made the distinction between message encryption and image concealment visible. It also raised immediate questions: whether the image was merely a carrier, whether the embedded material could survive ordinary image processing, what metadata remained exposed, and whether a shared secret was sufficient for the communication being proposed.

Argon2id was considered as a password-based key derivation function, with a fresh salt and recorded parameters. The KDF can increase the cost of guessing, but it cannot create entropy absent from the password. The encrypted object would still need a vetted authenticated-encryption construction and correct nonce handling. The password model did not, by itself, prove who sent a message, bind a key to a human identity, provide a robust multi-device lifecycle or solve first-contact impersonation.

The starting model is retained as part of the research history. It is not rewritten as a failed idea: it was a useful narrow model whose limits became clearer as the research question expanded.

### 2.2 Why the research widened

The project moved from a self-contained protected object towards communication between independently verified endpoints. This changed the problem. The question was no longer only how to protect a message before placing it in an image. It became how participants establish and maintain trust, how sender identity is authenticated, how context is bound to ciphertext, how keys change, and how delivery can proceed through services that are not trusted with plaintext.

A shared password may remain appropriate for a narrow, pre-arranged exchange where participants accept its limitations. It is not automatically a participant identity system or a complete protocol for ongoing communication. A hybrid that combines passwords with endpoint key agreement would need a defined role for each input, explicit context binding and key separation, and independent review. Informal combinations of cryptographic primitives are not an acceptable substitute for protocol design.

### 2.3 Design evolution as evidence of changing assumptions

The design history matters because it records why the scope changed. It should not be mistaken for evidence that the later architecture is correct. The evolution from password-derived encryption to endpoint-managed keys reflects an expanded set of requirements, not a simple ranking in which one approach is universally superior.

**Illustration pointer:** [01 · From idea to architecture](diagrams/01-ideation-and-design-evolution.svg) shows the initial concept and the reasoning path that widened the research. It is a historical and conceptual map, not an implementation workflow.

**Illustration pointer:** [03 · Design decisions](diagrams/03-design-decisions.svg) records selected design choices and their rationale. It should be read alongside the decision register, which carries the fuller reasoning, alternatives and unresolved status.

## 3. Research proposition, scope and contribution

### 3.1 Core proposition

The central proposition is that cryptographic authority should remain with the communicating endpoints, while intermediary services are treated as untrusted for plaintext confidentiality and sole decryption authority. Transport and carrier handling should be replaceable and should not silently acquire identity, key, authentication or message-semantic authority.

This is an architectural objective, not a demonstrated guarantee. Its plausibility depends on correct cryptographic composition, endpoint security, identity verification, message binding, safe parsing, and a transport design that does not create unacceptable privacy or availability failures.

### 3.2 Intended contribution

The intended contribution is a transparent research architecture that:

- distinguishes security properties that are often conflated;
- makes endpoint and intermediary responsibilities explicit;
- explains the evolution from the initial password-based model;
- separates cryptographic message construction from transport and carrier processing;
- examines image carriage as a required route without presuming it is superior;
- compares route-specific capabilities, exposures and failure modes;
- includes discovery, collection and human behavioural linkability in the privacy analysis;
- distinguishes ciphertext fragmentation from threshold secret sharing;
- states lifecycle and recovery limitations;
- proposes evaluation criteria capable of challenging the design; and
- preserves assumptions, alternatives, dissent and unresolved decisions.

### 3.3 Scope

The research includes endpoint-controlled key custody and plaintext handling; explicit peer verification; authenticated key establishment; authenticated encryption; sender authentication; versioned message context; envelope and multipart validation; a first-class carriage layer; image carriage as a required route; comparison carriage profiles; optional steganographic concealment; intermediary coordination; metadata minimisation; discovery and collection; expiry, revocation and key rotation; and the possible inclusion of separately governed recovery.

### 3.4 Non-goals and exclusions

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

Endpoints require an authenticated key-establishment process with clear identity binding, key confirmation and transcript/context binding. The phrase "anonymous agreement" has appeared as an unresolved idea, but it is not sufficiently defined to assign it a protocol meaning. It must not be silently interpreted as anonymous key exchange, deniable authentication, private mutual authentication, participant unlinkability or an anonymity network.

### 6.3 Message protection and sender authentication

Authenticated encryption can protect message contents and associated data when correctly composed and used. Sender authentication is a separate design responsibility. The final protocol must explain whether it relies on an authenticated session, signatures or another reviewed construction, and how the evidence binds to the intended sender, recipient, session and message context.

Candidate primitives such as X25519, HKDF-SHA-256, Ed25519 and XChaCha20-Poly1305 may be evaluated. They are not a selected protocol and should not be assembled informally. A complete specification would need key separation, key confirmation, nonce rules, associated-data construction, version negotiation, downgrade handling, transcript binding, safe error behaviour, rotation and compromise response.

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

### 7.3 Fragmentation is not secret sharing

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
- conventional end-to-end messaging transport, where a meaningful comparison can be defined.

The comparison should examine confidentiality boundaries, sender authentication, identity assurance, intermediary visibility, metadata exposure, capacity, transformations, ordering, delivery semantics, retrieval, failure behaviour, usability, accessibility, deployability, operational complexity and fallback. Comparisons must avoid pretending that different services offer identical delivery guarantees or threat models. The corresponding evaluation protocol is recorded in W4's route-comparison matrix. It defines the dimensions and conditions to investigate; it does not report comparative results or assume that any profile is superior.

### 8.3 Image carrier and optional concealment

An image is a carrier, not a key, identity credential or guaranteed entropy source. Image processing belongs in a route-specific adapter that does not own cryptographic secrets. Optional steganography attempts to make embedded material less apparent. It is a separate sub-layer and must be evaluated against detection and transformation; it does not encrypt, authenticate or hide all transfer metadata.

Platforms may resize, recompress, transcode, strip metadata, moderate or otherwise transform media. The research must define the tested image formats, payload capacity assumptions, transformation profiles and extraction failure behaviour. A route that only works when a platform preserves exact bytes may be unsuitable for that platform, even if a controlled laboratory demonstration succeeds.

### 8.4 Distribution, discovery and collection

Transport is not complete when a carrier is published. The intended recipient must discover where the relevant carrier is available, retrieve it, determine whether it is the correct carriage instance, extract the protected object and pass that object to endpoint validation.

These stages are coupled. A changing or randomised placement may reduce simple correlation with a predictable publication location, but the recipient needs a way to discover it. A stable locator or rendezvous point may reintroduce linkability. A highly variable discovery process may increase loss, delay, confusion or usability burden. The design must examine both sides rather than treating random placement as an unqualified privacy improvement.

The recipient-discovery problem is therefore a central open question for the transport route: what information must be shared, through which channel, under what authentication and privacy assumptions, and what can an observer infer from publication and retrieval?

### 8.5 Unique envelopes and bounded transport unlinkability

The transport may use a newly generated, unique image envelope for each carriage instance and vary where that envelope is placed for collection. This may reduce reuse of identical carriers and weaken straightforward correlation based on repeated objects or fixed publication locations. It does not follow that uniqueness creates unpredictability, that unpredictability creates anonymity, or that either guarantees unlinkability.

The evaluation must distinguish:
- **uniqueness:** whether the same carrier object is reused;
- **randomness:** whether values are sampled from a defined random process;
- **unpredictability:** whether an observer can feasibly predict the next carrier or placement;
- **unlinkability:** whether an observer can connect two events under a specified observation model; and
- **anonymity:** whether an observer can identify a participant within a defined anonymity set.

These are different claims and require different evidence. A unique image may still have a recognisable generation style, similar dimensions, a repeated visual theme or a correlated timestamp. Placement may vary while retrieval timing remains highly predictable.

### 8.6 Metadata minimisation and its limits

Metadata minimisation is a baseline requirement for image carriage. The carrier-processing path should remove unnecessary embedded metadata, including avoidable EXIF, IPTC and XMP fields, and avoid identifying filenames, descriptive properties, thumbnails or other unnecessary file-level identifiers. The design should define an allowlist of fields demonstrably required for safe extraction, compatibility or handling, then verify the actual output rather than assuming removal succeeded.

Removing embedded metadata does not erase network identifiers, hosting-provider logs, access records, externally observed timestamps, traffic volume, file-size observations, platform-generated metadata or copies already retained by third parties. These require separate controls and remain possible observations. Stripping metadata may also affect compatibility or legitimate handling; the allowlist and transformation tests must make that trade-off explicit.

### 8.7 Human behavioural linkability and social engineering

Technical randomisation does not make human behaviour random. Repeated publication and retrieval schedules, predictable response intervals, habitual platform or device choices, language, phrasing, formatting, message length, image-generation style and reactions to familiar prompts may correlate exchanges even when each carrier is unique.

An adversary may probe those patterns through false delivery notices, urgency cues, staged extraction failures, timed contact, impersonation or prompts designed to elicit a predictable response. These are behavioural side channels and social-engineering threats, not failures of encryption itself. The architecture should minimise unnecessary behavioural disclosure and avoid placing the entire mitigation burden on user vigilance. Privacy must not depend on unsafe, deceptive, exhausting or inaccessible behavioural camouflage.

### 8.8 Transport evaluation

A meaningful route comparison should record the observer model, route assumptions, payload capacity, transformations, metadata, publication and retrieval behaviour, timing, ordering, failure modes, user effort and operational dependencies. Tests should include benign and adversarial platform transformations, carrier substitution, locator disclosure, retrieval correlation, delayed or repeated access, and human-pattern probes where ethically and practically appropriate.

**Illustration pointer (planned):** A transport-method comparison figure should show the same already protected object passing through distinct route profiles, with route-specific packaging, publication, discovery, collection and extraction. It should make clear that endpoint cryptographic validation remains common to every route.

**Illustration pointer (planned):** A discovery-and-observation figure should show the coupled publication/discovery/retrieval process and the observations available to a platform, host, network observer and behavioural adversary. It must not imply that variable placement guarantees anonymity.

## 9. Lifecycle, expiry, revocation and recovery

### 9.1 Lifecycle semantics

A communication system needs explicit rules for session creation, key rotation, device replacement, compromise response, expiry, revocation and recovery. These policies must be authenticated and consistently interpreted. The system must define clock assumptions, offline-device behaviour, revocation propagation, local versus service-side enforcement and the consequences of stale state.

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
| Envelope and parsing | Are malformed, oversized, downgraded or ambiguous inputs rejected safely? |
| Multipart validation | Are missing, duplicate, reordered, mixed, substituted, altered and replayed pieces handled correctly? |
| Intermediary authority | Can an intermediary obtain plaintext or sole decryption authority? What can it still observe or disrupt? |
| Image route | What capacity and extraction success remain after defined resizing, recompression, transcoding and moderation? |
| Concealment | Under which detection methods and transformations is concealment detectable or destroyed? |
| Metadata | Which fields are removed, retained or recreated, and what records remain outside the file? |
| Discovery and collection | What stable rendezvous, locator, timing or access-pattern information is exposed? |
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

**Illustration pointer (planned):** A claim-to-evidence traceability figure should connect research questions, security objectives, threats, architectural responsibilities, proposed tests and evidence maturity. It should visually distinguish proposed requirements from demonstrated results.

## 11. Discussion, limitations and unresolved reasoning

The architecture's strongest proposition is separation of responsibility: endpoints retain cryptographic authority, while the transport carries material without being trusted to interpret or decrypt it. This is conceptually useful, but separation alone does not prove correct protocol composition, trustworthy identity binding, safe endpoint behaviour or robust delivery.

The image route gives the project a distinctive and necessary research subject. Its value must be assessed against realistic alternatives. The research must not defend image carriage simply because it was the original inspiration. Equally, it should not discard the route before examining its properties, limitations and possible use cases. The correct conclusion may be conditional: useful in some environments, fragile in others, or valuable as a comparative study rather than a universal transport.

The transport privacy proposal is similarly conditional. Unique image envelopes, variable placement and metadata minimisation may reduce selected forms of correlation. Recipient discovery may reintroduce a stable signal; hosting and network records may expose independent information; human behaviour may remain recognisable. These are not peripheral caveats. They determine whether the proposed privacy contribution exists under a stated observer model.

The research scope is broad. Identity, cryptographic protocol composition, carrier engineering, steganalysis, distributed retrieval, privacy, usability and recovery could each become a substantial study. The thesis must keep a coherent central question and avoid claiming to solve every adjacent problem. Some matters may be bounded as assumptions, comparison dimensions or future work, provided their impact on the central proposition is made explicit.

The term "anonymous agreement" remains unresolved. It must be defined by the property sought, the adversary, the participants and the information each party or observer may learn. Until then it cannot responsibly be assigned a cryptographic mechanism or used as a security claim.

Other open questions include the identity-assurance level; exact authenticated key-establishment protocol; key-change and device-recovery ceremony; sender-authentication composition; canonical envelope and manifest format; replay-state model; message and capsule limits; image formats and transformations; metadata allowlist; recipient discovery and rendezvous; observer collusion; the meaning and measurable scope of transport unlinkability; whether concealment adds sufficient value; whether threshold recovery belongs in scope; and the evaluation thresholds needed to support any stronger conclusion.

## 12. Conclusion

The Invisible Postman is a research investigation into endpoint-controlled cryptographic messaging whose protected messages may travel through untrusted intermediaries and image-based carriage. Its central concern is not whether an image can hide bytes. It is whether a complete communication architecture can separate cryptographic authority from transport, make its assumptions visible, and withstand critical examination across identity, message protection, carriage, collection, lifecycle and human interaction.

Image carriage remains a required research route, but it does not define every layer of the system. The thesis must explain why the route is being examined, what it changes, how it compares with alternatives and where it fails. The transport element remains replaceable and subordinate to endpoint cryptographic authority. Its discovery and collection processes deserve explicit study because publication alone does not complete delivery and because retrieval can itself expose relationships.

The work advances only when claims become clearer, assumptions are tested, alternatives are fairly considered and weaknesses remain visible. The next stage is to reconcile the full manuscript against W1–W4, the decision register, self-review and source material; then complete the research reasoning and evidence plan before final illustration and publication.

## Appendix A. Terminology

- **AEAD:** Authenticated Encryption with Associated Data.
- **Carrier:** An image or other media object used to transport protected data.
- **Capsule:** A transport unit containing or referencing part of a protected message.
- **Ciphertext fragmentation:** Splitting protected transport data into pieces; not secret sharing.
- **Decapsulation:** Receiving-side extraction of the protected object from its carriage envelope.
- **Identity verification:** A process binding a cryptographic key to the intended participant under a stated assurance model.
- **Message envelope:** A versioned structure binding protected content to identity and message context.
- **Metadata minimisation:** Removing or avoiding unnecessary information while acknowledging records generated elsewhere.
- **Rendezvous mechanism:** A means by which a recipient discovers where or how to collect a relevant carrier.
- **Steganalysis:** Analysis intended to detect or characterise hidden data.
- **Threshold secret sharing:** Distribution of secret material so a defined threshold can reconstruct it.
- **Transport unlinkability:** A bounded objective of making specified transport events harder to correlate under a defined observer model.

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
- `project/WORKPLAN.md` and `project/PROJECT_STATE.md` — roadmap and verified checkpoint.

## Appendix D. Illustration guide

The current illustrations explain the research's origin and selected decisions. The wider thesis requires additional figures only after the substantive argument and architecture have stabilised. The planned figure set, contextual placement and status are maintained in [the diagram index](diagrams/README.md). Planned figures are not represented as existing or validated artwork.

**Project status:** Theory only · No implementation · Not audited.
