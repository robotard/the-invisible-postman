# The Invisible Postman

**A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging**  
Researcher: `@robotard`

> **Status: Theory only · No implementation · Not audited.**

This repository documents a research proposal for endpoint-controlled encrypted messaging that may use images as carriers and optional steganographic concealment. It separates encryption, sender authentication, identity verification, carrier handling, multipart integrity, lifecycle policy and optional threshold recovery.

## What this repository is

- A theory-led architecture and design rationale.
- Research framing, threat model, architecture and risk/evaluation work.
- A record of design evolution and decisions.
- Candidate cryptographic directions and open questions.
- A research-practice framework for author self-examination and constructive peer scrutiny.
- Proposed evaluation and independent-review criteria.

## What it is not

- Not a working messaging application.
- Not a complete protocol specification.
- Not formally verified or independently audited.
- Not evidence of measured resistance to steganalysis.
- Not a guarantee of anonymity, delivery, remote erasure or metadata protection.

## Start here

1. [Workplan](project/WORKPLAN.md) — stable roadmap and work-unit definitions.
2. [Project state](project/PROJECT_STATE.md) — changing, verified checkpoint.
3. [Integrated thesis](thesis.md) — active thesis manuscript.
4. [Research practice](docs/research-practice.md) — critical self-examination, peer discussion, dissent and contribution principles.
5. [Initial self-review register](docs/self-review-register.md) — author-identified challenges and evidence needs, open to independent criticism.
6. [W1 · Research framing](docs/w1-research-framing.md) — problem, questions, scope and intended contribution.
7. [W2 · Threat model](docs/w2-threat-model.md) — assets, actors, trust boundaries and attacker capabilities.
8. [W3 · Architecture](docs/w3-architecture.md) — logical components and responsibilities.
9. [W4 · Risks and evaluation](docs/w4-risks-and-evaluation.md) — failure modes and proposed evaluation.
10. [Research traceability](docs/traceability.md) — links between questions, threats, architecture and evaluation.
11. [Design decision register](docs/decision-register.md) — rationale, refinements and rejected approaches.
12. [Work log](project/WORK_LOG.md) — dated work-session record and deferred tasks.

## Ideation and design evolution

- [From idea to architecture](diagrams/01-ideation-and-design-evolution.svg) illustrates the initial password-based concept, its rationale and limits, and the research evolution towards endpoint-controlled trust.
- [Design decisions](diagrams/03-design-decisions.svg) summarises major design choices and refinements.

## Preserved historical editions

These are historical source editions, not the active thesis manuscript:

- [Archived thesis DOCX](archive/the-invisible-postman-thesis.docx)
- [Archived short thesis source](archive/thesis-source-short.md)

They are retained unchanged. The active manuscript is thesis.md.

## Core principles

- Endpoints retain plaintext and private keys.
- Relays, platforms, image hosts and storage are treated as untrusted for plaintext confidentiality.
- Images are carriers, not keys or guaranteed entropy sources.
- Cryptographic key authentication and identity verification must be explicit.
- Ciphertext fragmentation is distinct from threshold secret sharing.
- Expiry and revocation cannot recall plaintext or keys already obtained.
- Design complexity must justify its place through a research objective or threat response.
- Claims, limitations, evidence, criticism and unresolved disagreement must remain visible.

## Research ethos

> **Never confuse agreement with progress.**

The authors are responsible for examining their own reasoning. Peer discussion is invited to challenge, deepen and improve the work, not merely to validate it. Reasoned dissent and unresolved questions are retained as part of the research record.

**Theory only · No implementation · Not audited.**
