# The Invisible Postman: Project State

**Checkpoint:** 2026-11-16  
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

The latest verified work reconciles transport independence and optional orchestration across the architecture, thesis, W4, traceability, README and diagram guidance. The protected message is logically invariant across routes unless an explicit authenticated conversion is specified. Image carriage remains a required research comparison, not a mandatory runtime route.

## Completed baseline

- **W0.1:** Repository foundation and GitHub-first workflow established.
- **W0.2:** Research-practice, self-review and contributor-governance documents exist. Routine review administration is deferred; external review has not occurred.
- **Prior art:** 37 source-register entries; comparisons include OMR/GOMR, Oblivious Signaling, Remise, dead-drop messaging, image-diffusion work and Echomix/Katzenpost.
- **Architecture:** Endpoint message protection, carrier encapsulation, transport adapters and optional orchestration are distinct functions. One service may perform several roles; analyse each role separately.
- **Route method:** A common lifecycle/event and observer framework exists for image, file/attachment, conventional E2E messaging and mixnet-backed routes.
- **Latest reconciliation:** README, W4, traceability and diagram index reflect transport independence, optional orchestration, hop-by-hop observer exposure and protected-object invariance.

## Active work, in priority order

1. **Route evidence:** Select defensible, named and versioned profiles for image-platform carriage, file/attachment transfer, conventional E2E messaging and Echomix/Katzenpost. Populate the route framework with source-backed lifecycle events, observer views, transformations, reliability and costs. Mark unknowns; do not invent platform behaviour.
2. **Source review:** Complete full-text review of SRC-033–SRC-037 and update their review states and evidence boundaries.
3. **Architecture alignment:** Check W3 section numbering and terminology against traceability and the thesis.
4. **Protocol questions:** Analyse nonce uniqueness, salt purpose, key scope, identity/context binding, replay and safe fallback without prematurely selecting a protocol.
5. **Audit:** After substantive edits, run repository-wide relative-link, exact-status and cross-document consistency checks.
6. **Thesis integration:** Reconcile material findings into the thesis, W1–W4, decision register, source register and traceability.

## State and blockers

- W1–W4 are drafted; final alignment against the integrated thesis remains open.
- W6 thesis construction is active; the current manuscript is not a review-ready final.
- Named route profiles and source-backed route observations are not yet complete.
- The full link/status audit has not been rerun after the latest cross-links.
- No current GitHub write blocker is known. The latest main-branch commit and prior edits were fetched successfully.
- No researcher decision currently blocks the next research pass.

## Deferred

- New diagrams until the route comparison produces a stable explanatory result.
- External peer-review packaging until there is a coherent thesis candidate.
- Implementation, platform experiments, extraction tests, steganalysis benchmarks, formal proofs and security audit.

## Next session: exact starting point

1. Apply the Continue/resume contract above. Read both digests, all three working documents and the relevant thesis, research and supporting documents from live `main`.
2. Inspect SRC-033–SRC-037 and complete the highest-value full-text reviews.
3. Select route profiles only where the version/configuration can be evidenced; otherwise record the profile as unresolved and state what evidence is missing.
4. Populate the event/observer ledger, then reconcile the result into the thesis and supporting documents.
5. Check W3 numbering and traceability references.
6. Run the link, status and consistency audit after the edits.

## Document-boundary rule

The status label below is project metadata describing the repository's verified maturity. It is not a universal conversational instruction or a restriction on research activity. Research principles, substantive arguments, contribution assessments and technical reasoning belong in the thesis and research-supporting documents. Operational documents record verified status, priorities, dependencies and next actions, and link to research material rather than reproducing its exposition. The same distinction applies to assistant working notes and session handovers.

## Governing constraints

- Image carriage is a required research route, not a mandatory runtime transport.
- Orchestration is optional and does not define transport independence.
- Do not infer anonymity, security or improved privacy from extra hops, carrier uniqueness or concealment.
- Keep endpoint cryptographic validation authoritative; intermediaries do not gain plaintext or sole decryption authority by assumption.
- Preserve uncertainty, dissent, source provenance and historical work. Distinguish established mechanisms, proposed designs and unverified claims.
- Never describe drafts as implemented, tested, proven, audited or externally reviewed.

**Research baseline commit:** [c3f0032](https://github.com/robotard/the-invisible-postman/commit/c3f0032c5455682c1c426c6b5b04e26130bc287f). The subsequent working-document compression and read-back verification are recorded in `WORK_LOG.md` and `SESSION_DIGEST.json`.

**Verification boundary:** Documentation and repository changes only. No implementation, platform experiment, cryptographic test, formal proof or independent audit has been performed.
