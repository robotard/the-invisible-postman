# The Invisible Postman: Project State

**Researcher:** @robotard  
**Working title:** *The Invisible Postman: A Theory-Based Architecture for Endpoint-Controlled Cryptographic Messaging with Image Carriage*  
**Checkpoint:** 2026-11-15  
**Status:** Theory only · No implementation · Not audited.

## Session handover digest

- Machine-readable handover: [project/SESSION_DIGEST.json](SESSION_DIGEST.json).
- It is a deliberately small retrieval index for new chat sessions, not a second source of truth. Re-read the live project state, roadmap, work log and thesis before acting.
- Refresh it only after material work has been committed and verified. Never let its cached counts or summaries override a fresh repository check.

## Governing ethos

> **Never confuse agreement with progress.**

This checkpoint records scrutiny and evidence, not just consensus or completed tasks. Reasoned disagreement and unresolved questions remain visible.

## Purpose

This is the changing, evidence-based progress record. project/WORKPLAN.md is the stable roadmap. Report repository changes only after checking the returned commit result and, where material, fetching the changed file again.

## Latest checkpoint · 2026-11-15 · Full-thesis research framing and illustration map

- Reframed the active thesis around the complete research argument rather than allowing transport to dominate the manuscript. The revised structure now covers the research problem and method, design evolution, scope and contribution, distinct security properties, system/trust model, endpoint cryptographic responsibilities, envelopes and multipart validation, transport methods, lifecycle and recovery, evaluation, limitations and unresolved reasoning.
- Kept transport as a substantial Section 8, with image carriage required and other routes treated as comparison profiles. Expanded its reasoning to include distribution, discovery, collection, unique carrier envelopes, variable placement, metadata minimisation, observer models and human behavioural linkability.
- Removed duplicated paragraphs in the former passenger/train subsection and clarified that the train and encapsulation boundary do not create cryptographic integrity, anonymity or participant identity.
- Added `diagrams/README.md`, an illustration index distinguishing the two existing figures from proposed thesis figures. It maps each planned illustration to the relevant thesis section and records design guardrails. No new artwork was created.
- Updated README scope/navigation and corrected literal escaped newline artefacts in its numbered links.
- Thesis, diagram index and README writes returned successful commits. Read-back, link/tree audit and full W1–W4 reconciliation remain the next verification steps.

**Latest thesis commit:** fa1876bf1ba42538c30efc3b49c5784016144257  
**Illustration index commit:** fd0fc64237ab3b36cab364c9292185af5b52c3f7  
**README commit:** 258ba0c88ce35fc3400f25eaff8a394826ae6b10

## Verified repository baseline

- Repository: https://github.com/robotard/the-invisible-postman
- Default branch: main; public repository.
- Current GitHub connection permissions were checked during this session: push=true, admin=true.
- The recursive Git tree was rechecked after the governance additions. It contains 22 files (excluding directory entries), including 18 Markdown files.
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

## 2026-11-15 · Transport privacy clarification

The D-11 passenger/train separation has been refined. The standalone train may use a unique image envelope per carriage instance, vary carrier placement, and decapsulate at the receiving side before handing the protected object to the participant endpoint. This is a bounded transport-level unlinkability objective, not proof of participant anonymity.

Metadata minimisation is now a baseline requirement for carrier processing. Unnecessary embedded image metadata and identifying file-level properties should be removed before publication, while metadata generated by hosts, platforms, networks and observers remains a separate exposure.

Human behavioural linkability and social engineering are now explicit threat/evaluation concerns. Repeated schedules, response patterns, platform/device habits, language, formatting, image styles and predictable reactions may correlate exchanges. False delivery notices, urgency, staged failures and timed prompts may exploit those patterns.

Updated and read-back verified: thesis, D-11 decision register, W2, W3, W4 and traceability. The recipient-discovery mechanism, metadata allowlist, observer model and evaluation scenarios remain open. This is architectural theory only; no implementation or validation is claimed.

## Current work-unit assessment · 2026-11-15

### W0.1 · Repository housekeeping

Complete for the current verified tree and internal relative Markdown-link scope. The latest audit covered all 20 active Markdown files: 51 relative links checked, zero broken targets; every active file contains the exact status statement; no active ZIP/archive-generation instructions were found.

### W0.2 · Research-practice foundation

The methodology, author challenge register, governance proposal, contribution templates and adopted-practices baseline exist. Routine author-led challenge review is now deliberately deferred until a coherent thesis candidate exists, except where a specific issue blocks progress or risks embedding a material error. External peer review remains lowest priority until the thesis is workable.

### W0.3 · Research-source reconciliation

In progress. This batch aligned W1's central and supporting questions with the thesis; reconciled multipart arrival-order semantics across W2, W3, W4 and traceability; formalised encapsulation/train/route-adapter responsibilities and decapsulation lifecycle in W3; added a route-comparison matrix to W4; and repaired traceability duplication and numbering. An initial 19-entry source register now covers cryptographic specifications, protocol comparators, image metadata, steganalysis, rendezvous and traffic-analysis research. The thesis has a provisional author-date bibliography and claim-level citations for selected claims. The archived short thesis source was inspected as historical context and remains unchanged. Full-text review of all sources, further literature coverage and complete thesis-to-supporting-document reconciliation remain outstanding.

### W6 · Integrated thesis

Substantive working draft. The thesis now points to the W4 route-comparison matrix. It is not yet a stable review candidate: source grounding, full consistency audit, claim-language refinement and editorial integration remain.

### W7 · Traceability

The ten main research questions now map to the thesis and W1. Threat, component and evaluation mappings have been updated for discovery, metadata, behavioural correlation and safe out-of-order reconstruction. Further verification remains.

### W5 · External review preparation

Deferred until a workable thesis candidate exists. Existing governance material is preserved; no new reviewer solicitation or peer-review activity is claimed.

## Verified limitations and outstanding work

- Full W1–W4 and thesis line-by-line reconciliation remains in progress.
- An initial 19-entry source register and claim map now exist; full-text review and claim-specific verification remain outstanding, especially for steganalysis, human factors/social engineering, platform transformations and parser/resource-exhaustion research.
- The complete observer model, recipient-discovery/rendezvous design, carrier metadata allowlist and evaluation scenarios remain open.
- The two existing diagrams remain the only verified illustrations. New artwork and contextual embedding remain deferred until the substantive manuscript stabilises.
- No reviewer PDF has been generated or verified.
- The archived DOCX and short thesis source remain unchanged.

## Next construction tasks

1. Continue reconciling the complete thesis against W1–W4, D-10/D-11, the decision register and traceability.
2. Inspect and strengthen the full route comparison, discovery/rendezvous model, metadata inventory and multipart failure semantics.
3. Verify technical claims against primary specifications and authoritative research; record source provenance and claim limits.
4. Refine the thesis into a coherent review candidate, then provide one consolidated GitHub deployment digest and any genuinely blocking author decisions.
5. Only after the manuscript stabilises, resume contextual illustrations and reviewer publication.

Routine author review and external peer review must not displace thesis construction.

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


## 2026-11-15 · Collaborative governance checkpoint

### Completed and verified

- Added docs/collaborative-governance.md, a proposed consortium-inspired, project-scoped governance framework.
- Added contribution and review attribution template at docs/templates/contribution-review-record.md.
- Added practice proposal and decision record template at docs/templates/decision-record.md.
- Defined the practice lifecycle from Draft through review, ratification, adoption, contestation and supersession.
- Defined independent review thresholds, with stronger requirements for security-, privacy- and safety-significant practices.
- Defined the project-wide baseline "global commit" as an auditable merge after ratification, with the originating proposal, exact reviewed version, reviewers, dissent, contributor mapping and merge SHA retained.
- Distinguished contribution, review, approval, ratification and endorsement. Added consent-based attribution using CRediT roles where appropriate, while separating review credit from Git commit authorship.
- Defined automation as process enforcement only. It may validate metadata and approval gates but must not infer truth, expertise, independence or consent, and must never erase dissent.
- Integrated the framework into README.md, project/WORKPLAN.md, docs/research-practice.md, docs/traceability.md and docs/decision-register.md. Added proposed governance decision D-08.
- Added official CRediT and GitHub documentation as source notes in the governance document.
- Verified successful GitHub write responses for all new files and cross-document changes.
- Recorded this work in project/WORK_LOG.md.

### Governance and repository controls: verified limits

- The GitHub repository rulesets endpoint returned an empty list.
- The available connection returned HTTP 403 when branch protection for main was queried. Branch-protection status is therefore unverified.
- No GitHub protection setting, automation, auto-merge or ratification workflow was enabled.
- No external peer reviewers, consortium members, ratified practices or contributor endorsements are claimed.
- The governance framework is a proposal pending independent review. The "global commit" is a defined future adoption event, not an event that has occurred.

### Work-unit status

- W0.1 remains complete for the previously verified repository tree and internal Markdown-link audit.
- W0.2 has expanded: research-practice method, author challenge register and collaborative governance/attribution framework now exist. Actual peer review, author claim-by-claim responses and a tested contribution workflow remain outstanding.
- W0.3 remains outstanding: reconcile the thesis with W1–W4, decision register and historical source material.

### Next work

1. Continue W0.2 by conducting the author claim-by-claim review and verifying source claims.
2. Complete W0.3 source reconciliation.
3. Invite independent review of the governance framework before treating it as adopted policy.
4. Decide whether branch protection/rulesets should be enabled after the actual reviewer permission model is known.
5. Exercise the templates with real contributions only when contributors consent and their roles are confirmed.
6. Do not automate adoption until the manual process has been independently examined and successfully exercised.
7. Stabilise the manuscript before further diagrams and reviewer PDF work.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Established framework comparison and adaptation

### Completed and verified

- Compared the proposed collaborative governance model with official OpenSSF Best Practices Badge criteria, OpenSSF Scorecard, Apache Software Foundation governance, IETF RFC 7282 rough-consensus guidance, CRediT contributor roles and GitHub review controls.
- Updated docs/collaborative-governance.md with an explicit "borrow, adapt and refuse carefully" analysis for each model.
- Added D-09 to docs/decision-register.md, recording the selected adaptations and explicit exclusions.
- Updated project/WORKPLAN.md so future work uses established frameworks rather than inventing governance mechanisms unnecessarily.
- Confirmed the distinctions:
  - OpenSSF Badge criteria can inform an evidence-backed checklist, but this theory-only repository must not claim a badge or treat self-assessment as peer review.
  - OpenSSF Scorecard may later assess software repository security posture, but cannot score thesis quality, protocol correctness or scientific validity.
  - Apache's public asynchronous deliberation and reasoned objections are useful; its institutional roles and lazy-consensus rules are not imported, and silence is not consent.
  - IETF rough-consensus objection handling is useful; "running code" is not made a gate for theory-only work.
  - CRediT offers a contribution vocabulary, not an authorship test; attribution remains consent-based and tied to accepted work.
  - GitHub issues, pull requests and protected-branch reviews are useful mechanisms, subject to actual permissions and settings.
- Added primary source links for each framework in the governance document.
- Verified successful commits:
  - Governance framework: c35304dade24a5483e5ac01ae76c76cde4808190
  - Decision register D-09: 97f2e4b1ea53fe10c1488b070d2284c32746b8c0
  - Workplan adaptation note: 7e67e6fc9a6e62d9fee44422dcf087387899e69b

### Not completed

- The frameworks have not been independently reviewed or formally ratified by external participants.
- No OpenSSF badge, Scorecard run, GitHub protection rule or automated adoption workflow has been enabled.
- No multi-party consortium is claimed.
- This is a research-method and governance-document adaptation only, not implementation of the messaging system.

### Next

Continue W0.2/W0.3: complete author-led claim review and reconcile the active thesis with W1–W4 and the decision register. Invite external review of the governance framework before operationalising its proposed ratification rules.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Adopted-practices baseline and contribution-rights boundary

### Completed and verified

- Created docs/adopted-practices.md as the versioned project-scoped working baseline, initially version 0.1.
- Recorded six maintainer-adopted research practices covering critical examination, reasoned objection dispositions, contribution attribution, version-specific independent review, process-only automation and auditable baseline changes.
- Explicitly labelled the baseline as maintainer-adopted and awaiting external review. No external ratification, consortium approval or universal best-practice status is claimed.
- Added current attribution for the maintainer's work only; no external contributors or reviewers are invented.
- Linked the baseline from README.md and the governance framework; updated WORKPLAN.md.
- Clarified the DCO boundary: no DCO sign-off is required until a repository licence and contribution terms are selected and documented. DCO is a contribution-rights attestation, not peer review or proof of originality.
- Verified successful commits and read-back:
  - Adopted practices baseline: b5e01fdb577092d99a537b9ab6b34d0585fe8791
  - README link: aa88f5485876669a89b750f1a73ae39bca0a484d
  - Governance/DCO clarification: 18c4de20569859df0ff9b6a0d5c0cb9baa074c20
  - Workplan link and scope: ccfe2a8586a949006fc5180da3017329de315302

### Remaining governance limitations

- The manual governance model has not yet been exercised with an external contribution.
- The governance framework and baseline have not been independently reviewed.
- No branch-protection rule or automation was enabled.
- The repository has no verified root LICENSE file; contribution licensing and DCO adoption remain open.

### Next

Resume W0.2 author-led claim review and W0.3 source reconciliation. Do not automate ratification or enable branch protection before the manual process, contributor permissions and review model have been independently examined.

**Theory only · No implementation · Not audited.**


### Follow-up repository audit

- Rechecked the recursive main-branch tree after the governance work: 22 files, 18 Markdown files (17 active Markdown files plus one preserved archived Markdown source).
- Rechecked active Markdown status statements: all 17 active Markdown files contain the exact required status. The archived short thesis remains unchanged.
- Rechecked relative Markdown links: 34 links, zero broken targets.
- Rechecked active documents for obsolete packaging directives: none found.
- Added the exact project status statement to both active templates and verified their saved contents:
  - Contribution/review template: ad7ee31500b2eec37b23a2a827f5ac763d1ca4e9
  - Decision template: 2b5153411800efbf26dcd84eacef749a7de7d340

**Theory only · No implementation · Not audited.**


## 2026-11-15 · W0.2 author-led claim review: SELF-01 to SELF-03

### Completed and verified

- Re-read the active thesis, W1 research framing, W2 threat model, W3 architecture, W4 evaluation framework and the relevant self-review entries before recording author responses.
- SELF-01: confirmed that the manuscript does not yet demonstrate a distinct advantage for image carriage over encrypted attachments, encrypted file transfer or conventional end-to-end messaging. Recorded a provisional recommendation to test image carriage as a candidate transport profile and retain it as a case study unless comparative evidence establishes a necessary advantage. No final scope decision made.
- SELF-02: found that the documents consistently label the work provisional, but the title and some shorthand wording may imply achieved authentication. Recorded a claim-language audit requirement and a distinction between architectural requirements and demonstrated properties.
- SELF-03: separated key control, key continuity and real-world identity proof. Recorded the need to define the minimum identity assurance level and compare verification ceremonies, including key changes and recovery.
- Updated docs/self-review-register.md with author responses, provisional recommendations, evidence requirements and explicit unresolved status. No item is represented as external peer review.
- Verified the saved register after each commit:
  - SELF-01: 335b04cb05a2cc2b087e5c37df2c14bd68fd2169
  - SELF-02: 8b9a0393a655e9743487815169adadf8d06d3c19
  - SELF-03: a78c6fa8583e003fa775f7da2d66a182b9339c6e

### Decisions deliberately deferred

- Whether image carriage is a core requirement or an optional transport profile.
- The intended identity-assurance level and whether the project needs real-world identity proof or only verified cryptographic peer-key continuity.

These decisions require the comparative use-case analysis and threat-led evidence to be presented before asking the researcher to choose.

### Next

Continue the author-led review with SELF-04 through SELF-12, then complete W0.3 source reconciliation. Do not start illustration work until the manuscript and scope decisions stabilise.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Transport-route scope and contributor-continuity clarification

### Researcher scope clarification

The researcher explicitly confirmed that message carriage must be included as transport routes. Image carriage is a required route in the research and remains central; it must not be demoted to a decorative or optional afterthought. Other routes may be modelled as comparison profiles. This is recorded as D-10 in docs/decision-register.md.

### Completed and verified

- Updated the SELF-01 response: the earlier suggestion to make image carriage merely optional was too broad. The route layer is first-class; image carriage is required; alternatives are comparison profiles. Comparative evaluation remains necessary and does not presume image-route superiority.
- Updated the active thesis, W1 and W3 to reflect the route-layer decision.
- Added docs/idea-intake-and-continuity.md to address three explicit governance risks: no active external contributors, absent/dormant contributors, and useful ideation being overlooked.
- Added continuity rules for durable idea capture, provenance, triage, resurfacing, contributor return, attribution uncertainty and no-contributor operating mode.
- Updated the governance framework, decision register, README and WORKPLAN.
- Successful read-back verification:
  - Idea intake and continuity document: aee8c451618b419c12bcf3525a88fa8054566541
  - Governance framework: 68dd9a42ee34740d6dfaec5b28a3b15158fa87f0
  - Decision register D-10: 12c9436f6539c2e0622bb3db9fcac1dea33d26ed
  - SELF-01 correction: 5627f900da6742cc9c4b29738dc2f51c0f94e063
  - Thesis: 31cfd09d516ff0bc2a6a65427a0f07281db72c15
  - W3: 67a19f9ec9d163b145e497d466d0ac61c85b9338
  - README: 939269f6b23a86cd226beee276a575d24824eba4
  - WORKPLAN: 575af57b8f544db9c56649972e118d0242951825

### Important boundary

No external contributors or reviewers are currently claimed. The new intake and continuity process is a proposed manual process and has not yet been exercised. No automation or GitHub enforcement was enabled.

### Next

Continue author-led SELF-04 to SELF-12 and W0.3 source reconciliation. Then define the transport-route comparison matrix and reconcile route terminology across thesis, W1–W4 and evaluation. Keep diagrams deferred until the substantive architecture stabilises.

**Theory only · No implementation · Not audited.**

- Extended W4 E6 to evaluate the transport-route layer, including route-specific metadata, capacity, ordering, delivery semantics, fallback/substitution, image transformations and extraction failure.
- Updated traceability to map the required image route and comparison profiles into research questions, threats, architecture and evaluation.
- Verified W4 and traceability read-back after commits c5e3b35d32726c0dd13b1f30f0f9800d7127b3cb and 5629dbd5b488d44cd83c81e067c8422ad6fc1b20.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Research-construction priority reset

### Researcher direction

The researcher has clarified the immediate sequencing:

- Routine author-led review is lower priority unless a specific issue blocks responsible progress or risks embedding a material error.
- External peer review is the lowest priority until a workable, coherent thesis exists.
- The current runway should be used to build, reconcile and strengthen the thesis rather than repeatedly presenting fragments for review or expanding review administration.
- The researcher wants concise summaries of items actually committed to GitHub, with direct links and verification status, before undertaking their own review.

### Operating response

- Added a research-construction priority and review-gate section to `project/WORKPLAN.md`.
- Added a GitHub deployment-digest protocol: report exact changed paths, purpose, commit SHA and link, read-back/verification performed, remaining gaps and any genuinely blocking decision.
- The digest must be based on live GitHub results. Uncommitted drafts and planned work must not be described as deployed.
- Clarified that this is a GitHub-first execution/reporting routine, not a new CI bot. Do not add untested GitHub Actions or automated research-quality judgements.
- Existing author-review and peer-governance records are preserved, but they must not displace construction of the integrated thesis.

### Verified deployment

- `project/WORKPLAN.md` updated and read back successfully.
- Commit: `2042d79f4e25b832a69fef3f6e59f0d0c53035d2`
- Blob SHA after read-back: `b04f2384001d4cbee4af13e1f54c7573cc329720`

### Next construction work

1. Reconcile the integrated thesis against W1–W4, decision register and traceability.
2. Inspect W3's component inventory and lifecycle for the standalone train, encapsulation, unique carrier envelope, placement, recipient discovery, decapsulation and metadata-removal boundaries.
3. Reconcile W2/W4 actor-specific metadata and behavioural-linkability threats with the thesis.
4. Build the route comparison and failure-semantics reasoning, keeping image carriage required and alternative routes comparative.
5. Integrate and verify primary sources and claim boundaries.
6. Only surface researcher decisions where a genuine blocking ambiguity remains.

No author review or external peer review is being represented as completed or invited.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Thesis and architecture reconciliation batch

### Deployed and read-back verified

- Updated W1 to match the thesis central research question and ten supporting questions; clarified required image carriage and route comparison scope.
- Updated W2 to distinguish valid out-of-order capsule arrival from invalid or ambiguous message-set construction, and clarified the image route/comparison profile boundary.
- Updated W3 to move password-derived keying into the correct architecture-principles section; distinguish transport arrival order from authenticated logical order; define encapsulation/decapsulation, standalone train and route-adapter responsibilities; add discovery, metadata allowlisting and safe decapsulation to the lifecycle; and update trust boundaries, threat mapping, topology and open decisions.
- Clarified that per-carriage carrier uniqueness means non-reuse, not cryptographic randomness, entropy or guaranteed unlinkability.
- Updated W4 with safe out-of-order reconstruction criteria, explicit decapsulation checks and a four-profile route-comparison matrix.
- Rebuilt traceability around the ten thesis research questions; repaired duplicate RQ3b and duplicate unresolved-decision numbering; added discovery and metadata threat mappings; clarified multipart semantics and component boundaries.
- Updated D-11, linked the thesis route comparison to the W4 matrix, repaired README line breaks and reordered the workplan so thesis construction precedes review-framework expansion.

### Verification

Changed research documents were fetched after successful GitHub writes. Targeted checks confirmed the W1 question list, W2 route scope, W3 component/lifecycle structure, W4 comparison profiles, ten-row traceability map, README line breaks and workplan order. The whole-repository relative-link/status/package-instruction audit has now passed for the current tree; external URLs and future changes remain outside that check.

### Key commits

- W1: `e4157bb960b7c9f6181919716bb71cf6b36f3138`
- W2: `38be882a104b80e47f98a276f1d7926dc2ca51b4`
- W3: `b9b33d65f24025541d015dd326988607e39093f2`
- W4 route matrix: `494a13980ef9f2f561bf26c6a097a377aaad38c9`
- Traceability: `f5af660490dea1cb66271049b87e3652773252cf`
- Thesis: `8d8ae5fa7e8c4ad02fc64a0a93a87f2f53080f25`
- Decision register: `39e6b4afe8896491d1dfe0d40c2a60ffa7682a00`
- README: `6e1543a93a4b23dbbae3e1213c573e71ecf61d64`
- Workplan: `3812d5d44a6e2b41a0824e6920a79991e3e4cafc`

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Repository consistency audit

- Re-read all 19 active Markdown files on the default branch.
- Checked 45 relative Markdown link targets against the live repository tree: zero missing targets.
- Confirmed all 19 active Markdown files contain the exact status string: `Theory only · No implementation · Not audited.`
- Checked active Markdown for ZIP/archive-generation instructions: none found. Historical archive references and preserved archive files remain intentionally intact.
- Confirmed the current tree contains 24 files, including 20 Markdown files (19 active and one preserved archived source).
- Marked W0.1 complete in the workplan for this verified scope. External URLs, heading-anchor resolution and future repository changes are not included in the relative-path audit.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Source integration and traffic-privacy research

### Deployed work

- Created `docs/source-register.md` with 19 entries spanning cryptographic primitives, messaging protocol comparators, NIST key-management guidance, Exif/IPTC/XMP metadata standards, steganalysis, rendezvous and traffic-analysis research.
- Integrated provisional author-date citations and a working bibliography into `thesis.md`.
- Added traffic-analysis reasoning to the thesis: encrypted content does not remove observable timing, size, flow and endpoint metadata; carrier rotation is not equivalent to mix-network protection.
- Added bounded research comparisons:
  - Loopix as an example of explicit mixing and cover traffic, not an assumed project component.
  - Tor v3 rendezvous as an example of discovery/rendezvous being explicit protocol machinery, not a side effect of variable placement.
  - Bozorgi et al. (2023) and Li (2026) as traffic-analysis evidence under specific observer models, not direct results for this image-carriage proposal.
- Clarified that social-engineering and interpersonal behavioural claims still need dedicated usable-security/human-factors sources.
- Expanded W2 threats for flow correlation, discovery/rendezvous correlation and behavioural probing.
- Expanded W3 to distinguish carrier-level variation from network-level traffic-analysis defence.
- Expanded W4 E9 with actor-specific observer models, measurable correlation conditions, error rates and the cost of padding, delay, batching, cover traffic or mixing.
- Added source mappings to W2, W3, W4 and traceability; updated the workplan to make the source register part of W0.3 and W6.

### Verification and limits

- The source register, thesis, W2, W3, W4, traceability and workplan were fetched after successful writes.
- Source claims are deliberately bounded. The 2026 IM-call study is limited to its stated services, two-device testbed and controlled trials; the 2023 IM study's traffic features and countermeasures are not assumed to transfer directly to this architecture.
- The bibliography is provisional. No claim of systematic literature review or full verification of all 19 sources is made.
- A fresh repository-wide link/status audit is required after adding the source register and its cross-links.

### Key commits

- Source register (19 sources): `659f23052d0c40a6b26df881efc37e4700f9aa1d`
- Thesis traffic-analysis integration: `09397dba778a826da8d3fc21de84826f9c1eefe3`
- Thesis bibliography: `ed3155f04ae1b386b4e6cae02257c5cb9a31316b`
- W2 traffic/discovery threats: `994fddc34c8a1983f0a7e6fba562b04203ee3ca5`
- W3 carrier-vs-network boundary: `b689010c9c5cdc5a62e1857e154e6e835825e995`
- W4 E9 traffic-analysis evaluation: `a23fd8f71e29c751d94f5671e6d0d9431b369934`
- Traceability traffic mapping: `81ea9a1eccf72eefac302d9ed468f25f42792d8f`
- Workplan source workflow: `1b5d5399ba880c79a80bb607c0d1a0bc60f0aac4`

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Post-source-integration repository audit

- Current working tree: 25 files, including 21 Markdown files (20 active and one preserved archived source).
- Re-read all 20 active Markdown files from the live default branch.
- Checked 51 relative Markdown link targets against the current repository path set: zero missing targets.
- Confirmed all 20 active Markdown files contain the exact status statement: `Theory only · No implementation · Not audited.`
- Checked active Markdown for ZIP/archive-generation instructions: none found.
- Confirmed the new source register is linked from README, thesis, W1 and traceability; W4 links to it for traffic-analysis evaluation.
- Preserved historical archive material unchanged. External URL availability and heading-anchor rendering are not covered by this path audit.

**Theory only · No implementation · Not audited.**
