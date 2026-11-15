# The Invisible Postman: Project State

**Researcher:** @robotard  
**Working title:** *The Invisible Postman: A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging*  
**Checkpoint:** 2026-11-15  
**Status:** Theory only · No implementation · Not audited.

## Governing ethos

> **Never confuse agreement with progress.**

This checkpoint records scrutiny and evidence, not just consensus or completed tasks. Reasoned disagreement and unresolved questions remain visible.

## Purpose

This is the changing, evidence-based progress record. project/WORKPLAN.md is the stable roadmap. Report repository changes only after checking the returned commit result and, where material, fetching the changed file again.

## Verified repository baseline

- Repository: https://github.com/robotard/the-invisible-postman
- Default branch: main; public repository.
- Current GitHub connection permissions were checked during this session: push=true, admin=true.
- The recursive Git tree was checked. It contains 22 paths, including 14 Markdown files.
- Active research files verified: README.md, thesis.md, project/WORKPLAN.md, project/PROJECT_STATE.md, project/WORK_LOG.md, docs/w1-research-framing.md, docs/w2-threat-model.md, docs/w3-architecture.md, docs/w4-risks-and-evaluation.md, docs/traceability.md, docs/decision-register.md, docs/research-practice.md and docs/self-review-register.md.
- Two existing SVG diagrams were verified: diagrams/01-ideation-and-design-evolution.svg and diagrams/03-design-decisions.svg.
- Historical files verified under archive/: the-invisible-postman-thesis.docx and thesis-source-short.md. Neither was changed.
- The active thesis remains thesis.md. An active DOCX export was not found at the former README path.
- The former README references to review/REVIEW_QUESTIONS.md and SECURITY.md did not resolve and have been removed. The review method and author-led challenge register now have verified paths under docs/.

## Completed and verified in this session

### W0.1 · Repository housekeeping

- Reinspected the live repository and confirmed current GitHub push/admin permissions.
- Removed obsolete packaging instructions and exceptions from project/WORKPLAN.md and project/PROJECT_STATE.md.
- Corrected README navigation and stale references. The active DOCX path, uppercase W1/W2 paths, missing review-question file and missing SECURITY.md reference were removed.
- Confirmed W1–W4, the active thesis, decision register, traceability register and work log are present at their actual paths.
- Preserved the archived DOCX and short thesis source unchanged.
- Audited all 14 Markdown files in the repository tree: 19 relative internal Markdown links checked, zero broken links.
- Confirmed there are no embedded Markdown image references in the current Markdown set. Existing SVG diagrams are linked as files, not yet embedded contextually throughout the thesis.
- Confirmed no active Markdown file contains obsolete packaging terminology or instructions.
- Confirmed every active Markdown file contains the exact project status statement: "Theory only · No implementation · Not audited."
- W0.1 is complete for the current repository tree and Markdown-link scope. External links and future additions will need their own verification.

### W0.2 · Critical self-examination and collaborative research practice

- Created docs/research-practice.md as the standing methodology for author responsibility, critical self-review, multidisciplinary peer discussion, evidence-led criticism, attribution, dissent and future asynchronous contribution.
- Created docs/self-review-register.md with twelve initial author-identified challenges.
- The twelve challenges cover proposition value, security-claim discipline, identity verification, protocol composition, carrier value, steganalysis evidence, metadata exposure, multipart ordering and validation, lifecycle/recovery complexity, evaluation design, scope and source grounding.
- Each register item includes section/location, challenged claim or assumption, reviewer question, evidence needed, proposed action, priority, status and response/resolution.
- Linked both documents from the README, workplan and traceability register.
- Explicitly distinguished author-identified challenges from external peer-review findings. No external peer review, reviewer group or endorsement is claimed.
- Identified an important multipart question: transport arrival order is not necessarily authenticated logical order. Safe reassembly of reordered fragments may be appropriate when indices and message-set binding are authenticated; this must be distinguished from conflicting, duplicated, substituted or incomplete sets. Recorded as SELF-08.
- W0.2 has a substantive foundation but remains in progress. The claim-by-claim self-review, source verification and full contribution workflow remain outstanding.

### Verified commits from this session

- Research practice document: 1438b8a4deaaa1bc9c028ba50bd611c644e559cb
- Initial self-review register, including research ethos: 637e12fc81d3d6727f852d26a074a1045ec5995a
- Workplan with Phase 1 work units: 9184cf00fd349d8b2226b681d6e803ba298fb18f
- README navigation and review links: 8b15a418cc713b360062ed0bf7d7ffa21c72766b
- Traceability review links and dissent model: 6350914103d0b92eec2f5330c8cc0cda9fb30fd1
- W1 exact status statement: 1881c90b0ec917d790ab186360322237b89b29c3
- W2 exact status statement: 9f8f236c4b7b257772027150a760e437b360ffc7
- Thesis exact status statement: 2294116cbe7c799044df856657be99db02391be4
- Work log, including research ethos: f708c095572ed912806bc7715ddfcc3454462caf

## Current work-unit assessment

### W0.1 · Repository housekeeping

Complete for the current verified tree and internal Markdown-link scope. Re-run the checks when files or links change.

### W0.2 · Critical self-examination and collaborative research practice

In progress. The methodology and initial challenge register exist. Next, examine the active thesis claim by claim, verify technical/source claims and expand the authors' own response/resolution fields before inviting external reviewers.

### W0.3 · Research-source reconciliation

Not yet completed. Compare the active thesis against W1–W4, the decision register and historical source material. Record contradictions, missing evidence, stale assumptions and unsupported claims without erasing useful design history.

## Verified limitations and outstanding work

- W1–W4 exist in the repository, but the integrated thesis has not yet been fully reconciled against all four.
- The two verified diagrams are SVG files. No complete PNG export set has been verified.
- The thesis still requires substantive integration, claim review, terminology reconciliation, source/reference integration and a stronger research-method narrative.
- The structured external reviewer guide, contribution templates and response workflow have not yet been completed.
- No embedded Markdown image references currently exist; contextual thesis illustration is intentionally deferred until the manuscript stabilises.
- No reviewer PDF has been generated or verified.
- The archived DOCX and short thesis source remain unchanged.

## Next task

Continue Phase 1 in order:

1. Complete the W0.2 author-led claim-by-claim self-review, starting with SELF-01 through SELF-12.
2. Complete W0.3 by reconciling W1–W4, the active thesis, decision register and preserved historical source material.
3. Identify which issues require author decisions and which can proceed through evidence gathering or peer challenge.
4. Build the detailed external review framework after source reconciliation.
5. Stabilise the manuscript before further illustration work.

## Operating rules

- Inspect current repository content before changing it.
- Fetch existing files and use their current blob SHAs before updates.
- Prefer small, reviewable commits.
- After material writes, verify the commit response and fetch the saved file again.
- Keep WORKPLAN.md as the stable roadmap and PROJECT_STATE.md as the changing verified checkpoint.
- Preserve archived editions and commit history.
- Do not implement the messaging system.
- Distinguish verified repository files from Library sources, local drafts and assumptions.
- Record reasoned disagreement and unresolved questions; do not manufacture consensus.
- Defer further illustration until the substantive manuscript and research structure have stabilised.

## Assurance statement

**Theory only · No implementation · Not audited.**
