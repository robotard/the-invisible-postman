# The Invisible Postman: Workplan

**Researcher:** @robotard  
**Working title:** *The Invisible Postman: A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage*  
**Status:** Theory only · No implementation · Not audited.

## Purpose

Develop a critically examined thesis for an architecture in which encrypted messages travel through an explicit transport-route layer. Image carriage is a required research route; other routes may be modelled for comparison. An untrusted intermediary transports or coordinates delivery without being trusted with plaintext access or sole decryption authority.

This repository records the reasoning, design evolution, assumptions, limitations, evidence and review questions. It does not claim a working application, complete protocol or proven security.

## Session handover digest

Start a new work session with [project/SESSION_DIGEST.json](SESSION_DIGEST.json), then verify the live branch and read the authoritative project state, workplan, work log and thesis. The digest is a compact retrieval index only; it must not replace source documents, repository inspection or commit/read-back verification. Refresh it after each meaningful verified batch.

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

### Phase 1 · Repository foundation and source reconciliation

- [x] **W0.1 · Repository housekeeping** — verify the live repository and authoritative paths; remove obsolete or conflicting workflow instructions; correct README navigation and stale references; preserve historical files and commit history; establish the current verified baseline.
- [ ] **W0.2 · Research-practice foundation** — maintain the existing method for author responsibility, evidence, dissent, attribution and future peer discussion. The core documents already exist: docs/research-practice.md, docs/self-review-register.md, docs/collaborative-governance.md, docs/templates/ and docs/adopted-practices.md. Do not expand review administration or continue routine author challenge reviews during thesis construction unless a specific issue blocks progress or risks embedding a material error. The adopted-practices baseline remains maintainer-adopted and awaits external review; no external ratification is claimed.
- [ ] **W0.3 · Research-source reconciliation** — immediate construction priority. Compare W1–W4, the active thesis, decision register, traceability and preserved historical source material; identify contradictions, missing provenance, stale references and unsupported claims without erasing useful design history. Maintain the bibliography and claim map in [docs/source-register.md](../docs/source-register.md); verify sources at claim level and integrate only what each source actually supports. The full-text prior-art comparison is recorded in [docs/prior-art-comparison.md](../docs/prior-art-comparison.md), with the [observer/property matrix](../docs/observer-property-matrix.md), [Echomix/Katzenpost comparator](../docs/echomix-katzenpost-comparator.md) and [route comparison framework](../docs/route-comparison-framework.md). W0.3 remains open: compare the image-platform boundary against the strongest integrated messaging, media-forensics and dead-drop systems; then apply the common event/observer framework to named, versioned route profiles and identify a reproducible, decision-relevant result.

### Phase 2 · Research foundations and alignment

- [ ] **W1 · Research framing** — align the problem statement, central question, supporting questions, contribution, scope and non-goals with the complete thesis.
- [ ] **W2 · Threat model** — align assets, actors, trust boundaries, attacker capabilities, assumptions and security goals with the complete thesis.
- [ ] **W3 · Architecture** — reconcile components, message lifecycle, cryptographic boundaries, transport encapsulation, train/decapsulation, linked capsules and optional recovery.
- [ ] **W4 · Risks and evaluation** — connect failure modes, abuse cases, route comparisons, acceptance criteria, evaluation plans and limitations to the thesis claims.

### Phase 3 · Thesis construction, traceability and later review

- [ ] **W6 · Integrated thesis** — current substantive priority. Develop the full research argument across problem framing, design evolution, security-property distinctions, trust model, endpoint cryptographic reasoning, message structure, carriage-method comparison, lifecycle, evaluation and limitations. Use [the route comparison framework](../docs/route-comparison-framework.md) to populate named, versioned route profiles and reconcile route-native guarantees, observer views, transformations, reliability and cost. Keep transport substantial but proportionate. Reconcile W1–W4, decisions, traceability and source-register entries; verify sources at claim level and preserve unresolved questions rather than overstating evidence. Use only author challenges that materially affect correctness. The current structural revision is a working draft, not completion of W6.
- [ ] **W7 · Research traceability and decision reconciliation** — maintain links among research questions, threats, claims, architectural choices, evaluation proposals, source evidence and any future contributions.
- [ ] **W5 · Review framework and reviewer preparation** — defer substantive expansion until a workable thesis candidate exists. Then prepare concise reviewer guidance, evidence requirements, contribution workflow, response register and explicit handling of dissent. Use repository discussion tools only as available; do not imply a live forum or active reviewer group where none exists. External peer review remains the lowest priority until the thesis is coherent enough to review as a whole.

### Phase 4 · Visual communication and publication

- [ ] **W8 · Illustration design** — use [the illustration index](../diagrams/README.md) as the contextual figure plan. Only after the substantive manuscript has stabilised, create evidence-aligned diagrams and place them beside the concepts they explain. Use editable SVG source and high-quality PNG exports where generation capability permits. Avoid visuals that imply unestablished guarantees.
- [ ] **W9 · Reviewer publication** — prepare a readable PDF with contents, integrated chapters, contextual figures, references, limitations, open decisions and reviewer guidance.
- [ ] **W10 · Repository verification** — verify internal Markdown links, image references, document consistency, publication rendering, accessibility text, provenance and exact status statements.

## Candidate technical direction (not a final protocol)

The thesis may evaluate authenticated key agreement based on X25519, HKDF-SHA-256, Ed25519 signatures where appropriate, and XChaCha20-Poly1305 AEAD. These are candidates, not a completed or audited protocol. Key confirmation, identity binding, nonce rules, versioning, error handling, metadata leakage and recovery semantics still require explicit specification.

Password-derived encryption may be discussed as a distinct alternative or historical exploratory model. It must not be silently merged with the current endpoint-controlled identity and key-management architecture.

## Publication and disclosure

Publish the architecture, design rationale, threat model, limitations, candidate primitives, diagrams, traceability and review materials. Never commit real secrets, private keys, passwords, tokens, recovery codes, personal data, private correspondence or sensitive non-public infrastructure details. Do not hide design weaknesses under the label of security through obscurity.

## Research-construction priority and review gates

The immediate priority is to produce a coherent, defensible working thesis that the researcher can review as a whole. Do not spend the current runway expanding review administration or repeatedly asking the researcher to review fragments.

Priority order:

1. **Construct and reconcile the thesis:** integrate W1–W4, decisions, traceability and historical research; improve explanations, argument flow, terminology and source grounding.
2. **Resolve only blocking questions:** investigate technical or evidential gaps directly. Raise a researcher decision only where the work cannot proceed responsibly without it, or where an assumption would materially change scope or meaning.
   - Current targeted gaps: the observer/property matrix now includes OMR/GOMR, Oblivious Signaling, Remise, dead-drop covert messaging, image-diffusion work, integrated Echomix/Katzenpost, and SRC-033–SRC-037 on robust social-platform steganography, active payload removal and steganalysis. The [route comparison framework](../docs/route-comparison-framework.md) is the working event/observer ledger. Next: complete the full-text review of the most relevant image-platform sources; define named, versioned route profiles; populate source-backed observer/event comparisons against file, conventional messaging and mixnet-backed baselines; then identify a measurable decision-relevant difference or narrow the research scope. Parser budgets and behavioural evidence remain supporting workstreams.
3. **Prepare a coherent review candidate:** once the thesis has a stable argument, complete enough references, and aligned supporting documents, provide one consolidated review package and a short list of genuine decisions.
4. **Author review:** defer routine author-led challenge-register work until the researcher has a coherent thesis to examine. Continue it earlier only when a specific issue blocks construction or risks embedding a material error.
5. **External peer review:** lowest priority until a workable thesis candidate exists. Do not solicit reviewers, expand peer-review process documentation, or operationalise governance merely to create activity. Preserve existing governance work, but do not let it displace thesis construction.

This is sequencing, not abandonment. Keep open issues visible and record uncertainty without turning every unresolved question into a request for immediate researcher input.

### GitHub deployment digest

At the end of each meaningful work batch, prepare a concise review digest from the live GitHub repository. The digest must report only items actually committed and verified:

- exact file paths changed and the purpose of each change;
- commit SHA(s) and direct GitHub links;
- verification performed, including successful read-back and relevant link/content checks;
- what remains incomplete, uncertain or explicitly deferred;
- any researcher decision that is genuinely blocking the next step.

Do not list drafts that were not committed, describe a planned change as deployed, or claim checks that were not run. Fetch the live repository before each batch, use current blob SHAs for edits, verify each successful write by reading it back, and derive the summary from those returned results. Keep the durable checkpoint in `project/PROJECT_STATE.md` and the dated history in `project/WORK_LOG.md`. Give the researcher the concise digest in chat so they can review the deployed work directly from GitHub.

This is an execution and reporting routine, not a new CI bot or an automated judgement of research quality. Do not add untested repository automation or GitHub Actions merely to automate the summary; only introduce such tooling if a repeatable repository-side need is demonstrated.

## Mandatory three-document session continuity rule

Every work session must use and reconcile all three working documents:

1. [PROJECT_STATE.md](PROJECT_STATE.md) — current state, completed work, evidence, blockers and next task.
2. [WORKPLAN.md](WORKPLAN.md) — governing sequence, priorities, dependencies and deferrals.
3. [WORK_LOG.md](WORK_LOG.md) — dated record of actions, decisions, changes, verification and unresolved work.

This is a concrete completion rule, not an optional handover preference. Before a session ends, update all three so they agree. Work must either be recorded as complete with evidence and read-back verification, or explicitly parked for the next session. A parked item must state its current state, what has and has not been established, blockers or dependencies, exact next action, relevant paths and constraints to preserve. Do not leave a half-finished task described only in chat or in one document.

At session start, refresh the session digest from the live repository, then read all three working documents before substantive work. At session close, update the three working documents first and refresh [SESSION_DIGEST.json](SESSION_DIGEST.json) last. The digest remains a retrieval index, not a replacement for any of the three.

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
