# The Invisible Postman: Workplan

**Working title:** *The Invisible Postman: A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage*  
**Status:** Theory only · No implementation · Not audited.

## Purpose

Develop a critically examined thesis for endpoint-controlled cryptographic messaging over replaceable, potentially untrusted delivery routes. Image carriage is a required research route and comparison subject; it is not assumed to be the mandatory runtime transport. The repository records research reasoning, evidence, design evolution, limitations and unresolved questions. It does not claim a complete protocol or proven security.

## Research ethos

> **Never confuse agreement with progress.**

Advance through evidence, explicit assumptions, critical examination and willingness to revise. Preserve reasoned dissent, rejected alternatives, uncertainty and contributor provenance. Author responsibility remains with the researchers; peer discussion can challenge and improve the work but cannot substitute for evidence.

See [research practice](../docs/research-practice.md), [collaborative governance](../docs/collaborative-governance.md) and [idea intake and continuity](../docs/idea-intake-and-continuity.md).

## Governing principles

- Participant endpoints retain cryptographic authority. Treat bots, platforms, carriers, transport services and storage as untrusted for plaintext confidentiality.
- Separate message protection, identity verification, sender authentication, carrier encapsulation, transport and optional concealment.
- Keep carrier encapsulation, transport adapters and orchestration distinct. Orchestration is optional; a service may perform multiple roles, which must be analysed separately.
- Preserve the protected object across routes unless an explicit authenticated protocol conversion is defined.
- Image carriage remains a required research comparison, not a mandatory runtime route.
- Do not treat carrier uniqueness, public image generation or extra hops as entropy, anonymity or proof of privacy.
- Make identity assurance, key changes, replay handling, lifecycle and recovery assumptions explicit.
- Distinguish ciphertext fragmentation from threshold secret sharing.
- Expiry and revocation cannot recall plaintext or keys already obtained.
- Label algorithms and mechanisms as candidates until the complete protocol is specified and reviewed.
- Justify each component against a research objective or threat; preserve source provenance and claim boundaries.

## Document boundaries and status semantics

The exact status string **Theory only · No implementation · Not audited.** is project-status metadata. It describes the current verified state; it is not a standing instruction for every conversation and does not prohibit research, architectural exploration, specification work or future changes in project maturity.

- **Thesis and research-supporting documents:** hold the substantive research argument, technical principles, evidence, contribution assessment, uncertainty and limitations.
- **Operational documents:** hold concise verified status, work priorities, dependencies, blockers, paths and next actions. Link to research documents instead of duplicating thesis exposition.
- **Session digests:** encode the same operational state as structured handover data, not as additional thesis prose.
- **Assistant working notes:** preserve this separation and mention the status only when relevant.

The status label must remain accurate wherever project maturity is reported. Its presence must not be interpreted as a restriction on the work that may be researched or planned.

## Roadmap

Work units produce independently useful outputs. Progress belongs in `PROJECT_STATE.md`; dated actions and verification belong in `WORK_LOG.md`.

### Phase 1 · Repository and research foundation

- [x] **W0.1 Repository foundation:** authoritative paths, repository baseline, navigation and GitHub-first workflow.
- [~] **W0.2 Research practice:** core self-review, governance, attribution and contribution documents exist. Routine administration is deferred; external review and ratification remain outstanding.
- [~] **W0.3 Source reconciliation:** substantial prior-art work and source register exist (37 entries). Still open: finish SRC-033–SRC-037 review, test the image-platform boundary against strong comparators, and establish evidence-backed route comparisons.

### Phase 2 · Research foundations

- [~] **W1 Research framing:** drafted; final thesis alignment and claim-level source reconciliation remain.
- [~] **W2 Threat model:** drafted; final alignment of assets, observers, capabilities, assumptions and goals remains.
- [~] **W3 Architecture:** drafted; check section numbering, terminology, traceability and protocol boundaries.
- [~] **W4 Risks and evaluation:** drafted; align route-specific failure modes, evidence and acceptance criteria as comparisons mature.

### Phase 3 · Thesis and traceability

- [~] **W6 Integrated thesis:** active. Build a coherent argument across research framing, threat model, architecture, endpoint cryptography, carrier comparison, lifecycle, evaluation and limitations. Keep claims proportional to evidence.
- [ ] **W7 Traceability:** maintain links among questions, threats, claims, decisions, components, sources and evaluation.
- [ ] **W5 Review preparation:** defer until a coherent thesis candidate exists. Prepare concise reviewer guidance and response records; do not imply an active reviewer group.

### Phase 4 · Visual communication and publication

- [ ] **W8 Illustrations:** create contextual, evidence-aligned diagrams only after the argument and route comparison stabilise. Prefer editable SVG and accessible exports.
- [ ] **W9 Review publication:** prepare an integrated, readable PDF with figures, references, limitations, open decisions and reviewer guidance.
- [ ] **W10 Repository audit:** verify links, image references, consistency, accessibility, provenance, rendering and exact status statements.

Legend: `[x]` complete; `[~]` drafted or in progress; `[ ]` not started or deferred. These labels describe work-unit maturity, not security assurance.

## Immediate execution sequence

1. Select named, versioned route profiles for image-platform carriage, file/attachment transfer, conventional E2E messaging and Echomix/Katzenpost. Use only profiles whose relevant version/configuration can be evidenced.
2. Populate [the route-comparison framework](../docs/route-comparison-framework.md) with source-backed lifecycle events, observer views, transformations, discovery/access patterns, reliability, failure behaviour and cost. Mark unknowns and non-comparable properties explicitly.
3. Complete full-text review of SRC-033–SRC-037 in [the source register](../docs/source-register.md).
4. Check W3 numbering and cross-references against [traceability](../docs/traceability.md).
5. Reconcile material findings into the thesis, W1–W4, decision register, source register and traceability.
6. Analyse nonce uniqueness, salt purpose, key scope, identity/context binding, replay and safe fallback at protocol-design level without prematurely choosing primitives.
7. Run a fresh repository-wide link, status and terminology consistency audit.

A comparison may show that image carriage adds no defensible benefit. That is a valid result. Do not preserve a preferred route by weakening baselines or inventing platform behaviour.

## Candidate cryptographic direction

X25519, HKDF-SHA-256, Ed25519 and XChaCha20-Poly1305 may be evaluated as candidate primitives, not treated as a selected or complete protocol. Key confirmation, identity binding, nonce rules, key separation, versioning, error handling, replay and recovery semantics require explicit composition and review.

Password-derived encryption remains a distinct alternative and part of the design history. Do not silently merge it with the endpoint-controlled identity/key-management direction; retain the rationale for the original choice in the thesis.

## Session continuity and GitHub workflow

The three working documents have separate jobs:

1. `PROJECT_STATE.md`: concise current snapshot, verified progress, blockers and exact next action.
2. `WORKPLAN.md`: stable roadmap, principles, priorities and dependencies.
3. `WORK_LOG.md`: dated history of changes, decisions, evidence and verification.

At session start, refresh the live repository and read `SESSION_DIGEST.md`, `SESSION_DIGEST.json`, all three working documents and relevant research files. At session close, reconcile `PROJECT_STATE.md`, `WORKPLAN.md` and `WORK_LOG.md`; read back and verify them; refresh the machine-readable `SESSION_DIGEST.md` from that verified state; refresh `SESSION_DIGEST.json` last; then verify both digests against the three working documents. Both digests are compact operational handovers, never replacements for the authoritative documents or containers for thesis exposition.

For every GitHub change: fetch the current file and blob SHA; make logically grouped writes; confirm the returned commit; fetch the saved file and verify its content. Never claim a change is deployed without successful read-back. Keep the user-facing deployment summary concise and limited to verified changes.

## Research-construction and review gates

Prioritise a coherent, defensible thesis over expanding review administration. Resolve only questions that block construction or risk embedding a material error. Defer external peer review until a workable thesis candidate exists. Preserve existing governance work without allowing it to displace the research.

Publish design rationale, threat models, limitations, candidate mechanisms, diagrams, traceability and review materials. Never commit secrets, private keys, passwords, tokens, recovery codes, personal data or private correspondence. Do not imply that repository governance, discussion or endorsement has occurred when it has not.

## Assurance boundary

This is a theory-led research project. No implementation, platform experiment, extraction test, steganalysis benchmark, formal proof or independent security audit is implied by the roadmap or by documentation progress.

**Theory only · No implementation · Not audited.**
