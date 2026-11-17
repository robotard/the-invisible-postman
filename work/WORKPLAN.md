# The Invisible Postman: Workplan

**Working title:** *The Invisible Postman: A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage*  
**Status:** Theory only · No implementation · Not audited.

## Purpose

Develop a critically examined thesis for endpoint-controlled cryptographic messaging over replaceable, potentially untrusted delivery routes. Image carriage is a required research route and comparison subject; it is not assumed to be the mandatory runtime transport. The thesis itself is the sole product: `thesis.md` is the one active manuscript in staging, and production is a frozen release of that same thesis after evidence reconciliation and peer scrutiny. There is no second production thesis or alternate product identity. The repository records research reasoning, evidence, design evolution, limitations and unresolved questions. It does not claim a complete protocol or proven security.

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
- Treat confidence as a verifier's claim-specific, evidence-bounded judgement; expose provenance, scope, assumptions, freshness and unresolved alternatives without a universal score or central tracking ledger.

## Document boundaries and status semantics

The exact status string **Theory only · No implementation · Not audited.** is project-status metadata. It describes the current verified state; it is not a standing instruction for every conversation and does not prohibit research, architectural exploration, specification work or future changes in project maturity.

- **Thesis and research-supporting documents:** hold the substantive research argument, technical principles, evidence, contribution assessment, uncertainty and limitations.
- **Operational documents:** hold concise verified status, work priorities, dependencies, blockers, paths and next actions. Link to research documents instead of duplicating thesis exposition.
- **Session digests:** encode the same operational state as structured handover data, not as additional thesis prose.
- **ChatGPT Project Instructions:** remain a thin operating layer for resumption, execution and verification. They follow the live GitHub records and must not duplicate or override thesis research rules. The user-facing Project Instructions are external to this repository; this workplan records their intended boundary, not a claim that ChatGPT settings were changed here.
- **Assistant working notes:** preserve this separation and mention the status only when relevant.

The status label must remain accurate wherever project maturity is reported. Its presence must not be interpreted as a restriction on the work that may be researched or planned.

## Thesis product and lifecycle

The thesis is the product. `thesis.md` is the single active manuscript being developed in staging. Production is a frozen, versioned release of that same thesis after the relevant research, evidence, coherence, accessibility and peer-review gates have been addressed. Staging and production are not separate thesis documents or competing products. A release must preserve the thesis's provenance, citations, evidential limits, acknowledged uncertainty, author responsibility and review history. Do not describe the thesis as independently reviewed until independent review has actually occurred.

Peer review is substantive: define scope and reviewer competence; provide a coherent thesis candidate and supporting material; preserve reviewer comments and evidence; record author responses and dispositions; retain unresolved dissent; reconcile accepted findings into the thesis and supporting research; and record the resulting version/commit. Existing research-practice, governance and review templates remain the governing process. This workplan does not claim a reviewer group is active or review has occurred.

## Temporary work-area remit

`/work/` is the temporary store of work to be done to bring the thesis to its intended standard. It coordinates unfinished research and source reviews, route/comparator analysis, protocol-boundary reconciliation, thesis synthesis, diagram briefs and creation, cross-document validation, peer-review preparation and response, and release checks. The enduring argument, evidence, definitions and citations belong in `thesis.md` and substantive research documents, not in `/work/`.

Internal concept keys (`C-###`) and task keys (`T-###`) exist only to shorten our own lookup and continuation. They are not thesis identifiers, must not be inserted into thesis/research prose, and never replace source IDs (`SRC-###`), citations, section references or figure references. The registries point to enduring research locations; the thesis and substantive research documents remain authoritative.

A task is extinguished only when its outcome is reconciled into the thesis and/or enduring research records, evidence limits and review disposition are recorded, and no further action remains; it may instead be explicitly closed as unnecessary with rationale. IDs are not recycled. At full release, verify no enduring document depends on `/work/`, transfer substantive outcomes to permanent locations, then remove `/work/` in full.

## Roadmap

Work units produce independently useful outputs for the thesis. Actionable work and continuation keys are indexed in `lookup/TASKS.md`; progress belongs in `PROJECT_STATE.md`; dated actions and verification belong in `WORK_LOG.md`.

### Phase 1 · Repository and research foundation

- [x] **W0.1 Repository foundation:** authoritative paths, repository baseline, navigation and GitHub-first workflow.
- [~] **W0.2 Research practice:** core self-review, governance, attribution and contribution documents exist. Routine administration is deferred; external review and ratification remain outstanding.
- [~] **W0.3 Source reconciliation:** substantial prior-art work and source register exist (49 entries). Full text inspected for SRC-035 and SRC-037; SRC-033, SRC-034 and SRC-036 remain partial article reviews pending complete methods/results. Author-linked MRAS/DRAS MATLAB repositories for SRC-033/034 are now pinned and source-inspected; this is not a full-paper review or independent reproduction. An initial six-profile register and documentary comparison matrix now exist; still open: pin live service versions/configurations, complete service-level evidence and test the image-platform boundary against strong comparators.

### Phase 2 · Research foundations

- [~] **W1 Research framing:** drafted; final thesis alignment and claim-level source reconciliation remain.
- [~] **W2 Threat model:** drafted; final alignment of assets, observers, capabilities, assumptions and goals remains.
- [~] **W3 Architecture:** drafted; protocol boundary obligations are now documented separately and linked; final alignment of terminology, traceability and state semantics remains.
- [~] **W4 Risks and evaluation:** drafted; align route-specific failure modes, evidence and acceptance criteria as comparisons mature.

### Phase 3 · Thesis and traceability

- [~] **W6 Integrated thesis:** active. Build a coherent argument across research framing, threat model, architecture, endpoint cryptography, carrier comparison, lifecycle, evaluation and limitations. Keep claims proportional to evidence.
- [~] **W7 Traceability:** the register and core mappings exist; continue maintaining links among questions, threats, claims, decisions, components, sources and evaluation as new evidence is integrated.
- [ ] **W5 Peer-review preparation and process:** defer active external review until a coherent thesis candidate exists. Prepare scope, reviewer guidance and response records; conduct and document substantive independent review only when reviewers actually participate.

### Phase 4 · Visual communication, peer scrutiny and release

- [~] **W8 Illustrations:** text-only illustration prompts and placement/guardrails are now embedded in W1–W4 and indexed in `diagrams/README.md`; create actual contextual, evidence-aligned diagrams only after the argument and route comparison stabilise. Prefer editable SVG and accessible exports.
- [ ] **W9 Thesis release:** prepare a frozen release of the same thesis manuscript, with figures, references, limitations, open decisions, provenance and review state.
- [ ] **W10 Repository audit:** verify links, image references, consistency, accessibility, provenance, rendering and exact status statements.

Legend: `[x]` complete; `[~]` drafted or in progress; `[ ]` not started or deferred. These labels describe work-unit maturity, not security assurance.

## Immediate execution sequence

1. Refine the initial [route-profile register](../docs/route-comparison-framework.md) into pinned service/client versions and configurations where authoritative evidence is available. Keep literature, protocol-reference, service-documentation and deployed-evaluation profiles distinct.
2. Expand the documentary comparison into a source-backed lifecycle/event/observer ledger covering transformations, discovery/access patterns, reliability, failure behaviour, expiry, collusion and cost. Mark unknowns and non-comparable properties explicitly.
3. Seek accessible full text for the remaining methods/results of SRC-033, SRC-034 and SRC-036; MRAS/DRAS public code repositories have been inspected at pinned commits but not executed. SRC-035 and SRC-037 have been inspected in full. Preserve the source-specific review boundaries in [the source register](../docs/source-register.md).
4. [x] Initial multi-message integration into the lifecycle/event/observer ledger: fragment-set membership, redundant carriers, independent messages, conversation continuity, retries, cross-route copies and collection-level steganalysis are mapped with observer vantage, collection size, acquisition window and dependence assumptions. Continue extending only when source-specific evidence or a declared test justifies it.
5. Recheck W3 numbering, thesis terminology and cross-references against [traceability](../docs/traceability.md); retain the text-only illustration prompts in W1–W4 and the diagram index, but do not create artwork until the argument stabilises.
6. Reconcile material findings into the thesis, W1–W4, decision register, source register, prior-art comparison, observer/property matrix and traceability.
7. Reconcile [protocol boundary analysis](../docs/protocol-boundary-analysis.md) into W2/W3/W4 and the thesis. Stress-test key scope, HKDF salt/info, identity/transcript binding, nonce uniqueness under retries/concurrency/recovery, AAD visibility, replay/order state and safe fallback against established protocol references without prematurely selecting primitives.
8. Pin live service/client versions and configurations where authoritative evidence is available; do not convert documentation-only profiles into deployed evaluations.
9. Run a fresh repository-wide link, status, terminology and image-reference consistency audit.
10. Review the newly registered sanitization and animated-carrier comparators SRC-046–SRC-048 at full-text level where available; review SRC-049's paper/formal security argument and complete results. SRC-049 README and selected core/sender/receiver source files have been inspected but not executed or audited. Keep abstract-only and code-derived evidence explicitly partial, and distinguish one GIF's internal frames from separate image carriers and message sets.
11. Integrate and challenge the [confidence and evidence model](../docs/confidence-and-evidence-model.md): validate its distinctions against the source base, route/event ledger and protocol obligations; test whether it improves claim precision without creating a privacy-invasive evidence ledger or false precision.

A comparison may show that image carriage adds no defensible benefit. That is a valid result. Do not preserve a preferred route by weakening baselines or inventing platform behaviour.

## Message multiplicity and illustration discipline

The research distinguishes one logical message, its protected object, a fragment set, redundant fragment carriage, independent messages in a batch, conversation/session continuity, retries and cross-route copies. Do not use a generic multipart label for all of them. The conceptual package sequence is endpoint-protected object → authenticated message-set context/manifest where needed → fragment capsules → route-specific carrier encapsulation → optional image steganographic embedding → carrier events → endpoint decapsulation and validation. This is not a selected wire format.

W1–W4 contain text-only illustration placeholders with intended placement, prompts and "must not imply" guardrails. `diagrams/README.md` indexes them. These are not artwork and do not override the existing gate: create genuine visual diagrams only when the argument and evidence are stable; never use ASCII art.

## Candidate cryptographic direction

X25519, HKDF-SHA-256, Ed25519 and XChaCha20-Poly1305 may be evaluated as candidate primitives, not treated as a selected or complete protocol. RFC 9180 HPKE is a compositional reference and application-responsibility checklist, not an adopted protocol or a complete messaging design. Key confirmation, identity binding, nonce rules, key separation, versioning, error handling, replay and recovery semantics require explicit composition and review.

Password-derived encryption remains a distinct alternative and part of the design history. Do not silently merge it with the endpoint-controlled identity/key-management direction; retain the rationale for the original choice in the thesis.

## Commit and update discipline

Every commit follows the same checkpoint contract in [work-area README](README.md#commit-checkpoint-contract). Treat the commit as the atomic record of one coherent work unit: do the work, reconcile its task key and work records, commit once, fetch the commit and changed files, and verify exact read-back. A task is complete only after the outcome is integrated into its enduring destination and post-commit verification succeeds. Record verification in the next work-log/checkpoint update; do not create bookkeeping-only commits when the record can accompany the next substantive unit. At handover, reconcile state/plan/log, refresh the Markdown digest, then JSON last.

## Session continuity and GitHub workflow

The project uses four operational handover documents with distinct jobs:

1. `PROJECT_STATE.md`: current verified position, completed work, remaining work, blockers, dependencies and exact next action.
2. `WORKPLAN.md`: stable roadmap, priorities, sequence and dependencies. Change only when the roadmap or operating workflow genuinely changes.
3. `WORK_LOG.md`: chronological record of actual actions, changes, evidence, limitations and verification.
4. `SESSION_DIGEST.md` and `SESSION_DIGEST.json`: paired compact handover formats, refreshed from the other three records. They are retrieval aids, not competing sources of truth.

The live GitHub repository, saved files and commit history are authoritative. Chat history, recollection and digests must never displace a newer verified repository state. The thesis and research documents remain the authoritative location for substantive research; operational records should link to them rather than duplicate their arguments.

### Operating loop: read → decide → do → record → verify → repeat

For every continuation, including a short “continue” prompt:

1. **Read the checkpoint:** fetch the live default branch and current digests; read `PROJECT_STATE.md`, this workplan and `WORK_LOG.md`. Inspect the relevant thesis/research/supporting files needed for the next action.
2. **Reconcile:** establish what is actually complete, what remains, blockers, dependencies and the next unblocked action. Use file content, commit history and recorded evidence, not a chat recap alone.
3. **Decide without ceremony:** select the next useful action in the agreed sequence. Ask the user only if a missing decision, material ambiguity, permission or safety issue prevents correct progress. Never ask them to repeat information already recorded or seek approval for routine, reversible work already authorised by the project.
4. **Execute:** work in the correct GitHub thesis/research/supporting file or available connected resource. Do not substitute another plan, an extended progress narrative or a list of intentions for work that can be performed.
5. **Use the available runway:** within the current turn/session, complete a coherent unit and continue into the next unblocked unit while useful token/time capacity remains. Do not stop after a trivial edit merely to report progress. If the runway is ending, leave a precise, verified continuation point rather than rushing unsupported claims.
6. **Record reality:** update affected substantive files and `WORK_LOG.md`; reconcile `PROJECT_STATE.md`. Record only work actually attempted or completed, including negative results, failed access, uncertainty and unresolved issues. Distinguish drafted, committed, fetched/read-back verified, tested, reproduced and independently reviewed.
7. **Verify:** fetch each changed file after writing and check the saved content. A successful write response or commit SHA alone is not proof that the intended content is present.
8. **Repeat:** after recording and verifying a coherent unit, return to the next unblocked action while meaningful runway remains. The process is iterative, not a single plan-then-stop cycle.
9. **Hand over:** provide a concise summary of actual work, evidence/verification, limitations and exact next action. The summary reports the work; it does not replace it.

If a task is blocked, state the precise reason, record it, and continue with another useful unblocked dependency where possible. Do not invent progress, silently downgrade evidence standards or imply that a blocked task is complete.

### Scope and interaction discipline

- Prefer action over repeated planning. Planning is only useful when it resolves a real sequencing or dependency question.
- Keep questions exceptional and specific. Do not ask broad preference questions when the next step is already determined by the recorded plan.
- Keep progress messages short and factual. Avoid repeatedly describing the whole project or praising routine edits.
- Do not overstate the significance of incremental changes. Report the concrete file, section, finding, commit/read-back status and what remains.
- Do not make the user manage the assistant's continuity. The records exist so neither party has to repeat completed work or reconstruct prior decisions.
- Preserve the user's intended sequence and challenge it only where evidence, contradiction, risk or a genuine dependency warrants doing so.

### Checkpoint and verification protocol

- After meaningful thesis/research changes, update the relevant supporting and traceability records and record the actual work in `WORK_LOG.md`.
- Reconcile `PROJECT_STATE.md` with the real current position and next unblocked action.
- Change this roadmap only when priorities, dependencies or workflow genuinely change.
- Fetch every changed GitHub file before editing; use its current blob SHA and do not run concurrent writes to the same path.
- Fetch every changed file after writing and verify its exact saved content.
- At handover, reconcile and verify `PROJECT_STATE.md`, `WORKPLAN.md` and `WORK_LOG.md`; refresh `SESSION_DIGEST.md`; refresh `SESSION_DIGEST.json` last; then fetch and verify both digests against the three records.
- Keep both digests compact and machine-oriented: stable keys, concise values, paths, dependencies and next action. Do not put thesis exposition or narrative session transcripts in them.
- Never claim saved, committed, published, deployed, tested, reproduced, proven, audited or independently reviewed without evidence appropriate to that exact claim.

## Research-construction and review gates

Prioritise a coherent, defensible thesis over expanding review administration. Resolve questions that block construction or risk embedding a material error. Keep the thesis as the single product through staging and production. Defer external peer review until a workable thesis candidate exists, then run a substantive, traceable review process. Preserve existing governance work without allowing administration to displace the research.

Publish design rationale, threat models, limitations, candidate mechanisms, diagrams, traceability and review materials. Never commit secrets, private keys, passwords, tokens, recovery codes, personal data or private correspondence. Do not imply that repository governance, discussion or endorsement has occurred when it has not.

## Assurance boundary

This is a theory-led research project. No implementation, platform experiment, extraction test, steganalysis benchmark, formal proof or independent security audit is implied by the roadmap or by documentation progress.

**Theory only · No implementation · Not audited.**


## ChatGPT Project operating instructions and context recovery

The concise text intended for the ChatGPT Project's external **Project Instructions** is maintained in [CHATGPT_PROJECT_INSTRUCTIONS.md](CHATGPT_PROJECT_INSTRUCTIONS.md). Keep the actual Project Instructions thin: continuity, source authority, execution priorities, verification and context-limit recovery only. Do not paste thesis methodology, technical principles or contribution arguments into this field; those remain in `thesis.md` and enduring `docs/` research records.

The repository cannot directly modify ChatGPT's external Project settings. After editing this file, installation requires copying its complete contents into **The Invisible Postman → Project settings → Project instructions**. Do not claim the external setting has changed until that has actually been done.

For context-limit recovery, preserve the full prior conversation and start a new chat inside the same Project. Resume from the live GitHub digests and working records plus the new chat's automatic summary; never treat a new chat as a project reset. Do not fill every response with the maturity label. Use it only when a maturity/evidence qualification is relevant.
