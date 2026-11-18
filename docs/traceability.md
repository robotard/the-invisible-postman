# The Invisible Postman: Research and Design Traceability

**Status:** Working traceability register  
**Research basis:** W1 Research Framing, W2 Threat Model, W3 Architecture, W4 Risks and Evaluation  
**Assurance:** Theory only · No implementation · Not audited

## 1. Purpose

This document records how research questions and identified threats influence the proposed architecture, how design responses should be evaluated, and how critical feedback should be connected to changes in the research.

It preserves the reasoning chain from research to design. It must not imply that a proposed mitigation has been implemented, tested or independently verified. The [prior-art comparison](prior-art-comparison.md) records the current full-text comparison of recipient-retrieval and covert-carriage systems; its conclusions remain provisional.

The governing design principle is:

**Complexity must earn its place through a demonstrable improvement or another stated research objective.**

The governing research ethos is:

> **Never confuse agreement with progress.**

The authors remain responsible for examining their own assumptions and claims. External criticism is invited to deepen, challenge and improve the work. Reasoned dissent and unresolved questions must remain traceable rather than being collapsed into artificial consensus.

See [Research Practice: Critical Self-Examination and Collaborative Scrutiny](research-practice.md) for the method and [Initial Self-Review and Challenge Register](self-review-register.md) for the current author-identified challenges.

## 2. Research question traceability

The identifiers below follow the ten supporting questions in Thesis §1.3 and W1 §3. They are kept in the same order so that a reader can move from the thesis question to its threat, architecture and evaluation evidence without translating between competing numbering schemes.

| Research question | Research concern | Architectural response | Evaluation reference |
|---|---|---|---|
| RQ1 · Identity and trust | What does key verification establish, and what does it not prove about a human identity? | Identity and key-management boundary; explicit first-contact verification and key-change handling | W2 §§4, 6–7; W3 §3.2; W4 E2, E7 |
| RQ2 · Cryptographic composition | How are authenticated key establishment, confidentiality, sender authentication, integrity, replay resistance and key lifecycle composed? | Endpoint-held key authority; authenticated transcript; scoped key schedule; nonce, AAD and replay obligations | W2 §§6–7; W3 §§3.1, 3.3–3.4, 3.8, 3.10; W4 E1–E4, E7–E8; [protocol boundary analysis](protocol-boundary-analysis.md); SRC-041–SRC-042 |
| RQ3 · Intermediary exposure | What can intermediaries and observers learn, alter, correlate or deny? | Least-privilege coordinator; standalone train; explicit trust and data boundaries | W2 §§2, 4–5; W3 §§2.4, 3.6–3.7; W4 E1, E6, E9 |
| RQ4 · Message structure | How are message context, envelopes, multipart capsules and manifests bound and validated, and how are relationship authority and receiver acceptance distinguished? | Versioned protected envelope; canonical authenticated context; authenticated manifest; bounded parsing and set reconstruction; typed fragment, conversation, retry, redundancy and cross-route relationships; distinguish byte recovery, storage atomicity, application continuity, retrieval-window coverage, fragment-set completeness, endpoint acceptance, publication completeness and human receipt | W1 §7; W2 §§3, 5–7; W3 §2.4 and relationship-authority/receiver-acceptance boundary; W4 E3–E5; [protocol boundary analysis](protocol-boundary-analysis.md); [multi-message linkage analysis](multi-message-linkage-and-steganographic-carriage.md) §6.1; [prior-art comparison](prior-art-comparison.md) §10.3; [route/fault/evidence matrix](route-fault-evidence-matrix.md); SRC-040, SRC-043, SRC-052 |
| RQ5 · Carriage methods | What changes across image, file/attachment, conventional end-to-end and mixnet-backed carriage? | First-class route layer; image carriage as a required research comparison; route-specific adapters preserving native semantics | W2 §§2, 5; W3 §§2.3, 3.6, 4; W4 E6, E9; route profiles IMG-QIAO-2023, IMG-MRAS-2026, IMG-DRAS-2026, FILE-DROPBOX-LINK, E2E-SIGNAL-PROTOCOL and MIX-ECHOMIX-PIGEONHOLE |
| RQ6 · Concealment | Does optional steganography address a distinct measurable threat, and where does it fail? | Optional concealment sub-layer within the image route, separate from cryptographic protection; compare per-carrier concealment with collection-level steganalysis and linkage | W1 §§5, 7; W2 §§4–5, 7–8; W3 §§2.3, 3.6; W4 E6; SRC-033–SRC-037, SRC-043–SRC-049 |
| RQ7 · Discovery and collection | How can recipients find and retrieve changing carriers without exposing a stable rendezvous or access pattern, including multi-carrier sets, while resisting bootstrap substitution, malicious publication, index equivocation, retrieval manipulation and credible cross-role collusion? | Decompose bootstrap, publication/indexing, candidate enumeration, recipient pertinence, retrieval authorisation and endpoint association; compare full-scan, stable locator, capability, OMR/GOMR, stateful OMR, OMR/PIR efficiency variants, Oblivious Signaling, Remise and oblivious retrieval under their native observer/collusion assumptions; pressure-test retention, suppression and ambiguous absence; separate endpoint-authenticated facts, service reports, observed metadata and inferred correlations | W2 §§2, 4–5, 7, 9; W3 §§2.4.1 and multi-message package encapsulation; W4 E6, E9; SRC-017, SRC-020, SRC-024–SRC-032, SRC-043–SRC-053; [observer/property matrix](observer-property-matrix.md); [Echomix comparator](echomix-katzenpost-comparator.md); [multi-message linkage analysis](multi-message-linkage-and-steganographic-carriage.md) |
| RQ8 · Human behaviour | How do routines, timing, language, platform habits and social-engineering probes create linkability? | Treat human interaction as a cross-cutting behavioural side channel; use bounded qualitative evidence while keeping unmeasured project-specific patterns as open questions or provisional threat propositions; minimise unnecessary exposure without relying on unsafe user rituals | W2 §§2, 5, 7; W3 §§2.4.1, 3.6; W4 E6, E9; SRC-022 |
| RQ9 · Lifecycle and recovery | What can expiry, revocation, key rotation and recovery achieve, and what assumptions do they introduce? | Local lifecycle state; explicit limits on future acceptance; recovery remains separate and optional | W2 §§3–4, 6–8; W3 §§3.8–3.9; W4 E4, E7–E8 |
| RQ10 · Evaluation and confidence | What evidence is needed to assess architectural objectives and route claims, and how should confidence remain bounded by provenance, scope, assumptions, observer vantage and freshness? | Threat-to-component mapping; claim-centred evidence record; explicit claim status; falsifiable evaluation plan; observer-specific and privacy-minimising evidence | W4 §§2–8, especially E11; [confidence and evidence model](confidence-and-evidence-model.md); [route/fault/evidence matrix](route-fault-evidence-matrix.md); this traceability register |

The [Echomix comparator](echomix-katzenpost-comparator.md) adds an integrated messaging baseline covering global/active observers, traffic coupling, capability-derived discovery, asynchronous storage, reliability signalling and colluding roles. The remaining image-platform question is whether carrier transformations and platform/account observations produce distinct, measurable effects under a common endpoint-message comparison.

The current [observer/property matrix](observer-property-matrix.md) compares the scope and leakage boundaries of OMR/GOMR, Oblivious Signaling, Remise, dead-drop covert messaging and image-diffusion work. It is a working analytical aid, not a proof of completeness or originality. The matrix must be revised whenever a new comparator materially changes the observer or property baseline.

### 2.1 Confidence and evidence traceability within RQ10

Confidence and evidence are not a separate eleventh research question. They are part of RQ10's evaluation method: how can the thesis justify each claim without treating one kind of evidence as proof of a different property or event? The confidence/evidence model applies across identity, integrity, message-set completeness, conversation continuity, observer linkage and delivery. The following mapping makes those boundaries explicit:

| Claim area | Evidence required | Threat or invalid inference | Research/evaluation location |
|---|---|---|---|
| Key attribution and identity | Signature/session verification plus separate peer-key verification process | Treating key validity as human identity | W2 goals; W4 E2 and E11 |
| Object integrity | AEAD/signature validation over defined content and context | Treating integrity as semantic truth or completeness | W3 validation boundary; W4 E3/E11 |
| Fragment membership/completeness | Authenticated manifest, membership checks and completeness/coding rule | Treating one valid fragment as a complete message | Multi-message analysis; W4 E5/E11 |
| Relationship authority | Authenticated membership/session context or endpoint-local retry/cross-route mapping; observer-vantage evidence for inferred links | Treating public carrier fields, timing or correlation as authenticated protocol relationships | Thesis §7.3.1; W3 relationship-authority boundary; W4 E5/E11 |
| Receiver acceptance | Evidence for each distinct transition from carrier observation to endpoint acceptance | Treating publication, service acknowledgement, extraction or partial-set receipt as delivery/acceptance | Thesis §§7.3.2, 10.2; W3; W4 E5/E11 |
| Conversation continuity | Authenticated session/context linkage between distinct messages | Treating timing or shared carrier origin as authenticated continuity | Multi-message analysis; W2 linkage threat |
| Delivery state | Evidence from the actor that generated each lifecycle event | Upgrading service acceptance to endpoint receipt or human reading | Confidence model; W4 E11 |
| Observer linkage | Explicit vantage and observed metadata/events | Treating correlation as endpoint-authenticated linkage | Observer/property matrix; W2/W4 |
| Evidence freshness | Key epoch, timestamp, expiry and revocation state | Reusing stale evidence after compromise or context change | W2 evidence threats; W4 E11 |

This traceability does not assert that any evidence mechanism is implemented or validated. It records the claims that a future design and evaluation must distinguish.

## 3. Threat-to-architecture traceability

### 3.1 Transport-independence traceability

| Research concern | Architectural response | Evaluation requirement |
|---|---|---|
| Transport coupling | Endpoint-protected object independent of route; route-specific encapsulation | Carry the same protected-message semantics across declared profiles or document an authenticated conversion |
| Role conflation | Separate message protection, encapsulation, transport, orchestration and external carrier generation | Record each function's authority, inputs/outputs, retained state and observer view, even when one provider performs several roles |
| Coordinator dependence | Orchestration is optional and may itself be a transit participant | Demonstrate the architecture's conceptual operation without a mandatory coordinator; assess coordinator and transit disclosures separately |
| Multi-hop correlation | Explicit route composition and per-hop observer ledger | Enumerate every hop, transition, identifier, timing/access event and transformation; do not presume extra hops improve privacy |
| Unsafe fallback | Declared route policy preserving protected-object semantics and cryptographic context | Review retry/fallback for authentication, replay, key/nonce safety and added disclosures |



| W2 threat | W3 architectural response | W4 evaluation | Outstanding specification |
|---|---|---|---|
| First-contact key substitution | Identity and key-management boundary; authenticated session establishment | E2 | Verification ceremony and key-change handling |
| Platform identifier mistaken for identity | Explicit cryptographic identity binding | E2 | Identity model and assurance assumptions |
| Ciphertext or metadata alteration | Message protection and authenticated context | E3 | Canonical encoding and associated-data rules |
| Replay of valid messages | Message identifiers and lifecycle state | E4 | Freshness policy and replay-state persistence |
| Fragment mixing, conflicting indices or invalid set construction | Capsule manager and authenticated message-set context; valid out-of-order arrivals may be reassembled | E5 | Manifest, duplicate policy, resource limits and reconstruction format |
| Parser/resource exhaustion | Bounded decapsulation, manifest parsing and reassembly | E5 | Byte/count/header/decompression/CPU/memory/disk/time/concurrency limits; target profile; safe cleanup |
| Missing or duplicated capsules | Completeness and uniqueness validation | E5 | Retry and failure policy |
| Image transformation | Image route adapter within the transport-route layer | E6 | Supported formats and transformation tolerance |
| Route-specific exposure or failure | Route manager and route-specific adapters | E6, E9 | Route profiles, metadata, capacity, ordering, fallback and delivery semantics; see profile register and SRC-038–SRC-040 |
| Metadata correlation | Carrier metadata minimisation, coordinator minimisation and documented platform/host/network exposure | E6, E9 | Format-specific allowlist separating descriptive fields, structural/codec requirements and signal-level fingerprints; output verification and platform-specific tests |
| Traffic analysis and flow correlation | Encryption does not hide all timing, size, volume or endpoint metadata; compare carrier rotation with explicit obfuscation approaches | E9 | Observer vantage, event features, correlation method, error rates and overhead; source leads SRC-016, SRC-018 and SRC-019 |
| Behavioural correlation and social engineering | Human routine and interaction patterns can link otherwise distinct carriage instances | E9 | Behavioural side-channel analysis, adversarial prompt scenarios and proportionate user-facing mitigations |
| Recipient discovery and rendezvous correlation | Separate authenticated discovery mechanism; no assumption that variable placement is self-discovering | E6, E9 | Compare full-scan, stable locator, one-use capability and oblivious retrieval; channel binding, locator lifetime, query linkability, collusion and access-pattern observer model |
| Intermediary compromise | Endpoint-held private keys and least privilege | E1, E9 | Exact coordinator permissions |
| Logging and diagnostics leakage | Endpoint and service secret-handling responsibilities | E8 | Logging and crash-report policy |
| Recovery collusion or share theft | Optional, separate recovery boundary | E1, E8 | Recovery authority, threshold and collusion model |
| Endpoint compromise | Explicit endpoint trust boundary | E8 | Device security and compromise response |
| False expiry or revocation claims | Local lifecycle semantics | E7 | Precise future-acceptance and retention policy |

## 4. Architectural component traceability

| W3 component | Primary responsibility | Research justification | Evaluation |
|---|---|---|---|
| Participant endpoint | Plaintext, private-key custody, verification and decryption | Preserve cryptographic authority at the communicating parties | E1, E2, E8 |
| Identity and key management | Bind keys to identities and manage changes | Prevent platform identity assumptions and key substitution | E2, E7 |
| Session establishment | Establish authenticated shared context | Prevent unauthenticated or ambiguous peer association | E2, E3 |
| Message protection and envelope | Protect content and bind context | Confidentiality, integrity and message association | E1, E3, E4 |
| Capsule and multipart manager | Package and reconstruct protected messages | Handle fragmented delivery without ambiguous acceptance | E5 |
| Encapsulation and decapsulation boundary | Add bounded carriage framing; extract the protected object and check structure, lengths, supported format and completeness | Framing is not cryptographic authentication; security-relevant bindings are authenticated by the endpoint protocol | E5, E6 |
| Transport adapters | Carry opaque protected objects over declared hops; expose route-specific handling and failures | Replaceable carriage without plaintext, key, identity or message-acceptance authority | E6, E9 |
| Optional orchestration | Coordinate route selection, publication/retrieval, retries and delivery references; may also be a transit participant | Coordination is not mandatory; any transit role has a separate observer view | E6, E9 |
| Transport-route manager and carrier adapters | Select, describe and invoke carriage routes; encode/extract route-specific carriers and apply image metadata minimisation | Image carriage is required; other routes are comparison profiles | E6, E9 |
| Coordinator and transport | Route and coordinate delivery | Permit intermediary assistance without granting cryptographic authority | E1, E9 |
| Lifecycle and local state | Manage replay, expiry and key changes | Give lifecycle claims precise operational meaning | E4, E7 |
| Optional recovery | Support explicitly authorised recovery if justified | Explore recovery without making it a mandatory trust dependency | E1, E8 |

The image-carriage research boundary is mapped to SRC-033–SRC-037 and SRC-043–SRC-045: MRAS, DRAS, practical social-network robustness comparisons, active payload-removal research and the image-steganography/steganalysis survey. These sources constrain claims about carrier robustness and concealment. SRC-043 directly addresses multi-image fragment redundancy using robust watermarking; SRC-044–SRC-045 address pooled steganalysis and bounded batch-capacity theory; SRC-036 and SRC-046–SRC-047 address active sanitization; SRC-048 describes keyed adaptation to a known sanitizer; SRC-049 addresses cross-frame redundancy within one animated GIF carrier. Evaluation must separately trace extraction reliability, detectability, endpoint authenticity/integrity, discovery privacy and observer leakage. See the [route comparison framework](route-comparison-framework.md).

## 5. Evidence and maturity

Use the W4 evidence model:

- **L0 · Conceptual:** A requirement or intention has been stated.
- **L1 · Specified:** A mechanism and its assumptions are documented.
- **L2 · Analysed:** The design has been examined against identified threats.
- **L3 · Tested:** Defined tests have been executed and results recorded.
- **L4 · Independently reviewed:** Relevant independent specialist review has been completed.

These are internal project labels, not certification levels.

The initial [research source register](source-register.md) records authoritative specifications, protocol comparators, metadata standards, source status and claim areas. It is a starting bibliography, not evidence that every thesis claim has been verified against the full source.

Current evidence is predominantly conceptual and specified. Some architectural reasoning has been analysed against the threat model. No implementation tests or independent audit are claimed. No external peer review should be implied until contributions have actually been received and evaluated.

## 6. Unresolved decisions

The following decisions must remain open until research and specification justify them:

1. Authenticated key agreement and key confirmation.
2. First-contact identity verification and key-change procedures.
3. Message envelope format, canonical encoding and version negotiation.
4. AEAD selection, nonce construction, key separation and associated-data rules.
5. Message freshness, replay-state persistence and expiry semantics.
6. Capsule manifest, indexing, integrity and reconstruction rules.
7. Supported image formats and realistic transformation tolerance.
8. Metadata exposure, retention and coordinator permissions.
9. Recovery authority, threshold, collusion and share-protection assumptions.
10. Test methods, justified acceptance criteria and independent review scope.
11. Route-specific assumptions and comparison of image carriage with file/attachment and conventional messaging routes.
12. The distinct value, use cases and limitations of image-carried messaging.
13. Recipient discovery, rendezvous privacy and the information exposed by publication and retrieval.
14. Carrier metadata allowlist, verification of removal, and metadata introduced by platforms or hosts.
15. The evidence required to make any bounded claim about concealment or steganalysis resistance.
16. Key schedule inputs and domain separation; the distinct roles of HKDF salt and info; identity/transcript binding; nonce uniqueness under retries, concurrency, crash recovery and multi-device use; authenticated visible context; replay/order state; and downgrade-resistant route fallback. See [protocol boundary analysis](protocol-boundary-analysis.md) and SRC-041–SRC-042.

Candidate cryptographic primitives must not be treated as a selected or complete protocol. RFC 5869 and RFC 9180 are references for specific construction responsibilities, not evidence that those responsibilities have been solved for this project.

## 7. Change-control rule

When a research finding changes an architectural decision:

1. Record the originating question, threat, criticism or new evidence.
2. Identify the affected W3 component or architectural boundary.
3. Explain why the existing design is insufficient or what new benefit is expected.
4. Record the proposed change and its expected benefit.
5. Identify new risks and evaluation requirements.
6. Update this traceability register and the integrated thesis.
7. Preserve the previous rationale where it remains historically relevant.
8. Record unresolved disagreement rather than silently treating it as settled.

Do not retrofit the narrative to make a later decision appear inevitable.

## 8. Critical review and contribution traceability

The project uses the method in research-practice.md and the [Idea Intake and Contributor Continuity](idea-intake-and-continuity.md) process. The latter preserves substantive ideas and provenance during periods with no active contributors, absent or dormant contributors, and future contributor return. This section defines how future criticism is connected to research changes; it does not claim that a reviewer group or live forum currently exists.

Each substantive reviewer contribution should be traceable through the following chain:

| Record element | Required information |
|---|---|
| Contribution ID | Stable identifier for the issue or discussion |
| Location | Thesis section, W1–W4 item, claim or decision |
| Challenge | Claim, assumption, omission or interpretation being questioned |
| Reviewer reasoning | Argument, alternative explanation or proposed counterexample |
| Evidence | Sources, analysis, data or test that supports the challenge |
| Author response | Acknowledgement, investigation and reasoned response |
| Disposition | Accepted, partially accepted, rejected with rationale, unresolved or superseded |
| Research change | Affected manuscript, architecture, evaluation or decision-register entry |
| Remaining dissent | Competing reasoning or uncertainty that remains material |

A response is not automatically a resolution. A contribution may be closed only when its disposition and rationale are recorded. Where evidence is insufficient, retain the issue as unresolved.

Review should be able to challenge:

- the central research question, architectural objectives, scope and intended contribution;
- threat assumptions, attacker capabilities and trust boundaries;
- identity verification, key binding and protocol choices;
- the distinct value of image carriers and optional concealment;
- steganalysis claims and the limits of available evidence;
- metadata exposure and platform transformation;
- multipart validation and failure handling;
- lifecycle, expiry, revocation and recovery complexity;
- evaluation design, acceptance criteria and unsupported claims.

Reviewers should be credited only with their consent and according to their requested attribution. Public discussion must not solicit secrets, credentials, personal data or confidential operational details.

## 9. Design-decision traceability

Decision D-01 records the initial password-derived model, its usability and portability rationale, its security limits, and the reason the research evolved toward endpoint-controlled identity and authenticated session establishment. The decision is carried into Thesis Section 2.1, W3 section 2.5 and W4 evaluation domain E10.

The remaining decisions are recorded in docs/decision-register.md: image hashes as keys, double encryption as identity, linked-image fragmentation versus threshold sharing, remote revocation limits, platform identifiers as identity, and the ordering of cryptography before optional concealment.

## 10. Collaborative governance traceability

The proposed [Collaborative Research Governance Framework](collaborative-governance.md) defines how reviewed practices may be ratified and incorporated into a versioned project-wide baseline. Its templates are [contribution and review record](templates/contribution-review-record.md) and [decision record](templates/decision-record.md).

For every adopted practice or material research decision, trace:

1. originating research question, threat, issue or external contribution;
2. exact proposal version and evidence considered;
3. independent reviewers and their review scope, subject to consent;
4. author response, accepted and rejected portions, and remaining dissent;
5. contributor attribution mapped to the content actually incorporated;
6. ratification decision and accountable maintainer;
7. adopted baseline version and merge commit SHA; and
8. subsequent challenges, revisions or superseding decisions.

The framework is proposed, not yet ratified by external reviewers. No adopted consortium-wide practice or automated adoption mechanism is currently claimed. The repository rulesets endpoint returned no rulesets; branch-protection status could not be inspected through the available connection.

## 11. Current conclusion

The research currently supports a minimal, endpoint-controlled architecture with an untrusted coordinator and standalone train, a bounded encapsulation/decapsulation boundary, a required image-carriage route, and endpoint-authoritative message validation. Multipart reconstruction must be independent of transport arrival order where authenticated manifest and index data make the logical set unambiguous; conflicting, incomplete, substituted or ambiguous sets must fail safely.

It does not yet justify a complete protocol, mandatory threshold recovery, a particular deployment topology or claims of concealment robustness. Recipient discovery, route metadata and the practical value of transport-level unlinkability remain open research questions. The initial source base now includes a formal oblivious-retrieval comparator, a media-forensics survey, qualitative social-engineering evidence and a concrete multipart-parser resource-exhaustion case; none selects a mechanism or supplies project-specific validation.

Further complexity remains conditional on demonstrated value. External criticism may strengthen, narrow, redirect or displace the current research direction; the research record should preserve the reasoning whichever outcome follows.

**Theory only · No implementation · Not audited.**
