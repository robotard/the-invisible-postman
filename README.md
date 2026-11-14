# The Invisible Postman

**A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging**

> **Theory only · No implementation · Not audited.**

## Overview

The Invisible Postman investigates an architecture in which images may carry protected message capsules while communicating endpoints retain control of plaintext, private keys and cryptographic identity.

An intermediary may coordinate or transport messages, but is not trusted with plaintext confidentiality or sole decryption authority. Cryptographic protection is distinct from optional steganographic concealment.

## Research documents

1. [Workplan](project/WORKPLAN.md) — scope, principles and research waypoints.
2. [Project state](project/PROJECT_STATE.md) — verified repository checkpoint and remaining work.
3. [W1 · Research framing](docs/w1-research-framing.md) — problem and research questions.
4. [W2 · Threat model](docs/w2-threat-model.md) — assets, actors, assumptions and security goals.
5. [W3 · Architecture](docs/w3-architecture.md) — component boundaries and message lifecycle.
6. [W4 · Risks and evaluation](docs/w4-risks-and-evaluation.md) — adversarial evaluation framework.
7. [Traceability](docs/traceability.md) — research-to-threat-to-architecture-to-evaluation mapping.
8. [Integrated thesis](thesis.md) — consolidated argument and current design position.
9. [Security notes](SECURITY.md) — scope, limitations and repository hygiene.
10. [Review questions](review/REVIEW_QUESTIONS.md) — critical review agenda.
11. [Diagrams](diagrams/) — editable Mermaid source diagrams.

## Core principles

- Plaintext and private-key authority remain at participant-controlled endpoints.
- Relays, platforms, bots and image hosts are untrusted for plaintext confidentiality.
- Cryptographic identity must be explicitly verified; platform identifiers are not proof of human identity.
- Confidentiality, sender authentication, identity verification and integrity are distinct properties.
- Images are carriers, not keys or guaranteed sources of cryptographic entropy.
- Concealment is optional and does not replace encryption or authentication.
- Multipart fragments must be bound to one message set and validated before reconstruction.
- Ciphertext fragmentation is not threshold secret sharing.
- Expiry and revocation cannot recall plaintext or keys already obtained.
- Additional mechanisms must justify their complexity through demonstrable benefit.

## Scope and assurance

This is a theory-led research and architecture proposal. It is not a working messaging application, complete protocol specification, formally verified design, security audit, or evidence of measured resistance to steganalysis or media transformation.

Candidate cryptographic primitives remain candidates until a complete protocol is specified and reviewed. Design intentions, analysis, executed tests and independent assurance must never be conflated.

**Theory only · No implementation · Not audited.**
