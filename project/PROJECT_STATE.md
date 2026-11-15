# The Invisible Postman: Project State

**Researcher:** @robotard  
**Working title:** *The Invisible Postman: A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging*  
**Checkpoint:** 2026-11-15  
**Status:** Theory only · No implementation · Not audited

## Purpose

This is the changing progress record. `project/WORKPLAN.md` is the stable roadmap. Only report repository changes after checking GitHub's returned commit result and, where material, fetching the changed file again.

## Verified repository baseline

- Repository: https://github.com/robotard/the-invisible-postman
- Default branch: `main`; public repository.
- Current GitHub connector permissions: `push: true`, `admin: true`.
- Core files present: `README.md`, `thesis.md`, `project/WORKPLAN.md`, `project/PROJECT_STATE.md`, `docs/w3-architecture.md`, `docs/w4-risks-and-evaluation.md`, and `docs/traceability.md`.
- `docs/decision-register.md` and `diagrams/03-design-decisions.svg` were added and verified in this checkpoint.
- The 14 November review-candidate archive in the Library contains W1, W2, a longer password-focused thesis source, and three PNG diagrams. These are source artifacts, not proof that the corresponding files are already present in GitHub.
- The integrated root thesis now follows the endpoint-controlled research direction and retains the password-derived model as an intentional starting point and evaluated alternative.

## Completed and verified

- Confirmed direct GitHub write access and adopted GitHub-first publication; no ZIP is needed for routine updates.
- Reconciled the password-based starting model with the broader endpoint-controlled architecture in Thesis Section 2.1.
- Recorded why the password model was initially chosen: familiarity, portability, low setup overhead, and no initial need for a central identity directory or key service.
- Recorded why the scope evolved: explicit peer verification, sender authentication, authenticated session context, and key lifecycle are not supplied by a shared password alone.
- Retained password-derived encryption as a narrow alternative under explicit assumptions, not as the current identity model.
- Added W3 section 2.5, W4 evaluation domain E10, and decision traceability.
- Added `docs/decision-register.md` covering the password decision and the other major design changes.
- Added `diagrams/03-design-decisions.svg` and linked it from the thesis and README.
- Fetched changed files from GitHub after writes. Read-back checks confirmed the thesis rationale, W3 alternative, decision register, W4 evaluation, traceability, README links, diagram contents, and this state file.

## Latest verified commits

- Thesis password rationale: `8f91f7d400af1a8f3b53469f5cc9d96a58143620`
- W3 alternative: `02eba9fcbe05eeb356d6d4c88d6b60defc8052dc`
- Decision register: `1bf7967b64db86e6a0eaee8c0b8b8e97a6246b83`
- W4 evaluation: `e00e15e9f2a822553dad8503070cdb197d29816c`
- Traceability: `e1458b81178f74fb585b61458fb14e635cb6b978`
- README decision-register link: `d85edbb399394a59849c963a4da0bfccb4cec984`
- Updated design-decisions SVG: `606d7f105e29a04b1b828cf92df1315e8ccfd4ae`
- Thesis diagram reference: `97b1d7a75448334830341a6ae8dff2ce1a12bee1`
- README diagram link: `ecd75274fb47d780265d81408d6eaeb556217805`
- State checkpoint: `18c70a32422a1c5d5dc8f019e8fb55240ff7dc43`


## 2026-11-15 · Illustration pass

- Added `diagrams/01-ideation-and-design-evolution.svg`, a rich workflow illustration showing the initial question, password-derived starting model, its rationale and limits, the expanded research question, and the current endpoint-controlled direction.
- Added `project/WORK_LOG.md` to hold the illustration backlog and work that cannot be completed in one pass.
- Linked the ideation illustration from README and thesis.
- Source framing checked against the W1 and W2 documents in the 14 November review source archive. The archive was used only as a source for inspection; no ZIP is being prepared or used as the publication deliverable.
- Diagram commit: `3e24cb5d2128fbfd483d80c3759bf8e559f7631f`
- Work log commit: `f8400dde083c1e2c831dddbd0b220d6c79bdd332`
- README link commit: `25990708610158575d6864687be16e3f1319b191`
- Thesis reference commit: `c4111f9a2cc9c1cdc3dc48800c1dba0b08457617`
- Deferred work is listed in `project/WORK_LOG.md`; it includes publishing/reconciling W1 and W2, trust-boundary and carrier-flow illustrations, threat-to-control mapping, lifecycle/limitations, and a full diagram consistency pass.

## Remaining

1. Publish the verified W1 and W2 source documents from the 14 November review-candidate archive to the intended repository paths, after comparing their content with the integrated thesis.
2. Publish or verify the trust-boundary and message-carrier diagrams. The updated design-decisions SVG is the only diagram published and verified in this pass.
3. Review the integrated thesis against W1–W4 for terminology, traceability, completeness, and claim discipline.
4. Verify every README and manuscript link and check whether the referenced DOCX export exists before describing it as available.
5. Prepare the next review-ready manuscript state and update this record after verification.

## Next task

Complete the W1/W2 and diagram publication/consistency pass. Preserve the password rationale and the distinction between the original model and the current endpoint-controlled direction.

## GitHub-first operating rules

- Inspect current repository content before changing it.
- Fetch existing files and use their current blob SHAs before updates.
- Prefer small, reviewable commits.
- After material writes, verify the commit response and fetch the saved file again.
- Summarise only verified changes, verification and remaining work.
- Ask for user intervention only for a genuine decision, missing permission/authentication, unresolved conflict, ambiguous source of truth, or required visual judgement.
- Do not create a ZIP unless GitHub publication is unavailable or the user explicitly requests one.
- Do not implement the messaging system.

## Assurance statement

**Theory only · No implementation · Not audited.**
