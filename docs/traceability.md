The Invisible Postman: Research and Design Traceability

Status: Working traceability register
Research basis: W1 Research Framing, W2 Threat Model, W3 Architecture, W4 Risks and Evaluation
Assurance: Theory only · No implementation · Not audited

1. Purpose

This document records how the research questions and identified threats influence the proposed architecture and how those design responses should be evaluated.

It exists to preserve the reasoning chain from research to design. It must not imply that a proposed mitigation has been implemented, tested or independently verified.

The governing principle is:

Complexity must earn its place through a demonstrable improvement or another stated research objective.

2. Research question traceability

Research question	Research concern	Architectural response	Evaluation reference
RQ1: How can confidentiality and authentication remain independent of an intermediary?	Intermediary access to plaintext or decryption authority	Endpoint-controlled keys and message protection	W4 E1, E2
RQ2: How can an untrusted intermediary coordinate delivery?	Compromised or over-privileged coordinator	Restricted coordinator responsibilities and least privilege	W4 E1, E9
RQ3: What security does an image carrier provide?	Confusion between encryption and concealment	Separate cryptographic envelope and optional carrier encoding	W4 E6
RQ4: How can multipart messages be validated?	Missing, duplicated, reordered or mixed capsules	Authenticated message-set context and strict reconstruction	W4 E3, E5
RQ5: How should lifecycle events be handled?	Replay, expiry, revocation and key compromise	Local lifecycle state and explicit key-management responsibilities	W4 E4, E7
RQ6: Is recovery justified, and under what assumptions?	Recovery abuse, collusion and additional trust	Recovery deferred from the minimum architecture	W4 E1, E8
RQ7: How can the proposal be evaluated honestly?	Unsubstantiated security claims	Threat-led evaluation and evidence maturity levels	W4 sections 4–8

3. Threat-to-architecture traceability

W2 threat	W3 architectural response	W4 evaluation	Outstanding specification
First-contact key substitution	Identity and key-management boundary; authenticated session establishment	E2	Verification ceremony and key-change handling
Platform identifier mistaken for identity	Explicit cryptographic identity binding	E2	Identity model and assurance assumptions
Ciphertext or metadata alteration	Message protection and authenticated context	E3	Canonical encoding and associated-data rules
Replay of valid messages	Message identifiers and lifecycle state	E4	Freshness policy and replay-state persistence
Fragment mixing or reordering	Capsule manager and authenticated message-set context	E5	Manifest and reconstruction format
Missing or duplicated capsules	Completeness and uniqueness validation	E5	Retry and failure policy
Image transformation	Separate carrier encoder/decoder boundary	E6	Supported formats and transformation tolerance
Metadata correlation	Coordinator minimisation and documented exposure	E9	Metadata inventory and retention policy
Intermediary compromise	Endpoint-held private keys and least privilege	E1, E9	Exact coordinator permissions
Logging and diagnostics leakage	Endpoint and service secret-handling responsibilities	E8	Logging and crash-report policy
Recovery collusion or share theft	Optional, separate recovery boundary	E1, E8	Recovery authority, threshold and collusion model
Endpoint compromise	Explicit endpoint trust boundary	E8	Device security and compromise response
False expiry or revocation claims	Local lifecycle semantics	E7	Precise future-acceptance and retention policy

4. Architectural component traceability

W3 component	Primary responsibility	Research justification	Evaluation
Participant endpoint	Plaintext, private-key custody, verification and decryption	Preserve cryptographic authority at the communicating parties	E1, E2, E8
Identity and key management	Bind keys to identities and manage changes	Prevent platform identity assumptions and key substitution	E2, E7
Session establishment	Establish authenticated shared context	Prevent unauthenticated or ambiguous peer association	E2, E3
Message protection and envelope	Protect content and bind context	Confidentiality, integrity and message association	E1, E3, E4
Capsule and multipart manager	Package and reconstruct protected messages	Handle fragmented delivery without ambiguous acceptance	E5
Carrier encoder and decoder	Encode and extract capsule data	Evaluate the practical image-carrier requirement separately	E6
Coordinator and transport	Route and coordinate delivery	Permit intermediary assistance without granting cryptographic authority	E1, E9
Lifecycle and local state	Manage replay, expiry and key changes	Give lifecycle claims precise operational meaning	E4, E7
Optional recovery	Support explicitly authorised recovery if justified	Explore recovery without making it a mandatory trust dependency	E1, E8

5. Evidence and maturity

Use the W4 evidence model:

* L0 · Conceptual: A requirement or intention has been stated.
* L1 · Specified: A mechanism and its assumptions are documented.
* L2 · Analysed: The design has been examined against identified threats.
* L3 · Tested: Defined tests have been executed and results recorded.
* L4 · Independently reviewed: Relevant independent specialist review has been completed.

These are internal project labels, not certification levels.

Current evidence is predominantly conceptual and specified. Some architectural reasoning has been analysed against the threat model. No implementation tests or independent audit are claimed.

6. Unresolved decisions

The following decisions must remain open until the research and specification justify them:

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
11. Synchronous versus asynchronous/offline delivery model and corresponding session protocol.
12. Recipient-side sender authentication versus transferable message signatures.

Candidate cryptographic primitives must not be treated as a selected or complete protocol.

7. W6 protocol-decision traceability

W6 decision	Related research/threat	W4 evaluation	Required evidence or decision
D1: Synchronous or asynchronous delivery	Delayed delivery, recipient offline, prekey exhaustion and replay	E2, E4, E9	Explicit operating requirement and comparison of reviewed session protocols
D2: Sender-authentication semantics	Impersonation, key substitution and attribution ambiguity	E2, E3	State whether recipient authentication is sufficient or transferable signatures are required
D3: Identity and key-agreement key relationship	Key substitution and key-purpose confusion	E2, E7	Documented identity bundle and key-binding/rotation rules
D4: First-contact and key-change ceremony	First-contact substitution and compromised identity key	E2, E7	Verifiable ceremony, failure behaviour and compromised-key recovery path
D5: Canonical envelope encoding	Ambiguous parsing, downgrade and cross-context substitution	E3	Versioned encoding, bounded fields and authenticated context definition
D6: KDF, AEAD, key separation and nonce policy	Key reuse, nonce reuse and cryptographic misuse	E1, E3	Complete reviewed profile, domain separation and state/usage bounds
D7: Replay-state scope and persistence	Replay, stale delivery, rollback and backup restore	E4, E7	Durable state model and fail-safe recovery behaviour
D8: Multipart manifest and reconstruction	Missing, duplicate, conflicting and cross-message fragments	E3, E5	Authenticated manifest, size bounds and rejection test cases
D9: Metadata and coordinator data contract	Traffic analysis and intermediary overreach	E1, E9	Metadata inventory, minimum permissions and retention policy
D10: Carrier profile	Transformation and extraction failure	E6	Defined supported formats and reproducible transformation evidence
D11: Recovery/concealment necessity	Additional authority, collusion and concealment claims	E1, E6, E8	Evidence of benefit against a defined threat; otherwise remain deferred

8. Change-control rule

When a research finding changes an architectural decision:

1. Record the originating question, threat or new evidence.
2. Identify the affected W3 component or architectural boundary.
3. Explain why the existing design is insufficient.
4. Record the proposed change and its expected benefit.
5. Identify new risks and evaluation requirements.
6. Update this traceability register and the integrated thesis.

Do not silently retrofit the narrative to make a later decision appear inevitable.

9. Current conclusion

The research currently supports a minimal, endpoint-controlled architecture with an untrusted transport coordinator, cryptographic message protection, optional image-carrier encoding and strict multipart validation.

It does not yet justify a complete protocol, mandatory threshold recovery, a particular deployment topology or claims of concealment robustness.

Further complexity remains conditional on demonstrated value.

Status: Theory only · No implementation · Not audited.