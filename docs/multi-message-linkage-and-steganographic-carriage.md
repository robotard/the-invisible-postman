# Multi-Message Linkage and Steganographic Carriage

**Status:** Research analysis and design obligations; no protocol or embedding method selected.  
**Research alignment:** W1 RQ4–RQ8 · W2 observer/threat model · W3 capsule and route architecture · W4 E5/E6/E9  
**Related work:** SRC-026, SRC-027, SRC-033–SRC-037, SRC-043–SRC-049, and SRC-024–SRC-032  
**Assurance:** Theory only · No implementation · Not audited.

## 1. Why this is a separate research problem

A system that sends one protected message in one image has a different problem from a system that distributes one message across several images, repeats fragments for resilience, or links several independent messages into a conversation. These cases are often collapsed under the word *multipart*. That is too imprecise for either protocol design or privacy analysis.

The distinction is especially important for steganography. Hiding a fragment inside an image does not hide the relationship between images. A receiver may need fragment numbers, a set identifier, a manifest, a rendezvous capability, a retrieval schedule or a shared embedding context. Each can create an observable relationship. Conversely, omitting or randomising linkage information may make reconstruction, loss recovery, recipient discovery and safe rejection harder.

The literature already contains direct work on fragmented covert communication across many images and social platforms. Wang et al. (2024) fragment a secret file, embed each fragment redundantly in multiple image carriers, encode fragment number and content, and reconstruct after receiving enough carriers using majority voting over redundant copies. The authors explicitly distinguish steganography from watermarking; the system's core carrier mechanism is a robust DFT/DCT watermarking method used for covert communication, not a demonstration that ordinary steganographic embedding survives social-platform transformations. Their reported experiments include recovery under stated image attacks and carrier loss (SRC-043). Ker's batch-steganography analysis shows that a warden can pool evidence across a collection of covers, and that distributing payload across more covers is not automatically safer (SRC-044). These works make generic claims to novelty in multi-image fragmentation, redundant image-carried fragments, or whole-message reconstruction untenable without a much narrower, evidenced distinction.

The inspected author-linked MRAS/DRAS MATLAB repositories (SRC-033/034) provide a useful contrast. Their public demos process ten cover images as separate per-image embedding/extraction operations; each call loads a sample-message prefix. The exposed routines do not define a cross-image fragment manifest, set reconstruction or conversation linkage. Their demos simulate JPEG recompression locally rather than reproducing the papers' separately reported live-platform tests. This is a statement about the pinned public code inspected, not a claim that the papers contain no additional platform experiment or that the code has been independently validated. The project must therefore ask not merely whether several images can carry pieces of a message, but what relationship must be maintained, who can observe it, how it is authenticated, what it costs, and whether concealment survives collection-level analysis.

## 2. Required vocabulary: do not call every case multipart

| Case | Meaning | Core protocol question | Main privacy question |
|---|---|---|---|
| Single-carrier message | One logical protected message is carried in one image/object | Does the recovered object authenticate and validate? | What does one carrier and its publication/retrieval expose? |
| Fragmented logical message | One protected object is split into distinct pieces across carriers | How are set, count, index, completeness and content bound? | Can observers identify which carriers form one set? |
| Redundant fragment carriage | A fragment or coded block is copied into multiple carriers to tolerate loss | What threshold/decoding rule and duplicate policy apply? | Does repetition increase pooled detection, traffic volume or correlation evidence? |
| Multiple independent messages | Distinct protected messages are sent in the same period or batch | Are they independent, sequenced, or intentionally grouped? | Can observers infer common sender, recipient, session or campaign? |
| Conversation/session linkage | Several messages intentionally belong to one authenticated dialogue | How is continuity authenticated and key state advanced? | Does a stable session/thread identifier expose a long-lived relationship? |
| Multi-recipient/group delivery | One message or related messages are intended for several recipients | What are the recipient and key scopes? | Does the carrier or retrieval pattern reveal group membership? |
| Retransmission/duplicate delivery | The same logical message or capsule is sent again after uncertain delivery | Is it an identical retransmission or a new protected message? | Do repeated events reveal delivery state or recipient activity? |
| Cross-route carriage | The same protected object or logical message appears on more than one route | Does route change preserve authenticated semantics and nonce/replay state? | Can equality of ciphertext, timing or retrieval link the routes? |

A fragment set is not a conversation. A conversation identifier is not a fragment-set identifier. A retransmission is not a new message. A group recipient list is not a carrier-distribution list. The wire format and research documents must preserve these distinctions.

## 3. The relationship graph

Model the system as a graph, not just a sequence of files.

- **Logical-message node:** one user-visible message with a stable endpoint meaning.
- **Protected-object node:** the authenticated encrypted representation of that message.
- **Fragment node:** a bounded piece or coded block derived from the protected object.
- **Carrier node:** an image or other object that transports one or more fragments.
- **Publication event:** an upload/post/send event for a carrier.
- **Discovery event:** a signal or query that tells a recipient where to look.
- **Retrieval event:** a download/access event.
- **Conversation/session edge:** intentional continuity between distinct logical messages.
- **Fragment-membership edge:** a fragment's authenticated membership in one logical-message set.
- **Redundancy edge:** a relation between copies or coded blocks that contribute to recovery.
- **Retry edge:** a later attempt to deliver the same logical object.
- **Route-equivalence edge:** carriage of the same protected object through another declared route.

The endpoint may need to know the full graph. A platform, host, coordinator, network observer or human observer sees only a projection of it. The privacy question is whether those projections nevertheless let an observer reconstruct edges through shared identifiers, timing, size, access patterns, image features, accounts, embedding artefacts or behaviour.

The graph must distinguish a relationship that is **intentionally visible to the recipient** from one that is **unintentionally visible to a carrier, platform or observer**. A value being encrypted inside a carrier does not make its publication pattern invisible. A hidden fragment index does not hide a common upload account or repeated timing.

## 4. Linkage mechanisms and their trade-offs

No mechanism is selected. These are alternatives to compare, not a recommended protocol.

### 4.1 Explicit public set identifiers

A visible set identifier plus index/count is simple to discover and reconstruct. It is also a direct correlation handle: an observer can group carriers without decoding the hidden payload. Reusing an identifier across a conversation would expose even more.

### 4.2 Per-set random identifiers

A fresh random identifier can avoid obvious global naming, but it is still a stable join key within the set wherever it is visible. Randomness does not make a value secret, authenticated or unlinkable. Its generation, collision handling, scope and lifetime need specification.

### 4.3 Keyed or recipient-specific linkage values

A keyed derivation or pseudorandom token may let authorised endpoints recognise set membership without publishing a plain identifier. Its security depends on key scope, domain separation, recipient/group scope, rotation and the observer's access to the token. Reuse of a stable token creates linkability even if the token's meaning is opaque. The derivation and any associated manifest still require authenticated context.

### 4.4 Encrypted manifest or out-of-band manifest

A manifest can carry the mapping between logical message, fragments, indices, counts, digests, expiry and retrieval hints. Encrypting it can reduce direct disclosure to a carrier platform, but the act of retrieving it, its delivery channel, size and timing may expose relationships. An out-of-band channel may create a separate identity and metadata dependency.

### 4.5 Capability-based discovery

A one-use or short-lived capability can provide access to a particular set without a stable public recipient identifier. It does not hide the request from the service that receives it, and distribution of the capability becomes a separate authenticated protocol problem. A capability should not be treated as a complete identity proof or a guarantee against correlation.

### 4.6 Endpoint-local conversation mapping

Distinct per-message identifiers can be mapped to a conversation locally by the endpoints. This can reduce exposure of a stable thread identifier to carriers, but it does not eliminate timing, size, account, key-use or retrieval correlation. It also requires a defined way to authenticate continuity and handle missing, delayed or out-of-order messages.

**Design rule:** distinguish *linkability required for correct recipient reconstruction* from *linkability exposed to observers*. A design cannot simply delete all links; it must decide which party needs which relationship, at what stage, and under which trust assumption.

### 4.7 Discovery is not a single lookup

For comparison and threat analysis, decompose discovery into bootstrap/trust establishment, publication/indexing, candidate enumeration, recipient pertinence and retrieval authorisation, and endpoint conversation association. These stages answer different questions and may be controlled by different actors. A recipient may already possess an authenticated capability but still need to locate the relevant carrier; a service may authorise a retrieval without knowing the human identity behind the capability; and an endpoint may authenticate a fragment after retrieval without proving that the publication or retrieval path was private.

The distinction matters when comparing established systems. OMR/GOMR target recipient-message pertinence under their board/detector models; they do not make publication events disappear or replace endpoint message authentication. Oblivious Signaling shifts work towards uniform sender-side updates and relies on an external anonymous channel for sender anonymity. Remise's two-server privacy depends on non-collusion, while bearer-token distribution remains out of band. Echomix/Pigeonhole integrates capability-derived addressing with asynchronous storage and role separation, but capability distribution and the service/network views remain explicit parts of its model. None should be reduced to the generic label “private discovery”.

A privacy claim must name the event and observer. Hiding which item a recipient queries is not the same as hiding who published it, hiding the query's network source, hiding capability use, preventing a platform from correlating carrier objects, or concealing the later endpoint association. Out-of-band distribution changes the observer boundary; it does not eliminate the boundary. A capability can grant access while leaving use visible to the receiving service. Endpoint-local conversation mapping minimises public continuity identifiers but is not a candidate-enumeration mechanism.

For each deployment, map the full chain—bootstrap, publication, enumeration, pertinence/authorisation, retrieval, extraction, endpoint validation and conversation association—to its responsible actor, observers, retained metadata, collusion assumptions and failure modes. Keep availability and suppression separate from confidentiality and pertinence privacy. This decomposition is an analytical requirement, not a claim that any one mechanism is selected.

The event chain must also be pressure-tested against active service behaviour. A substituted bootstrap instruction can redirect a recipient before endpoint authentication has a trusted peer binding. A malicious publisher can seed false or stale carriers; an equivocating index can give different candidate sets to different recipients; and a retrieval service can selectively withhold or replay results while recording capability use. Publisher/index/retrieval collusion can join publication provenance, object identifiers, capability use, account/device metadata and request timing even if each role's isolated view appears limited. Retention of backups, moderation records, access logs and telemetry may outlive the visible carrier or locator. These are distinct attacks and evidence questions, not one generic compromised-service case.

The endpoint can reject an invalid or replayed protected object, but this does not prove that the index was complete, that every expected carrier was published, or why an object is absent. A service record can attest to the service's own reported publication or retrieval event, but not to peer identity, endpoint acceptance or the non-occurrence of an event outside its view. An index response is not proof of completeness unless a specified consistency mechanism is independently checkable. Silence is ambiguous among non-publication, suppression, indexing delay, network failure and ordinary latency. Any timeout/retry policy should state which ambiguity it bounds and what additional timing or access-pattern leakage it introduces.

For every route profile, record the relevant pairwise and multi-role collusions, the metadata join keys, clock-alignment uncertainty, retention window and evidence source. Distinguish endpoint-authenticated facts, service-reported events, observed metadata and analyst-inferred correlation. Unknown internal retention or service behaviour remains unknown; provider documentation is not equivalent to observed operation. No mitigation or privacy guarantee is selected by this analysis.

## 5. Steganographic embedding across multiple carriers

### 5.1 Per-carrier and set-level concealment are different

A detector may inspect one image at a time, but an observer may collect many images from the same account, platform, time window, visual source, embedding method or suspected sender. Shared embedding keys, payload distributions, image-generation patterns, repeated formats, similar dimensions, common compression traces or coordinated timing may make a set easier to identify than any individual image.

Ker (2007) explicitly studies batch steganography and pooled steganalysis. The paper analyses how a warden combines detector evidence across a set and shows, within its stated model and image method, that spreading a fixed payload over more covers is not automatically the safest tactic. Its model assumes a fixed, known batch size, equal cover capacities, random selection of embedded covers and specified component-detector response assumptions; it treats sequential acquisition as a different problem. The formal square-root capacity theorem is established in Ker's follow-up paper (SRC-045), under its own explicit assumptions: equal cover capacities, shift-hypothesis detector response with regularity conditions, independent per-cover detection errors and a batch size known to both parties. Ker notes that practical bounds can be loose and that sequential acquisition is a different setting. Neither paper licenses a universal law for current platform images or dependent collections. The methodological point remains: evaluate the collection, not only isolated images.

### 5.2 Fragmentation and redundancy change the exposure surface

Distributing one protected object across several images can reduce the payload carried by an individual image, but it also increases the number of observable publication events and the amount of evidence available to a pooled detector. Redundantly embedding the same fragment can improve recovery after loss, while increasing repeated signal, carrier count, traffic volume and potential linkage.

The relevant trade-off is not simply payload per image. It includes:
- Total payload and per-carrier payload distribution.
- Number of carriers and number of publication/retrieval events.
- Redundancy or erasure-code overhead.
- Number of carriers lost or transformed before recovery.
- Individual-image and collection-level detector performance.
- Similarity and provenance of cover images.
- Shared embedding keys, seeds, algorithms or parameter choices.
- Platform-specific recompression and other transformations.
- Visibility of fragment/set metadata and retrieval behaviour.
- Time, bandwidth, storage, computation and user effort.

No claim that spreading payload over more images necessarily reduces detectability is acceptable without a stated model and collection-level experiment.

### 5.3 Embedding, watermarking and cryptographic protection must remain distinct

Robust watermarking can preserve a recoverable signal under transformations that defeat fragile steganographic payloads. That does not make watermarking equivalent to steganographic undetectability. Wang et al. (2024) explicitly distinguish watermarking, which protects/marks the carrier, from steganography, which seeks to conceal communication; their system uses robust watermarking layers to carry fragmented covert data across multiple images (SRC-043).

The thesis must state whether a proposed image method is:
- A steganographic embedding method evaluated for detectability;
- A robust watermarking method evaluated for payload recovery;
- A hybrid that makes separate, testable claims for concealment and recovery; or
- A carrier-only method with no concealment claim.

Do not use *steganography*, *watermarking*, *robustness* and *undetectability* as interchangeable labels.

### 5.4 Multiple images are not necessarily independent samples

A platform may process a batch in a common way. Images may share a source, device, account, application version, export pipeline, embedding implementation or upload session. A set-level detector cannot automatically assume independent observations. Experiments must describe dependencies and avoid multiplying single-image probabilities as though every image were independent.

### 5.5 Multi-frame animated carriers are not multi-object fragment sets

Wang et al. (2026; SRC-049) provide a useful additional comparator: the author-linked README and inspected code describe a 16-frame pipeline in which secret bits are repeated within each frame and each frame's recovered secret is then combined by majority voting across frames. The implementation uses per-frame key/nonce material in its PyCryptodome ChaCha20 path, AnimateDiff generation and DDIM-inversion extraction. The sender code path writes frame PNGs; the receiver reads a fixed 16-frame PNG set plus locally stored keys and ground truth. This is a single animated carrier object with internal frame multiplicity. It is not the same topology as publishing separate image objects, distributing fragments across posts, or linking independent messages into a conversation.

The comparison must therefore distinguish at least three levels:

1. **Within-object multiplicity:** frames or planes inside one animated/container object; loss or distortion may be correlated by shared encoding and platform handling.
2. **Across-object multiplicity:** separate image/file objects carrying distinct fragments or redundant copies; publication, account, timing and retrieval events become part of the observer's collection.
3. **Across-message multiplicity:** distinct protected logical messages linked by a conversation/session relationship, independently of how each message is carried.

Cross-frame majority voting may improve recovery from frame-level bit errors under the paper's evaluated conditions, but the inspected receiver asserts that exactly 16 frames and matching keys are present; missing-frame erasure tolerance is therefore not established by this code path. The inspected ChaCha20 implementation exposes no authentication tag, the fallback is a 32-bit NumPy PRNG explicitly labelled TEST ONLY, and the local group ID/key files do not constitute an authenticated endpoint manifest. These are source-code observations, not a security audit. The paper's formal security claim remains unreviewed. None of this establishes cross-post discovery, endpoint-authenticated fragment-set membership, conversation continuity or collection-level concealment across an account's image history.

### 5.6 Active sanitization and counter-adaptation form an adversarial loop

SRC-036, SRC-046 and SRC-047 describe learned approaches intended to remove robust hidden data while maintaining image quality; SRC-047 specifically describes separate Scaling-Net and SC-Net paths. SRC-048 then describes a counter-adaptation in which a secret-seed-conditioned decoder is jointly considered with a sanitizing network and the sender iteratively optimises the cover so the sanitiser's output yields the intended secret.

This literature changes the threat framing: a carrier route may face passive or routine transformations, an active sanitiser deliberately optimised to destroy hidden payloads, and an adaptive sender method designed against a known sanitiser. These are distinct adversarial settings. The sources do not show that a named platform deploys the sanitizers or that the counter-adaptation generalises to unknown sanitizers, model versions or processing chains. Any comparison must state who controls the sanitizer, whether its model is known, what the receiver knows, what transformations are chained, and whether the result is extraction, concealment, or endpoint-authenticated acceptance.

## 6. Endpoint message-set and conversation integrity

If a logical message is fragmented, the endpoint protocol must define a canonical authenticated set context. Candidate fields include protocol version, message-set identifier, sender/recipient scope, session reference, declared total count, fragment index, coding/redundancy parameters, protected-object length, per-fragment length and digest, expiry policy and any manifest reference. The exact fields and encoding remain open.

The design must specify:
- How the manifest or equivalent context is authenticated.
- Whether the fragment index/count are visible, encrypted or authenticated-visible AAD.
- How a fragment is prevented from being transplanted into another message, recipient set or session.
- How identical duplicates are treated and conflicting duplicates rejected.
- How missing fragments, excess fragments, invalid indices, mixed sets and incomplete sets are handled.
- Whether arrival order is irrelevant and how logical order is reconstructed.
- How a complete set is distinguished from a partial set.
- How expiry, replay windows and durable duplicate state apply to the entire set.
- What resource limits apply before image decoding, decompression, allocation and reconstruction.
- Whether recovery uses simple repetition, erasure coding, another coding method or no redundancy.

A content digest can detect mismatch only if the expected digest is itself authenticated. A public set ID does not authenticate membership. An image-level watermark's recovery success does not establish endpoint sender authentication. The endpoint must reject a recovered object whose cryptographic validation or authenticated set policy fails.

For multiple independent messages in one conversation, define continuity separately. Candidate controls include authenticated per-message sequence/context, ratchet state, message identifiers and endpoint-local conversation mapping. A stable session identifier may be operationally useful but can create a durable correlation handle if exposed in carrier metadata or discovery requests.

### 6.1 Relationship authority and acceptance-state separation

The relationship graph in §3 is not a single public index. It contains edges with different authorities: endpoint-authenticated membership and conversation continuity; endpoint-local retry and cross-route equivalence; coding/redundancy relationships required for reconstruction; and observer-inferred associations. A public set ID, image metadata field, filename, platform thread or timestamp cannot authenticate an edge. A keyed or encrypted token may reduce direct disclosure but still creates linkability wherever it is reused or observed.

For every edge, record which endpoint needs it, whether it is cryptographically authenticated, where it is stored, which route participants can observe it, its lifetime/rotation scope, and what happens when evidence is missing or contradictory. Correct reconstruction requires recipient-side linkage; privacy requires minimising what each intermediary can observe.

The receiver's acceptance path should keep distinct states: candidate carrier observed; carrier retrieved; bounded payload extraction; endpoint authentication; fragment membership validation; set completeness; reconstruction and protected-object validation; replay/freshness decision; logical-message acceptance. Their evidential meanings must not be collapsed:

- Publication is not retrieval.
- Retrieval is not successful extraction.
- Extraction is not cryptographic validity.
- A valid fragment is not proof of set membership unless membership is authenticated.
- Valid membership is not completeness.
- Completeness is not conversation continuity.
- A service acknowledgement is not endpoint receipt, decryption, display or human reading.

Incomplete sets remain unaccepted and consume bounded resources under explicit expiry. Identical duplicates may be idempotent under authenticated replay policy; conflicting values for one authenticated fragment position must be rejected or quarantined. No partial plaintext should be exposed before the complete protected object passes required endpoint checks. Keep route-event evidence separate from endpoint-authenticated state and default to endpoint-local linkage records; shared receipts or stable correlation tokens need a stated purpose, recipient, retention period and observer analysis.

This acceptance model is a research/design obligation. It does not select the manifest format, identifier construction, cryptographic primitive, durable state store or acknowledgement protocol.

It also does not collapse cryptographic validity into unique sender attribution. An AEAD tag under a shared symmetric key authenticates against that key and context, but any holder of the key may be capable of producing a valid tag. A signature or authenticated session can bind an object to a protocol key/session; the claim that this key belongs to a particular person depends on a separate peer-key verification and identity-assurance process. The manifest's issuer/authorisation scope must therefore be explicit: a valid manifest authenticates only the relationships and claims covered by its cryptographic context, not an unverified human identity or the truth of outer-carrier metadata.

## 7. Threats specific to linked carriers and multi-message flows

| Threat | Example | Required analysis/control |
|---|---|---|
| Set disclosure | Public set ID, visible index/count or common locator groups carriers | Record exactly which observer sees the linkage value and for how long |
| Cross-set mixing | Fragments from two messages are combined | Authenticate set membership, recipient/session scope and fragment content |
| Fragment substitution | An attacker replaces one carrier or index | Authenticated manifest/context and endpoint validation |
| Replay | An old valid fragment or complete set is reintroduced | Freshness, expiry and durable duplicate/replay policy |
| Partial-set ambiguity | Missing pieces are treated as a complete message | Explicit completeness and acceptance rules |
| Redundant-copy correlation | Same fragment appears in many carriers | Measure duplicate signal, event volume and collection-level detection |
| Pooled steganalysis | Weak evidence across many images accumulates | Evaluate per-image and batch-level detectors with realistic collection sizes |
| Shared-key fingerprinting | Repeated embedding key or algorithm leaves common structure | Analyse key scope, rotation and detector access; do not claim key secrecy solves statistical signatures |
| Cross-message correlation | Distinct messages share a visible session ID or repeated timing | Separate intended endpoint continuity from observer-visible linkage |
| Cross-route equality | Same ciphertext appears on image and file/messaging routes | Assess equality and timing leakage; route wrappers do not automatically hide the inner object |
| Discovery correlation | Recipient queries or retrieves several related carriers | Model locator/capability use, polling, batching, access patterns and network observers |
| Active carrier attack | Resize, recompress, crop, reorder, remove, duplicate or replace carriers | Define transformation profile, recovery threshold and authenticated rejection behaviour |
| Behavioural linkage | Predictable schedules, response patterns or image styles group events | Treat as a separate human/network side channel; do not imply cryptography solves it |

## 8. Evaluation protocol: test the set and the timeline

A credible evaluation should have at least four separate levels.

### Level A — Carrier-level recovery and detectability

For each carrier, record source image, dimensions, format, embedding method, payload rate, pre/post transformation, extraction outcome, distortion/quality metrics and detector scores. Include benign and adversarial transformations. Do not infer set-level stealth from single-image scores.

### Level B — Set-level reconstruction and integrity

Vary carrier count, fragment size, redundancy, loss, duplication, reordering, substitution and cross-set mixing. Measure complete-set recovery, partial recovery, false acceptance, false rejection, time/memory/storage, and exact rejection reason. Test the manifest and every fragment against substitution, replay and mix-and-match attempts.

### Level C — Collection-level steganalysis and linkage

Give the observer increasingly realistic collections:
1. Isolated images with no known grouping.
2. Images from one account or platform in a time window.
3. Images sharing source/device/export characteristics.
4. Multiple suspected carriers from one communication episode.
5. Repeated episodes across time.
6. Collections with partial platform transformations and missing images.

Evaluate both payload-presence detection and event/set clustering. Report ROC/precision-recall or other justified metrics, false-positive/false-negative rates, base rates, sample construction, detector training/test separation and dependence assumptions. Compare a single-image detector with pooled/set-level approaches. A detector that identifies a suspicious collection need not recover the message or correctly identify the sender; report these outcomes separately.

### Level D — End-to-end observer and lifecycle analysis

For each route, map publication, discovery, retrieval, retry, acknowledgement, expiry and human interaction events to platform, host, coordinator, network, global and colluding observers. Measure whether an observer can link:
- Multiple carriers to one logical message.
- Multiple messages to one conversation/session.
- A sender's publication to a recipient's retrieval.
- A retry to the original attempt.
- An image-carried event to a file or messaging route.
- A set of carriers to a particular account, device or behavioural routine.

Use declared observer vantage, available records, time resolution, active capabilities and collusion assumptions. Do not label a result *unlinkability* without stating which two events are being linked and what the observer can see.

## 9. Comparison with established work and contribution boundary

SRC-043 is a direct prior-art comparator for fragmented covert communication across multiple images and social platforms. It already combines secret-file fragmentation, fragment numbering, redundant embedding across multiple images, recipient-side collection and concatenation, and robustness under loss/transformation. It therefore defeats any broad claim that this thesis newly introduces multi-image fragmentation, redundant image-carried fragments or reconstruction from a subset of received images.

SRC-044 establishes that steganalysis can aggregate evidence across a batch and that payload distribution across covers has non-obvious trade-offs. It makes single-image-only evaluation insufficient for any repeated-carrier proposal.

SRC-026 independently studies a broader public-platform dead-drop messaging pipeline with fragmentation, hints, rendezvous and retrieval, albeit using generated text rather than image carriers and with a bounded observer model. SRC-033–SRC-037 cover robust social-platform image steganography, active payload-removal and the wider steganalysis field. SRC-024–SRC-032 cover recipient retrieval, group privacy, anonymous publication and integrated messaging baselines.

Any remaining contribution must therefore be narrower and demonstrated. Candidate questions include whether a route-neutral endpoint-protected object can preserve authenticated set semantics across heterogeneous carrier adapters; whether a clearly specified observer model exposes different linkage than the direct prior-art systems; whether a particular discovery/manifest boundary changes measurable disclosure or cost; and whether the proposed architecture provides a better documented separation between endpoint identity/message authority and carrier-level reconstruction. These are research questions, not novelty claims. The comparison may show that existing systems already solve the relevant problem better.

## 10. Open decisions and immediate research tasks

| Decision | Must be established |
|---|---|
| Message model | Is the target one message, one fragmented message, a conversation, a batch, group delivery or a mixture? |
| Fragmentation | What object is split, and why is splitting preferable to one carrier or another route? |
| Redundancy | Is it repetition, erasure coding or another scheme; what loss threshold and overhead are justified? |
| Linkage | Which parties need set/conversation linkage, and what can each observer see? |
| Manifest | Where is it stored, how is it authenticated, how is it discovered and what does its retrieval reveal? |
| Steganographic method | Is the claim concealment, robust recovery, watermarking or a hybrid? |
| Collection model | How many images/events can an observer collect, over what time window and with what side information? |
| Platform route | Which platform/client/version/processing path is in scope, and how are current conditions pinned? |
| Cross-route semantics | Is the same protected object retried or carried elsewhere; what equality, replay and nonce implications follow? |
| Conversation continuity | What is authenticated across distinct messages and what stable identifier, if any, is exposed? |

**Immediate next work:** complete a source-level review of SRC-043–SRC-049, map their exact mechanisms and assumptions into the prior-art and observer matrices, then update W2/W3/W4 and thesis §7–§8. Do not design a final fragment format or select a steganographic method before this comparison is reconciled.

**Theory only · No implementation · Not audited.**
