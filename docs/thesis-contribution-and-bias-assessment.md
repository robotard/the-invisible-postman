# Thesis Contribution and Bias Assessment

**Checkpoint:** 2026-11-18  
**Scope:** Critical assessment of the active thesis and current literature position  
**Project status:** Theory only · No implementation · Not audited.

## 1. Purpose and judgement boundary

This is a hard research checkpoint, not an endorsement, peer review, novelty certification or security audit. It tests whether the current argument has a defensible contribution and whether the research process is biased towards preserving the original image-carriage idea.

The scores below are provisional construction-readiness judgements based on the current manuscript, W1–W4, decision register, traceability and the sources inspected to date. They are not measurements of scientific quality. They must change when stronger literature evidence or contrary findings appear.

## 2. Provisional weighted assessment

Scale: 1 = weak or absent; 3 = plausible but incomplete; 5 = strong and well-supported. Confidence indicates confidence in this assessment, not confidence in the proposed system.

| Dimension | Weight | Current score | Confidence | Current judgement |
|---|---:|---:|---|---|
| Originality and differentiation | 25% | 2/5 | Low | Individual ingredients and the whole-pipeline/dead-drop framing have substantial prior art. A distinct contribution has not yet been isolated. |
| Theoretical coherence | 20% | 4/5 | Medium | The separation of endpoint authority, transport, carrier, concealment, identity and delivery responsibilities is coherent and consistently reasoned. Full protocol composition remains open. |
| Practical usefulness | 15% | 3/5 | Low–medium | The architecture addresses real deployment concerns, but no target use case, comparative benefit or operational feasibility has yet been demonstrated. |
| Security and privacy reasoning | 15% | 4/5 | Medium | The thesis is unusually careful about property separation, intermediary distrust, discovery leakage, metadata, behavioural correlation and lifecycle limits. Analysis is not proof. |
| Evaluation and falsifiability | 15% | 3/5 | Medium | Threats and evaluation dimensions exist, but the tests, observer assumptions, baselines and acceptance thresholds are not yet sufficiently operational. |
| Scope and research feasibility | 10% | 2.5/5 | Medium | Ten supporting questions span several mature fields. Without a narrower central claim, the work risks becoming a catalogue rather than a thesis. |

**Indicative weighted construction-readiness: 3.0/5.** This is a navigation aid only. It is not a thesis grade, novelty score or security rating. The low novelty score is deliberately weighted most heavily because originality is the largest unresolved academic risk.

## 3. Strongest reasoning already present

### 3.1 Separation of security properties

The manuscript correctly refuses to treat “secure” as one property. Confidentiality, sender authentication, identity verification, integrity, replay resistance, availability, concealment, metadata minimisation, unlinkability and recoverability have different mechanisms, assumptions and failure modes.

This is a strong foundation because it prevents a carrier or transport mechanism from inheriting guarantees it cannot provide.

### 3.2 Endpoint authority separated from carriage

The passenger/endpoint cryptographic topology is conceptually independent of the replaceable train, carrier and intermediary. The protected object should remain meaningful when the route changes. Transport framing and extraction do not become cryptographic authority merely because they are necessary for delivery.

This is the clearest architectural principle in the current work. It is not yet a novel protocol or a demonstrated security property.

### 3.3 Delivery is treated as a lifecycle, not a posting event

The thesis recognises that publication does not equal delivery. Discovery, retrieval, collection, decapsulation, validation, reassembly, expiry and recovery introduce distinct failure and privacy surfaces. Recipient discovery can undo privacy assumptions made at the carrier layer.

This is one of the most promising areas for a distinctive contribution, provided the comparison is rigorous and grounded in current private-retrieval and dead-drop literature.

### 3.4 Honest limits on carrier uniqueness and concealment

The distinction between non-reuse and cryptographic uniqueness, and between concealment and confidentiality, is essential. The manuscript correctly avoids deriving entropy, randomness, unpredictability, anonymity or traffic-analysis resistance from unique carriers, variable placement or metadata removal.

This is strong claim discipline, not novelty by itself.

### 3.5 Multipart safety is treated as a system property

The separation of transport arrival order from authenticated logical order, and the addition of explicit parser/reassembly resource budgets, improves the architecture's realism. These are defensible design requirements, but the proposed capsule format and thresholds remain unspecified.

## 4. Main bias risks

### B1 · Image-route commitment bias

Image carriage is a required research route by project decision. That is legitimate scope, but it creates a risk that the thesis will search for reasons to preserve it or portray it as more useful than alternatives.

**Countermeasure:** Treat image carriage as a fixed research subject, not a presumed winner. Define use cases in which it may be useful, neutral, inferior or unsuitable. Keep comparison profiles fair and apply the same threat model and evaluation criteria to each route.

### B2 · Architecture-by-accumulation

The architecture has gained useful components: endpoint keys, identity verification, message envelopes, multipart capsules, a train, image adapters, discovery, metadata controls, behavioural threats, expiry and recovery. More components can make the system look more complete without improving its central proposition.

**Countermeasure:** Every component must map to a research question, a threat or a necessary lifecycle function. Remove, defer or mark optional any component that does not justify its complexity.

### B3 · Novelty-by-combination

Combining known cryptography, steganography, media transport, rendezvous and lifecycle mechanisms does not automatically create a novel contribution.

**Countermeasure:** Identify the precise gap in prior work, explain why existing architectures do not already address it, and show what new model, distinction, evaluation method or result this thesis contributes. “Integrated architecture” is not enough unless the integration produces a demonstrable insight.

### B4 · Security-language inflation

Terms such as “anonymous”, “unlinkable”, “private”, “secure” and “untrusted” can sound stronger than the underlying model.

**Countermeasure:** For every such claim specify the observer, capability, visible information, collusion assumption, property, residual leakage and evidence status. Prefer bounded wording over absolute labels.

### B5 · Threat-model expansion without prioritisation

Adding every conceivable observer and human factor may make the thesis broad but analytically shallow.

**Countermeasure:** Separate primary adversaries, secondary observers and out-of-scope actors. Rank threats by relevance to the central research direction and explain excluded threats.

### B6 · Source-confirmation bias

Sources can be selected because they support existing design decisions, while contradictory or more recent work is missed.

**Countermeasure:** Maintain a prior-art challenge list for each proposed contribution. Search for the strongest competing system and the strongest argument that the proposed contribution is already known. Record adverse findings, not only supporting citations.

### B7 · Metaphor and terminology bias

The passenger/train metaphor helps explain separation, but may make the design appear more settled than it is or obscure technical interfaces.

**Countermeasure:** Use the metaphor as explanatory shorthand only. Every diagram and section must also name the actual component, interface, trust boundary, data and authority.

### B8 · Confidence-language inflation

"Confidence" is attractive as an organising idea but can become an untestable marketing term, a universal score or a substitute for security, trust and assurance. A polished interface can make weak evidence appear conclusive. Cryptographic validity can be mistaken for identity, truth or delivery; observer inference can be mistaken for authenticated linkage.

**Countermeasure:** Treat confidence as a verifier's judgement about a specific claim, grounded in provenance-aware evidence, scope, assumptions, threat model and freshness. Keep trust, assurance, security, authenticity, integrity, discoverability and truth distinct. Do not introduce a numeric score without calibration and explicit error costs. Evaluate whether the evidence model itself creates tracking metadata. See [the confidence and evidence model](confidence-and-evidence-model.md).

## 5. Candidate confidence/evidence framing

The thesis now uses the candidate principle: "The Invisible Postman does not promise certainty. It makes the basis, boundaries and limitations of confidence explicit." This is an organising proposition for the research, not a novelty claim and not a demonstrated system property.

Its potential value is methodological: it forces claims to be tied to a verifier, scope, evidence provenance, assumptions, freshness and unresolved alternatives. It also exposes important negative boundaries, particularly the difference between a valid cryptographic object and a true statement, between endpoint-authenticated linkage and observer correlation, and between transport acceptance and human reading.

The framing should be retained only if it improves claim precision, traceability and evaluation. It must not create a centralised evidence ledger, mandatory telemetry or a universal confidence score. Its usability and privacy costs remain unevaluated. The supporting [confidence and evidence model](confidence-and-evidence-model.md) is a proposed research artefact, not independent validation.

## 6. Prior-art pressure points identified

These sources were identified in the current assessment. SRC-033, SRC-034 and SRC-036 have expanded partial publisher-indexed text inspection, but not complete full-text review; SRC-035 was inspected as full publisher HTML; SRC-037 was inspected in full from a repository copy. Do not cite abstracts or records as full-paper analysis.

| Prior work | Pressure on our claims | Required response |
|---|---|---|
| Kombrink et al. (2024), image steganography and steganalysis survey, ACM Computing Surveys | Image embedding and detection are mature fields; broad invention claims are untenable. | Define the project contribution outside the generic act of hiding data in images. |
| Liu & Tromer (2022), Oblivious Message Retrieval | Private recipient detection/retrieval already has formal constructions and threat models. | Compare definitions, assumptions, costs and applicability; do not present discovery privacy as a new problem. |
| Liu et al. (2024), PerfOMR; Lee & Yeo (2026), SophOMR; Liang et al. (2026), InstantOMR | OMR has continuing performance refinements across communication, compression, latency and parallelisability. | Include current performance-oriented retrieval comparators. |
| Gouert et al. (2026), StOMR; Fisch et al. (2026), UnifOMR | StOMR's camera-ready paper defines stateful OMR and OMR-KEM shared-state establishment under a passive receiver-privacy model. UnifOMR's full 56-page primary paper is directly reviewed: malicious-detector privacy is distinct from completeness/soundness, which assume an honest-but-curious detector; malicious single-server integrity remains open; Algorithm 1's candidate truncation leaves a primary-text capacity-accounting ambiguity. SRC-053 is a secondary assessment now cross-checked against the primary text. | Preserve the capacity question as unresolved source-text accounting, not a demonstrated defect; seek author clarification or inspect an exact UnifOMR implementation before making stronger claims. |
| Shuhan et al. (2026), Oblivious Signaling, USENIX Security 2026 | A newer design shifts cost from retrieval to sending and changes the delivery cost model. | Add to the retrieval taxonomy and compare the sender/recipient/server cost allocation. |
| Bauer et al. (2024), Leveraging Generative Models for Covert Messaging: Challenges and Tradeoffs for Dead-Drop Deployments | Whole-pipeline dead-drop challenges and performance/security trade-offs have already been studied. | Do not claim that considering the full pipeline is itself novel. Identify what this thesis adds beyond that work. |
| Bauer et al. (2025), Provably Secure Covert Messaging Using Image-based Diffusion Processes | Formal image-based covert messaging exists in a related but different generated-image model. | Distinguish generated-image channels from embedding/reusing externally hosted image carriers; inspect the full paper. |
| Pasquini et al. (2021), media forensics on social platforms | Platform transformations and forensic traces are established research concerns. | Avoid claiming platform processing or metadata forensics as novel; identify any new cross-layer application or evaluation. |
| Wang et al. (2024), fragmented covert communication across many images (SRC-043); Ker (2007), batch steganography and pooled steganalysis (SRC-044); Ker (2007), asymptotic capacity theorem (SRC-045); Wei et al. (2022) and Zhu et al. (2021, 2023, 2025), active sanitization and counter-adaptation (SRC-036, SRC-046–SRC-048); Wang et al. (2026), multi-frame GIF steganography (SRC-049) | Multi-image fragmentation, redundant carriage, collection-level steganalysis, active payload sanitization, sanitizer-aware counter-adaptation and within-GIF frame redundancy are established comparator topics. SRC-043 uses robust watermarking; SRC-045 has explicit mathematical assumptions; SRC-048 is a keyed response to a known sanitizer; SRC-049 concerns one animated carrier, not multiple posts. | Do not claim novelty in multi-image fragmentation, redundant recovery, pooled detection, active sanitization or frame-level majority voting. Test any narrower proposition in endpoint-authenticated set semantics, observer-specific linkage, package boundaries or cross-route invariants. |
| Kumar et al. (2026), MRAS and DRAS; Qiao et al. (2023); Zhu et al. (2021); Kombrink et al. (2025), image steganography/steganalysis | Image-platform payload robustness, social-network transformation, active payload removal and steganalysis are established topics with recent real-platform evaluations. | Do not claim image payload survival, recompression tolerance or concealment alone as a differentiator. Separate extraction, detectability, endpoint authentication/integrity and observer privacy. |
| Infeld et al. (2025), Echomix / Katzenpost | Integrated global-observer messaging already combines traffic coupling, anonymous discovery/storage, reliability, collusion analysis and human-routine leakage. | Do not claim a general integrated delivery-privacy architecture or responsibility separation as new. Compare the image-platform boundary against this stronger integrated baseline. |

## 7. Candidate contribution statements to test

These are candidates, not approved claims.

**Candidate A — Responsibility-separated architecture**

A theory-led architecture that keeps participant cryptographic authority independent of a replaceable, untrusted carriage system, while defining the authenticated boundary between protected message semantics and route-specific packaging.

- Strength: coherent, understandable and directly supported by the current design reasoning.
- Weakness: architectural separation is a familiar systems principle; novelty depends on a precise comparison with existing secure messaging and covert-messaging architectures.

**Candidate B — Cross-layer image-platform carriage analysis**

A bounded comparison of ordinary image-platform carriage with established file, conventional messaging and mixnet-backed messaging routes, using common endpoint objectives and explicit observer/event models to identify media-transformation, metadata, discovery, retrieval or failure differences.

- Strength: focuses on a route-specific boundary not directly studied by the integrated Echomix messaging design, while retaining the project's required image-carriage scope.
- Weakness: the difference may be merely descriptive or already covered by image-forensics/dead-drop research. It needs a reproducible, decision-relevant result and must be narrowed or abandoned if no such result survives.

**Candidate C — Route-independent message semantics with image-carriage comparison**

A route abstraction and comparative evaluation framework in which one protected message object is considered across image, file/attachment and conventional messaging routes, with route-specific transformations, metadata, discovery, capacity, reliability and failure behaviour.

- Strength: potentially useful to system designers; makes image carriage testable against simpler alternatives.
- Weakness: a comparison table alone is not a contribution. It needs a defensible taxonomy, reproducible evaluation method or new insight.

**Current direction:** A remains the architectural organising principle, not a novelty claim. Candidate C supplies the comparison method. Candidate B is now narrowed to image-platform carriage and must earn its place through a measurable, decision-relevant difference against the stronger integrated baseline. No contribution ranking is final.

### Cross-profile discovery challenge result · 18 November 2026

The source-audited six-profile comparison now gives Candidate B and Candidate C a sharper test, but it does not yet satisfy either candidate's contribution condition.

- The comparison is a documentary evidence map across three image-literature profiles, one file-host documentation profile, one protocol-plus-documentary-service profile and one integrated mixnet/messaging comparator. The evidence types are intentionally asymmetric.
- It identifies a recurring evidence boundary: endpoint authentication can reject an invalid object that arrives, while a service-reported event supports only a bounded claim about that service's own action. Neither alone proves intended publication, complete candidate enumeration, endpoint acceptance or the cause of absence.
- This is not a newly demonstrated attack, a new privacy guarantee or a measured cross-route outcome. The falsifiable test plan is specified but has not been executed.
- SRC-043's native receiver is deliberately tolerant of missing carriers: it majority-votes redundant copies and marks missing fragment bytes with `?`. Its published loss benchmark (1,000 images, 208 fragments, r=4) reports a byte-recovery rate, including 61.1% of bytes at 80% carrier loss; this is not a complete authenticated-message acceptance rate. A project-specific authenticated manifest and fail-closed acceptance gate would be an additional endpoint layer, not a property demonstrated by SRC-043. The smallest semantic fixture is S=2 fragments with r=4 carriers per fragment; its results must not be conflated with the paper's benchmark.
- Pigeonhole's AllOrNothing specification claims atomic success/failure for associated writes from the replica/second-party reader's perspective. The pinned `v0.0.90` source review adds an unresolved specification/implementation question: the courier dispatches destination envelopes sequentially, returns failure at the first failed envelope after earlier successful writes may already be persisted, and the inspected failure path contains no rollback of that prefix. Whether a reader with the destination capability can observe it is not established by code inspection alone. The pinned `katzenqt 0.0.2` application receive path separately stores received pieces and dispatches a message only after its own terminal-`F` contiguous-chain assembler succeeds; this is application-level display gating, not AllOrNothing or atomic storage, and the client is pre-alpha/not suitable to rely on for privacy. The thin-client v0.0.23 Copy-command API is sender-side (temporary-stream WriteCap plus optional courier identity/queue) and exposes no reader-side commit operation; the same library does expose separate ReadCap operations. Its default read API retries `BoxIDNotFound` until the box appears, so the probe now uses the no-retry variant for timed observations. The courier caches terminal Copy status for 30 minutes by temporary-stream WriteCap, so same-cap reissues during that period do not re-run the write path. Existing tests read multi-channel destinations after success, while the failure test rejects the first envelope, leaving the successful-prefix/later-failure reader case untested. The probe also treats RocksDB Put acceptance as a store event, not crash-durable persistence. This makes reader-visible set atomicity a sharper test target, not a confirmed vulnerability. Any novelty claim must be narrower than generic multi-object completeness and compare route-native atomicity with endpoint-managed partial-set detection. The image, Dropbox and Signal source profiles do not establish equivalent arbitrary cross-object set semantics, but that is an evidence gap, not proof that those products lack such functionality.
- Dropbox's viewer information is conditional: owner/editor file activity, configurable viewer information, plan-dependent history, Guest treatment and direct-download omissions must be preserved. A view-only shared link can be previewed without an account, but direct shared-folder Can view membership may still allow download/share/comment; download disabling is a shared-link control, not a direct-sharing control. Link settings do not govern direct/existing access, and no owner-facing viewer-info omission proves provider-side event absence. Do not claim that every link access is attributable to a named person.
- Signal is no longer only a protocol reference: current Support pages and a pinned public Signal-Server source snapshot provide selected product/service semantics, including per-device queues, acknowledgement and linked-device lifecycle. They still do not constitute a deployed-service or account audit. Keep PQXDH's initial-message replay caveat, Double Ratchet's bounded skipped-message handling, server delivery acknowledgement and optional Read receipt as separate layers.
- No actual Dropbox account/link, shipped Signal client/service configuration or compatible Katzenpost deployment is pinned. The six-profile result therefore remains documentary and cannot support a deployment ranking.
- The route framework and thesis now include set-level atomicity/completeness as an explicit comparison and evaluation dimension. Pigeonhole AllOrNothing is a native comparator with a bounded reader model; the test must compare partial visibility, incomplete-set handling and evidence provenance without assuming that non-specified services lack equivalent features.
- Pinned source inspection at `katzenpost v0.0.90` shows sequential destination writes and no rollback of a successful prefix in the inspected failure path. The specification's reader-atomicity claim therefore needs a read-side test with a pre-existing recipient capability; a second control should disclose the capability only after sender success. The source has not been executed, and no reader-visible failure is asserted.

### Known mechanisms versus the remaining contribution candidate

| Element | What the current evidence says | Contribution status |
|---|---|---|
| Multi-image fragmentation and redundant recovery | SRC-043 already fragments files, repeats fragments across carriers, majority-votes duplicates and supports partial byte recovery when fragments are missing. | Known prior art; not a contribution claim. |
| Set-level copy/batch semantics | Pigeonhole specifies AllOrNothing; pinned source dispatches sequentially and the inspected tests do not cover a successful prefix followed by later failure with a concurrent reader. | Known mechanism with an unresolved implementation/reader-evidence question; not a new primitive. |
| Application-level incomplete-set gating | katzenqt 0.0.2 stores pieces and withholds conversation-log dispatch until a contiguous terminal-F chain is assembled. | Existing app-level behaviour in an immature client; not evidence of atomic storage or a privacy guarantee. |
| Cryptographic validity, membership and completeness | Authenticated manifests, replay policy, fragment membership and whole-object validation are standard protocol obligations already identified in the research. | Required design discipline; novelty not established by naming the states. |
| Private discovery and intermediary-observer separation | OMR/GOMR, PerfOMR/SophOMR/InstantOMR, stateful StOMR, PIR-related UnifOMR, Oblivious Signaling, Remise and Echomix/Pigeonhole already supply distinct retrieval, state-establishment, efficiency, anonymity, non-collusion and role-separation models. A third-party UnifOMR integration adds service-level completeness flags, cursor recovery and PIR/fallback composition (SRC-050–052). | Existing prior art; generic claims are excluded. StOMR and UnifOMR primary papers directly reviewed; selected StOMR artifact source inspected; no identifiable official UnifOMR implementation built or run. SRC-053 is secondary corroboration cross-checked against the UnifOMR primary text; SRC-052 remains an experimental third-party integration, not production evidence. |
| Typed completeness and cross-carrier acceptance/evidence comparison | The thesis distinguishes byte recovery, storage atomicity, application continuity, retrieval-window coverage, authenticated fragment-set completeness, endpoint logical-message acceptance, publication/index completeness and human receipt. SRC-052 shows service-level range completeness and retry are already implemented patterns; the remaining question is whether authenticated cross-carrier manifest membership and whole-object acceptance add a distinct route-relevant property. | Narrow Candidate C to a reproducible comparison of typed completeness/evidence scopes across heterogeneous routes. It remains a candidate only if it changes route choice or exposes a material failure/assurance gap beyond SRC-043, Pigeonhole/katzenqt and the SRC-052 integration; otherwise retire it. |

The detailed mechanism-by-mechanism crosswalk is now in [prior-art comparison §2 comparative matrix](prior-art-comparison.md#2-comparative-matrix); it should be used as the source for any later novelty statement.

The defensible direction is therefore **not** “invent multi-image fragmentation” or “invent atomic multi-object delivery.” It is to specify and critically evaluate an endpoint acceptance contract that remains authoritative while routes expose different native units and evidence: partial carrier recovery (SRC-043), a single file object (Dropbox), per-message cryptographic state (Signal), and capability-addressed asynchronous writes (Pigeonhole). The contract must not claim that every route provides the same delivery semantics. Its value would be that partial reconstruction, service acknowledgement, protocol write completion and authenticated logical-message acceptance cannot be confused.

This remains a systems/analysis contribution candidate, not an established novelty claim. It survives only if the thesis maps the contract precisely to prior art, identifies a concrete decision it changes, and demonstrates the distinction through a reproducible route evaluation or a rigorous counterexample. Otherwise present it as a careful synthesis and narrow the contribution claim.

**Current contribution judgement:** Candidate A remains an architectural organising principle, not a novelty claim. Candidate C remains a possible method contribution only if a repeatable route-comparison procedure produces decision-relevant outputs beyond the current table. Candidate B remains conditional on identifying and measuring a specific image-platform difference that is not already covered by media-forensics, dead-drop or integrated messaging work. No contribution score is increased. If a pinned evaluation cannot produce such a difference, narrow or retire Candidate B rather than protecting it by assertion.

### Candidate D · Privacy-preserving verifiable message-set closure

The APIR/AAD comparison identifies a possible extension beyond the retired receiver-acceptance mechanism, but generic private result-set completeness is no longer an open claim. APIR (2023) provides multi-server authenticated point and predicate/aggregate queries under an at-least-one-honest-server model; its single-server construction is for point queries and requires an out-of-band database digest (SRC-054); vPIR (2022) proves local/global database properties while hiding a queried index (SRC-057); multi-query vPIR (2025) binds multiple point answers to one database through APIR and a SNARK (SRC-058). Two 2024 encrypted-range-query papers also claim privacy-preserving range search with result verification: Nie et al.'s VPRQ (SRC-059, abstract/introduction only) and Basudan/Alamer's leakage-suppressed range query (SRC-060, full paper reviewed). The latter uses trusted data owners/seekers and a primarily semi-honest cloud; the inspected formal theorem proves IND-SCPA trapdoor privacy, while no separate malicious-cloud soundness theorem was located. Most directly for PIR, the 2026 APIR range-query paper claims soundness and completeness for variable-size private range results over a static owner-signed database (SRC-056). Its indexed full-text extract also acknowledges leakage from query access count, timing and communication volume; the full PDF remains inaccessible in this review. AAD (SRC-055) proves all-and-only keyed lookup and append-only/fork-consistent evolution, but its AAS model has no authenticated user identities; fork detection depends on external view comparison/gossip, and the paper does not model the network-connectivity assumptions required. AAD notes VRF compatibility for path derivation, not full access-pattern privacy. Its q-PKE/q-SBDH construction requires trusted setup and reports high memory/append costs. OMR supplies recipient-pertinence privacy, and SRC-052 demonstrates service-scoped completeness and cursor recovery. None of these individual elements can be claimed as new.

The conditional gap is narrower: can a recipient verify every record matching an OMR-specific hidden recipient predicate in a dynamic authenticated publication snapshot, without leaking query-dependent access volume or cross-epoch linkage, and then verify that the retrieved carriers close into a sender-authenticated, hiding multi-carrier manifest? The model must distinguish sender intent, authenticated admission, retrieval completeness and logical-object closure. A log proves only what entered its authenticated scope; it cannot prove that an intended but never-submitted carrier existed. A manifest proves only the set the sender committed to, not that the commitment captured all of the sender's intent. The range-APIR construction is a direct baseline for static ordered predicates, not a reason to ignore dynamic publication, OMR's detector semantics or sender admission.

Candidate D is a **new research direction, not a novelty claim**. It advances only if a formal model and full nearest-prior-art comparison show that this OMR-specific dynamic-predicate/admission/manifest composition is not already supplied by VPRQ, the 2024 leakage-suppressed range scheme, APIR-range, vPIR, multi-query vPIR, AAD, OMR or the downstream integration, and if the proof and interaction costs remain useful. A rigorous impossibility or privacy/efficiency trade-off result would also be valuable. UnifOMR's candidate-capacity ambiguity and StOMR's state-recovery question are supporting lines, not substitutes for this main test.

The formal decomposition in [prior-art comparison §4.2](prior-art-comparison.md#42-candidate-d-formal-property-model-and-negative-boundary) separates record soundness, predicate completeness, snapshot consistency, append/fork consistency, query privacy, admission evidence, manifest closure and endpoint acceptance. It also states a limited pre-admission-omission indistinguishability boundary: a verifier seeing only an authenticated snapshot cannot distinguish a sender who intended exactly the committed records from one whose additional intended carrier was never submitted. This is not a proof that every Candidate D construction is impossible; it shows why a sender-authenticated manifest or admission receipt must be independently available.

The 18 November source pass also inspected the APIR companion code at current-main commit `7a7f2041bc1e0907ef089f8e8e55252ef7f18e0f` and the AAD C++ proof headers at commit `2f31566bbdac4891df45eee2e9268bc4681533dd`. The exposed APIR predicate path returns a scalar aggregate and its current PGP implementation leaves SUM unimplemented; the AAD code exposes complete-membership and append-only proof paths. Neither repository was built or tested. Reported costs reinforce the composition risk: APIR predicate computation is at least 350× its point-query path; AAD lookup proofs are about 95 KiB for 32 values at 10^6 entries and take about 2.5 seconds to verify, with high append and memory costs. The 2026 range-APIR full paper remains unavailable, so its exact proof/communication cost is unresolved.

A concrete path now under examination is APIR predicate-count plus APIR point retrieval. If a hidden OMR signal-membership function is supported by an efficient FSS, APIR can authenticate the count of matching rows; each detector-returned index can then be fetched and authenticated as a point query. After local predicate checking and deduplication, equality between the unique valid candidate count and the authenticated count proves completeness relative to one immutable database snapshot. This is a conditional cardinality argument, not a construction already evaluated in the OMR setting. It requires the same snapshot/epoch for both APIR query types, an FSS for the batched OMR signal set, padding to control query-count leakage, and independent sender-manifest/admission evidence. A malicious detector can still force an abort; it cannot be made to deliver unavailable records.

### Protocol-composition boundary

The protocol-boundary analysis now makes key hierarchy, authenticated identity/transcript binding, HKDF salt versus `info`, AEAD nonce uniqueness, associated-data visibility, replay/order state, multipart validation and downgrade-resistant fallback explicit. These are necessary correctness obligations for any credible route-independent messaging architecture; their enumeration is not, by itself, a novel contribution. The underlying primitives and many of the relevant protocol mechanisms are established in standards and prior systems. Any eventual contribution must be demonstrated at the system boundary: for example, a defensible model of how endpoint-authenticated message and set semantics remain invariant across replaceable routes while route-specific observers, discovery, transformation and delivery events differ. That proposition remains theoretical and unvalidated. See [protocol boundary analysis](protocol-boundary-analysis.md), W2–W4 and RQ2/RQ4 traceability.

The 17 November retrieval pass expanded publisher-preview evidence for MRAS, DRAS and active sanitisation, located and inspected the SRC-047 author repository README, and added abstract-level detail for SRC-049. It did not obtain complete papers for SRC-033, SRC-034, SRC-036, SRC-046 or SRC-048, inspect SRC-047 implementation/model files, or review SRC-049's formal proof and complete results. The relevant source-register entries retain partial-review status. These additions strengthen the prior-art pressure but do not establish any new novelty claim.


### Receiver-acceptance candidate narrowed · 18 November 2026

The source-audited crosswalk now rules out treating the endpoint acceptance sequence itself as a novel mechanism. Authenticated membership, completeness, whole-object validation and freshness/replay handling are standard endpoint protocol obligations; StOMR/OMR work concerns private retrieval and state, while SRC-052 demonstrates service-scoped range completeness and retry. None should be relabelled as a new contract.

Candidate C is narrowed to a reproducible cross-route evaluation method: hold the protected endpoint object and validation policy constant, preserve route-native units (image fragment set, single file, per-message protocol state, capability-addressed copy and private retrieval window), inject comparable faults where applicable, and keep endpoint ground truth, service-reported events and observer inference in separate evidence ledgers. Its contribution condition is strict: a controlled result or rigorous counterexample must change a declared route decision, invalidate a material assurance claim, or expose a failure/evidence ambiguity not already made explicit by the closest prior art. A richer matrix or a generic list of protocol obligations is insufficient. If no such result emerges, retain the method as careful synthesis and make no originality claim.

The crosswalk also clarifies the OMR boundary: private retrieval/receiver-privacy does not prove global publication or candidate-view completeness, and endpoint manifest validation does not prove private discovery or availability. These properties must be evaluated independently. SRC-051 UnifOMR is now a direct review of the full 56-page primary paper; its two-round clue-detection/batch-PIR construction, malicious-detector privacy versus honest-but-curious completeness/soundness boundary, and unresolved candidate-capacity accounting ambiguity are recorded in the source register and prior-art comparison. The cited repository does not expose an identifiable UnifOMR implementation; SRC-052 remains a third-party experimental integration whose reported test status has not been independently reproduced.

## 8. Required evidence before claiming originality

1. A focused related-work matrix covering secure messaging architectures, covert/dead-drop messaging, image steganography, recipient discovery/private retrieval, mix networks/traffic analysis and media-platform transformations.
2. Full-text review of the newly identified works, including formal definitions, threat models, construction, assumptions, limitations and evaluation.
3. A direct comparison of the proposed architecture against the closest existing systems, not just against isolated primitives.
4. A concise statement of what prior systems do not address, supported by evidence rather than absence-of-search.
5. A contribution statement that remains meaningful even if image carriage proves inferior in the target use case.
6. A falsifiable evaluation plan with named observers, measurable leakage, route baselines, transformations, resource costs and justified thresholds.

## 9. Hard checkpoint decision

**Proceed with thesis construction, but do not yet present originality as established.**

The strongest current thesis is not “a new image steganography system” and not “a new cryptographic messaging protocol”. Neither claim is supported.

The strongest current direction is a controlled comparison of ordinary image-platform carriage against file, conventional messaging and mixnet-backed messaging, while holding endpoint security objectives constant and recording route-native guarantees, observer capabilities, transformations, discovery, reliability and human interaction. The expanded image-carriage literature further constrains the claim: carrier robustness, concealment, fragmented multi-image carriage, redundant recovery, pooled detection, active sanitization, sanitizer-aware counter-adaptation and animated-frame redundancy are established areas. The comparison must establish a complete-route difference rather than repeat an embedding, sanitization or reconstruction result. Any residual proposition around authenticated message-set semantics or observer-specific linkage remains unproven and must be tested against SRC-043–SRC-049. Echomix means that broad integrated lifecycle framing is not a differentiator.

### 9.1 Result of the six-profile discovery pressure test · 18 November 2026

The comparison has **not yet produced a decision-relevant substantive contribution beyond an evidence-bounded comparative map and a falsifiable evaluation method**. Its strongest result is a negative but useful decision: the present documentary evidence does not justify preferring image carriage, claiming an image-specific privacy/reliability advantage, or claiming that the proposed architecture closes discovery and delivery-evidence gaps. The image route remains in scope by project decision, but that does not make it superior or novel.

The six-profile matrix identifies where the sources place authority and which event/evidence classes they document. It does not measure a common deployment. The current strongest comparator, Echomix/Pigeonhole, has native capability-based access, role separation, AllOrNothing stream semantics and explicit collusion analysis; the current compatible source tags are now pinned, but the implementation is pre-alpha/unaudited, the Qt client is explicitly not suitable to rely on for anonymity/security/privacy, and no configured deployment or service-event capture has been evaluated. Dropbox's view-only-link and direct-invitation paths expose different identity/permission conditions; Signal's client release tags do not pin its backend or account behaviour. These details improve the profile definition, not the evidence maturity.

The 18 November matrix audit removed source-specific parameter and product-UI diagnostics from the common fault-injection table and separated the minimum discriminating cases from conditional duplicate/conflict/order/replay extensions. The first controlled comparison is staged around three primary treatments: SRC-043-style multi-image carriage, a single-file Dropbox object and raw Pigeonhole AllOrNothing; `katzenqt` is a separate application-gate observation, Signal remains a protocol/service reference, and OMR-family systems remain retrieval comparators. This is a smaller and more defensible experiment than a full route-by-fault factorial. It is still only a design: no controlled result exists. The Pigeonhole source/specification tension is not a rigorous counterexample until concurrent reader visibility is observed; UnifOMR's capacity question is a paper-text ambiguity, not a demonstrated failure; SRC-043's partial byte recovery is established prior art. Therefore the matrix audit does not satisfy Candidate C's contribution condition.

**Contribution disposition:** retain Candidate A as an architectural organising principle, not a novelty claim; retain Candidate C as a comparison method that must be made reproducible and decision-relevant; keep Candidate B as a research target, not an established contribution. Candidate B earns a place only if a defined use case and controlled, version-pinned comparison reveal a measurable route-specific benefit, leakage, failure mode or decision that is not already explained by the closest image-forensics, dead-drop, private-retrieval or integrated-messaging literature. If no such result emerges, report that negative result and narrow the thesis rather than inflate the framework into a novelty claim.

The next research batch should prioritise:

1. Complete full-text review of SRC-033–SRC-037, prioritising the methods and evaluation details of MRAS and DRAS.
2. Apply the route comparison framework to named, versioned profiles and explicit observer/event ledgers.
3. Compare image-platform transformations and observables with media-forensics and dead-drop systems.
4. Identify a reproducible, decision-relevant difference; revise or retire Candidate B if none survives.
5. Only then, decide which planned diagrams are stable enough to communicate the actual contribution.

**Go decision:** Continue. The architectural reasoning is strong enough to justify further work, and the privacy/lifecycle question has real research value. The originality claim remains conditional. Do not pause the thesis for routine review or illustration work; do not let the required image route dictate the conclusion.

**Theory only · No implementation · Not audited.**
