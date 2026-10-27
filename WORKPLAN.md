# The Invisible Postman: Workplan

**Researcher:** @robotard  
**Working title:** *The Invisible Postman: A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging*  
**Status:** Theory only · No implementation · Not audited

## Purpose

Develop a critically examined thesis for an architecture in which encrypted messages may be carried by images while an untrusted intermediary transports or coordinates delivery without gaining plaintext access or the ability to impersonate authenticated participants.

This repository records the reasoning, design evolution, assumptions, limitations, and review questions. It does not claim a working implementation or proven security.

## Working principles

- Treat endpoints as trust anchors; treat bots, transport services, image hosts, and storage as untrusted for plaintext confidentiality.
- Separate message encryption, sender authentication, carrier formatting, and optional steganographic concealment.
- Do not treat an image, its uniqueness, or a public carrier source as cryptographic entropy or a key.
- Make first-contact identity verification explicit. A platform username or chat ID is not proof of a human identity.
- Distinguish ciphertext fragmentation from threshold secret sharing.
- State lifecycle limits honestly: expiry and revocation cannot recall plaintext or keys already obtained.
- Prefer explicit threat models, testable acceptance criteria, and independent review over claims based on obscurity.
- Label cryptographic algorithms as candidates until a complete protocol is specified and reviewed.

## Waypoints

Each waypoint should produce a complete, independently useful artifact before work advances. Keep status and unresolved issues visible.

- [ ] **W0 · Baseline and work plan** — repository state, scope, working principles, and waypoint plan.
- [ ] **W1 · Research framing** — problem statement, central question, supporting questions, contribution, scope, and non-goals.
- [ ] **W2 · Threat model** — assets, actors, trust boundaries, attacker capabilities, assumptions, and security goals.
- [ ] **W3 · Architecture** — components, message lifecycle, cryptographic boundaries, linked capsules, and recovery model.
- [ ] **W4 · Risks and evaluation** — failure modes, abuse cases, acceptance criteria, test plan, and limitations.
- [ ] **W5 · Integrated thesis** — coherent manuscript with consistent terminology, references, and styled diagrams.
- [ ] **W6 · Publication package** — README, thesis export, diagrams, security note, and reviewer questions.
- [ ] **W7 · Repository verification** — check links, filenames, reproducibility of document outputs, disclosure status, and final claim discipline.

## Candidate technical direction (not a final protocol)

The thesis may evaluate authenticated key agreement based on X25519, HKDF-SHA-256, Ed25519 signatures where appropriate, and XChaCha20-Poly1305 AEAD. These are candidates, not a completed or audited protocol. Key confirmation, identity binding, nonce rules, versioning, error handling, metadata leakage, and recovery semantics still require explicit specification.

## Publication and disclosure

Publish the architecture, design rationale, threat model, limitations, candidate primitives, diagrams, and review questions. Never commit real secrets, private keys, passwords, tokens, recovery codes, personal data, private correspondence, or sensitive non-public infrastructure details. Do not hide design weaknesses under the label of security through obscurity.

## Current state

- Repository: https://github.com/robotard/the-invisible-postman
- Default branch: `main`
- README: placeholder content at initial inspection.
- W0: workplan drafted; this checklist is the tracking record.
- W1: research-framing working draft exists in the project conversation, but has not yet been integrated into repository files.
- Implementation: none claimed.
- Independent security audit: none claimed.

## Immediate next steps

1. Save the W1 research framing as a durable repository artifact.
2. Develop W2 as a threat model with explicit assets, adversaries, trust boundaries, goals, and non-goals.
3. Reconcile the threat model against the existing thesis before changing its technical claims.
4. Keep every security claim proportional to the evidence available.
