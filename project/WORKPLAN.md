# The Invisible Postman: Workplan

**Working title:** *The Invisible Postman: A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging*  
**Status:** Theory only · No implementation · Not audited

## Purpose

Develop a critically examined thesis for an architecture in which encrypted messages may be carried by images while an untrusted intermediary transports or coordinates delivery without gaining plaintext access or the ability to impersonate authenticated participants.

The repository records reasoning, design evolution, assumptions, limitations and review questions. It does not claim a working implementation or proven security.

## Working principles

- Treat endpoints as trust anchors; treat bots, transport services, image hosts and storage as untrusted for plaintext confidentiality.
- Separate message encryption, sender authentication, carrier formatting and optional steganographic concealment.
- Do not treat an image, its uniqueness or a public carrier source as cryptographic entropy or a key.
- Make first-contact identity verification explicit. A platform username or chat ID is not proof of a human identity.
- Distinguish ciphertext fragmentation from threshold secret sharing.
- State lifecycle limits honestly: expiry and revocation cannot recall plaintext or keys already obtained.
- Prefer explicit threat models, testable acceptance criteria and independent review over claims based on obscurity.
- Label cryptographic algorithms as candidates until a complete protocol is specified and reviewed.

## Research waypoints

- [x] **W0 · Baseline and workplan** — repository scope, principles and waypoint plan.
- [x] **W1 · Research framing** — problem statement, central and supporting questions, contribution, scope and non-goals.
- [x] **W2 · Threat model** — assets, actors, trust boundaries, attacker capabilities, assumptions and security goals.
- [x] **W3 · Architecture** — components, message lifecycle, cryptographic boundaries, linked capsules and deferred recovery.
- [x] **W4 · Risks and evaluation** — failure modes, abuse cases, proposed acceptance criteria and limitations.
- [x] **W5 · Initial thesis reconciliation** — thesis aligned to W1–W4; protocol details remain open.
- [ ] **W6 · Protocol specification (in progress)** — protocol design dossier drafted; asynchronous delivery, sender-authentication semantics, identity binding, cryptographic profile, replay state and multipart rules remain unresolved.
- [ ] **W7 · Critical review and evaluation design** — adversarial scenarios, test methods, justified thresholds and independent review scope.
- [ ] **W8 · Publication verification** — link/path checks, diagram rendering, reproducibility and disclosure review.

A checked waypoint means the research artefact exists, not that its proposed security properties have been proven.

## Candidate technical direction

X25519, HKDF-SHA-256, Ed25519 and XChaCha20-Poly1305 may be evaluated as candidate mechanisms. They are not an adopted or complete protocol. A reviewed session-establishment framework must be selected to match synchronous or asynchronous delivery. Key confirmation, identity binding, sender-authentication semantics, nonce rules, versioning, error handling, metadata leakage and recovery semantics require explicit specification.

## Current state

- Repository: https://github.com/robotard/the-invisible-postman
- Default branch: `main`
- W1–W4 and traceability are present as substantive documents.
- W6 protocol design dossier is drafted at `docs/w6-protocol-specification.md`, with a protocol decision-flow diagram; neither is a final protocol specification.
- Reconciliation changes are pushed on `work/reconcile-research-and-repository`; PR #1 is open and not merged.
- The earlier Python/Flask password-based proposal is retained in the thesis as historical exploration, not the current architecture.
- No implementation, formal proof or independent security audit is claimed.

## Publication and disclosure

Publish architecture, design rationale, threat model, limitations, candidate primitives, diagrams and review questions. Never commit real secrets, private keys, passwords, tokens, recovery codes, personal data, private correspondence or sensitive non-public infrastructure details.

Do not hide design weaknesses under the label of security through obscurity.

## Immediate next steps

1. Decide whether offline/asynchronous sending is a core requirement.
2. Define sender-authentication semantics and the identity/key-binding model.
3. Select a reviewed session-establishment construction for the chosen operating model.
4. Finalise the canonical envelope, authenticated context, key separation and nonce policy.
5. Specify replay-state persistence and multipart manifest/rejection rules.
6. Evaluate metadata exposure and whether concealment or recovery is justified.
7. Build a threat-led evaluation plan before any implementation work.
