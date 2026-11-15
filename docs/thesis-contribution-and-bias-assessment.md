# Thesis Contribution and Bias Assessment

**Checkpoint:** 2026-11-15  
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

**Countermeasure:** Separate primary adversaries, secondary observers and out-of-scope actors. Rank threats by relevance to the central proposition and explain excluded threats.

### B6 · Source-confirmation bias

Sources can be selected because they support existing design decisions, while contradictory or more recent work is missed.

**Countermeasure:** Maintain a prior-art challenge list for each proposed contribution. Search for the strongest competing system and the strongest argument that the proposed contribution is already known. Record adverse findings, not only supporting citations.

### B7 · Metaphor and terminology bias

The passenger/train metaphor helps explain separation, but may make the design appear more settled than it is or obscure technical interfaces.

**Countermeasure:** Use the metaphor as explanatory shorthand only. Every diagram and section must also name the actual component, interface, trust boundary, data and authority.

## 5. Prior-art pressure points identified

These sources were identified in the current assessment. Only the abstracts, publisher summaries or specified overview material were inspected for the newly identified works; they must not be cited as full-paper analysis.

| Prior work | Pressure on our claims | Required response |
|---|---|---|
| Kombrink et al. (2024), image steganography and steganalysis survey, ACM Computing Surveys | Image embedding and detection are mature fields; broad invention claims are untenable. | Define the project contribution outside the generic act of hiding data in images. |
| Liu & Tromer (2022), Oblivious Message Retrieval | Private recipient detection/retrieval already has formal constructions and threat models. | Compare definitions, assumptions, costs and applicability; do not present discovery privacy as a new problem. |
| Liu et al. (2024), PerfOMR | OMR has concrete performance and communication refinements. | Include current performance-oriented retrieval comparators. |
| Shuhan et al. (2026), Oblivious Signaling, USENIX Security 2026 | A newer design shifts cost from retrieval to sending and changes the delivery cost model. | Add to the retrieval taxonomy and compare the sender/recipient/server cost allocation. |
| Bauer et al. (2024), Leveraging Generative Models for Covert Messaging: Challenges and Tradeoffs for Dead-Drop Deployments | Whole-pipeline dead-drop challenges and performance/security trade-offs have already been studied. | Do not claim that considering the full pipeline is itself novel. Identify what this thesis adds beyond that work. |
| Bauer et al. (2025), Provably Secure Covert Messaging Using Image-based Diffusion Processes | Formal image-based covert messaging exists in a related but different generated-image model. | Distinguish generated-image channels from embedding/reusing externally hosted image carriers; inspect the full paper. |
| Pasquini et al. (2021), media forensics on social platforms | Platform transformations and forensic traces are established research concerns. | Avoid claiming platform processing or metadata forensics as novel; identify any new cross-layer application or evaluation. |

## 6. Candidate contribution statements to test

These are candidates, not approved claims.

**Candidate A — Responsibility-separated architecture**

A theory-led architecture that keeps participant cryptographic authority independent of a replaceable, untrusted carriage system, while defining the authenticated boundary between protected message semantics and route-specific packaging.

- Strength: coherent, understandable and directly supported by the current design reasoning.
- Weakness: architectural separation is a familiar systems principle; novelty depends on a precise comparison with existing secure messaging and covert-messaging architectures.

**Candidate B — End-to-end delivery privacy analysis**

A lifecycle model that treats publication, recipient discovery, retrieval, collection, decapsulation, validation and human/metadata correlation as one connected privacy problem rather than treating carrier concealment as the whole delivery problem.

- Strength: the strongest candidate for a distinctive analytical contribution, especially if the thesis produces a useful observer/property matrix and demonstrates where privacy assumptions fail across layers.
- Weakness: dead-drop messaging and oblivious retrieval already address substantial parts of this space. The exact gap must be established against those works.

**Candidate C — Route-independent message semantics with image-carriage comparison**

A route abstraction and comparative evaluation framework in which one protected message object is considered across image, file/attachment and conventional messaging routes, with route-specific transformations, metadata, discovery, capacity, reliability and failure behaviour.

- Strength: potentially useful to system designers; makes image carriage testable against simpler alternatives.
- Weakness: a comparison table alone is not a contribution. It needs a defensible taxonomy, reproducible evaluation method or new insight.

**Provisional direction:** B as the main research contribution, supported by A as the architectural foundation and C as the evaluation method. This is the best current hypothesis, not a settled conclusion.

## 7. Required evidence before claiming originality

1. A focused related-work matrix covering secure messaging architectures, covert/dead-drop messaging, image steganography, recipient discovery/private retrieval, mix networks/traffic analysis and media-platform transformations.
2. Full-text review of the newly identified works, including formal definitions, threat models, construction, assumptions, limitations and evaluation.
3. A direct comparison of the proposed architecture against the closest existing systems, not just against isolated primitives.
4. A concise statement of what prior systems do not address, supported by evidence rather than absence-of-search.
5. A contribution statement that remains meaningful even if image carriage proves inferior in the target use case.
6. A falsifiable evaluation plan with named observers, measurable leakage, route baselines, transformations, resource costs and justified thresholds.

## 8. Hard checkpoint decision

**Proceed with thesis construction, but do not yet present originality as established.**

The strongest current thesis is not “a new image steganography system” and not “a new cryptographic messaging protocol”. Neither claim is supported.

The strongest defensible direction is a critical, lifecycle-wide architectural study of endpoint-controlled messaging over replaceable untrusted carriage, with particular attention to the interaction between image carriage, recipient discovery and cross-layer privacy leakage.

The next research batch should prioritise:

1. Full-text comparison of OMR, PerfOMR and Oblivious Signaling.
2. Full-text comparison of the 2024 dead-drop pipeline and 2025 image-diffusion work.
3. A prior-art matrix mapping each candidate contribution to what existing work already does and what remains distinct.
4. A sharpened central research question and contribution statement based on that matrix.
5. Only then, decide which planned diagrams are stable enough to communicate the actual contribution.

**Go decision:** Continue. The architectural reasoning is strong enough to justify further work, and the privacy/lifecycle question has real research value. The originality claim remains conditional. Do not pause the thesis for routine review or illustration work; do not let the required image route dictate the conclusion.

**Theory only · No implementation · Not audited.**
