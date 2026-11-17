# The Invisible Postman: Project State

**Checkpoint:** 2026-11-17 · discovery decomposition and route observer integration; relationship authority and receiver-acceptance model aligned across thesis and architecture  
**Branch:** `main`  
**Research baseline before checkpoint compression:** `c3f0032c5455682c1c426c6b5b04e26130bc287f`  
**Status:** Theory only · No implementation · Not audited.

## Continue/resume contract

When the user says **continue**, resume from the latest verified repository checkpoint without asking them to repeat project history:

1. Fetch the live default branch and read both session digests, this file, `WORKPLAN.md`, `WORK_LOG.md` and the relevant research/supporting documents.
2. Reconcile completed work, remaining work, blockers and dependencies against saved files and commit history; do not rely on chat recollection or a digest alone.
3. Select the next unfinished, unblocked action in `WORKPLAN.md`, using this file for the current state and `WORK_LOG.md` for chronology/evidence.
4. Continue the work directly in GitHub where permissions allow. If a write is blocked, preserve the work and report the exact limitation; never imply a local or drafted change is in GitHub.
5. After meaningful progress, update the relevant research/supporting files and checkpoint records. Fetch every changed file back and verify its saved content before claiming completion.

Use GitHub work documents as the project continuity source. Do not make the user reconstruct prior decisions already recorded there.

## Working cycle: manage, execute, record, repeat

The four operational documents are a handover mechanism, not a parallel project or an output to be endlessly rewritten:

- `PROJECT_STATE.md` says where the work actually stands now.
- `WORKPLAN.md` says what should be done and the intended sequence.
- `WORK_LOG.md` records actions actually performed, changes, evidence and verification.
- `SESSION_DIGEST.md` and `SESSION_DIGEST.json` are two compact formats of the same handover, not two additional plans.

For each continuation, including a simple “continue”:

1. Read the current records and only the research sources needed for the next action. Check the live branch and relevant commit/file state.
2. Reconcile what is already done, what remains, what is blocked and what depends on something else. Do not repeat completed work merely because it appeared in chat.
3. Choose the next useful, unblocked action. Ask the user only when a missing decision or ambiguity materially prevents safe or correct progress. Do not ask for confirmation of recorded decisions or narrate a plan when execution can proceed.
4. Do the work directly in the appropriate thesis/research/supporting file or connected repository. Use the available turn/token runway productively: finish a coherent unit, then continue to the next unblocked unit while meaningful work remains. Do not stop after planning or after one small edit merely to produce a progress report.
5. Record only what actually happened. Distinguish attempted, drafted, committed, read-back verified, tested and independently reviewed work. Preserve failures, access limits, uncertainty and dissent.
6. Fetch changed files back and verify the saved content. Reconcile the log and current state, then refresh the digests at handover.
7. Summarise actual completed work, verification, limitations and the exact next action. Keep the report concise; it is an outcome report, not a substitute for doing the work.

If a source or action is blocked, make the useful progress still available, record the precise blocker and move to another unblocked dependency where sensible. Do not fabricate progress or hide the blocker. At session close, leave a continuation point that can be resumed from GitHub without reconstructing this conversation.


## Current position

The thesis is the sole product. `thesis.md` is the one active manuscript under development (staging); production is a frozen release of that same thesis, not a separate product or parallel thesis. Its intellectual identity, provenance, citations, evidence boundaries and research integrity persist through both states. Peer review is a substantive scrutiny process whose scope, reviewer contributions, author responses, dispositions, dissent and resulting changes must be traceable; do not imply independent review until it has occurred.

`/work/` is the temporary store of work to be done to develop, analyse, explain, scrutinise and release the thesis. It coordinates research/source reviews, route comparisons, protocol-boundary reconciliation, thesis synthesis, diagrams and peer-review/release processes. It does not own the thesis argument or replace enduring research records. Internal `C-###` and `T-###` keys are private lookup aids, never thesis references. At full release, substantive outcomes must already be in the thesis or enduring research records; then `/work/` can be removed without changing the thesis or its meaning.

The thesis now has a more explicit central argument: transport independence requires endpoint-protected message semantics to remain authenticated across replaceable carriage, while route-specific transformations, observers, discovery and delivery events are made explicit. The central research question and provisional proposition have been tightened; the abstract and research method now state the theory-led comparative approach and its evidence limits. The intended contribution is separated into four testable strands: responsibility-separated architecture, common route comparison, message-relationship/lifecycle analysis and claim-centred evidence discipline. §8.2 contains an initial documentary comparison of image-platform, Dropbox shared-link, Signal protocol and Echomix/Pigeonhole profiles; §11 discusses why the evidence is asymmetric and does not justify an overall route ranking. The related-work discussion now explicitly confronts OMR/GOMR and their performance variants, Oblivious Signaling, Remise, dead-drop covert messaging and image-diffusion covert communication, alongside the existing multi-image, sanitization and steganalysis comparators. W1 and traceability are aligned to ten supporting questions, with confidence/evidence integrated into RQ10 rather than treated as an extra eleventh question. The confidence model remains provisional; its originality, usability and privacy cost remain unproven.

The route-comparison lifecycle/event ledger has now been extended with profile-specific rows for authenticated fragment-set reconstruction, redundant carriage, independent messages/conversation continuity, retry/duplicate and cross-route linkage, and collection-level steganalysis. The latest thesis integration now carries six named evidence-bounded route profiles into §8.2 (Qiao, MRAS, DRAS, Dropbox shared link, Signal protocol reference and Echomix/Pigeonhole) and a source-bounded lifecycle/observer comparison into §8.8. It explicitly distinguishes literature, protocol, service-documentation and deployed-evaluation evidence; no compatible deployed profile is claimed. The §8.8 synthesis concludes only that image carriage creates a distinct platform-transformation research burden, not a demonstrated privacy, reliability or delivery advantage. Existing multi-image watermarking and pooled-steganalysis prior art are treated as constraints on novelty and observer exposure. The thesis now identifies the conditions under which image carriage could become decision-relevant without preferring it in advance. It requires observer vantage, collection size, acquisition window, detector, cover dependencies and side information. A targeted relative-link audit across W1–W4 and the route framework found no broken links. The architecture continues to separate endpoint protection, carrier encapsulation, route adapters and optional orchestration. The protected object remains invariant across routes unless an explicit authenticated conversion is specified; image carriage is a required research comparison, not a mandatory runtime route. The source register now has 49 entries. SRC-043 (Wang et al., 2024) and SRC-044 (Ker, 2007) have full-text reviews; SRC-045 (Ker, 2007) has a full-paper review of the formal asymptotic capacity theorem. SRC-046–SRC-048 add active sanitization and keyed counter-adaptation references at abstract/metadata level. SRC-049 adds an animated-GIF comparator with README and selected source-code inspection; the paper/formal security argument remains unreviewed. The distinction is explicit: Wang's multi-image covert-communication system uses robust DFT/DCT watermarking, fragment numbers and redundant copies with majority-vote reconstruction; it is not evidence of generic steganographic stealth. Ker's pooled-detection and capacity findings are bounded by their detector, independence, cover-capacity and batch assumptions. A dedicated multi-message linkage/steganographic-carriage analysis now defines fragment sets, redundant carriage, independent messages, conversations, retries, cross-route copies, package encapsulation and collection-level observer analysis. It distinguishes frames inside one animated carrier (SRC-049) from separate image objects and distinct messages, and separates passive processing, active sanitization (SRC-036, SRC-046–SRC-047) and keyed adaptation to a known sanitizer (SRC-048). W1–W4 now contain consistent definition/comparison blocks and text-only illustration prompts with placement and guardrails, including new carrier-multiplicity and sanitizer prompts W1-F04, W2-F02, W3-F03 and W4-F03; the diagram index records them. The protocol-boundary analysis remains linked and no cryptographic protocol is selected. A further source-code inspection pinned the author-linked MRAS and DRAS MATLAB repositories (SRC-033/034): their public demos use per-image embed/extract operations and local `imwrite` recompression; the inspected APIs do not provide cross-image fragment-set manifests, reconstruction or conversation linkage. This is evidence about the public demos only, not an independent reproduction or a substitute for full-paper review.

## Completed baseline

- **W0.1:** Repository foundation and GitHub-first workflow established.
- **W0.2:** Research-practice, self-review and contributor-governance documents exist. Routine review administration is deferred; external review has not occurred.
- **Prior art:** 49 source-register entries; comparisons include OMR/GOMR, Oblivious Signaling, Remise, dead-drop messaging, image-diffusion work, Echomix/Katzenpost, Signal protocol specifications, Dropbox shared-link documentation, direct multi-image fragment carriage, batch steganalysis, active image sanitization/counter-adaptation and animated-GIF frame redundancy.
- **Architecture:** Endpoint message protection, carrier encapsulation, transport adapters and optional orchestration are distinct functions. One service may perform several roles; analyse each role separately.
- **Protocol boundaries:** `docs/protocol-boundary-analysis.md` translates open cryptographic composition questions into explicit design obligations. HKDF salt and `info` are distinguished; HPKE is a comparator, not a selected messaging protocol.
- **Multi-message/steganography:** `docs/multi-message-linkage-and-steganographic-carriage.md` records distinct message relationships, package encapsulation, explicit linkage alternatives, collection-level steganalysis, active sanitizer threat conditions and the distinction between GIF-frame redundancy and multi-object fragmentation. W1–W4 and the thesis now use aligned definitions and evaluation distinctions. MRAS/DRAS public code is pinned and inspected as per-image carrier-method reference code, not a multi-image messaging package.
- **Confidence/evidence:** `docs/confidence-and-evidence-model.md` defines claim-centred, verifier-relative confidence and separates evidence of object validity, identity, fragment membership, completeness, conversation continuity and delivery events. It is integrated into thesis §4.1 and §10.5, W1–W4, the contribution/bias assessment, D-13 and traceability. It remains a proposed model, not an evaluated or novel contribution.
- **Thesis argument and route synthesis:** `thesis.md` now has a tightened central research question/proposition, revised abstract/method/contribution, a documentary route comparison in §8.2 and a route-evidence synthesis in §11. Signal's profile is explicitly protocol-level, Dropbox's is shared-link/file-host documentation, and Echomix/Pigeonhole is the strongest integrated comparator in the current documentary set; none is treated as a directly equivalent deployed test.
- **Illustration planning:** Text-only prompts with placement and "must not imply" guardrails are embedded in W1–W4 and indexed in `diagrams/README.md`; no new artwork has been generated.
- **Route method:** A common lifecycle/event and observer framework now includes six evidence-bounded starting profiles (three image literature profiles, Dropbox shared-link file hosting, Signal protocol reference, and Echomix/Pigeonhole). An initial documentary comparison matrix and lifecycle/event observer ledger have been added; the profiles are not yet all pinned to live product releases or deployed test configurations.
- **Latest reconciliation:** README, W4, traceability and diagram index reflect transport independence, optional orchestration, hop-by-hop observer exposure and protected-object invariance.

## Active work, in priority order

1. **Thesis construction and integration (T-006, active):** continue writing and integrating the strongest next argument into `thesis.md`. This sprint formalises relationship authority and receiver acceptance across fragment sets, conversation continuity, retries, redundancy and cross-route carriage, aligned with W3 and the dedicated multi-message analysis; thesis §10.2, W4 E5 and RQ4/RQ10 traceability now carry the corresponding evaluation and evidence obligations.
2. **Evidence gaps (T-001–T-003, active in parallel):** continue full-text/code access work for SRC-033/034/036, SRC-046–048 and SRC-049 when it materially changes a claim. Access barriers do not block unrelated thesis drafting. Keep partial-review labels and narrow claims to inspected evidence.
3. **Route evidence (T-004, ready):** pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/account configurations and service-side lifecycle evidence; do not present protocol or documentation profiles as deployed tests.
4. **Coherence and challenge (T-006/T-007):** align terms, citations, observer assumptions, message relationship semantics, delivery events and confidence/evidence claims. T-007 remains gated until synthesis stabilises.
5. **Diagrams, peer review and release:** remain gated until the thesis argument and evidence are sufficiently stable.

## State and blockers

- W1–W4 are drafted and contain aligned multi-message terminology, definition/comparison blocks and text-only illustration prompts. W1 and traceability remain aligned to the ten thesis research questions.
- W6 thesis construction remains active. The manuscript has improved argument structure, route synthesis and now a bounded protocol comparison, but source reconciliation, version-pinned route evidence, critical challenge and independent scrutiny remain incomplete; it is not review-ready.
- **T-001 access result:** The 17 November publisher-preview pass exposed additional MRAS matching-recompression and DRAS downward-recompression method/evaluation context, and further SRC-036 CNN/sanitisation details. Direct ScienceDirect page retrieval returned 403; full articles, complete methods/tables and limitations remain unavailable. MRAS/DRAS code remains pinned and inspected but not executed.
- **T-002 access result:** SRC-047 author repository zyzhu19/Image-Sanitization was located and its README inspected. The README describes Scaling-Net/SC-Net and links model material externally; attempted GitHub retrieval of testmy.py, test.py, model/README.md and requirements.txt returned 404. SRC-046 OpenReview access redirected to a browser-verification challenge; SRC-048 IEEE abstract/metadata was inspected. Full papers and SRC-047 code/model snapshot remain outstanding.
- **T-003 access result:** An indexed abstract/summary for SRC-049 was located and compared with the already inspected pinned code. Full paper, formal security argument, complete experimental tables and limitations remain unreviewed. The selected code was read, not run or audited.
- **Protocol boundary:** Signal, MLS and HPKE were compared at their distinct native scopes. This is documentary analysis, not suitability proof, implementation or protocol selection. Ratchet out-of-order handling is not fragment-set reconstruction; HPKE is not a full messaging protocol; MLS group state is not assumed to fit the current 1:1 scope.
- The existing static audit of 29 Markdown files and illustration prompt IDs predates the latest substantive edits; rerun relevant link, section, status and cross-document checks after the next material synthesis pass.
- No researcher decision currently blocks the next research pass. The immediate source blocker is access to complete papers/code, not a missing design decision.

## Deferred

- New diagrams until the route comparison produces a stable explanatory result.
- External peer-review packaging until there is a coherent thesis candidate.
- Implementation, platform experiments, extraction tests, steganalysis benchmarks, formal proofs and security audit.

## Next session: exact starting point

1. Resume T-006 first: pressure-test the discovery event chain against the observer/property matrix and W2 threat model, especially malicious or colluding publication/index/retrieval actors, bootstrap-channel substitution, event retention and suppression. Preserve the distinction between protocol-guaranteed properties, assumptions and observer inference; integrate only material corrections into the thesis and evaluation.
2. Keep the active thesis and architecture working set cached; fetch additional files only when dependencies require them, then review the coherent diff and commit together.
3. Continue T-001–T-003 source access in parallel only where it resolves a material evidential weakness; preserve partial-review boundaries and do not let inaccessible papers stall thesis progress.
4. Advance T-004 route configuration evidence when authoritative product/client details are available.
5. Run targeted terminology, citation, section-reference and delivery-semantics checks after the next substantive integration. T-007 remains gated.
6. Keep diagrams, external peer review and release work deferred until their research gates are met.

## Document-boundary rule

The status label below is project metadata describing the repository's verified maturity. It is not a universal conversational instruction or a restriction on research activity. Research principles, substantive arguments, contribution assessments and technical reasoning belong in the thesis and research-supporting documents. Operational documents record verified status, priorities, dependencies and next actions, and link to research material rather than reproducing its exposition. The same distinction applies to assistant working notes and session handovers. ChatGPT Project Instructions are a thin operating layer for continuation, execution and verification; they follow the live GitHub records and do not replace or duplicate the substantive research rules. The actual ChatGPT Project Instructions are managed outside this repository; repository updates document their intended boundary rather than claiming to edit ChatGPT settings.

## Governing constraints

- Image carriage is a required research route, not a mandatory runtime transport.
- Orchestration is optional and does not define transport independence.
- Do not infer anonymity, security or improved privacy from extra hops, carrier uniqueness or concealment.
- Keep endpoint cryptographic validation authoritative; intermediaries do not gain plaintext or sole decryption authority by assumption.
- Preserve uncertainty, dissent, source provenance and historical work. Distinguish established mechanisms, proposed designs and unverified claims.
- Never describe drafts as implemented, tested, proven, audited or externally reviewed.

**Research baseline commit:** [c3f0032](https://github.com/robotard/the-invisible-postman/commit/c3f0032c5455682c1c426c6b5b04e26130bc287f). The 2026-11-16 infrastructure checkpoint records the thesis-product lifecycle, `/work/` remit and expanded backlog in `WORK_LOG.md` and both session digests.

**Verification boundary:** Documentation and repository changes only. No implementation, platform experiment, cryptographic test, formal proof or independent audit has been performed. The relative-link audit was static and limited to Markdown links resolved against the current repository tree.

## Operational checkpoint model · 2026-11-17

The temporary work area now uses one keyed task registry and one commit contract:

- Canonical task lookup: work/lookup/TASKS.json, schema tip.work.registry.v3; tasks is an object keyed by immutable T-### IDs. Each value carries status, priority, targets, dependencies, next action, blockers and completion rule.
- Human index: work/lookup/TASKS.md; it mirrors the keys/statuses but is not another plan.
- Every commit follows the uniform contract in work/README.md: reconcile task and work records before committing; commit one coherent work unit; fetch the commit and changed files; verify exact saved content and applicable checks; record commit/read-back evidence; only then report completion.
- Work may span multiple commits; do not create bookkeeping-only commits when verification can be recorded with the next substantive checkpoint. Digests refresh at handover only, Markdown first and JSON last.
- Current execution priority is T-006 thesis-first synthesis (in_progress); T-001–T-003 source access remains active in parallel where material; T-004 is ready; T-005 is complete. T-007 remains gated on stable synthesis. Diagram, peer-review and release gates remain deferred.

Workflow implementation commits, each exact-read-back verified: c3767d9, 51821d7, 009f59a, 64224e4. Detailed paths and evidence are in WORK_LOG.md.


## ChatGPT Project instruction repair · 2026-11-17

A concise, project-specific instruction set has been prepared at [CHATGPT_PROJECT_INSTRUCTIONS.md](CHATGPT_PROJECT_INSTRUCTIONS.md). It defines the Project as a continuing workspace, makes live GitHub the authority, limits startup reading to the five operational records plus only the research files needed, and prioritises substantive thesis work over planning/admin narration.

The instruction file is a repository-held source for the text to install in ChatGPT Project settings. GitHub access cannot itself change those external settings; installation must be completed in the ChatGPT Project UI. The maturity label is metadata and must not be repeated as a conversational prefix. Context-limit recovery means starting a new chat inside the same Project, preserving the old chat and resuming from the verified GitHub checkpoint.


## Automatic re-entry entry point

[START_HERE.md](START_HERE.md) is the single bootstrap entry point for any assistant resuming this Project. It defines the ordered repository read sequence, work priorities and context-limit recovery. The ChatGPT Project Instructions should direct every new/resumed chat to read it first. This repository file cannot itself attach to ChatGPT Project sources or edit external Project settings.
