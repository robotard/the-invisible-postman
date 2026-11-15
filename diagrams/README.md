# Illustration and Diagram Index

**Project status:** Theory only · No implementation · Not audited.

This index distinguishes existing historical/conceptual illustrations from figures proposed for the integrated thesis. A planned figure is not an existing asset, an implementation diagram or evidence that a property has been achieved.

## Existing illustrations

| Figure | File | Thesis context | Purpose and limitation |
|---|---|---|---|
| 01 · From idea to architecture | [01-ideation-and-design-evolution.svg](01-ideation-and-design-evolution.svg) | Section 2.3 | Explains the initial password/image idea and the evolution of the research. It is a design-history map, not a protocol flow. |
| 03 · Design decisions | [03-design-decisions.svg](03-design-decisions.svg) | Section 2.3; decision discussion | Summarises selected decisions and their rationale. It does not replace the decision register or imply that every decision is final. |

## Planned thesis illustrations

These figures should be designed only after the manuscript, terminology and supporting research documents have been reconciled. Their order is a reading sequence, not a development or implementation sequence.

| Proposed figure | Intended thesis location | What it should explain | Guardrail |
|---|---|---|---|
| 02 · Research proposition and system boundary | Sections 1–3 | The problem, participants, endpoints, intermediaries, research proposition and scope | Must not suggest the architecture is deployed or validated |
| 04 · Security properties and responsibility map | Section 4 | Confidentiality, sender authentication, identity verification, integrity, replay resistance, availability, concealment, metadata minimisation and unlinkability | Do not merge distinct properties into a generic “security” label |
| 05 · Trust boundaries and observer model | Section 5 | Endpoint trust, intermediary capabilities, network/platform observers, attacker access and residual endpoint risk | Distinguish who is trusted from who merely handles data |
| 06 · Endpoint cryptographic architecture | Section 6 | Identity/key verification, authenticated key establishment, message protection, authenticated context and endpoint validation | Candidate primitives must not look like a selected or complete protocol |
| 07 · Envelope and multipart validation | Section 7 | Message envelope, manifest, capsules, out-of-order arrival, completeness checks and rejection paths | Distinguish arrival order from authenticated logical order; fragmentation is not secret sharing |
| 08 · Transport-method comparison | Section 8 | Common protected object across image, file/attachment and conventional messaging route profiles | Do not imply equivalent delivery semantics or image-route superiority |
| 09 · Image carriage and decapsulation | Section 8 | Unique image envelope, carrier processing, optional concealment, extraction and endpoint handover | Carrier and concealment do not provide cryptographic protection |
| 10 · Discovery, collection and observation | Section 8 | Publication, rendezvous/discovery, retrieval, collection, platform/network visibility and behavioural correlation | Variable placement and unique carriers do not guarantee anonymity |
| 11 · Lifecycle, revocation and recovery boundaries | Section 9 | Session/key lifecycle, device loss, expiry, revocation and optional recovery | Show what cannot be recalled after plaintext or keys are obtained |
| 12 · Claim-to-evidence traceability | Section 10 | Research questions, objectives, threats, components, tests and evidence maturity | Separate proposals, tested observations and independently reviewed claims |

## Figure design rules

1. Place each figure beside the argument it explains; do not collect all diagrams at the end as a substitute for exposition.
2. Use consistent names for endpoints, participant-side cryptographic topology, transport element, carrier, envelope, capsule, intermediary, discovery and collection.
3. Show trust boundaries and direction of authority explicitly. A data-flow arrow must not imply that a component is trusted.
4. Distinguish required research scope, optional mechanisms, comparison profiles, unresolved choices and residual risks.
5. Do not depict candidate algorithms as selected protocol components.
6. Do not imply that image uniqueness, steganography, metadata removal or variable placement establishes anonymity or cryptographic integrity.
7. Provide meaningful accessible descriptions and keep editable SVG source. Export high-quality PNG only when the figures are ready for publication.
8. Verify every figure against the thesis and W1–W4 before embedding it.

**Current state:** Figures 01 and 03 exist. Figures 02 and 04–12 are proposed only. No new artwork is being created at this stage.

**Theory only · No implementation · Not audited.**
