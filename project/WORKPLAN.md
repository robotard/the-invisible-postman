# The Invisible Postman: Workplan

**Researcher:** @robotard  
**Working title:** *The Invisible Postman: A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage*  
**Status:** Theory only · No implementation · Not audited.

## Purpose

Develop a critically examined thesis for an architecture in which encrypted messages travel through an explicit transport-route layer. Image carriage is a required research route; other routes may be modelled for comparison. An untrusted intermediary transports or coordinates delivery without being trusted with plaintext access or sole decryption authority.

This repository records the reasoning, design evolution, assumptions, limitations, evidence and review questions. It does not claim a working application, complete protocol or proven security.

## Governing research ethos

> **Never confuse agreement with progress.**

Progress is measured through disciplined examination, evidence, transparent reasoning and willingness to revise conclusions. Agreement alone is not validation; disagreement alone is not disproof.

The authors remain responsible for critically examining their own claims, assumptions and decisions. External peer discussion is invited to deepen, challenge, correct and extend that work, not to substitute for authorial responsibility or merely endorse existing conclusions.

The project must preserve reasoned dissent, alternative interpretations, rejected proposals, unresolved questions and the rationale for decisions. It must not manufacture consensus or conceal uncertainty.

See [Research Practice: Critical Self-Examination and Collaborative Scrutiny](../docs/research-practice.md) for the standing method, and [Idea Intake and Contributor Continuity](../docs/idea-intake-and-continuity.md) for preserving suggestions and contributions.

## Working principles

- Treat participant endpoints as trust anchors; treat bots, transport services, image hosts and storage as untrusted for plaintext confidentiality.
- Treat message carriage as a first-class transport-route layer. Retain image carriage as a required research route; compare other routes without demoting or deleting it.
- Keep the participant-side cryptographic topology primary and separate from a standalone, replaceable, low-fidelity train. Define the encapsulation boundary; do not assign the train key, identity, encryption, authentication or decryption authority.
- Preserve ideas and contributor provenance through durable intake, triage and resurfacing, including periods with no active external contributors or dormant contributors.
- Separate message encryption, sender authentication, identity verification, carrier formatting, optional steganographic concealment and metadata protection.
- Do not treat an image, its uniqueness or a public carrier source as cryptographic entropy or a key.
- Make first-contact identity verification explicit. A platform username or chat ID is not proof of a human identity.
- Distinguish ciphertext fragmentation from threshold secret sharing.
- State lifecycle limits honestly: expiry and revocation cannot recall plaintext or keys already obtained.
- Prefer explicit threat models, testable acceptance criteria and independent review over claims based on obscurity.
- Label cryptographic algorithms as candidates until a complete protocol is specified and reviewed.
- Make every design component justify its complexity through a stated research objective or threat response.
- Preserve provenance. A file's presence in a working folder or Library does not prove that it is the latest authoritative source.
- Record reviewer contributions and author responses without implying that discussion or endorsement has already occurred.

## Phases and work units

Each work unit should produce a complete, independently useful artifact before dependent work advances. Progress and evidence belong in project/PROJECT_STATE.md, not in this stable roadmap.

### Phase 1 · Repository foundation and critical research practice

- [ ] **W0.1 · Repository housekeeping** — verify the live repository and authoritative paths; remove obsolete or conflicting workflow instructions; correct README navigation and stale references; preserve historical files and commit history; establish the current verified baseline.
- [ ] **W0.2 · Critical self-examination and collaborative research practice** — critically examine the central proposition and existing assumptions; define author responsibility and the purpose of peer discussion; identify relevant disciplinary perspectives; specify how criticism, evidence, dissent, responses and unresolved questions will be recorded; define the requirements for future asynchronous review. The working method is documented in docs/research-practice.md; initial author-identified challenges and evidence needs are recorded in docs/self-review-register.md. The proposed Collaborative Research Governance Framework is documented in docs/collaborative-governance.md, with contribution and decision templates under docs/templates/ and the current project-scoped baseline in docs/adopted-practices.md. The baseline is maintainer-adopted and awaits external review; it is not presented as universally ratified. It explicitly adapts selected practices from OpenSSF, Apache, IETF, CRediT and GitHub, while rejecting inappropriate transfer of badge/score claims, silence-based consensus or running-code requirements to a theory-only project.
- [ ] **W0.3 · Research-source reconciliation** — compare W1–W4, the active thesis, decision register, traceability and historical source material; identify contradictions, missing provenance, stale references and unsupported claims without erasing useful design history.

### Phase 2 · Research foundations

- [ ] **W1 · Research framing** — problem statement, central question, supporting questions, contribution, scope and non-goals.
- [ ] **W2 · Threat model** — assets, actors, trust boundaries, attacker capabilities, assumptions and security goals.
- [ ] **W3 · Architecture** — components, message lifecycle, cryptographic boundaries, linked capsules and recovery model.
- [ ] **W4 · Risks and evaluation** — failure modes, abuse cases, acceptance criteria, evaluation plan and limitations.

### Phase 3 · Review and manuscript development

- [ ] **W5 · Review framework** — reviewer guidance, structured issues, evidence requirements, contribution workflow, response register and explicit handling of dissent. Use repository discussion tools only as available; do not imply a live forum or active reviewer group where none exists.
- [ ] **W6 · Integrated thesis** — develop the full research argument across problem framing, design evolution, security-property distinctions, trust model, endpoint cryptographic reasoning, message structure, carriage-method comparison, lifecycle, evaluation and limitations. Keep transport substantial but proportionate. Reconcile W1–W4, decisions, traceability, sources and author self-critique; preserve unresolved questions and review prompts. The current structural revision is a working draft, not completion of W6.
- [ ] **W7 · Research traceability and decision reconciliation** — ensure research questions, threats, claims, architectural choices, evaluation proposals and reviewer contributions remain linked.

### Phase 4 · Visual communication and publication

- [ ] **W8 · Illustration design** — use [the illustration index](../diagrams/README.md) as the contextual figure plan. Only after the substantive manuscript has stabilised, create evidence-aligned diagrams and place them beside the concepts they explain. Use editable SVG source and high-quality PNG exports where generation capability permits. Avoid visuals that imply unestablished guarantees.
- [ ] **W9 · Reviewer publication** — prepare a readable PDF with contents, integrated chapters, contextual figures, references, limitations, open decisions and reviewer guidance.
- [ ] **W10 · Repository verification** — verify internal Markdown links, image references, document consistency, publication rendering, accessibility text, provenance and exact status statements.

## Candidate technical direction (not a final protocol)

The thesis may evaluate authenticated key agreement based on X25519, HKDF-SHA-256, Ed25519 signatures where appropriate, and XChaCha20-Poly1305 AEAD. These are candidates, not a completed or audited protocol. Key confirmation, identity binding, nonce rules, versioning, error handling, metadata leakage and recovery semantics still require explicit specification.

Password-derived encryption may be discussed as a distinct alternative or historical exploratory model. It must not be silently merged with the current endpoint-controlled identity and key-management architecture.

## Publication and disclosure

Publish the architecture, design rationale, threat model, limitations, candidate primitives, diagrams, traceability and review materials. Never commit real secrets, private keys, passwords, tokens, recovery codes, personal data, private correspondence or sensitive non-public infrastructure details. Do not hide design weaknesses under the label of security through obscurity.

## Stable GitHub-first execution protocol

1. Use the connected GitHub repository as the publication target. Inspect the current branch and files before making changes.
2. Locate and compare authoritative source material before editing. Do not assume that an old local export, Library copy, archive or similarly named file is current.
3. Make changes directly in GitHub when the available connector supports the operation. Prefer small, logically grouped commits with descriptive messages.
4. For file updates, fetch the current file first and use its current blob SHA. Do not issue competing writes to the same path in parallel.
5. After each material write, verify the returned commit result and fetch the saved file again. Check that the content, path, links and dependent references are correct.
6. Update project/PROJECT_STATE.md with the changing checkpoint, completed work, remaining work, blockers, commit references and next task. Do not use this roadmap as a progress log.
7. Summarise changes and verification results only. Do not ask the user to perform routine file operations that the connected tools can perform.
8. Request user intervention only for a genuine decision, missing permission/authentication, unresolved conflict, ambiguous source of truth or visual judgement that cannot be verified reliably through available tools.
9. Never claim completion or publication without a successful write response and read-back verification.

## Assurance and scope

This is a theory-led research project. Do not implement the messaging system as part of these work units. Do not claim formal verification, measured steganographic robustness, production readiness or independent security audit unless those activities are actually performed and evidenced.

**Theory only · No implementation · Not audited.**
