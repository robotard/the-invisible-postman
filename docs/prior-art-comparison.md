# Prior-Art Comparison: Recipient Retrieval and Covert-Carriage Pipelines

**Checkpoint:** 2026-11-15  
**Role:** Working literature synthesis for W0.3/W6  
**Status:** Theory only · No implementation · Not audited.

## 1. Purpose and inspection boundary

This comparison tests the current candidate contributions against the closest identified work. It is intended to prevent novelty-by-combination and to expose where apparently similar systems solve different problems under different observer assumptions.

The following full texts have been inspected for their stated models, constructions, threat assumptions, evaluation and limitations:

- Liu and Tromer (2022), *Oblivious Message Retrieval* (OMR), including its formal definitions, DoS model, key unlinkability, performance and integration sections.
- Liu, Tromer and Wang (2024), *PerfOMR*, including its adapted OMR definition, adversary model, constructions, benchmarks and Zcash integration discussion.
- Shuhan, Baldimtsi and Ateniese (2026), *Oblivious Signaling*, including the formal receiver-privacy model, server leakage, inbox update construction, cost model and limitations.
- Lee and Yeo (2026), *SophOMR*, including its receiver-linkage model, SIMD-aware compression construction and evaluation.
- Liang et al. (2026), *InstantOMR*, including its OMR threat model, hybrid construction, benchmark methodology and latency/throughput trade-offs. The conference paper defers some formal details and malicious-detector correctness/integrity discussion to its full version; those details are not treated as verified here.
- Bauer et al. (2024), the full version of *Leveraging Generative Models for Covert Messaging: Challenges and Tradeoffs for “Dead-Drop” Deployments*, including its MBFTE construction, rendezvous/key-table arrangement, platform constraints, discovery hints, threat model and empirical evaluation.
- Bauer, Bao and Bindschaedler (2025), *Provably Secure Covert Messaging Using Image-based Diffusion Processes*, including its problem model, pre-shared-key assumption, adversary model, latent-space indistinguishability argument, proof discussion and empirical evaluation.

This is a focused comparison, not a systematic literature review, independent reproduction, proof verification or complete account of all related systems. Full-text inspection means the paper was examined; it does not mean its implementation or claims were independently reproduced.

## 2. Comparative matrix

| Work | Primary problem and mechanism | Observer/threat model and protected property | Explicit boundary or limitation | Relevance to this thesis |
|---|---|---|---|---|
| **OMR (2022)** | Public bulletin board; each message carries a payload and recipient clue. An untrusted detector uses a recipient detection key to produce a compact digest for local decoding. | Computationally bounded adversary reads the board, public keys and detector-recipient communication. For privacy, parties may be malicious and collude except the target sender and recipient. The paper separately strengthens DoS correctness/soundness assumptions and defines clue/detection-key unlinkability. | Explicitly excludes application-specific payload encryption, contact discovery, key establishment, privacy-preserving board posting and recipient subscription to detectors. Ordinary soundness/completeness assumptions are weaker than the strongest privacy model. | Establishes that recipient discovery/retrieval privacy is a mature, formally modelled problem. It is not a complete publication, contact-discovery or image-carriage architecture. |
| **PerfOMR (2024)** | Improves OMR using Ring-LWE variants and more efficient retrieval circuits, with two constructions trading detector runtime, clue/key size and message overhead. | Adversary reads public information and detector-recipient communication, and may control or collude with parties other than the target sender/recipient; malformed messages and keys are within the stated model. | Remains an OMR primitive around a public board and detector. Its integration discussion addresses clue-key distribution and embedding for Zcash, not a general social-platform or image-carriage pipeline. | Makes the OMR comparator materially more practical; a proposed discovery mechanism cannot ignore its efficiency and integration trade-offs. |
| **Oblivious Signaling (2026)** | Replaces retrieval-time scanning with a fixed-capacity encrypted inbox per recipient. Every send triggers a uniform homomorphic update across the anonymity set. | Malicious server may collude with users for receiver privacy. Server observes public keys, sender batch requests, encrypted inbox state and delivery schedule. Sender-to-server anonymity is assumed externally; receiver-server channel is authenticated and encrypted. | Sender anonymity is outside the protocol and depends on an anonymous channel. Timing, batch size, registered recipients and read timing remain visible. Fixed FIFO capacity evicts old messages; sharding reduces the anonymity set. Correctness assumes protocol-following updates; malicious state corruption is outside the claims. | Shows that discovery/retrieval has multiple architectural families and different cost placement. A fair comparison must include sender cost, server work, polling frequency, retention and network leakage. |
| **SophOMR (2026)** | Uses SIMD-aware homomorphic compression to improve OMR digest generation and reduce computation/communication overhead compared with PerfOMR. | The paper states a passive adversary attempting to link messages to receivers, with access to the public board, public keys and communication, and possible collusion except for target sender/receiver. | Efficiency improvement within the OMR model; it does not supply a complete messaging lifecycle, contact discovery, sender anonymity or carrier/platform concealment. | Updates the current OMR performance baseline. It reinforces that recipient retrieval is an active research area, not an unoccupied design space. |
| **InstantOMR (2026)** | Hybrid TFHE/RLWE retrieval designed for low latency and high parallelisability, especially streaming and small batches; trades per-message throughput against latency. | Computationally bounded adversary sees public board, keys and detector-recipient communication. Privacy allows collusion by parties other than target sender/recipient; soundness/completeness assume honest-but-curious parties in the conference paper. | The conference paper defers correctness/integrity against malicious detectors and some formal details to a full version. It does not extend the underlying OMR privacy model into a complete publication or platform-carriage model. | Requires the thesis to compare latency and throughput by workload, rather than describe OMR as one fixed design or cost profile. |
| **Dead-drop covert messaging (2024)** | A model-based format-transforming encryption pipeline produces natural-language covertext for publication on high-volume public platforms. It studies encoding, record framing, fragmentation, hints, rendezvous, retrieval, platform constraints and empirical performance/security heuristics. | Adversary knows the system except pairwise secret keys, can post and attempt decoding, and observes platform posts. It cannot control the platform, see fine-grained user actions or obtain IP identifiers. Platform cooperation is explicitly left to future work. | Uses generated text, not image-carried protected capsules. It assumes pre-shared information and an overt signal; a key table/message counter/PRNG coordinates model states and exchange locations. Platform-control and user-action visibility are excluded. Its heuristic detectability results are tied to the tested model/platform/dataset. | Directly defeats any broad claim that “whole-pipeline covert messaging” or adding retrieval/discovery to steganography is itself new. Its assumptions and text-specific design differ, but the overlap is substantial and must be confronted. |
| **Image-based diffusion covert messaging (2025)** | Embeds encrypted/authenticated bits in the initial latent noise of diffusion-generated images, with a latent-distribution-preserving construction and error-correction strategy. | Adversary knows the model, parameters, prompts and cryptographic algorithms, can generate and invert images, but does not observe the sender's initial randomness; security is formalised through latent-space indistinguishability against PPT distinguishers. | Assumes sender and receiver already share a key. It explicitly does not study how images are delivered to the recipient. It targets small, high-security covert messages, not frequent low-latency high-capacity private messaging. Generated images are not the same as embedding a capsule in an existing user-selected image. | Establishes formal image-generated covert communication as prior art, while leaving distribution/retrieval outside its problem model. It is a close image-channel comparator but not an equivalent transport architecture. |

## 3. Findings that change the novelty assessment

### 3.1 Recipient privacy is already a mature design space

OMR is not simply a generic “hidden inbox” idea. It has formalised message-recipient privacy, malicious-party collusion models, key unlinkability and DoS-resistance variants. PerfOMR, SophOMR and InstantOMR continue to optimise different parts of its cost profile. Oblivious Signaling changes where the expensive privacy work occurs, shifting cost from recipient retrieval to sender-triggered updates.

Consequently, the thesis cannot claim to introduce private recipient retrieval, recipient-message unlinkability, or the general idea of outsourcing discovery to an untrusted service. It must compare the actual alternatives and their different assumptions and cost models.

### 3.2 “Whole-pipeline” analysis is not sufficient by itself

The 2024 dead-drop paper explicitly moves beyond the steganographic core and examines a deployable public-platform pipeline: format transformation, record framing, fragmentation, platform constraints, rendezvous, overt/covert hints, retrieval, user detection and empirical trade-offs.

It therefore overlaps directly with a broad claim that this project is novel merely because it considers the entire delivery lifecycle. Its exclusions are important: the paper assumes the adversary cannot control the platform, observe fine-grained user actions or obtain IP identifiers, and leaves platform cooperation outside scope. Its text-generation channel and record construction also differ from the proposed image-carried protected-object route.

The distinction, if any, must be stated more precisely than “we consider the full pipeline.”

### 3.3 Image-based covert communication exists, but the delivery problem differs

The 2025 diffusion paper provides a formal image-based covert communication construction. It embeds information in generated images' initial latents, assumes a pre-shared key, and analyses a strong distinguisher that knows the model and can invert images. Its formal claim is tied to latent-space distribution preservation and its stated adversary.

However, the authors explicitly leave image delivery to the recipient outside their problem. Their channel is a generated image, not an arbitrary existing image carrying an independently protected capsule. It also prioritises small, high-security messages rather than frequent, low-latency private messaging.

The project must therefore distinguish at least three different ideas: embedding into an existing image, generating an image whose latent state carries information, and carrying an already protected object through an image-based route. They are not interchangeable.

### 3.4 Privacy claims must be compared at the observer boundary

The reviewed systems protect different relationships:

- OMR-family systems protect message-to-recipient linkage within a public-board/detector model.
- Oblivious Signaling protects receiver linkage at the server while relying on an external anonymous channel for sender anonymity and accepting timing/system leakage.
- The dead-drop pipeline studies whether covert posts and users can be detected on a public platform, but excludes some platform and network observations.
- Diffusion-based covert messaging studies whether an image-generation process reveals embedded communication, while leaving delivery outside scope.

A single phrase such as “transport privacy” or “unlinkability” would conceal these differences. The thesis needs an explicit observer/property matrix: who observes which event, what they can correlate, what they can alter, which parties may collude, and which leakage is deliberately outside the model.

## 4. Candidate contribution pressure test

| Candidate | What prior art already establishes | What might remain distinct | Current judgement |
|---|---|---|---|
| **A — Responsibility-separated architecture** | Endpoint encryption with untrusted intermediaries, cryptographic authority separation and modular carriage are familiar principles. OMR and dead-drop systems already combine protected payloads with untrusted public infrastructure in different ways. | A carefully specified boundary between endpoint-authenticated message semantics, replaceable external image carriage and receiving-side decapsulation may be useful as a coherent design account. | **Not a novelty claim.** Keep as architectural foundation unless a precise comparative distinction emerges. |
| **B — End-to-end delivery-privacy analysis** | OMR and Oblivious Signaling formalise recipient privacy; dead-drop work examines public-platform publication, rendezvous, discovery and retrieval; diffusion work studies image covert-channel detectability. | A common, explicit analysis joining endpoint cryptographic authority, external image-carrier publication/transformation, recipient discovery/retrieval, decapsulation and human/metadata correlation under a unified observer model may expose cross-layer incompatibilities or leakage not captured by the separate models. | **Strongest emergent proposition, originality unestablished.** It must produce a defensible analytical method and new findings, not merely combine named mechanisms. |
| **C — Route-independent semantics and route comparison** | Existing work compares alternative cryptographic retrieval constructions and covert-channel methods, but not necessarily the same protected message object across this project's image, file/attachment and conventional routes. | A reproducible comparison under common message semantics, observer capabilities, platform transformations, delivery failures and user effort may provide practical insight. | **Potentially useful method, not a contribution by itself.** A table alone is insufficient. |

## 5. Provisional emergent proposition

The most defensible working direction after this comparison is:

> A useful privacy analysis of endpoint-controlled messaging over replaceable external carriage must treat recipient discovery and retrieval, platform publication and transformation, endpoint validation, and observable human/metadata behaviour as coupled parts of one delivery lifecycle; evaluating these parts under separate threat models can conceal cross-layer leakage and incompatible assumptions.

This is deliberately an emergent proposition, not a settled contribution claim. The reviewed papers make the proposition plausible as a research question, but they do not yet establish that the proposed unified analysis is original, complete or practically superior.

## 6. What remains before any originality statement

1. Compare the exact observer capabilities and leakage functions of OMR, PerfOMR, SophOMR, InstantOMR and Oblivious Signaling in one table.
2. Compare the dead-drop paper's rendezvous, hints, platform assumptions, user-detection analysis and fragmentation against the proposed image-carriage lifecycle.
3. Compare the diffusion paper's latent-space security model with the threat model for an existing-image carrier and platform transformation.
4. Search for additional integrated anonymous messaging/dead-drop/image-carriage systems and related work that may challenge the proposed gap.
5. Define the project's intended deployment and primary observer model narrowly enough to make comparison meaningful.
6. Identify at least one non-obvious cross-layer result or analytical method that would remain useful even if image carriage is not the best route.
7. Revise the central research question and contribution language only after those steps.

## 7. Immediate research consequence

The next useful artifact is not another architecture diagram. It is a common observer/property matrix covering publication, discovery, retrieval, collection, carrier transformation, decapsulation, endpoint validation and human interaction. That matrix should expose where the reviewed papers' assumptions stop and where the proposed system would need evidence of its own.

**Theory only · No implementation · Not audited.**

## 8. Supplementary prior-art comparison · GOMR and Remise

The full-text comparison above has been extended after locating two important systems that materially narrow the candidate contribution.

### 8.1 Group Oblivious Message Retrieval (Liu, Tromer and Wang, 2024)

GOMR generalises OMR from one recipient to ad-hoc and fixed groups. It formalises group recipient privacy, detection-key unlinkability and denial-of-service resistance, and evaluates FHE/lattice-based constructions. Its model distinguishes public bulletin-board publication from the oblivious detector's retrieval task. It assumes the application payload is already suitably encrypted; authenticated clue-key distribution, contact discovery and privacy-preserving board posting remain outside scope. Its privacy adversary may control or collude with parties other than the protected sender and recipient(s), while the paper explicitly treats integrity and DoS under their own adversary-strength conditions.

**Research consequence:** Any broad claim that recipient-private delivery or group retrieval is newly addressed is untenable. Group communication must be included in the related-work baseline even if the proposed project remains focused on one-to-one communication.

### 8.2 Remise (Ravi, Shukla and Vadapalli, 2026)

Remise is a two-server DORAM-based anonymous communication system with two modes: an epoch-published anonymous bulletin board and private communication channels with writer-controlled read authorisation and revocation. It explicitly considers a global network adversary observing client-server communications, uses cover traffic, and hides access indices and writer-reader relationships under its two-server model. Its privacy requires the servers not to collude; integrity assumes both servers follow the protocol, and the paper assumes semi-honest servers. RemiseCC uses bearer authorisation tokens distributed out of band; privacy-preserving token distribution remains open. The authors also note that a malicious server can drop writes.

**Research consequence:** Remise directly overlaps any generic claim to have newly combined anonymous publication, authorised recipient access, relationship privacy and revocation. It does not provide an image-carriage or social-platform media pipeline, carrier metadata/forensic analysis, the proposed endpoint message semantics or human behavioural correlation model. The distinction must be argued at these exact boundaries, not by saying the project considers more of the lifecycle.

### 8.3 Revised cross-system judgement

The [observer/property matrix](observer-property-matrix.md) now compares OMR/GOMR, the OMR performance variants, Oblivious Signaling, Remise, dead-drop covert messaging and image-diffusion covert messaging across publication, discovery, retrieval, collection, carrier transformation, decapsulation, endpoint validation and human interaction.

The additional papers make three distinctions essential:

1. **Access-pattern privacy is not media-carrier privacy.** DORAM and OMR-family work hide selected access or recipient relationships under their models; they do not establish that an external image platform cannot correlate media, users or retrieval events.
2. **Anonymous access control is not endpoint-authenticated message semantics.** A system may hide which reader accesses a stored item without defining the project's peer identity verification, sender authentication, authenticated message context or capsule validation.
3. **A combined lifecycle narrative is not itself a contribution.** GOMR and Remise already cover substantial publication, retrieval, relationship and access-control machinery. The only defensible path for Candidate B is to identify a concrete cross-layer leakage or incompatible assumption arising when those privacy mechanisms meet media-carrier transformation, endpoint validation and human/network observation.

The emergent proposition in §5 is therefore retained only as a question to test, not a conclusion. It must be narrowed, displaced or abandoned if the next comparison does not reveal a non-obvious result.

