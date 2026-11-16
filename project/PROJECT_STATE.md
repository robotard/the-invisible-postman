# The Invisible Postman: Project State

**Checkpoint:** 2026-11-16 · Multi-message linkage, active sanitization and animated-carrier prior art integrated  
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

## Current position

The repository has a coherent working thesis, W1–W4 research documents, a threat model, decision and traceability registers, prior-art comparisons, an observer/property matrix and a common route-comparison framework. These are substantive drafts, not a finished or independently reviewed thesis.

The route-comparison lifecycle/event ledger has now been extended with profile-specific rows for authenticated fragment-set reconstruction, redundant carriage, independent messages/conversation continuity, retry/duplicate and cross-route linkage, and collection-level steganalysis. It requires observer vantage, collection size, acquisition window, detector, cover dependencies and side information. A targeted relative-link audit across W1–W4 and the route framework found no broken links. The architecture continues to separate endpoint protection, carrier encapsulation, route adapters and optional orchestration. The protected object remains invariant across routes unless an explicit authenticated conversion is specified; image carriage is a required research comparison, not a mandatory runtime route. The source register now has 49 entries. SRC-043 (Wang et al., 2024) and SRC-044 (Ker, 2007) have full-text reviews; SRC-045 (Ker, 2007) has a full-paper review of the formal asymptotic capacity theorem. SRC-046–SRC-048 add active sanitization and keyed counter-adaptation references at abstract/metadata level; SRC-049 adds an animated-GIF comparator based on author-linked implementation documentation and publication metadata. These four new reviews remain partial. The distinction is explicit: Wang's multi-image covert-communication system uses robust DFT/DCT watermarking, fragment numbers and redundant copies with majority-vote reconstruction; it is not evidence of generic steganographic stealth. Ker's pooled-detection and capacity findings are bounded by their detector, independence, cover-capacity and batch assumptions. A dedicated multi-message linkage/steganographic-carriage analysis now defines fragment sets, redundant carriage, independent messages, conversations, retries, cross-route copies, package encapsulation and collection-level observer analysis. It distinguishes frames inside one animated carrier (SRC-049) from separate image objects and distinct messages, and separates passive processing, active sanitization (SRC-036, SRC-046–SRC-047) and keyed adaptation to a known sanitizer (SRC-048). W1–W4 now contain consistent definition/comparison blocks and text-only illustration prompts with placement and guardrails, including new carrier-multiplicity and sanitizer prompts W1-F04, W2-F02, W3-F03 and W4-F03; the diagram index records them. The protocol-boundary analysis remains linked and no cryptographic protocol is selected. A further source-code inspection pinned the author-linked MRAS and DRAS MATLAB repositories (SRC-033/034): their public demos use per-image embed/extract operations and local `imwrite` recompression; the inspected APIs do not provide cross-image fragment-set manifests, reconstruction or conversation linkage. This is evidence about the public demos only, not an independent reproduction or a substitute for full-paper review.

## Completed baseline

- **W0.1:** Repository foundation and GitHub-first workflow established.
- **W0.2:** Research-practice, self-review and contributor-governance documents exist. Routine review administration is deferred; external review has not occurred.
- **Prior art:** 49 source-register entries; comparisons include OMR/GOMR, Oblivious Signaling, Remise, dead-drop messaging, image-diffusion work, Echomix/Katzenpost, Signal protocol specifications, Dropbox shared-link documentation, direct multi-image fragment carriage, batch steganalysis, active image sanitization/counter-adaptation and animated-GIF frame redundancy.
- **Architecture:** Endpoint message protection, carrier encapsulation, transport adapters and optional orchestration are distinct functions. One service may perform several roles; analyse each role separately.
- **Protocol boundaries:** `docs/protocol-boundary-analysis.md` translates open cryptographic composition questions into explicit design obligations. HKDF salt and `info` are distinguished; HPKE is a comparator, not a selected messaging protocol.
- **Multi-message/steganography:** `docs/multi-message-linkage-and-steganographic-carriage.md` records distinct message relationships, package encapsulation, explicit linkage alternatives, collection-level steganalysis, active sanitizer threat conditions and the distinction between GIF-frame redundancy and multi-object fragmentation. W1–W4 and the thesis now use aligned definitions and evaluation distinctions. MRAS/DRAS public code is pinned and inspected as per-image carrier-method reference code, not a multi-image messaging package.
- **Illustration planning:** Text-only prompts with placement and "must not imply" guardrails are embedded in W1–W4 and indexed in `diagrams/README.md`; no new artwork has been generated.
- **Route method:** A common lifecycle/event and observer framework now includes six evidence-bounded starting profiles (three image literature profiles, Dropbox shared-link file hosting, Signal protocol reference, and Echomix/Pigeonhole). An initial documentary comparison matrix and lifecycle/event observer ledger have been added; the profiles are not yet all pinned to live product releases or deployed test configurations.
- **Latest reconciliation:** README, W4, traceability and diagram index reflect transport independence, optional orchestration, hop-by-hop observer exposure and protected-object invariance.

## Active work, in priority order

1. **Source review:** Seek full text for SRC-033, SRC-034 and SRC-036 where access permits. MRAS/DRAS public MATLAB repositories are pinned and inspected, but article methods/tables/limitations remain partial. Review SRC-046–SRC-048 full texts and the SRC-047 sanitization repository; inspect SRC-049 paper/formal argument and code only to the extent useful for the carrier-multiplicity comparison.
2. **Route evidence:** Select defensible, named and versioned profiles for image-platform carriage, file/attachment transfer, conventional E2E messaging and Echomix/Katzenpost. Populate the route framework with source-backed lifecycle events, observer views, transformations, reliability and costs. Mark unknowns; do not invent platform behaviour.
3. **Multi-message observer evidence:** Initial integration into the lifecycle/event/observer ledger is complete. Extend it only when source-specific evidence or a declared evaluation design justifies further detail; keep endpoint-authenticated relationships separate from observer-inferred correlations.
4. **Architecture alignment:** Check W3 section numbering and terminology against traceability and the thesis.
5. **Protocol questions:** Analyse nonce uniqueness, salt purpose, key scope, identity/context binding, replay and safe fallback without prematurely selecting a protocol.
6. **Protocol alignment:** Integrate the new protocol-boundary analysis into W2/W3/W4, key-lifecycle reasoning and the contribution assessment; keep primitive and protocol selection open.
7. **Audit:** After substantive edits, run repository-wide relative-link, exact-status and cross-document consistency checks.
8. **Thesis integration:** Reconcile material findings into the thesis, W1–W4, decision register, source register and traceability.

## State and blockers

- W1–W4 are drafted and now contain aligned multi-message terminology, definition/comparison blocks and text-only illustration prompts; final alignment against the integrated thesis remains open.
- W6 thesis construction is active; the current manuscript is not a review-ready final.
- An initial named profile register, documentary comparison and lifecycle/event observer ledger now exist. Product-level version pinning, route-specific service evidence and full observer/collusion detail remain incomplete.
- SRC-033, SRC-034 and SRC-036 remain partial article reviews because complete paper text/methods/tables/limitations were not accessible. Public author-linked code for SRC-033/034 is now pinned and inspected, but no code was run. SRC-035 and SRC-037 are full-text inspected.
- A fresh post-integration audit checked all 29 Markdown files against the current recursive repository tree: no broken relative links were found. All 29 Markdown files were also scanned for active ZIP/archive-generation instructions; none were found. Exact-status, terminology, image-reference and illustration-placeholder consistency remain to be checked separately.
- No current GitHub write blocker is known. The latest main-branch commit and prior edits were fetched successfully.
- No researcher decision currently blocks the next research pass.

## Deferred

- New diagrams until the route comparison produces a stable explanatory result.
- External peer-review packaging until there is a coherent thesis candidate.
- Implementation, platform experiments, extraction tests, steganalysis benchmarks, formal proofs and security audit.

## Next session: exact starting point

1. Apply the Continue/resume contract above and refresh the live digests and working records.
2. Seek full text for SRC-033, SRC-034 and SRC-036; MRAS/DRAS public repositories are pinned and source-inspected, but retain partial article-review labels until full methods/results and limitations are inspected.
3. Review full texts for SRC-046–SRC-048 and the SRC-047 source repository where available; inspect the SRC-049 paper's formal security argument and the implementation beyond its README. Preserve partial labels until inspected.
4. Pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/configuration profiles before making deployed-route claims.
5. Reconcile protocol-boundary analysis into W2/W3/W4, decision records and thesis; test obligations against Signal, MLS and HPKE references without prematurely selecting primitives.
6. Reconcile any new route findings into W1–W4, the contribution assessment and integrated thesis.
7. Complete the remaining exact-status, terminology, illustration-placeholder and image-reference consistency audit. The fresh 29-file relative-link audit passes and no active ZIP/archive-generation instructions were found.


## Document-boundary rule

The status label below is project metadata describing the repository's verified maturity. It is not a universal conversational instruction or a restriction on research activity. Research principles, substantive arguments, contribution assessments and technical reasoning belong in the thesis and research-supporting documents. Operational documents record verified status, priorities, dependencies and next actions, and link to research material rather than reproducing its exposition. The same distinction applies to assistant working notes and session handovers. ChatGPT Project Instructions are a thin operating layer for continuation, execution and verification; they follow the live GitHub records and do not replace or duplicate the substantive research rules. The actual ChatGPT Project Instructions are managed outside this repository; repository updates document their intended boundary rather than claiming to edit ChatGPT settings.

## Governing constraints

- Image carriage is a required research route, not a mandatory runtime transport.
- Orchestration is optional and does not define transport independence.
- Do not infer anonymity, security or improved privacy from extra hops, carrier uniqueness or concealment.
- Keep endpoint cryptographic validation authoritative; intermediaries do not gain plaintext or sole decryption authority by assumption.
- Preserve uncertainty, dissent, source provenance and historical work. Distinguish established mechanisms, proposed designs and unverified claims.
- Never describe drafts as implemented, tested, proven, audited or externally reviewed.

**Research baseline commit:** [c3f0032](https://github.com/robotard/the-invisible-postman/commit/c3f0032c5455682c1c426c6b5b04e26130bc287f). The subsequent working-document compression and read-back verification are recorded in `WORK_LOG.md` and `SESSION_DIGEST.json`.

**Verification boundary:** Documentation and repository changes only. No implementation, platform experiment, cryptographic test, formal proof or independent audit has been performed. The relative-link audit was static and limited to Markdown links resolved against the current repository tree.
