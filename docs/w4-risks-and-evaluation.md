W4 · Risks and Evaluation

Status: Proposed evaluation framework
Research basis: W1 · Research Framing; W2 · Threat Model; W3 · Architecture
Assurance status: Theory only · No implementation · Not audited.

1. Purpose

W4 defines how the proposed architecture should be challenged and evaluated.

It does not report completed tests, measured results or verified security properties. Its purpose is to turn the W2 threat model and W3 architectural responsibilities into explicit evaluation questions, acceptance conditions and unresolved risks.

The evaluation must be capable of rejecting the proposed architecture or requiring its revision. It must not simply confirm the assumptions on which it was designed.

2. Evaluation principles

1. Threat-led: every evaluation activity must map to an identified threat or research question.
2. Property-specific: confidentiality, authentication, integrity, concealment and availability must not be treated as interchangeable.
3. Adversarial: tests must consider active manipulation, not just normal message delivery.
4. Fail-safe: invalid, incomplete or ambiguous inputs must not be silently accepted.
5. Evidence-based: distinguish design rationale, proposed acceptance criteria, test results and independent assurance.
6. Proportionate: additional mechanisms require evidence of a corresponding improvement.
7. Honest limitations: successful evaluation of one property does not establish overall system security.

3. Evaluation domains

### Transport independence, role separation and route composition

**Threats:** a transport or coordinator becomes an implicit security authority; a service's multiple roles are collapsed into one trust assumption; route conversion changes authenticated message semantics; multi-hop delivery creates unrecognised correlation or failure surfaces; fallback silently weakens security.

**Evaluation questions:**

* Can the same endpoint-protected message be carried over more than one declared route without changing its cryptographic meaning?
* Does encapsulation alter only the outer carrier representation, and are malformed or unsupported conversions rejected?
* Which functions are endpoint protection, encapsulation, transport, orchestration or external carrier generation, and what does each observe?
* If one provider performs orchestration and transit, are its coordination and carriage disclosures separately recorded?
* For every hop, what identifiers, objects, timing, access events and transformations are visible to each observer?
* Does route fallback preserve the protected object, authentication, replay rules and nonce/key safety?

**Proposed acceptance conditions:**

* The architecture documents role-specific inputs, outputs, authority, retained state and observer views.
* Orchestration is explicitly optional; no central coordinator is required for the definition of transport independence.
* Every multi-hop route is enumerated and assessed hop by hop, without assuming additional hops improve privacy.
* Protected-object invariance is maintained, or any protocol conversion is explicitly specified and separately analysed.
* Fallback and retry behaviour cannot silently weaken authentication, replay handling or cryptographic parameter safety.



E1. Confidentiality and intermediary authority

Threats: unauthorised disclosure, intermediary compromise, excessive service privileges.

Evaluation questions:

* Can the intermediary obtain plaintext from the information and permissions available to it?
* Does any central component possess the sole means of decryption?
* Are private keys, plaintext and recovery material excluded from intermediary operations?
* Are operational logs, diagnostics and error reports capable of exposing protected content?

Proposed acceptance conditions:

* The documented architecture does not grant the intermediary plaintext access or sole decryption authority.
* The key-management model identifies where every relevant private key is held and used.
* Inspection of service data flows and logs finds no unintended disclosure of protected content or secret material.

E2. Identity and sender authentication

Threats: first-contact key substitution, impersonation, platform identity confusion.

Evaluation questions:

* How does a participant verify a peer’s cryptographic identity?
* Can an attacker substitute a public key without detection?
* Is the sender identity bound to the protected message?
* What happens when an identity key changes or is compromised?

Proposed acceptance conditions:

* First-contact verification is explicitly specified.
* Sender authentication is distinct from transport account identification.
* Substituted or untrusted identity material cannot silently become an accepted peer identity.
* Identity-key changes trigger a defined verification process.

E3. Message integrity and context binding

Threats: tampering, cross-recipient substitution, cross-session substitution, malformed messages.

Evaluation questions:

* Are sender, recipient, session and message-set context bound to the protected message?
* Can authenticated metadata be altered independently of the ciphertext?
* Are unsupported versions and ambiguous encodings rejected?
* Is the cryptographic construction specified as a complete protocol?
* Are key derivation inputs and purpose/direction labels unambiguous and domain-separated?
* Which header fields are encrypted, visible-but-authenticated AAD, or unauthenticated route metadata?

Proposed acceptance conditions:

* Alteration of authenticated content or context is detected.
* Messages cannot be silently reassigned to another recipient or session.
* Unsupported or ambiguous message formats are rejected.
* Algorithm selection, nonce construction, key separation and associated-data rules are documented and independently reviewed.
* Canonical encoding and field authority are explicit; visible AAD is not mistaken for identity verification.

E4. Replay and freshness

Threats: replayed messages, stale messages, duplicate acceptance.

Evaluation questions:

* What makes a message unique?
* What freshness policy is applied?
* How is replay state maintained?
* What happens if local replay state is lost, restored from backup or rolled back?
* Can concurrent sends, retries or multi-device state cause nonce reuse under the same key?
* How are sequence overflow, process crashes and uncertain-delivery retries handled?

Proposed acceptance conditions:

* Replayed messages are identified according to a documented policy.
* Duplicate acceptance is prevented within the stated replay-state assumptions.
* Clock dependence, state-loss/rollback behaviour and duplicate policy are documented.
* Nonce uniqueness is demonstrated by the specified state/key model for concurrency, retries, crash recovery, rollback and multi-device operation; a new carrier identifier is not accepted as a nonce-safety argument.
* Expiry is not presented as a substitute for replay protection.

E5. Multipart integrity and reconstruction

Threats: missing, duplicated, conflicting, mixed or substituted capsules, including adversarial reordering of transport arrivals.

Evaluation questions:

* Can fragments from different messages be combined?
* Can a partial set be presented as a complete message?
* Are index, count, set identity and version authenticated?
* What happens when a fragment is corrupted or permanently unavailable?

Proposed acceptance conditions:

* Incomplete sets are not silently accepted as complete.
* Authenticated logical indices and manifest context permit valid capsules to be reassembled when transport delivery order differs from logical order; arrival order alone is not treated as proof of tampering.
* A duplicate capsule is never counted as an additional distinct piece. The policy for identical duplicates is explicit; conflicting content for the same index, cross-message substitution, invalid indices and ambiguous manifests fail closed.
* Reconstruction produces the original protected message object or fails, with explicit size, count, timeout and resource limits.
* Tests exercise declared-length mismatches, excessive fragment counts, oversized manifests/headers, malformed nesting, decompression expansion, repeated retries and concurrent incomplete sets; record CPU, memory, disk and elapsed-time behaviour.
* Limits are justified against an explicit device and route profile, and rejection occurs before unbounded allocation or expensive decoding where possible.
* Fragmentation is not represented as a confidentiality, redundancy or recovery guarantee.

> **EVALUATION UNIT · Four separate outcomes**  
> (1) Carrier extraction asks whether payload can be recovered from an individual transformed image. (2) Set reconstruction asks whether the endpoint can validate and rebuild the intended protected object from a complete or permitted subset of carriers. (3) Steganalysis asks whether an observer can detect hidden payload in one carrier or a collection. (4) Linkage analysis asks whether an observer can associate carriers, fragments, messages, conversations, retries or routes. Success in one outcome does not establish success in another.
>
> **COMPARISON · Per-image versus collection-level detection**  
> A per-image detector evaluates carriers individually. Pooled steganalysis or collection-level clustering uses evidence across multiple images/events. Report both where relevant; do not assume independent samples or infer lower overall detectability from lower payload per image.
>
> **Illustrated diagram placeholder · W4-F01 — Evaluation ladder from carrier to conversation**  
> **Placement:** Immediately after E5 and before the image-route evaluation discussion.  
> **Prompt for later illustration:** Show four distinct evaluation layers: per-carrier extraction/transformation; authenticated fragment-set reconstruction; collection-level steganalysis and carrier clustering; and end-to-end message/conversation/route linkage under named observer models. For each layer show its unit of analysis, outcome metrics and what a positive result does not prove.  
> **Must not imply:** That image extraction proves stealth, that set reconstruction proves sender identity, or that collection detection automatically identifies participants.
>
Recent image-platform prior art (SRC-033–SRC-037) includes robust JPEG steganography under social-network recompression, real-service comparisons, active payload-removal methods and a broad steganography/steganalysis survey. SRC-043 directly studies fragmented covert communication across many images, redundant fragment carriage and reconstruction after carrier loss; SRC-044 analyses batch steganography and pooled steganalysis; SRC-045 proves a square-root capacity bound only under explicit mathematical assumptions, not as a universal platform law. Do not treat multi-image fragmentation, payload survival or concealment alone as a distinctive system-level result. Evaluate per-image and collection-level detection separately. Separate extraction success, detector performance, endpoint authentication/integrity, discovery privacy and observer leakage. Name the platform, application version, upload/download mode, source format and observed transformations. Report false positives, false negatives, payload rate, image quality and extraction-failure classification where relevant. Distinguish simulated-channel results from live platform observations.

E6. Transport-route, carrier integrity and transformation

Threats: route-specific metadata exposure, size/capacity limits, resizing, recompression, transcoding, metadata stripping, route substitution, extraction failure, delivery ambiguity and concealment detection.

The image-carriage route is required within the research scope. Other routes, including file/attachment carriage and conventional messaging transport, are comparison profiles. Comparing routes does not presume that any route is superior or that they provide equivalent delivery semantics.

> **DEFINITION · Linkage test**  
> A linkage test names the two events or objects an observer attempts to associate (for example, two fragments in one set, a publication and a retrieval, two messages in one conversation, a retry and its original, or the same protected object across routes). It must state the observer's data, time window, collection size, side information and collusion assumptions.
>
> **Illustrated diagram placeholder · W4-F02 — Observer collection and linkage experiment**  
> **Placement:** Beside the route comparison matrix or collection-level evaluation criteria.  
> **Prompt for later illustration:** Show how an experiment constructs realistic carrier collections across account/platform/time-window scopes, introduces missing/reordered/recompressed/duplicated carriers, and measures detection, clustering and false association under distinct observer capabilities. Separate ground-truth relationships from the observer's inferred links and show the evaluation metrics and limitations.
>
### Route comparison matrix

This is an evaluation plan, not a report of measured results. Each profile must be assessed under a stated platform, format, payload size, observer model and delivery configuration. A generic label such as "end-to-end messaging" is not enough to establish the behaviour of a particular service.

| Route profile | What the comparison must establish | Distinct conditions to examine | Claim boundary |
|---|---|---|---|
| Image-carried protected capsules, without concealment | Whether image carriage offers a defensible transport property or use-case benefit beyond simply carrying an encrypted object | Carrier format, payload capacity, image transformation, embedded metadata, file-level identifiers, publication/discovery/retrieval, multipart extraction and failure | Encryption and authentication belong to the endpoint protocol; the image itself supplies neither |
| Image-carried protected capsules, with optional concealment | Whether concealment adds a measurable benefit beyond the image-carriage baseline | Payload rate, cover-image selection, detector/analyst model, false positives and negatives, resizing/recompression/transcoding, moderation and extraction fragility | No generic claim of undetectability or stronger cryptographic protection |
| Encrypted file or attachment carriage | How a protected object behaves when carried as a conventional file or attachment | File metadata, filenames, attachment identifiers, service scanning/transformation, size limits, access controls, storage/retention, download interruption and locator exposure | A simpler carrier may meet the same confidentiality objective; this baseline must be taken seriously |
| Conventional end-to-end messaging transport | Which properties are provided by a named, documented messaging system and which remain service-visible | Identity/key verification model, service-side metadata, attachment processing, delivery/read receipts, device synchronisation, backups, message retention and failure semantics | Do not generalise from one application to all end-to-end messaging systems; document the selected comparator and its configuration |

Across all profiles, record: confidentiality boundary; sender and peer authentication assumptions; metadata visible to each actor; capacity and size constraints; transformations; ordering and duplicate delivery; publication, discovery and retrieval; timing and availability; usability/accessibility; operational dependencies; and safe failure behaviour. Where a dimension cannot be compared fairly, state why rather than forcing a score.

The evaluation must distinguish the participant-side cryptographic topology from the standalone train. The train is assessed as a low-fidelity, replaceable carriage element, not as a source of cryptographic protection. Sender-side encapsulation and receiving-side decapsulation are assessed for bounded framing, declared-length handling, format/version checks, parser limits, truncation detection, extraction completeness and safe failure. These structural checks do not prove origin or authenticity. Any security-relevant route or capsule binding must be authenticated by the endpoint protocol and verified by the endpoint.

A separate transport-level unlinkability objective may be evaluated for the train: unique image envelopes per carriage instance and variable carrier placement may make simple correlation through carrier reuse or predictable location less straightforward. Evaluate this narrowly under an explicit observer model; do not equate it with participant anonymity.

Metadata minimisation is a required route-processing objective. Define an allowlist of fields that must remain and remove unnecessary embedded image metadata and identifying file-level fields before publication. Evaluate the actual output, including metadata added by subsequent hosting or platform processing. Distinguish carrier metadata that can be stripped from server-side logs, network identifiers, access records, timing, size and other observations that the train cannot erase.

The evaluation must include human behavioural linkability and social-engineering resistance as cross-cutting concerns. Examine whether repeated schedules, response intervals, platform/device habits, language and formatting, image-generation patterns or predictable reactions allow exchanges to be correlated. Consider adversarial prompts such as false delivery notices, urgency cues, staged extraction failures and timed contact. Do not frame user vigilance as a complete mitigation or impose unsafe operational rituals; assess what the system can minimise, what users can reasonably understand, and what remains residual risk.

Evaluation questions:

* What route profiles are in scope, and what assumptions does each make about the transport service?
* Can the train be removed or replaced without changing the participant-side cryptographic trust model?
* Which encapsulation fields are merely operational route metadata, and which require endpoint-authenticated binding?
* Can the recipient discover the changing carrier through a mechanism that is authenticated without creating a stable, observable rendezvous point?
* Are carrier metadata removal and the retained-field allowlist verified on the actual output and after relevant platform processing?
* Does any failure of the train, route adapter, discovery channel or decapsulation layer cause unsafe reinterpretation, partial release or false acceptance?
* What capacity, size, ordering, metadata, timing and delivery-state information does each route expose or constrain?
* Which image transformations are expected to preserve capsule data, and which cause extraction failure?
* How do route substitution, duplicate delivery, delayed delivery, loss and cross-route retries affect message-set validation?
* Can corruption be distinguished from an incomplete message?
* Does optional concealment materially improve a stated objective within the image route?

Proposed acceptance conditions:

* Each route profile has an explicit description of its assumptions, observable metadata, capacity, ordering and delivery semantics.
* Route substitution or fallback cannot silently change authenticated message context.
* Supported image transformations are explicitly identified and tested.
* Unsupported transformations cause safe failure.
* Extraction errors cannot bypass message authentication.
* Any concealment claim is limited to the tested carrier formats, transformations, detection methods and threat assumptions.

No claim of universal steganographic resistance is acceptable.

E7. Lifecycle, key rotation and revocation

Threats: compromised keys, stale identities, false expiry or deletion claims.

Evaluation questions:

* How are keys retired and replaced?
* How are future messages prevented from using revoked identities?
* What happens to pending or delayed messages?
* What can and cannot be revoked after plaintext has been obtained?

Proposed acceptance conditions:

* Key rotation and identity-key replacement have documented procedures.
* Revocation affects future acceptance according to a defined policy.
* Expiry and revocation do not claim to erase previously obtained plaintext or copies.
* Device replacement and key compromise are treated as explicit lifecycle events.

E8. Secret handling and endpoint compromise

Threats: logs, crash reports, notifications, backups, local storage and compromised devices.

Evaluation questions:

* Where does plaintext exist during the message lifecycle?
* Which components can access private keys?
* Can secrets appear in logs, telemetry, crash reports or notifications?
* What is the response to suspected endpoint compromise?

Proposed acceptance conditions:

* Secret-handling rules are documented for each endpoint and service boundary.
* Logging and diagnostics are inspected for accidental secret disclosure.
* Key compromise has a defined response.
* The residual risk of a compromised endpoint is explicitly acknowledged.

The integrated Echomix/Katzenpost design is a required comparative baseline for E9, not simply a mix-network option. The comparison must account for its global and active adversary model, decoy/application traffic coupling, capability-derived discovery, courier/replica split, controlled acknowledgements and retries, all-or-nothing backfills, human-routine leakage, and role-collusion analysis. The project's image route must be tested for additional observations not covered by that system model: platform accounts and engagement, publication metadata, media transformation, moderation, hosting records and carrier extraction outcomes. Do not infer a privacy advantage merely because one route uses images and another uses a mixnet.

E9. Metadata, traffic analysis, discovery and availability Use the [route comparison framework](route-comparison-framework.md) as the common event/observer ledger across image, file/attachment, conventional messaging and mixnet-backed profiles. It is a comparison protocol for research planning, not a report of completed measurements.

Threats: traffic analysis, participant correlation, timing and volume observation, locator disclosure, access-pattern correlation, behavioural inference and delivery suppression.

Evaluation questions:

* What can each observer see: endpoint, coordinator, platform, image host, storage provider, network/ISP observer or a more capable colluding observer?
* Which identifiers, timestamps, sizes, flow durations, packet/byte counts, service endpoints, carrier fingerprints and routing relationships are exposed?
* What information is retained, by whom, for how long and under which access assumptions?
* Can a stable locator, publication schedule or retrieval pattern link a recipient to a carrier?
* How do recipient-side full scanning, stable authenticated locators, one-use/short-lived capabilities and private or oblivious retrieval compare under the same observer and collusion assumptions?
* Does capability delivery merely move the observable link to another channel, and what does the lookup service learn from each request, retry or failure?
* Can timing and size observations correlate sender and recipient events even when message contents remain encrypted?
* How do repeated schedules, response intervals, device/platform habits and staged social-engineering prompts affect correlation?
* Can a malicious intermediary delay, suppress or refuse delivery?
* What is the privacy, latency, bandwidth and usability cost of any proposed padding, delay, batching, cover traffic or mixing mechanism?

The evaluation must distinguish a baseline that merely rotates carriers or varies placement from stronger traffic-obfuscation or mix-network approaches. The [observer/property matrix](observer-property-matrix.md) records current comparator boundaries for OMR/GOMR, Oblivious Signaling, Remise, dead-drop covert messaging and image-diffusion work. It should be used to construct like-for-like observer scenarios, not to rank unlike guarantees. In particular, evaluate server collusion, out-of-band token distribution, cover-traffic assumptions, global network visibility, platform/media transformations and endpoint validation separately. Loopix is a comparator for the latter, not an assumed component. The encrypted-messaging traffic-analysis studies in [the source register](source-register.md) (SRC-016, SRC-018 and SRC-019) provide testable observer scenarios, but their results must not be generalised beyond their stated applications and conditions.

Proposed acceptance conditions:

* An actor-by-actor metadata and observer inventory is recorded, including publication, discovery and retrieval.
* Carrier metadata tests distinguish descriptive EXIF/IPTC/XMP fields, filenames and embedded previews from structural/codec information and image-signal fingerprints. Each named platform/route is tested separately for resizing, recompression, transcoding, field retention and extraction success.
* Retention and access assumptions are documented.
* Correlation experiments state the observer vantage, dataset, event definition, features, thresholds, false-positive/negative rates and limitations.
* Carrier uniqueness and variable placement are not treated as evidence of anonymity or unlinkability.
* Any proposed obfuscation mechanism is evaluated against its overhead, latency, accessibility and residual leakage.
* No anonymity or unlinkability claim is made without separate evidence.
* Availability limitations are explicit and are not confused with confidentiality.



E10. Password-derived encryption as a conditional alternative

This evaluation applies only if the password-derived mode is retained as a supported option. It is not part of the current endpoint identity or key-establishment model by implication.

Threats: weak or reused passphrases, offline guessing after carrier capture, unsafe KDF parameter handling, password disclosure, and inability to attribute a message to one holder of a shared secret.

Evaluation questions:

* Is the password-strength assumption explicit and realistic for the intended participants?
* Are salt generation, KDF identifier and parameters, nonce handling, payload versioning and authenticated metadata specified?
* Can attacker-controlled KDF parameters cause resource exhaustion?
* Does the documentation avoid treating a shared password as sender authentication or peer identity?
* Are distribution, rotation, loss and compromise response addressed?

Proposed acceptance conditions:

* A fresh random salt is used for each independently protected object.
* KDF parameters are bounded, versioned and validated before expensive derivation.
* Password-derived keys are used only through a vetted KDF and AEAD construction with documented key/nonce rules.
* Wrong-password, tampering, malformed-payload and resource-exhaustion cases are included in the evaluation plan.
* No claim of sender attribution, forward secrecy or identity verification is inferred from possession of the shared password.
* The mode is presented with explicit assumptions and limitations, not as an interchangeable substitute for authenticated endpoint key establishment.

4. Cross-cutting adversarial evaluation

Evaluation should include scenarios that combine multiple threats rather than testing every component only in isolation.

Candidate scenarios:

1. A malicious coordinator substitutes a recipient key during first contact.
2. An attacker replays an otherwise valid message after its intended acceptance period.
3. A platform recompresses an image carrying one capsule in a multipart message.
4. An attacker combines valid capsules from two different message sets.
5. A recipient receives a valid but incomplete capsule set.
6. A service error causes diagnostic output to include sensitive message material.
7. A participant replaces a device after suspected key compromise.
8. Recovery participants collude or disclose their shares, if recovery is eventually included.

Each scenario should record:

* Preconditions and attacker capability.
* Expected system behaviour.
* Observable evidence.
* Pass, fail or inconclusive outcome.
* Residual risk.
* Any resulting architecture or protocol change.

5. Evaluation evidence and maturity

The project must distinguish the following evidence levels:

Level	Meaning
L0 · Conceptual	A requirement or design intention has been stated
L1 · Specified	A mechanism and its assumptions have been documented
L2 · Analysed	The design has been examined against identified threats
L3 · Tested	Defined tests have been executed and results recorded
L4 · Independently reviewed	Relevant independent specialist review has been completed

These levels are a proposed project evidence model, not an external certification standard.

A documented design intention must never be described as a tested security property. Passing a test suite does not automatically establish resistance to untested attacks.

6. Evaluation artefacts

The evaluation process should eventually produce:

* Threat-to-component traceability.
* Protocol and message-format specification.
* Test-case register.
* Test results and reproducible procedures.
* Known limitations and residual-risk register.
* Key-management and lifecycle review.
* Carrier transformation results, if applicable.
* Independent cryptographic and implementation review findings.

No numerical thresholds are fixed at this stage. They must be justified by the relevant property and test environment rather than invented to make a design appear measurable.

7. Risks requiring continued scrutiny

Risk	Why it matters	Current treatment
Identity verification remains underspecified	Authenticated encryption cannot establish who a person is without a trustworthy identity binding	Open protocol decision
Key lifecycle complexity	Rotation, replacement and compromise may undermine otherwise sound message protection	Open protocol decision
Metadata exposure	Confidential content does not prevent participant and activity correlation	Explicit residual risk
Carrier fragility	Media processing may destroy embedded data	Requires testing
Multipart complexity	Reconstruction creates opportunities for ambiguity and manipulation	Strict validation proposed
Recovery expansion	Additional participants and shares create new trust and collusion risks	Deferred
Endpoint compromise	Plaintext and keys are exposed at the endpoints	Residual risk
False lifecycle claims	Expiry cannot erase information already obtained	Explicit limitation
Protocol composition errors	Individually sound primitives can be combined incorrectly	Requires complete specification and review
Excessive architecture	Additional services and dependencies expand the attack surface	Complexity must demonstrate value

8. Evaluation gates

The following gates are proposed before progression to implementation:

Gate 1 · Architecture coherence

* W1 questions map to W2 threats.
* W2 threats map to W3 responsibilities.
* No component lacks a stated purpose.
* Trust boundaries and residual risks are explicit.

Gate 2 · Protocol specification

* Identity verification and authenticated key establishment are defined.
* Message encoding and cryptographic context are specified.
* Nonce, key separation, replay and multipart rules are defined.
* Lifecycle and recovery decisions are explicit.

Gate 3 · Adversarial test design

* Threat scenarios have reproducible test procedures.
* Expected rejection and failure behaviour is specified.
* Test assumptions and acceptance criteria are justified.

Gate 4 · Independent review

* Cryptographic design receives appropriate specialist review.
* Implementation receives separate security review if built.
* Unresolved findings are recorded rather than hidden by a successful demonstration.

Passing a gate requires evidence. Progression must not be inferred merely because the relevant document exists.

9. W4 conclusion

The architecture is not validated by its elegance, number of components or choice of cryptographic primitives. It must demonstrate that the identified threats are addressed under explicit assumptions, and that its remaining limitations are honestly represented.

The next research priority is to close the protocol decisions that materially affect identity, key establishment, authenticated message context, replay protection and multipart integrity.

Optional concealment and threshold recovery remain conditional. They should advance only if their benefits can be evaluated against their additional risks and complexity.

Theory only · No implementation · Not audited.