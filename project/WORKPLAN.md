# The Invisible Postman: Workplan

**Researcher:** @robotard  
**Working title:** *The Invisible Postman: A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging*  
**Status:** Theory only · No implementation · Not audited

## Purpose

Develop a critically examined thesis for an architecture in which encrypted messages may be carried by images while an untrusted intermediary transports or coordinates delivery without gaining plaintext access or sole decryption authority.

This repository records the reasoning, design evolution, assumptions, limitations, and review questions. It does not claim a working implementation, complete protocol, or proven security.

## Working principles

- Treat participant endpoints as trust anchors; treat bots, transport services, image hosts, and storage as untrusted for plaintext confidentiality.
- Separate message encryption, sender authentication, identity verification, carrier formatting, optional steganographic concealment, and metadata protection.
- Do not treat an image, its uniqueness, or a public carrier source as cryptographic entropy or a key.
- Make first-contact identity verification explicit. A platform username or chat ID is not proof of a human identity.
- Distinguish ciphertext fragmentation from threshold secret sharing.
- State lifecycle limits honestly: expiry and revocation cannot recall plaintext or keys already obtained.
- Prefer explicit threat models, testable acceptance criteria, and independent review over claims based on obscurity.
- Label cryptographic algorithms as candidates until a complete protocol is specified and reviewed.
- Make every design component justify its complexity through a stated research objective or threat response.
- Preserve provenance. A file's presence in a working folder or Library does not prove that it is the latest authoritative source.

## Waypoints

Each waypoint should produce a complete, independently useful artifact before work advances. The progress and evidence for each waypoint belong in `project/PROJECT_STATE.md`, not in this stable roadmap.

- [ ] **W0 · Baseline and work plan** — repository state, scope, working principles, and waypoint plan.
- [ ] **W1 · Research framing** — problem statement, central question, supporting questions, contribution, scope, and non-goals.
- [ ] **W2 · Threat model** — assets, actors, trust boundaries, attacker capabilities, assumptions, and security goals.
- [ ] **W3 · Architecture** — components, message lifecycle, cryptographic boundaries, linked capsules, and recovery model.
- [ ] **W4 · Risks and evaluation** — failure modes, abuse cases, acceptance criteria, evaluation plan, and limitations.
- [ ] **W5 · Integrated thesis** — coherent manuscript with consistent terminology, traceable claims, references, and corrected stylised diagrams.
- [ ] **W6 · Publication set** — README, thesis source/export where appropriate, diagram assets, security note, traceability, and reviewer questions published in the repository.
- [ ] **W7 · Repository verification** — verify file paths, links, commit history, document consistency, disclosure scope, and claim discipline.

## Candidate technical direction (not a final protocol)

The thesis may evaluate authenticated key agreement based on X25519, HKDF-SHA-256, Ed25519 signatures where appropriate, and XChaCha20-Poly1305 AEAD. These are candidates, not a completed or audited protocol. Key confirmation, identity binding, nonce rules, versioning, error handling, metadata leakage, and recovery semantics still require explicit specification.

Password-derived encryption may be discussed as a distinct alternative or historical exploratory model. It must not be silently merged with the current endpoint-controlled identity and key-management architecture.

## Publication and disclosure

Publish the architecture, design rationale, threat model, limitations, candidate primitives, diagrams, traceability, and review questions. Never commit real secrets, private keys, passwords, tokens, recovery codes, personal data, private correspondence, or sensitive non-public infrastructure details. Do not hide design weaknesses under the label of security through obscurity.

## Stable GitHub-first execution protocol

1. Use the connected GitHub repository as the publication target. Inspect the current branch and files before making changes.
2. Locate and compare authoritative source material before editing. Do not assume that an old local export, Library copy, archive, or similarly named file is current.
3. Make changes directly in GitHub when the available connector supports the operation. Prefer small, logically grouped commits with descriptive messages.
4. For file updates, fetch the current file first and use its current blob SHA. Do not issue competing writes to the same path in parallel.
5. After each material write, verify the returned commit result and fetch the saved file again. Check that the content, path, links, and dependent references are correct.
6. Update `project/PROJECT_STATE.md` with the changing checkpoint, completed work, remaining work, blockers, commit references, and next task. Do not use this roadmap as a progress log.
7. Do not create a ZIP as the default publication deliverable. Use the repository directly. Create an archive only if GitHub publication is unavailable or the user explicitly requests one.
8. Summarise changes and verification results only. Do not ask the user to perform routine file operations that the connected tools can perform.
9. Request user intervention only for a genuine decision, missing permission/authentication, unresolved conflict, ambiguous source of truth, or visual judgement that cannot be verified reliably through available tools.
10. Never claim completion or publication without a successful write response and read-back verification.

## Assurance and scope

This is a theory-led research project. Do not implement the messaging system as part of these waypoints. Do not claim formal verification, measured steganographic robustness, production readiness, or independent security audit unless those activities are actually performed and evidenced.

**Theory only · No implementation · Not audited.**
