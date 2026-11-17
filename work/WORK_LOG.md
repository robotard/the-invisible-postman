## 2026-11-16 · Expanded thesis related-work pressure test

### Work performed

- Extended thesis §3.4 and §8.4 to explicitly discuss OMR/GOMR and the OMR-family performance variants (PerfOMR, SophOMR, InstantOMR), Oblivious Signaling and Remise.
- Integrated the dead-drop covert-messaging pipeline and image-diffusion covert-messaging construction as distinct prior-art families, preserving their different channel models and delivery assumptions.
- Added the corresponding complete bibliographic records for PerfOMR, SophOMR, InstantOMR, Oblivious Signaling, dead-drop covert messaging and image-diffusion covert messaging.
- Reconciled the thesis argument so it no longer relies on generic claims to private discovery, whole-pipeline analysis or image-based covert messaging. The remaining research question is a narrower comparison of route-specific transformations, observer visibility, endpoint-authenticated message relationships and lifecycle semantics.

### Evidence boundary

The referenced papers are recorded as full-text inspected or abstract/metadata-level in the source register according to their actual review status. No new paper review, reproduction or independent validation was claimed by this thesis integration. The contribution remains provisional and must be tested against the full comparator set.

### Verification

- The updated thesis and bibliography were fetched back from GitHub.
- The project state and work log were reconciled to this additional thesis progress.
- No implementation, experiment, protocol selection, independent review or audit was performed.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · Thesis argument and route-comparison synthesis advanced

### Work performed

- Rewrote the thesis abstract to state the research object, architecture, comparison method, evidence-bounded confidence principle and unresolved originality status.
- Tightened the central research question around preservation of authenticated message semantics across replaceable, untrusted routes and what route-specific evidence can establish under defined observer models.
- Added a provisional thesis proposition distinguishing genuine transport independence from merely moving ciphertext between services.
- Consolidated the supporting research questions to ten. Confidence/evidence is now part of RQ10 (evaluation), not an additional eleventh question.
- Reworked the research approach to state conceptual decomposition, structured prior-art comparison, threat/observer modelling, lifecycle analysis and falsifiable evaluation, while distinguishing publisher-indexed claims, inspected code, full-paper review, reproduction and independent evaluation.
- Reframed the intended contribution into four strands: responsibility-separated architecture; common route-comparison method; message-relationship/lifecycle analysis; and claim-centred evidence discipline. Explicitly disclaimed novelty in ciphers, embedding methods, anonymity networks and a complete messaging protocol.
- Added an initial documentary route-comparison table to thesis §8.2 for image-platform carriage, Dropbox shared-link/file hosting, Signal protocol references and Echomix/Pigeonhole. The table preserves each profile's native semantics and states what current sources do not establish.
- Added the route comparison's asymmetric evidence judgement to §11: image studies inform media transformation, Dropbox informs shared-link/file-host visibility, Signal specifications inform protocol mechanics but not the full service, and Echomix/Pigeonhole provides the strongest integrated comparator. No overall route ranking is claimed.
- Added the Dropbox activity/shared-link and Katzenpost Pigeonhole specification references to the working bibliography; corrected the Signal source-register reference to SRC-038.
- Aligned W1's central question, consolidated RQ10 and contribution framing with the thesis. Updated traceability so confidence/evidence is explicitly a component of RQ10, not a separate research question.

### Research judgement

The strongest current thesis proposition is narrower than "a secure messaging system using images": endpoint-protected message semantics should remain under endpoint authority across replaceable routes, and the evidence available to each verifier/observer must bound claims about identity, integrity, linkage, completeness and delivery.

The initial comparison is documentary and evidence-asymmetric. It is not a deployed product comparison, scored ranking or experimental result. Missing source coverage remains unknown rather than being treated as proof of absence. The originality of the four proposed contribution strands remains unresolved against OMR-family work, Oblivious Signaling, Remise, dead-drop messaging, image-diffusion covert communication, multi-image carriage and Echomix/Pigeonhole.

### Verification and remaining work

- `thesis.md`, W1 and traceability were fetched after the changes; saved content, research-question alignment, route-comparison insertion and bibliography corrections were checked.
- The current manuscript remains a working theory-led draft. No protocol was selected, no route was deployed or tested, no experiment was reproduced and no independent review or audit occurred.
- Next: pin compatible, named and versioned route profiles and add source-backed lifecycle/observer detail to thesis §8; continue full-text access work for SRC-033/034/036 without upgrading partial-review status.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · Confidence model challenged against image-steganography source claims

### Work performed

- Re-ran targeted discovery for complete texts/manuscripts of SRC-033 (MRAS), SRC-034 (DRAS) and SRC-036 (active payload removal), including exact-title/DOI searches, publisher records, ResearchGate full-text listings, author ORCID records and institutional/repository-oriented searches.
- Publisher-indexed records exposed additional method and evaluation context: MRAS's preprocessing, lattice-based embedding and postprocessing, with extraction-error, PSNR/SSIM and steganalysis metrics; DRAS's RoLoS/CARE design and Q95-to-Q85/Q80/Q75 evaluation claims; SRC-036's attack/filtering plus image-quality optimisation architecture and BOSSbase/BOWS2/QF75 setup.
- Direct publisher page retrieval continued to return access denied/403. ResearchGate records state that no full text is available and invite author requests. No author manuscript or institutional repository copy was obtained.
- Added bounded SRC-034 and SRC-036 source-claim examples to `docs/confidence-and-evidence-model.md`, showing how to preserve author attribution, study scope, provenance, missing evidence and non-reproduction status.
- Connected those examples to thesis §4.1. The examples demonstrate the model's intended use but do not independently validate it.

### Evidence boundaries and findings

- T-001 remains open. SRC-033, SRC-034 and SRC-036 remain partial reviews; no full-text review status was assigned.
- Author-reported extraction-error improvements remain attributed to the authors and limited to their stated experimental scope. They do not establish authenticity, message-set completeness, endpoint delivery or universal platform robustness.
- The SRC-036 sanitization model is not evidence that any named platform deploys that model or that all contemporary embedding methods are defeated.
- No code was executed, no experiment reproduced and no independent audit performed.
- The confidence model survived this initial documentary challenge as a useful claim-boundary aid, but its originality, usability and privacy cost remain untested.

### Next

Continue seeking full texts for SRC-033/034/036; preserve partial labels if access remains unavailable. Then test the model against protocol delivery semantics, route observer evidence and multi-message reconstruction requirements.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · Confidence and evidence principle integrated into thesis

### Work performed

- Added `docs/confidence-and-evidence-model.md` as a proposed claim-centred framework. It distinguishes confidence, trust, assurance, security, authenticity, integrity, discoverability and truth; defines a provenance-aware claim record; separates object validity, fragment membership, set completeness, reconstruction, conversation continuity, retry identity and observer-inferred linkage; and defines delivery-event semantics.
- Integrated the principle into `thesis.md` (§4.1 and §10.5), including the candidate statement: **"The Invisible Postman does not promise certainty. It makes the basis, boundaries and limitations of confidence explicit."**
- Reconciled W1 research framing, W2 threat model, W3 architecture, W4 evaluation, contribution/bias assessment, decision register (D-13), and traceability.
- Added explicit safeguards against universal confidence scores, evidence substitution, stale claims, centralised tracking and privacy-invasive telemetry.
- Recorded the model as a provisional thesis organising principle, not a demonstrated system property or originality claim. Its usefulness, usability and privacy cost remain unevaluated.

### Critical boundaries

- Cryptographic validity does not establish semantic truth or real-world identity by itself.
- A valid fragment does not establish set completeness; a complete set does not establish conversation continuity.
- Observer-inferred correlation is not endpoint-authenticated linkage.
- Transport acceptance is not endpoint receipt, decryption, display, human reading or comprehension.
- Confidence is verifier-, scope-, evidence- and time-relative; missing evidence is not success.
- No numeric confidence score or central evidence ledger is proposed.

### Verification and remaining work

- All nine changed research files were fetched back from `main`; their saved content and intended integration markers were checked.
- No implementation, user study, formal proof, source review upgrade or independent audit was performed.
- Next: challenge the model against source and route evidence, verify delivery semantics against the selected protocol comparators, and test whether the framing improves claim precision without introducing a new privacy cost.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · Initial route lifecycle/event observer ledger

### Completed and read-back verified

- Added an initial lifecycle/event observer ledger to the route-comparison framework for the image literature profiles, Dropbox shared-link file profile, Signal protocol reference and Echomix/Pigeonhole profile.
- Covered identity/session preparation, message protection, publication, discovery, retrieval/access observation, transformation, validation, retries/reliability, expiry/retention, and human/network observation.
- Marked protocol-level, service-level and literature evidence boundaries explicitly. Unknown service behaviours remain unknown rather than being filled by analogy.
- Re-fetched the route framework and verified the exact saved content.

### Research discipline

- Image extraction metrics are not endpoint authentication or delivery acceptance.
- Shared-link access is not cryptographic recipient identity; Dropbox activity documentation does not establish secure deletion or universal retention.
- Signal ratchet skipped-message handling is not a general product delivery/retry guarantee.
- Pigeonhole read/write capability semantics and asynchronous storage are distinct from the anonymity guarantees of the underlying mix network.
- The ledger is documentary and source-bounded. It is not a measured comparison or scalar route ranking.

### Next

1. Expand the observer ledger with more exact source citations and role/collusion combinations.
2. Pin live client/release/configuration profiles before any product-level or deployed-route claims.
3. Seek full text for SRC-033, SRC-034 and SRC-036.
4. Reconcile the resulting evidence into W1–W4, contribution assessment and thesis; then complete the exact-status, terminology and image-reference audits.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · Transport-neutral lifecycle, route profiles and documentary comparison

### Completed and read-back verified

- Corrected W3's logical lifecycle: route encoding, metadata/access handling, discovery and retrieval are now route-specific rather than hard-coded to image carriage.
- Clarified that image metadata minimisation belongs only to the image adapter; file hosts and messaging/mixnet routes have distinct native metadata and service semantics.
- Repaired the malformed traceability heading and aligned RQ5 with all four route families, including mixnet-backed messaging.
- Updated the integrated thesis to distinguish publisher-abstract claims for MRAS/DRAS from fully inspected or independently reproduced evidence, and added the mixnet-backed baseline to the route comparison list.
- Added SRC-038 (Signal PQXDH revision 3 and Double Ratchet revision 4), SRC-039 (Dropbox file activity and shared-link permissions), and SRC-040 (Katzenpost Pigeonhole specification/project documentation).
- Added six evidence-bounded profile entries to the route framework: Qiao's published social-image experiment, MRAS, DRAS, Dropbox shared-link file hosting, Signal protocol reference, and Echomix/Pigeonhole.
- Added an initial documentary comparison across endpoint crypto, discovery, observer visibility, transformation, reliability and evidence maturity. It is explicitly not a scored ranking.
- Linked the profile sources from the route framework and traceability register.
- Fetched every changed file after writing and verified exact saved content.

### Material analytical distinctions

- Qiao's 2023 platform study is a bounded literature profile, not a current Facebook/Twitter/WeChat service guarantee.
- MRAS and DRAS remain abstract/highlight-level profiles until full methods, configurations and results are inspected.
- Dropbox shared-link documentation supports a concrete file-host observation profile but does not establish end-to-end protection for the project's message object. Client-side protection is a comparison condition, not a Dropbox feature claimed here.
- Signal PQXDH/Double Ratchet specifications support protocol-level comparison, not a complete Signal Messenger service/attachment/metadata profile. PQXDH revision 3 explicitly notes its mutual authentication is not post-quantum secure.
- Pigeonhole's capability-controlled asynchronous storage abstraction must be distinguished from the anonymity properties of the underlying Echomix/Katzenpost or other network.
- None of these profiles has been tested as a deployed configuration. No common scalar ranking is justified yet.

### Static audit

- Retrieved the recursive GitHub repository tree and checked relative Markdown links across all 26 Markdown files. No broken relative links were found.
- W3 section numbering and traceability heading structure were inspected; the malformed heading was corrected.
- The exact-status/terminology and diagram/image-reference audits remain open.

### Remaining and next

1. Seek full text for SRC-033, SRC-034 and SRC-036; preserve partial review labels until full methods/results are inspected.
2. Pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/configuration profiles before making deployed-route claims.
3. Expand the documentary matrix into the full lifecycle/event/observer ledger, including discovery, retrieval, retries, expiry and collusion.
4. Reconcile route findings into W1–W4, the contribution assessment and integrated thesis.
5. Complete exact-status, terminology, image-reference and cross-document consistency audits.
6. Continue protocol-level analysis of nonce uniqueness, salt purpose, key scope, identity/context binding, replay and safe fallback without premature suite selection.

### Verification boundary

All changed files were fetched after writing and matched their submitted content. The link audit was static and covered Markdown links only. No implementation, live service test, platform experiment, cryptographic test, formal proof, independent reproduction or security audit was performed.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · Image-steganography prior-art review and route-evaluation refinement

### Completed and read-back verified

- Examined the full 40-page SRC-037 survey from the University of Amsterdam repository copy, including scope, source-selection methodology, embedding/steganalysis taxonomies, cross-paper performance synthesis and practical implications.
- Inspected the full publisher HTML for SRC-035, including its robust-steganography framework, metric definitions, representative methods, simulated-channel comparisons and Facebook/Twitter/WeChat tests.
- Rechecked SRC-033, SRC-034 and SRC-036 using publisher records and indexed article text. Their review states remain partial because complete article text and full experimental details were not accessible in this pass.
- Updated all five source-register review states to distinguish full-text inspection, partial publisher/indexed evidence and unperformed reproduction.
- Recorded the bounded cross-source implications in the source register, route-comparison framework and observer/property matrix.
- Corrected the priority-gap numbering in the source register.
- Updated PROJECT_STATE and WORKPLAN to reflect the actual review status and next work.
- Fetched each changed file after writing and verified exact saved content.

### Material research findings

- SRC-035 reports that results from simulated JPEG channels did not reliably predict its tested social-platform paths. Outcomes varied across Facebook, Twitter and WeChat and between WeChat original-image and default sending modes. Its platform sample and configuration are bounded; this is not a current universal platform profile.
- SRC-037 finds that steganalysis generalisation across embedding methods remains difficult and that some deep-learning methods are not reversible enough for practical message recovery. Its topological comparisons synthesise results from separate papers, not a single controlled benchmark.
- SRC-036 describes active image processing intended to remove robust hidden payloads while preserving image quality. It is a researched capability class, not evidence that any named platform deploys that method.
- SRC-033 and SRC-034 report newer JPEG recompression-robust approaches, but their full methods/results remain unreviewed here. Their abstracts/highlights cannot support a superiority claim.
- The route evaluation must separately record extraction/recovery, image quality, detector performance, endpoint authentication/integrity and observer privacy.

### Remaining and next

1. Seek full-text access for SRC-033, SRC-034 and SRC-036; preserve their partial status until methods/results can be inspected.
2. Select named, versioned profiles for image-platform carriage, file/attachment transfer, conventional E2E messaging and Echomix/Katzenpost, using only evidenced configurations.
3. Populate the common lifecycle/event/observer ledger with source-backed properties and explicitly marked unknowns.
4. Check W3 numbering and traceability references, then reconcile findings into thesis and supporting documents.
5. Run a fresh repository-wide relative-link, exact-status and cross-document consistency audit after the next substantive reconciliation.

### Verification boundary

Changed research and operational files were individually fetched after writing and matched the submitted content. No platform experiment, extraction test, steganalysis benchmark, model reproduction, implementation, formal proof or independent security audit was performed. Full-text access limitations for SRC-033, SRC-034 and SRC-036 remain.

**Theory only · No implementation · Not audited.**


 
## 2026-11-16 · Continue instruction and four-document checkpoint contract

### Completed and read-back verified

- Clarified the user's `continue` trigger: refresh live GitHub state, read the four continuity documents and work log, identify verified progress/blockers, and resume the next unfinished unblocked task without requiring the user to repeat history.
- Defined distinct responsibilities: `PROJECT_STATE.md` is the changing progress record; `WORKPLAN.md` is the stable roadmap; `SESSION_DIGEST.md` and `SESSION_DIGEST.json` are machine-readable shorthand only.
- Kept `WORK_LOG.md` as the chronological evidence/history record maintained alongside the four continuity documents.
- Added explicit GitHub fetch/write/read-back verification and evidence-based claim discipline.
- Clarified that supporting documents and traceability must follow material research changes.
- Required genuine illustrated diagrams, never ASCII art, while preserving the existing research gate: improve/create diagrams only when the underlying argument and evidence are stable.
- Kept project maturity wording as GitHub project metadata, not a universal conversational restriction.

### Verification boundary

All five operational files were fetched after their updates and checked against the submitted content. This is a workflow/documentation change only; it does not alter research findings, implementation status or assurance status.



## 2026-11-16 · Cross-document transport-independence reconciliation

### Completed and read-back verified

- Reconciled the transport-independence and optional-orchestration rule into README, W4, traceability and the diagram index.
- Added explicit evaluation questions for role conflation, optional coordination, multi-hop observer exposure, protected-object invariance and safe fallback.
- Updated traceability so optional orchestration is not conflated with the transport adapter or assumed to be mandatory.
- Updated future diagram guidance to show role boundaries and hop-by-hop observers without implying a central coordinator or image-route requirement at runtime.

### Remaining

- Review exact W3 section numbering and terminology for consistency with traceability references.
- Populate named, versioned route profiles and source-backed observer events.
- Re-run repository-wide relative-link, status-string and cross-document consistency checks after route-profile work.

### Verification boundary

Documentation only. No implementation, tests, formal proof or independent audit. Each change must be read back from GitHub before being described as deployed.


## 2026-11-16 · Transport independence and optional orchestration clarification

### Completed and read-back verified

- Added the transport-independence principle to W3 architecture and the integrated thesis.
- Clarified that message protection, carrier encapsulation, transport and orchestration are separate functions, even where one service implements more than one.
- Recorded orchestration as optional coordination that may itself participate in transit; it does not define agnostic delivery or become a mandatory central authority.
- Clarified that image carriage is a required research comparison route, not a mandatory runtime route. Telegram, external image generation and onward hops remain examples, not dependencies.
- Added hop-by-hop observer analysis and protected-object invariance as comparison rules.
- Added D-12 to the design decision register and aligned W1, W2 and the stable workplan.

### Remaining work

- Reconcile W4, traceability, README and the route comparison ledger with D-12.
- Review cryptographic nonce, salt, key-scope, identity/context binding and replay requirements without prematurely selecting a protocol.
- Select named, versioned route profiles and populate source-backed observer/event comparisons.
- Run a fresh link, status and document-consistency audit after the next reconciliation batch.

### Verification boundary

This is a theory/documentation update only. No implementation, platform experiment, cryptographic test, formal proof or independent audit was performed. GitHub write and read-back results are recorded in the session digest only after successful verification.
# Work Log

**Project:** The Invisible Postman  
**Purpose:** Dated record of work sessions, decisions, verification and deferred tasks.  
**Assurance:** Theory only · No implementation · Not audited.

> **Never confuse agreement with progress.**

## 2026-11-15 · Ideation illustration pass

### Completed
- Created `diagrams/01-ideation-and-design-evolution.svg` as a rich, text-led workflow illustration.
- The diagram shows the original question, the password-derived starting model, why it was selected, the limitations exposed by a broader threat model, the expansion of the research question, and the distinction between the retained password option and the current endpoint-controlled direction.
- The diagram is a conceptual explanation, not an execution flow or evidence of implementation.
- The diagram is linked from the README and intended to be referenced from the integrated thesis.
- Verified the source framing against the W1 research-framing and W2 threat-model documents in the review source material.

### Deferred to subsequent passes
1. Publish W1 and W2 as repository documents after a careful line-by-line comparison with the integrated thesis and existing W3/W4 content.
2. Reconcile the existing trust-boundary and message-carrier-flow diagrams with the current endpoint-controlled architecture.
3. Reconcile the design-decisions illustration with the full decision register and the newly retained password rationale.
4. Create a threat-to-control illustration showing attacker capabilities, exposed assets, boundaries and proposed mitigations without implying that mitigations are implemented.
5. Create a message lifecycle illustration covering identity verification, key establishment, message protection, capsule construction, intermediary transport, validation, decryption, expiry and recovery boundaries.
6. Create a separate lifecycle/limitations illustration for expiry, revocation, endpoint compromise and recovery. Avoid suggesting remote deletion or guaranteed recall.
7. Check every diagram's terminology, numbering, accessibility text, README links and thesis references.
8. Review whether the diagrams communicate distinct ideas without duplicating one another.

### Working rule
Do not force all illustrations into one oversized poster. Each diagram should answer one clear question, use readable text and explicit arrows, and distinguish current architectural direction from optional or unresolved mechanisms. Record anything not completed in the next session here rather than silently marking it complete.


## 2026-11-15 · Phase 1 housekeeping and research-practice definition

### Completed and verified

- Reinspected the live public repository on the default branch, main.
- Confirmed current repository permissions include push access; no publication target or access assumption was left unverified.
- Confirmed W1, W2, W3 and W4 are present at their lowercase, hyphenated paths.
- Confirmed the active thesis, decision register, traceability register and work log are present.
- Confirmed two SVG diagrams are currently present: the ideation/design-evolution illustration and the design-decisions illustration.
- Confirmed the archived DOCX and archived short thesis source are present under archive/ and were not modified.
- Removed obsolete packaging instructions and exceptions from the stable roadmap.
- Replaced stale README references with verified paths; removed references to a non-existent active DOCX export, review-question file and SECURITY.md.
- Added W0.1 repository housekeeping, W0.2 critical self-examination and collaborative research practice, and W0.3 research-source reconciliation to the roadmap.
- Added docs/research-practice.md to define author responsibility, critical self-review, multidisciplinary peer discussion, evidence-led criticism, dissent, attribution and future asynchronous contribution requirements.
- Extended docs/traceability.md to connect reviewer challenges, evidence, author responses, dispositions, research changes and unresolved dissent.
- Read back the changed README, roadmap, research-practice document and traceability register. Verified their exact status wording and absence of obsolete packaging instructions.

### Findings and limitations

- The README's former links to docs/the-invisible-postman-thesis.docx, uppercase W1/W2 paths, review/REVIEW_QUESTIONS.md and SECURITY.md did not resolve. The active README now points to verified files.
- The historical DOCX is archive/the-invisible-postman-thesis.docx; the short historical source is archive/thesis-source-short.md. Both remain unchanged.
- The two existing diagrams are SVG files. No PNG export set has been verified in the repository.
- The full manuscript-to-W1–W4 reconciliation, review register/templates, comprehensive link audit, illustration pass and reviewer PDF remain outstanding.
- No peer review or external endorsement is claimed. The new research-practice document defines the intended method; it does not imply a live forum or active reviewer group.

### Next work

1. Complete W0.3 by comparing the integrated thesis with W1–W4, decision register and preserved historical source material.
2. Review the thesis claims and assumptions against the new research-practice method.
3. Build the substantive review framework and contribution templates after the research reconciliation.
4. Stabilise the manuscript before creating further illustrations.
5. Update this checkpoint only after each material result is verified.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Initial author-led critical review

### Completed and verified

- Inspected the complete active thesis and the W1–W4 research documents to identify substantive questions for the authors and future reviewers.
- Created docs/self-review-register.md with twelve author-identified challenges covering research direction value, security-claim discipline, identity verification, protocol composition, carrier value, steganalysis evidence, metadata exposure, multipart ordering and validation, lifecycle/recovery complexity, evaluation design, scope and source grounding.
- Each issue records its location, challenged claim or assumption, reviewer question, evidence needed, proposed action, priority, status and response/resolution.
- Explicitly labelled the items as author-identified, not external peer-review findings or endorsements.
- Linked the register from the README, Phase 1 W0.2 work unit and research traceability register.
- Preserved the ability for reviewers to add competing interpretations, challenge the central research direction and retain unresolved dissent.

### Initial critical finding

A notable protocol-design question is the treatment of reordered multipart capsules. Transport arrival order and authenticated logical order are not necessarily the same. The receiver may be able to reassemble safely reordered fragments when their indices and message-set binding are authenticated; the specification should distinguish this from conflicting, duplicated, substituted or incomplete sets. This is recorded as SELF-08 and remains open.

### Deferred

- Complete the authors' claim-by-claim self-review and source verification.
- Reconcile the active thesis against W1–W4 and the decision register.
- Develop the full external reviewer guide, contribution templates and response workflow.
- Stabilise the manuscript before further illustration work.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Collaborative Research Governance Framework

### Completed and verified

- Created docs/collaborative-governance.md, defining a consortium-inspired but project-scoped framework for peer review, decision ratification, contributor attribution and a versioned adopted-practices baseline.
- Defined proposal lifecycle states: Draft, Open for review, Under revision, Evidence pending, Ratified, Adopted, Contested, Superseded, Rejected and Withdrawn.
- Defined ordinary and security/privacy/safety-significant review thresholds, including independent review and relevant domain competence. A proposer cannot be the sole reviewer or ratifier of their own proposal.
- Distinguished proposal, contribution, review, approval, ratification, adoption and endorsement.
- Defined a project-wide "global commit" as an auditable merge updating the repository's adopted-practices baseline, not a claim of universal adoption by the research community.
- Specified automation boundaries: automation may validate process metadata, required reviews, links and status gates, but cannot decide scientific validity, infer expertise, turn silence or reactions into consent, or erase dissent.
- Added consent-based contributor attribution using CRediT roles as a vocabulary where appropriate. Distinguished actual commit authorship/co-authorship from review and approval. Added exact accepted-contribution mapping.
- Created docs/templates/contribution-review-record.md and docs/templates/decision-record.md.
- Linked the governance framework and templates from README.md, WORKPLAN.md, research-practice.md, traceability.md and decision-register.md.
- Added D-08 to the decision register, explicitly recording that the governance framework is proposed and not externally ratified.
- Added source notes linking the official CRediT resource and GitHub documentation for pull-request review and branch controls.
- Checked the repository rulesets endpoint: it returned an empty list. Attempted to inspect main branch protection, but the available GitHub connection returned HTTP 403. Branch-protection status is therefore unverified; no automation or protection setting was changed.
- Verified successful write responses for all new documents and cross-document updates.

### Important governance boundary

The framework does not yet constitute a live peer-review forum, an established consortium or an operating automated ratification pipeline. No external reviewer, contributor, endorsement or adopted best practice is invented. The framework itself remains a proposal pending independent review.

### Deferred

- Invite and receive actual independent review of the governance framework.
- Decide whether the project should enable GitHub branch protection/rulesets after reviewing repository permissions and the desired reviewer model.
- Exercise the contribution and decision templates with a real, consented contribution.
- Define and test any future automation only after the manual governance process has been reviewed and used.
- Continue W0.2 and W0.3 research-source reconciliation before thesis illustration and PDF production.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Established framework comparison and adaptation

- Compared official OpenSSF Best Practices Badge criteria and Scorecard, Apache project governance, IETF RFC 7282, CRediT contributor roles and GitHub review controls.
- Updated docs/collaborative-governance.md with a model-by-model analysis of what to borrow, how to adapt it and what not to import.
- Added D-09 to docs/decision-register.md and cross-referenced the governance framework.
- Updated work/WORKPLAN.md to preserve this reuse-first approach.
- Adopted for the research method: evidence-backed checklists, public asynchronous deliberation, reasoned objection dispositions, contribution-role vocabulary, version-specific reviews and deterministic process checks.
- Explicitly excluded: treating OpenSSF badges or Scorecard scores as proof of thesis quality or protocol correctness; Apache silence-based lazy consensus; IETF running-code requirements at this theory-only stage; false claims of consortium or standards-body status; automated truth judgements or popularity-based ratification.
- No badge, scorecard scan, branch-protection rule, automation or auto-adoption workflow was enabled.
- Verified governance and decision-register commits: c35304dade24a5483e5ac01ae76c76cde4808190 and 97f2e4b1ea53fe10c1488b070d2284c32746b8c0.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Versioned adopted-practices baseline

- Created docs/adopted-practices.md, version 0.1, as the visible project-scoped working baseline.
- Recorded six maintainer-adopted practices with scope and limits: critical examination, reasoned objection dispositions, contribution attribution, version-specific review, process-only automation and auditable baseline changes.
- Marked all entries maintainer-adopted and awaiting external review. No external ratification, consortium authority or universal best-practice status is claimed.
- Linked the index from README.md and the governance framework; updated WORKPLAN.md and PROJECT_STATE.md.
- Clarified that DCO adoption is deferred because no repository licence or contribution terms are currently declared. A DCO attests contribution rights under a stated licence; it does not prove originality, quality or endorsement.
- No branch protection, auto-merge, ratification automation or other repository enforcement was enabled.
- Verified the new index and each changed document by fetching the saved content after successful commits.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Governance baseline verification

- Final tree audit: 22 files, 18 Markdown files (17 active, one archived source).
- All 17 active Markdown files contain the exact project status statement.
- 34 relative Markdown links checked; zero broken targets.
- No obsolete packaging directives found in active Markdown documents.
- Added the status statement to both active contribution and decision templates; verified read-back.
- Archived historical Markdown source left unchanged.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · W0.2 author-led review, first pass

Re-read the active thesis and W1–W4 before updating the author challenge register.

- **SELF-01:** Image carriage's distinct value is not yet demonstrated. Recorded the need for comparison against encrypted attachments, encrypted file transfer, ordinary end-to-end messaging, image carriage without concealment, and image carriage with optional concealment. Provisional recommendation: keep the architecture carrier-agnostic unless evidence justifies image-specific requirements.
- **SELF-02:** Existing disclaimers are strong, but the title and shorthand terminology may imply achieved authentication. Recorded a systematic claim-language audit and the distinction between design objectives and demonstrated properties.
- **SELF-03:** Separated private-key control, key continuity and real-world identity proof. Recorded the need to define assurance level and compare first-contact, key-change and recovery models.
- Updated and read-back verified docs/self-review-register.md. All three issues remain open and author-identified, not externally reviewed.
- No substantive scope decision was forced before evidence gathering.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Transport routes and contributor continuity

- Researcher clarified that message carriage must be represented as explicit transport routes. Image carriage is a required route and remains central to the research; alternative routes are comparison profiles, not replacements. Recorded D-10.
- Corrected SELF-01: the prior suggestion to demote image carriage to an optional case study was too broad. The remaining question is comparative value and trade-offs, not whether the image route belongs in scope.
- Updated thesis, W1 and W3 to introduce a first-class transport-route layer and route-specific adapters.
- Added docs/idea-intake-and-continuity.md for durable idea capture, provenance, triage, resurfacing, absent/dormant contributors, contributor return and the no-contributor operating mode.
- Updated collaborative governance, README and WORKPLAN.
- All changed files were read back after successful commits. No external review, contributor activity or automation is claimed.

**Theory only · No implementation · Not audited.**

- Extended W4 E6 with route-specific metadata, capacity, ordering, delivery semantics, route substitution/fallback, image transformation and safe extraction failure.
- Updated traceability to connect the transport-route decision with research questions, threats, architecture and evaluation; linked the idea-continuity process.
- Verified both documents after commit.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Passenger topology and standalone train clarification

### Researcher clarification

The researcher clarified that the participant-side cryptographic roles must remain separate from the train-like transport element. The train is a standalone element whose role is to assist carriage of already protected material over a deliberately low-fidelity route. Participants perform their own concise roles within the stronger endpoint-side topology.

### Completed and verified

- Added D-11 to the decision register: passenger-side cryptographic topology is primary; the train is a standalone, replaceable transport element.
- Defined a carrier-facing encapsulation boundary that packages protected material for carriage and supports framing/failure detection without independently claiming confidentiality, authentication, anonymity or integrity.
- Clarified that any security-relevant encapsulation binding must be authenticated by the endpoint protocol.
- Kept image carriage as a required route under D-10; steganography or another image technique remains a low-fidelity route mechanism, not part of the passenger security topology.
- Updated the integrated thesis, W1, W2, W3, W4, traceability and workplan to reflect the separation.
- Read back and verified all updated files after each commit.

### Open specification

- Define exactly what "anonymous agreement" means in the intended participant-side topology; do not infer anonymity from the phrase alone.
- Specify the train's narrow service contract, route metadata, encapsulation format, authenticated fields, and failure semantics.
- Evaluate replacement/removal of the train without changing the participant-side security model.

No cryptographic protocol or transport implementation has been created. No security property has been demonstrated.

**Theory only · No implementation · Not audited.**

## 2026-11-15 · Transport anonymity, metadata minimisation and behavioural linkability

### Clarification adopted for the working architecture

- The standalone train may use a newly generated, unique image envelope for each carriage instance and vary where that carrier is placed for recipient retrieval.
- A receiving-side transport decapsulation function discovers or obtains the carrier, extracts the already protected object and returns it to the participant endpoint. Endpoint cryptographic validation remains authoritative.
- This is a bounded transport-level unlinkability objective, not a claim of participant anonymity or immunity to traffic analysis.
- Metadata minimisation is a baseline requirement: remove unnecessary embedded image metadata and identifying file-level properties before publication, retaining only fields required for safe extraction and compatibility.
- Explicitly distinguish removable carrier metadata from network identifiers, hosting logs, access records, externally observed timing and other metadata generated outside the carrier.
- Add human behavioural linkability to the threat model: repeated schedules, response intervals, platform/device habits, language and formatting, image-generation patterns and predictable reactions.
- Include social-engineering probes such as false delivery notices, urgency cues, staged failures and timed prompts. Do not assume technical randomisation makes human activity unpredictable, or shift the entire burden onto unsafe user rituals.

### Files updated and read-back verified

- `docs/decision-register.md`: D-11 now records unique image envelopes, variable placement, decapsulation, metadata minimisation and behavioural linkability.
- `thesis.md`: adds transport unlinkability, metadata-removal limits, recipient discovery and human behavioural side channels.
- `docs/w3-architecture.md`: defines the unique-envelope/decapsulation flow and metadata/behavioural boundaries.
- `docs/w2-threat-model.md`: adds platform, network, carrier and human-behaviour correlation threats.
- `docs/w4-risks-and-evaluation.md`: adds evaluation requirements for metadata removal and social-engineering/behavioural linkability.
- `docs/traceability.md`: adds RQ3c and traceability for behavioural correlation.

### Remaining analysis

- Define the recipient-discovery/rendezvous mechanism without introducing a stable locator that defeats the unlinkability objective.
- Specify the carrier metadata allowlist and test actual metadata removal across image formats and platform transformations.
- Distinguish image-carrier uniqueness from true entropy, unpredictability or cryptographic randomness; do not imply one guarantees another.
- Develop observer models and evaluation scenarios for timing, access patterns, hosting/network records, image fingerprints and human behavioural correlation.
- Consider usability and accessibility: privacy controls must not require constant vigilance or unrealistic behavioural camouflage.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Full-thesis research framing and illustration map

### Completed

- Reframed the active thesis around the complete research investigation: problem and method; design evolution; research direction, scope and contribution; security-property distinctions; system and adversary model; endpoint cryptographic architecture; message envelopes and multipart validation; transport methods; lifecycle and recovery; evaluation; limitations and open reasoning.
- Kept transport as a substantial, bounded subsection. It now examines image carriage and comparison profiles alongside distribution, recipient discovery, collection, unique image envelopes, variable placement, metadata minimisation, observer models and human behavioural linkability.
- Removed duplicated material in the earlier passenger/train subsection and clarified the limits of encapsulation and transport-level unlinkability.
- Added a contextual illustration index. It distinguishes existing figures 01 and 03 from planned figures for the wider thesis, maps each planned figure to its intended section and records guardrails against visual overclaiming.
- Updated README and the workplan to reflect the full thesis scope and illustration index.
- Preserved the archived thesis editions and existing SVGs; no new artwork or implementation was created.

### Verification still required

- Read back the revised thesis, illustration index, README, workplan and project checkpoint.
- Audit Markdown links and the recursive repository tree after the new index was added.
- Reconcile the revised thesis line by line against W1–W4, the decision register, traceability, self-review and historical source material.
- Check for remaining duplicated concepts, stale wording, unsupported technical claims and terminology drift.
- Continue author-led review and source verification before treating the manuscript as stable.
- Create and embed the planned illustrations only after the substantive reasoning has stabilised.

### Commits

- Thesis: fa1876bf1ba42538c30efc3b49c5784016144257
- Illustration index: fd0fc64237ab3b36cab364c9292185af5b52c3f7
- README: 258ba0c88ce35fc3400f25eaff8a394826ae6b10
- Project state: recorded in the subsequent checkpoint commit.
- Workplan: recorded in the subsequent roadmap commit.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Thesis-first execution and GitHub review digest

- Researcher reprioritised the work: defer routine author-led review unless necessary to unblock or prevent a material error; keep external peer review at the lowest priority until a workable thesis exists.
- Updated `work/WORKPLAN.md` with an explicit construction-first sequence and review gates.
- Added a GitHub deployment-digest routine requiring exact paths, purpose, commit links, actual read-back/verification, outstanding gaps and only genuinely blocking decisions.
- Explicitly did not add a CI bot or untested GitHub Actions. The digest is generated from actual GitHub writes and read-backs.
- Updated `work/PROJECT_STATE.md` with the new priority, verified workplan commit and next construction tasks.
- Verified both updated files by fetching them after successful commits.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Thesis-first architecture and traceability reconciliation

### Completed and verified

- Reordered the roadmap so integrated thesis construction and traceability precede review-framework expansion. Routine author challenge review is deferred unless needed to prevent a material error or unblock work; external peer review remains lowest priority until a workable thesis exists.
- Aligned W1 with the thesis central question and ten supporting questions; clarified the required image route and comparison-only alternatives.
- Reconciled W2, W3 and W4 multipart language so valid out-of-order arrivals may be reassembled from authenticated logical indices, while conflicting, incomplete, substituted or ambiguous sets fail safely.
- Expanded W3's component and lifecycle reasoning to make encapsulation, the standalone train, route adapters, recipient discovery, metadata minimisation and receiving-side decapsulation explicit.
- Added a route-comparison matrix in W4 covering image carriage with and without concealment, encrypted file/attachment carriage and conventional end-to-end messaging. The matrix defines evaluation questions, not results.
- Rebuilt traceability around the ten thesis research questions; removed duplicate RQ3b and duplicate numbering; added explicit recipient-discovery and metadata threat mappings.
- Clarified in W3 and D-11 that per-carriage image uniqueness means non-reuse, not cryptographic uniqueness, entropy, randomness, unpredictability or guaranteed unlinkability.
- Linked the thesis route comparison to the W4 matrix and repaired literal escaped newline characters in README navigation.
- Inspected the archived short thesis source for historical continuity; left archive files unchanged.

### Verification and remaining work

- Changed research documents were fetched after their writes; targeted content checks passed.
- A fresh full-repository link/status audit has not yet been run.
- Full source/citation verification and complete thesis reconciliation remain outstanding.
- No new illustrations, reviewer solicitation or messaging-system implementation was created.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Repository consistency audit

- Re-read all 19 active Markdown files from the live default branch.
- Checked 45 relative Markdown links against the repository tree: zero broken targets.
- Confirmed the exact project status statement appears in all 19 active Markdown files.
- Confirmed the repository tree contains 24 files, including 20 Markdown files (19 active and one archived source).
- Marked W0.1 complete in `work/WORKPLAN.md`.
- Read back the updated workplan and project checkpoint after successful commits.

Scope note: this audit covers relative path targets, not external URL availability or heading-anchor rendering.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Source integration and traffic-privacy research

- Created an initial 19-entry source register covering cryptographic specifications, protocol comparators, key-management guidance, image metadata standards, steganalysis, rendezvous and traffic-analysis research.
- Integrated provisional author-date citations and a working bibliography into the thesis.
- Added bounded comparisons to Loopix, Tor v3 rendezvous, Bozorgi et al. (2023) and Li (2026). Their findings are explicitly not generalised to this proposed image-carriage architecture.
- Corrected the thesis distinction between a non-reused image carrier and cryptographic uniqueness, randomness, entropy or anonymity.
- Expanded W2 for traffic correlation, discovery/rendezvous correlation and behavioural probing; W3 for the distinction between carrier-level variation and network-level traffic-analysis defence; W4 E9 for observer-specific evaluation and obfuscation trade-offs.
- Added source mappings to traceability and made source-register verification part of W0.3/W6.
- Verified the source register, thesis, W2, W3, W4, traceability and workplan by fetching them after their writes.
- Full-text source review and a fresh repository-wide link/status audit remain outstanding.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Post-source-integration repository audit

- Re-read all 20 active Markdown files from the live default branch.
- Checked 51 relative Markdown link targets against the current repository path set: zero broken targets.
- Confirmed the exact project status string appears in all 20 active Markdown files.
- Current tree count is 25 files, including 21 Markdown files (20 active and one archived source).
- Confirmed the source register is linked from README, thesis, W1 and traceability, and W4 links to it for traffic-analysis evaluation.
- External URL availability and heading-anchor rendering are not covered by this path audit.

**Theory only · No implementation · Not audited.**



## 2026-11-15 · Recipient discovery, media forensics and parser-safety source integration

### Research findings and bounded use

- Added four source-register entries after inspecting source material: Liu and Tromer (2022) on Oblivious Message Retrieval; Pasquini, Amerini and Boato (2021) on media forensics across social platforms; Steinmetz, Pimentel and Goe (2021) on social-engineering practices; and the Go project's CVE-2023-24536 multipart parser resource-exhaustion record.
- The OMR paper sharpens RQ7: discovery and retrieval are separate privacy protocol problems. The working comparison now distinguishes recipient-side scanning, stable authenticated locators/rendezvous, short-lived or one-use capabilities, and private/oblivious retrieval. No approach is selected; the paper's bulletin-board construction is not treated as a drop-in image-hosting solution.
- The media-forensics survey supports a more careful metadata model: descriptive EXIF/IPTC/XMP fields are distinct from required image-container/codec structures, optional rendering information and signal-/codec-level platform fingerprints. Removing descriptive metadata cannot establish that a transformed image is uncorrelatable.
- The social-engineering study provides qualitative, bounded evidence from 37 interviews with social engineers. It supports attention to timing, routines, rapport, familiarity and adaptation, but does not quantify recipient susceptibility or validate every project-specific behavioural research direction.
- The Go multipart-parser incident demonstrates that excessive part counts and allocation patterns can cause CPU/memory exhaustion in a real parser. It is explicitly treated as an implementation-level caution, not as evidence of a vulnerability in the proposed capsule format.

### Deployed and read-back verified

- Expanded the source register to SRC-023 and updated its claim map and research gaps.
- Integrated discovery/retrieval alternatives, metadata-layer distinctions, qualitative social-engineering evidence and explicit parser resource budgets into the thesis.
- Added parser/resource-exhaustion threats and evaluation requirements to W2.
- Expanded W3's discovery comparison and bounded parsing/decapsulation contract.
- Expanded W4 E5/E9 evaluation questions for parser budgets, platform transformations and retrieval privacy.
- Updated W1 research framing, traceability and the workplan's targeted research gaps.

### Remaining work

- Review the formal definitions, constructions, security assumptions and performance sections of SRC-020 before relying on any specific OMR guarantee.
- Identify and compare further recipient-discovery and capability-based systems; no locator/capability design has been selected.
- Build a field-level metadata classification only after the image-carriage encoding method and test formats are specified.
- Research safe parser design beyond one CVE; derive budgets from explicit device, payload and route profiles.
- Continue claim-level source reconciliation. No implementation, empirical test, audit or independent review is claimed.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Machine-readable session handover

### Completed and verified

- Added `work/SESSION_DIGEST.json` as an intentionally small machine-readable retrieval index for new chat sessions.
- Linked the digest from `README.md`, `work/PROJECT_STATE.md` and `work/WORKPLAN.md`.
- Defined the handover rule: verify the live branch, then reread authoritative project state, roadmap, work log and thesis; never treat the digest as a replacement for those sources.
- Digest captures priorities, deferred work, open research threads, architectural invariants and the scope of the last repository audit.
- All four changed/created files were fetched after successful writes. Digest counts were refreshed to include the new JSON file.

### Verification boundary

- The last full Markdown path/status audit remains 20 active Markdown files, 51 relative links checked, zero broken targets.
- The new digest and its links have been read back, but a fresh full-tree link audit has not yet been run after these additions.
- No CI bot, GitHub Action, messaging implementation or diagram was added.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · Hard contribution and bias checkpoint

### Completed and read-back verified

- Added [the thesis contribution and bias assessment](../docs/thesis-contribution-and-bias-assessment.md), with a weighted, explicitly provisional assessment of originality, theoretical coherence, usefulness, security/privacy reasoning, falsifiability and scope feasibility.
- Identified the strongest current contribution direction as an developing research direction: a lifecycle-wide analysis of endpoint-controlled messaging over replaceable untrusted carriage, especially the interaction between image carriage, recipient discovery/retrieval and cross-layer privacy leakage. Its originality remains unestablished.
- Recorded bias controls for image-route commitment, architecture-by-accumulation, novelty-by-combination, security-language inflation, threat-model sprawl, source-confirmation bias and metaphor/terminology bias.
- Expanded the source register with PerfOMR (2024), Oblivious Signaling (2026), dead-drop covert messaging (2024) and image-based diffusion covert messaging (2025). Newly added works are explicitly marked as abstract/overview-level inspections; full-text verification remains outstanding.
- Added a direct “go” decision: continue thesis construction, but do not claim originality as established. Candidate B (end-to-end delivery privacy analysis) is the leading potential contribution direction, supported by A (responsibility-separated architecture) and C (route comparison/evaluation).
- No diagram work or implementation was started. Diagrams remain downstream of the contribution and argument being stable.

### Hard judgement

The thesis's strongest reasoning is the separation of security properties and the insistence that endpoint cryptographic authority remain independent of carrier and intermediary. Its most promising potential contribution is treating publication, discovery, retrieval, collection, decapsulation, validation and human/metadata correlation as one connected delivery-privacy problem.

The largest academic risk is originality. Existing work already addresses image steganography, dead-drop messaging pipelines and private recipient retrieval. Combining known mechanisms is not sufficient. A direct prior-art matrix and full-text comparison are now required before the contribution can be stated strongly.

### Provisional weighted assessment

- Originality/differentiation: 2/5 (low confidence; 25% weight)
- Theoretical coherence: 4/5 (medium confidence; 20%)
- Practical usefulness: 3/5 (low–medium confidence; 15%)
- Security/privacy reasoning: 4/5 (medium confidence; 15%)
- Evaluation/falsifiability: 3/5 (medium confidence; 15%)
- Scope/feasibility: 2.5/5 (medium confidence; 10%)
- Indicative weighted construction-readiness: 3.0/5. This is a planning signal, not a thesis grade, novelty score or security rating.

### Next construction priority

1. Full-text compare OMR, PerfOMR and Oblivious Signaling.
2. Full-text compare the 2024 dead-drop pipeline and 2025 image-diffusion work.
3. Build a prior-art matrix mapping candidate contributions to existing work and remaining gaps.
4. Sharpen the central research question and contribution statement from that matrix.
5. Reassess which thesis diagrams are stable enough to represent the resulting argument.

**Theory only · No implementation · Not audited.**

## 2026-11-15 · Method correction and session-continuity rule

### Completed and read-back verified

- Updated the machine-readable session digest first, recording the mandatory three-document rule and the corrected epistemic language.
- Withdrawn the premature confirmatory framing of the developing central research direction. The preferred term is **developing research direction**; originality remains unestablished.
- Added a canonical distinction in research practice between research progression, supporting evidence, research questions, developing research directions, evaluation, demonstrated results and demonstrated contributions.
- Reconciled stale confirmatory terminology across the active thesis, research practice, self-review, source register, traceability, contribution assessment, diagram index and project records. Historical archive files remain untouched.
- Established the concrete rule: every session must use and reconcile work/PROJECT_STATE.md, work/WORKPLAN.md and work/WORK_LOG.md. Before stopping, all three must agree on completed work or an explicitly parked continuation point. Parked work must include evidence, current state, blockers/dependencies, exact next action, relevant paths and constraints.

### Verification boundary

- Digest update was committed and fetched back successfully before the other edits.
- The active Markdown tree was searched for remaining occurrences of the retracted term; final verification is pending until the full terminology batch is read back and rescanned.
- No archive files, diagrams, implementation or security claims were changed.

### Parked continuation

- Resume the existing prior-art workplan: inspect full texts and formal models for OMR, PerfOMR and Oblivious Signaling; then inspect the dead-drop pipeline and image-diffusion papers.
- Build the candidate A/B/C prior-art matrix from what those sources actually establish, including limitations and counterevidence.
- Revisit the developing research direction only after that comparison. Keep new illustrations deferred.

**Theory only · No implementation · Not audited.**


## 2026-11-15 · First full-text prior-art comparison

### Completed and read-back verified

- Inspected the full texts of OMR (2022), PerfOMR (2024), Oblivious Signaling (2026), SophOMR (2026), InstantOMR (2026), the 2024 dead-drop covert-messaging pipeline and the 2025 image-based diffusion covert-messaging paper.
- Updated SRC-020 and SRC-024–SRC-027 with the actual inspection scope, threat models and explicit exclusions; added SRC-028 SophOMR and SRC-029 InstantOMR. The source register now contains 29 entries.
- Created docs/prior-art-comparison.md with a source-by-source comparison, observer and trust assumptions, protected properties, limitations, pressure tests for candidate contributions A/B/C, and a provisional developing research direction.
- Linked the comparison from thesis.md, docs/w1-research-framing.md, docs/traceability.md and docs/source-register.md.
- Updated the project checkpoint and workplan with the completed batch and the next research task.

### Material research findings

- Recipient-message privacy is an established and actively optimised research area. OMR, PerfOMR, SophOMR and InstantOMR provide distinct cost/performance points; Oblivious Signaling shifts privacy work from retrieval to sender-triggered inbox updates.
- The 2024 dead-drop paper already studies a public-platform covert-messaging pipeline, including rendezvous, discovery hints, retrieval, fragmentation, platform constraints and user detection. “Whole-pipeline analysis” alone cannot support an originality claim.
- The 2025 diffusion paper provides formal image-based covert-channel analysis but explicitly leaves delivery to the recipient outside its problem model and assumes a pre-shared key.
- The most promising remaining distinction is a common cross-layer observer/property analysis joining endpoint cryptographic authority, external image-carrier publication/transformation, recipient discovery/retrieval, endpoint validation and human/metadata correlation. This remains an developing research direction; originality is not established.

### Verification boundary

- All new and modified files were fetched after successful GitHub writes and matched the submitted content.
- No full-tree Markdown link audit was run after these additions. External source availability and independent reproduction of paper results were not tested.
- No implementation, diagram, formal proof or independent review was performed.

### Parked continuation for the next session

1. Broaden the closest-related-work search around group OMR, private signaling, two-server/DORAM systems and integrated dead-drop/image-carriage architectures.
2. Build a common observer/property matrix across publication, discovery, retrieval, collection, carrier transformation, decapsulation, endpoint validation and human interaction.
3. Reassess candidate contributions A/B/C and revise or displace the developing research direction based on adverse as well as supporting evidence.
4. Keep new diagrams deferred until the central argument stabilises.

### Verified commits in this batch

- Source register: 38a0f0c4357a0d3f9a3b727ed194a295c879c453; follow-up link integration: 82cedce9e46e58f79a85e4e9b236effcf06becb9
- Prior-art comparison: d6147586f32eac006402388cc634ce3a48577843
- Thesis link: bf27fe49326d18008d52de293ebe9cbd36db58c4
- W1 link: d0edba7304036e9849014d74d92ca014317268f0
- Traceability link: 9ec9171349388a810f34d209e4f959b8702aa5a3
- Project state: 340fcf9ecb326f5ebc0cfccfd6cbb7b4f5548db7
- Workplan: 933a165a48de28631a00d69f02c327b75e1ef11f

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Expanded prior-art comparison and lifecycle observer matrix

### Completed and read-back verified

- Verified the current repository as `robotard/the-invisible-postman`, default branch `main`; inspected the live session digest, PROJECT_STATE, WORKPLAN and WORK_LOG before substantive work.
- Read the full Group Oblivious Message Retrieval (GOMR) paper by Liu, Tromer and Wang (2024), including group models, threat definitions, constructions, DoS treatment, evaluation and discussion of related private retrieval/MLS work.
- Read the full Remise paper by Ravi, Shukla and Vadapalli (USENIX Security 2026), including its DORAM model, ideal functionality, threat assumptions, cover traffic, access-control construction, evaluation and stated limitations.
- Added SRC-030 and SRC-031 to `docs/source-register.md`.
- Created `docs/observer-property-matrix.md`, comparing seven related system families across the delivery lifecycle and distinguishing recipient privacy, sender anonymity, access-pattern privacy, payload protection, covert-channel detection and behavioural correlation.
- Extended `docs/prior-art-comparison.md` with GOMR and Remise and revised the pressure test for candidates A/B/C.
- Updated `thesis.md`, W1, W2, W3, W4 and `docs/traceability.md` to carry the new source boundaries and link the matrix.
- Updated `README.md` and `diagrams/README.md` so the new analytical artefact is discoverable and explicitly upstream of relevant figure work.
- Updated PROJECT_STATE and WORKPLAN after completing the research batch.
- Every file write in this batch returned a commit SHA and was fetched back; the saved content matched the submitted content.

### Material findings

- GOMR is established prior art for ad-hoc and fixed-group oblivious recipient retrieval. It assumes application payload protection and excludes authenticated contact/key distribution and privacy-preserving board publication.
- Remise is established prior art for two-server DORAM-based anonymous publication and authorised channels, hidden access patterns, reader permissions and revocation. Its privacy depends on server non-collusion; its integrity assumes protocol-following servers; servers are semi-honest; RemiseCC distributes bearer read tokens out of band; malicious-server write suppression is acknowledged.
- Candidate B's broad lifecycle novelty framing is materially narrowed. A possible remaining direction must identify a concrete cross-layer incompatibility or leakage involving media-carrier transformation, endpoint message semantics/validation and external human/network observers. No originality is established.
- The matrix is a working synthesis, not a systematic review, security ranking, formal analysis or reproduction of the papers' results.

### Verification boundary

- New and modified documents were individually read back after successful commits.
- Existing diagrams remain unchanged. New illustration work remains gated on thesis and contribution stabilisation.

### Parked continuation

1. Extend related work to the closest mix-network and anonymous-messaging/media-carriage systems, especially where global observers and cover traffic matter.
2. Build explicit leakage functions/observer views for publication, discovery, retrieval, collection, carrier transformation, decapsulation, endpoint validation and human interaction.
3. Identify a concrete cross-layer incompatibility or falsifiable comparison result; revise or retire Candidate B if no distinct result survives.
4. Reconcile the finding across thesis §§3, 5, 8 and 10, W1–W4, traceability and source register.
5. Only then reconsider the planned thesis illustrations.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Echomix integration and route-comparison framework

### Completed and read-back verified

- Refreshed the live `main` branch and read PROJECT_STATE, WORKPLAN, WORK_LOG, SESSION_DIGEST, thesis, prior-art comparison and observer/property matrix before work.
- Inspected the full Echomix paper (arXiv:2501.02933v2): global/active adversary model, traffic coupling, Loopix comparison, BACAP, Pigeonhole, reliability/backfill, collusion analysis, post-quantum packet variants and latency/bandwidth analysis.
- Inspected the current Katzenpost threat-model page and preserved its version caveat: it is evolving and does not yet incorporate all designs in the paper.
- Added SRC-032 to the source register (32 entries total).
- Created `docs/echomix-katzenpost-comparator.md`.
- Extended the observer/property matrix and prior-art comparison with Echomix as an integrated messaging baseline.
- Created `docs/route-comparison-framework.md` to compare image-platform, file/attachment, conventional messaging and mixnet-backed profiles using a common logical task, endpoint objectives, actor register and lifecycle event ledger.
- Integrated the comparator and framework into the thesis, W1, W2, W3, W4, traceability, README and diagram index.
- Updated the contribution/bias assessment: broad integrated lifecycle privacy is not a differentiator; the remaining focus is a measurable image-platform carriage difference, assessed against stronger integrated baselines.
- Updated WORKPLAN with the next W0.3/W6 task: define named, versioned route profiles and populate the common event/observer comparison with source-backed facts.
- Every new or modified file in this batch was fetched after writing and matched the submitted content.

### Material finding

Echomix/Katzenpost already integrates network anonymity, global/active observer analysis, traffic/decoy coupling, capability-derived discovery, asynchronous messaging/storage, reliability signalling, backfills, collusion analysis and human-routine leakage. The project must not present general integrated delivery privacy as a differentiator. The remaining route-specific question is whether ordinary image-platform carriage introduces distinct, measurable transformations, metadata, account/hosting observations, retrieval behaviours or failure costs compared with file, conventional messaging and mixnet-backed routes. That difference is not presumed to be original or useful.

### Parked continuation

1. Select named, versioned examples for image-platform, file/attachment, conventional messaging and mixnet-backed profiles.
2. Populate `docs/route-comparison-framework.md` with profile-specific facts and source evidence; distinguish comparable fields from route-native properties.
3. Map each lifecycle event to actual observer views, including account/engagement records, media transformations, hosting records, access patterns, retries and human interaction.
4. Identify a measurable decision-relevant difference, or narrow the project scope if image carriage adds no defensible benefit.
5. Reconcile the result into thesis §§3, 5, 8 and 10; W1–W4; source register; traceability and contribution assessment.
6. Keep new illustrations deferred until the comparison yields a stable explanatory result.

### Verification boundary

All listed file writes were individually read back. The recursive main-branch tree contains 31 files (26 Markdown, including one archived source); all 25 active Markdown files were fetched. A total of 117 relative Markdown links were checked with zero missing targets; all active Markdown files contain the exact project status string; no forbidden workflow or terminology references were found in active Markdown. External URL availability and heading-anchor rendering are outside this audit. No platform experiments, implementations, benchmark reproductions, formal proofs or independent security reviews were performed.

### Verified commit anchors

- Echomix comparator: `1acd0b881f7e7a6b03872bbb79bba79f5530a524`
- Route comparison framework: `90cf85d97289eccf9c8cde1f11d7eb9a5898df2d`
- Source register: `a3ced6004c76e1e4ca548dc04630c0fc8c3bfccc`
- Observer matrix: `46b65970765dd83659e2cab9c47d0eca9651e590`
- Prior-art comparison: `23dfc8053cbed281c5431f6592324de3bc63f663`
- Thesis: `103098ed25f8dcbfbc4b00e58f59de77ab487762`
- W1/W2/W3/W4: `0133bbd` / `f431493` / `235d9f8` / `cce49e0`
- Traceability: `718e4a7e643c7bd077081a7dc96ea48807bc84a1`
- Contribution assessment: `6ad692620dae024a758a9fb8706d96ea2c6335fa`
- README/diagram index: `fc4541b` / `568713e`
- Workplan: `e2136ff6bfc4ae5d24fc681c0be8d698a8bd7327`

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Image-platform prior-art pressure test and research framing correction

### Completed and read-back verified

- Added SRC-033–SRC-037: MRAS (2026), DRAS (2026), Qiao et al. (2023), Zhu et al. (2021), and the ACM Computing Surveys review of image steganography and steganalysis.
- Inspected publisher records and available abstracts/details. Full experimental reproduction was not attempted; the full ACM survey remains to be read.
- Extended `docs/route-comparison-framework.md` to separate extraction reliability, detectability, endpoint authenticity/integrity, observer privacy and operational cost.
- Extended `docs/observer-property-matrix.md` with the established image-platform steganography and active-transformation literature.
- Replaced the prior-art document's provisional framing with an open comparative research question that does not assume image carriage is superior, original or preferable.
- Integrated the sources and limitations into `thesis.md`, W1, W4 and traceability.
- Updated research language to use open research questions, architectural objectives and evidence requirements.
- Every changed file was fetched after writing and matched the submitted content.

### Material finding

Image-carrier robustness on social platforms is an established and active field. MRAS and DRAS report recent methods and real-platform tests; Qiao et al. provide practical comparisons; Zhu et al. study active payload removal; the ACM survey maps a broad embedding/detection literature. Image payload survival, recompression tolerance or concealment alone cannot carry a distinct contribution.

The project remains worth investigating as a complete endpoint-controlled delivery architecture and route-comparison study. Its potential value must be established through measurable differences across route-native guarantees, endpoint semantics, discovery, platform/network observers, reliability, usability and operational cost. Another route may prove preferable; that is a valid result.

### Parked continuation

1. Read SRC-037 in full and inspect full methods/results for SRC-033 and SRC-034 if access permits.
2. Select named, versioned profiles for one image platform, one encrypted file/attachment route, one conventional E2E messaging route and Echomix/Katzenpost.
3. Populate the route-comparison framework with source-backed properties and explicitly mark unverified platform behaviours.
4. Define a common logical message task and event-by-observer ledger, preserving route-native properties and non-comparable fields.
5. Determine which transformation measurements can be performed within the theory-only scope; do not imply experiments have occurred.
6. Reconcile findings into thesis §§3, 8 and 10, W1–W4, traceability and source register.
7. Keep diagrams deferred until the comparative argument stabilises.

### Verification boundary

All files changed in this batch were individually read back. No platform experiment, payload extraction test, steganalysis benchmark, implementation, formal proof or independent security audit was performed. A full-tree link/status audit remains to be rerun.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Final reconciliation of image-carriage prior art

- Reordered source-register entries SRC-032–SRC-037 and updated the prior-art synthesis coverage through SRC-037.
- Updated `docs/thesis-contribution-and-bias-assessment.md` with MRAS, DRAS, Qiao et al., Zhu et al. and the ACM survey. The assessment continues to treat Candidate B as conditional on a measurable complete-route difference.
- Corrected the thesis bibliography and section numbering: Remise is the USENIX Security 2026 paper; Echomix remains an arXiv preprint.
- Updated README navigation to include the route-comparison framework and corrected numbering.
- GitHub repository code search returned no matches for the retired terminology or disallowed packaging reference.
- Read back all changed files after their writes.

### Verification boundary

The previous 117-link audit predates this batch's added cross-links; it is not claimed as current. A fresh full relative-link and status audit remains outstanding. No platform measurements, extraction tests, steganalysis benchmarks, implementation, formal proof or independent audit were performed.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · Working-document and machine-handover compression

### Completed and read-back verified

- Replaced the oversized project-state history with a concise live checkpoint. Historical entries remain preserved in this work log.
- Simplified the stable workplan, corrected the malformed heading boundary, reconciled W0–W7 maturity labels and made the next research sequence explicit.
- Reduced duplicated process instructions while retaining the three-document continuity rule and GitHub write/read-back requirements.
- Kept the research scope, transport-independence constraints, uncertainty and assurance boundaries explicit.

### Remaining

- Condense the machine session digest after this entry is verified.
- Continue with source-backed route profiles, SRC-033–SRC-037 full-text review, W3/traceability alignment and a fresh repository audit.

### Verification boundary

The rewritten state and workplan were each fetched after writing and matched the submitted content exactly. This is documentation housekeeping only; no research claim, protocol, implementation or security property has been validated by this edit.


## 2026-11-16 · Status metadata and instruction-boundary correction

### Completed

- Clarified that “Theory only · No implementation · Not audited.” is project maturity metadata, not a universal conversational instruction or a prohibition on research and design work.
- Separated document responsibilities: thesis/research files carry substantive reasoning and technical principles; operational files carry verified status, priorities, dependencies and next actions; digests carry structured handover data.
- Added the Markdown session digest to the checkpoint protocol and made both digests part of close-out verification.

### Verification boundary

This is a documentation and workflow clarification only. It does not change the project's research conclusions, implementation status or assurance status.


## 2026-11-16 · Protocol boundary analysis and cryptographic composition checkpoint

### Completed and read-back verified

- Added `docs/protocol-boundary-analysis.md`, converting open protocol questions into explicit obligations for key scope, HKDF salt versus `info`, identity/transcript binding, AEAD nonce uniqueness, AAD visibility, replay/order state, multipart validation and safe route fallback.
- Added SRC-041 (RFC 5869) and SRC-042 (RFC 9180) to the source register after inspecting the full RFC texts. HPKE is treated as a compositional reference and application-responsibility checklist, not a selected messaging protocol.
- Integrated the analysis into W3 §3.10, thesis §6.3 and Appendix C, W4 E3/E4 acceptance questions, RQ2/RQ4 traceability and README navigation. Added RFC 9180 to the thesis bibliography.
- Updated WORKPLAN and PROJECT_STATE to reflect the new research output and the next integration/evidence tasks.
- Clarified the ChatGPT Project Instructions boundary: a thin operating layer for continuation, execution and verification that follows GitHub's live records; substantive research rules remain in thesis/research documents. The actual ChatGPT Project Instructions are external to this repository and were not edited by these GitHub commits.
- Each changed GitHub file was fetched after writing and its content matched exactly.

### Material protocol findings

- HKDF `salt` and `info` are not interchangeable. Salt is an optional non-secret extraction input, while `info` binds derived output to application/context information. Neither supplies identity authentication by itself.
- AEAD nonce uniqueness is per key, not per carrier. A new image, file, URL or route does not make reuse of a key/nonce pair safe.
- AAD authenticates visible bytes but does not independently prove the identity represented by the key.
- Replay, ordering, loss, multipart acceptance, crash/rollback recovery and downgrade-resistant fallback remain application protocol responsibilities.
- RFC 9180 explicitly requires stateful context for nonce management and leaves ordering/loss handling and broader replay protection to the application; it does not provide forward secrecy against recipient compromise.

### Remaining and limitations

- No cryptographic protocol or primitive suite has been selected.
- No implementation, interoperability test, platform experiment, cryptographic test, formal proof or independent security audit was performed.
- W2/W3/W4 and the full thesis still require final cross-document alignment. A fresh repository-wide relative-link audit subsequently checked all 27 Markdown files against the recursive repository tree and found no broken links. All 27 Markdown files were scanned for ZIP/archive-packaging instructions; none were found. Exact-status, terminology and image-reference consistency remain a separate audit task.
- SRC-033, SRC-034 and SRC-036 remain partial reviews; live service/client profiles remain unpinned.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Expanded publisher-indexed review of MRAS, DRAS and active payload-removal work

### Completed and read-back verified

- Revisited SRC-033, SRC-034 and SRC-036 using publisher-indexed article text and targeted section searches.
- MRAS (SRC-033): expanded the record to include its stated DCT stabilisation, lattice-based adaptive embedding and post-processing; BOSSbase payload/recompression evaluation; extraction-error, PSNR/SSIM and steganalysis-classification metric families; named comparators; and LinkedIn testing. Exact dataset/payload values, full result tables, LinkedIn path/configuration and limitations remain unverified.
- DRAS (SRC-034): expanded the record to include RoLoS quantisation-table coefficient selection, CARE predictive channel modelling with syndrome-trellis coding, Q95-to-Q85/Q80/Q75 evaluation scenarios, PMAS comparison, and author-reported extraction-error/runtime claims and WhatsApp/LinkedIn/X tests. Full methods, baseline tables and platform configurations remain unverified.
- Zhu et al. (SRC-036): expanded the record to include attack/optimisation network structure, BOSSbase 1.01 and BOWS2 dataset descriptions (10,000 512×512 images each), an 8,000/2,000 BOSSbase split and JPEG QF75 experiment context. Full model details, tables and generalisation boundaries remain unverified.
- Updated the source register, route-profile register, thesis §8.7, contribution/bias assessment and project checkpoint. All changed files were fetched after writing and matched exactly.

### Evidence boundary

Publisher-indexed article text and section snippets are not equivalent to complete full-text inspection. Direct ScienceDirect retrieval for MRAS was blocked; DRAS full methods/tables and Zhu et al. complete methods/results remain unavailable in this review. The reported platform and performance results remain attributed to the authors. No experiment, model or result was reproduced.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Multi-message linkage, image-carriage encapsulation and illustration briefs

### Completed and read-back verified

- Created `docs/multi-message-linkage-and-steganographic-carriage.md` as a dedicated research analysis covering distinct message models, relationship graphs, linkage mechanisms, steganographic collection risks, endpoint set integrity, observer threats, evaluation layers and contribution boundaries.
- Reviewed the full publisher HTML for Wang et al. (2024; SRC-043), the full proceedings paper for Ker (2007; SRC-044), and the full author-hosted IEEE paper for Ker's formal capacity theorem (2007; SRC-045).
- Corrected the prior-art distinction: SRC-043 uses robust DFT/DCT watermarking for multi-image covert communication, with fragment numbering and redundant copies combined by majority voting. It is not evidence that ordinary steganographic embedding is stealthy or robust on current platforms.
- Separated SRC-044's pooled-detection framework from SRC-045's formal asymptotic square-root capacity theorem. SRC-045's assumptions include equal cover capacities, shift-hypothesis detector response with regularity conditions, independent per-cover detection errors and a batch size known to both parties. Sequential acquisition, dependent collections and modern platform pipelines are not covered by a universal quantitative guarantee.
- Corrected the SRC-044 DOI and added SRC-045 as a separate source. Source register now contains 45 entries. Added the two Ker references and Wang et al. to the thesis bibliography.
- Updated W1–W4 with aligned definitions/comparisons and text-only illustration placeholders:
  - W1: research scope, message multiplicity and protected-object package.
  - W2: endpoint linkage versus observer-visible linkage, collection-level steganalysis and observer projections.
  - W3: conceptual package sequence from logical message through protected object, manifest, fragment capsules, carrier encapsulation, optional image steganography and endpoint validation; separate fragment-set, conversation, retry and route-copy relationships.
  - W4: separate carrier extraction, set reconstruction, steganalysis and linkage evaluation; observer collection and experiment prompts.
- Updated `diagrams/README.md` to index the W1–W4 prompts. The prompts specify placement, content and "must not imply" guardrails. No new diagram artwork was generated.
- Integrated the work into thesis §§7–8 and Appendix A/C, the source register, route comparison framework, traceability, prior-art comparison, observer/property matrix, contribution/bias assessment and README.
- Reconciled WORKPLAN and PROJECT_STATE. The ChatGPT Project Instructions boundary remains explicit: thin operating layer external to GitHub; substantive research rules stay in thesis/research documents.
- Each GitHub write was fetched back and exact saved content matched.

### Research distinctions now explicit

- One logical message is not the same thing as a fragment set; a conversation links distinct messages; a retry is another delivery event for the same logical message; redundancy repeats/codes information for loss tolerance; a batch can contain independent messages; cross-route carriage can repeat the same protected object.
- Endpoint-authenticated linkage needed for reconstruction is distinct from linkage visible or inferable by platforms, hosts, coordinators, network observers and human observers.
- Carrier extraction, authenticated set reconstruction, per-image concealment, collection-level steganalysis and event/message linkage are separate evaluation outcomes.
- A visible set identifier aids reconstruction but can be a correlation handle. Hiding it may move the problem to manifest distribution, capability delivery or retrieval timing.
- Package encapsulation provides bounded route-facing framing; it is not authentication. Optional steganographic embedding does not encrypt or authenticate.
- Multi-image redundancy may improve recovery while increasing carrier/event volume and pooled detection opportunities.

### Verification boundary and next work

- No final wire format, manifest schema, steganographic method, detector, or cryptographic protocol has been selected.
- No implementation, platform experiment, steganalysis benchmark, extraction test, formal proof, independent reproduction or security audit was performed.
- The previous relative-link and ZIP-instruction audits predate this batch and are stale. Rerun them, along with exact-status, terminology, image-reference and illustration-placeholder audits.
- Next research action: extend the lifecycle/event/observer ledger with source-specific fragment-set, conversation, retry, cross-route and collection-level observations; retain explicit vantage, collection size, time window and dependence assumptions.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Post-integration repository audit

- Re-read the live recursive repository tree and checked all 29 Markdown files for relative Markdown/image links against all tracked repository paths. **Zero broken relative links** were found.
- Scanned all 29 Markdown files for active ZIP/archive-generation instruction patterns. **No archive-generation workflow instructions** were found. Historical archive references and navigation links are not instructions.
- Confirmed the source register contains 45 sequential source entries, SRC-001 through SRC-045.
- Confirmed all four W1–W4 work documents contain definition/comparison blocks and illustrated-diagram prompt placeholders.
- Corrected the SRC-044 DOI and clarified that its square-root relationship was conjectural in the proceedings paper; the formal asymptotic theorem is separately recorded as SRC-045.
- Exact-status, terminology, image-reference and thesis heading/numbering consistency remain to be audited.

- Normalised the W4 Markdown heading hierarchy for sections 1–9 and E1–E10; corrected the route-comparison framework's functional-role subsection numbering. Fixed a malformed README core-principles list item.
**Theory only · No implementation · Not audited.**

## 2026-11-16 · Route ledger expanded for message multiplicity and observer linkage

- Extended the route-comparison lifecycle/event ledger with explicit profile-specific rows for authenticated fragment-set membership/reconstruction, redundant carriage/loss tolerance, independent messages and conversation continuity, retry/duplicate and cross-route linkage, and collection-level steganalysis/carrier clustering.
- Added an observer-ledger discipline section distinguishing endpoint ground truth from observer-inferred links and requiring collection size, acquisition window, detector, cover dependencies, side information and observer vantage.
- Closed a terminology gap in W2 and W4: W2 now defines the package-encapsulation boundary separately from endpoint authentication; W4 now defines fragment sets, redundancy, independent messages, conversations, retries, cross-route copies and package framing as separate evaluation units.
- Fetched all five changed research documents (W1–W4 and route comparison) after the writes. Exact content matched. A targeted relative-link audit of those five files found no broken links.
- Confirmed each W1–W4 document contains definition/comparison information, illustration prompt(s), package/encapsulation terminology, message-multiplicity terminology and steganography analysis. The prompt index remains in `diagrams/README.md`.
- No diagrams, implementation, platform experiment, steganalysis benchmark, cryptographic test, formal proof or independent audit was performed.

**Next:** Refresh the project checkpoint and both digests from verified files, then continue source-specific full-text retrieval for SRC-033, SRC-034 and SRC-036 and route-profile version/configuration pinning.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · MRAS/DRAS reference-code inspection and multi-image boundary

- Retrieved and inspected the author-linked public MATLAB repositories for MRAS and DRAS, pinned respectively at commits `a14777047f82715bdbefcfed2cbb85427add23bc` and `ad81f8785b473e03765ec3a859dad7ceb73ff9ea`.
- Inspected each README, batch demo, core embedding/extraction routines and a method-specific helper. No code was executed and no experimental result was reproduced.
- Both public demos process ten covers through per-image embed/extract calls; each call loads a sample-message prefix from `SecretMsg.mat`. Both demos simulate JPEG recompression locally using MATLAB `imwrite`, not platform upload/download APIs. The exposed routines do not provide a cross-image fragment manifest, authenticated set reconstruction or conversation/session linkage.
- Kept the evidence boundary strict: the repositories are author-published reference implementations, not independent verification. Their local demos do not reproduce the papers' separately reported live-platform tests, nor prove that the full papers lack other experiment components.
- Updated SRC-033/SRC-034 source records with pinned code references and inspection limits; integrated the distinction into W1–W4, the dedicated multi-message analysis, route-comparison framework and thesis.
- This narrows the comparator: MRAS/DRAS public code is a per-image carrier-method reference, not an end-to-end multi-image messaging package. It does not by itself establish a thesis contribution or novelty.
- All changed files were fetched back and exact content verified.

**Next:** Reconcile PROJECT_STATE and WORKPLAN; run repository-wide link/status/terminology/illustration audits; refresh SESSION_DIGEST.md and SESSION_DIGEST.json last. Then continue with SRC-036 full-text retrieval and stronger version-pinned route profiles.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Active sanitization and animated-carrier prior art integrated

### Source review additions

- Expanded the source register from 45 to 49 entries.
- **SRC-046:** Wei et al. (2022), *Breaking Robust Data Hiding in Online Social Networks*, IEEE Signal Processing Letters. Abstract/metadata support a general secret-data remover for robust steganography and watermarking, using attack, image-fusion and latent-renewal components. Full paper and tables remain uninspected.
- **SRC-047:** Zhu et al. (2023), *Image Sanitization in Online Social Networks*. Abstract/metadata describe Scaling-Net for oversized images, SC-Net for other images and a discriminator for image-quality optimisation. Full paper and repository remain uninspected.
- **SRC-048:** Zhu et al. (2025), *Covert Communication in Sanitized Online Social Networks*. IEEE abstract describes a secret-seed-conditioned decoder combined with a sanitizer and iterative cover optimisation. Full paper and evaluation details remain uninspected.
- **SRC-049:** Wang et al. (2026), *Provably Secure and Robust Training-Free GIF Steganography*. IEEE metadata and the author-linked implementation README were inspected. The README describes 16-frame redundancy, cross-frame majority voting, OTP/ChaCha20 modes, AnimateDiff generation and DDIM-inversion extraction. The formal security proof and full paper remain unreviewed; code was not executed or audited.
- Revisited SRC-033–SRC-036 through current publisher-indexed content. MRAS/DRAS remain partial article reviews despite public MATLAB demo inspection already recorded in the checkpoint. Zhu et al. (2021) publisher-indexed sections expose the attack/optimisation network, BOSSbase/BOWS2 setup, 8,000/2,000 split and JPEG QF75, but full methods/results and generalisation limits remain incomplete.
- Primary sources surfaced in this pass: IEEE records for SRC-046/SRC-048, publisher/author-indexed records for SRC-047, IEEE metadata and author-linked code README for SRC-049. OpenReview full-paper pages were browser-gated; no unavailable full text was treated as inspected.

### Research integration

- Added SRC-046–SRC-049 to the source register, claim map and source-review summary.
- Updated W1 with carrier-multiplicity levels (GIF frames, separate image objects, distinct messages), passive/active sanitization comparison and W1-F04 illustration prompt.
- Updated W2 with active sanitizer capabilities, distinction between passive processing and sanitization, frame/carrier/message collection definitions, and W2-F02 prompt.
- Updated W3 with animated-carrier and sanitizer boundaries plus W3-F03 prompt. GIF remains a comparator, not an adopted route.
- Updated W4 with separate frame/object/message evaluation units, sanitizer conditions, an animated-GIF matrix row and W4-F03 prompt.
- Updated the dedicated multi-message analysis, prior-art comparison, observer/property matrix, route-comparison framework, thesis bibliography/analysis, traceability and contribution/bias assessment.
- Updated diagrams/README.md to index W1-F04, W2-F02, W3-F03 and W4-F03. No diagram artwork was generated.
- Updated WORKPLAN source count and source-review sequence; updated PROJECT_STATE to 49 sources and the new exact next research action. ChatGPT Project Instructions remain an external thin operating layer; substantive research rules remain in GitHub thesis/research documents.

### Key distinctions now explicit

- **Within-object multiplicity:** GIF frames inside one carrier; cross-frame redundancy is not a multi-post fragment set.
- **Across-object multiplicity:** separate images/files carrying fragments or redundant copies; publication and retrieval events add observer evidence.
- **Across-message multiplicity:** distinct protected messages linked by conversation/session semantics.
- **Transformation conditions:** routine/passive processing, active learned sanitization and sender adaptation to a known sanitizer are different threat models.
- Sanitizer and counter-adaptation abstracts do not establish deployment by a named platform or universal success. GIF README claims do not substitute for reviewing the paper's formal security argument.

### Verification boundary

- Every changed GitHub file was fetched after writing and exact saved content matched.
- No platform test, sanitizer model test, steganalysis benchmark, GIF reproduction, code execution, cryptographic test, formal proof or independent audit was performed.
- Full-text access remains incomplete for SRC-033, SRC-034, SRC-036 and SRC-046–SRC-048; SRC-049's paper/formal proof remains unreviewed.

**Next:** Continue full-text retrieval for SRC-033, SRC-034 and SRC-036; inspect SRC-046–SRC-048 full texts and SRC-047 code repository; review SRC-049 paper/formal proof and code where available. Then pin route service versions/configurations and reconcile any source-backed findings into the ledger.

### Repository audit after this batch

- Re-fetched and checked all 29 Markdown files against the current recursive repository tree; zero broken relative links were found.
- Scanned all 29 Markdown files for active ZIP/archive-generation instructions; none were found.
- Exact-status, terminology, illustration-placeholder and image-reference consistency remain a separate final audit.

**Theory only · No implementation · Not audited.**

## 2026-11-16 · Cross-document formatting and static consistency audit

- Repaired escaped literal newline sequences in `docs/source-register.md` and the W4 animated-GIF route-matrix row so Markdown table/list structure renders as intended.
- Corrected duplicate numbering in the source-register cross-source implications.
- Rechecked all 29 Markdown files in the repository. The static relative-link audit found no broken repository-relative links; the same link pass covers Markdown image references. A scan found no active ZIP/archive-generation instructions.
- Confirmed the source register contains 49 entries (SRC-001–SRC-049).
- Confirmed all 12 W1–W4 illustration placeholder IDs are unique and exactly match the 12 entries indexed in `diagrams/README.md`.
- Confirmed W1–W4 each contain definition/comparison blocks and the shared package-encapsulation, message-multiplicity and steganography distinctions. W1–W4 also distinguish animated-GIF frames, separate image carriers, and distinct protected messages; active sanitization and keyed counter-adaptation remain separate threat conditions.
- The audit is static documentation validation only. It is not a semantic peer review, code execution, platform test, steganalysis benchmark or security audit.

**Next:** Complete full-text/source-level review for SRC-033, SRC-034 and SRC-036; inspect SRC-046–SRC-048 full text and SRC-047 implementation where available; review SRC-049's full paper/formal security argument and complete results. Selected README/core/sender/receiver code has been inspected but not executed or audited. Then pin route service/client versions and reconcile evidence into the comparison framework and thesis.


## 2026-11-16 · SRC-049 implementation inspection addendum

- Used the GitHub connector to inspect the author-linked repository README (blob c6a3fd63324404992f5b84c529b20afb09f4f3b1), core/method_core.py (blob a024cf92893c5fb8411f1ded9c9d64488914757c) and scripts/run_stego.py (blob e41bb02cd90499c9774b60ef5343415a1630a93b).
- Pinned the external implementation repository to main commit 4a5d2503623b06d17517ecf7a8b7527e1edc315d (2026-05-09); source register records the exact inspected blob IDs.
- The code implements two redundancy levels: d-fold bit repetition within each frame and majority voting across 16 reconstructed frame secrets.
- Each frame receives a separately generated ChaCha20 key and 12-byte nonce in the PyCryptodome path; the key material is stored as local per-frame files.
- The sender path writes 16 PNG frame files; the receiver expects frame PNGs, local key files and a local ground-truth watermark file. The group ID is used in file naming and seed handling, not as an authenticated message-set identifier.
- The receiver asserts that the number of recovered frames and ciphers equals the configured 16. The inspected code therefore does not establish erasure tolerance for missing frames; majority voting is not itself proof of missing-frame recovery.
- The inspected StreamCipher path uses raw ChaCha20 encrypt/decrypt without an authentication tag visible in that code. The fallback is a 32-bit NumPy PRNG XOR explicitly labelled TEST ONLY. These are code-reading observations, not a cryptographic audit or a judgement on the uninspected paper proof.
- Updated SRC-049, the multi-message analysis, W2/W3/W4, thesis and prior-art/observer comparisons to distinguish bit errors from frame erasures, local sidecar keys from authenticated recipient manifests, and carrier recovery from endpoint authentication.
- No code was executed, no GIF experiment was reproduced, and no formal proof or security audit was performed. The full paper and formal security argument remain unreviewed.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Disposable work area and internal lookup registries

### Completed and read-back verified

- Moved the five operational continuity records from `project/` to `work/`: project state, workplan, work log and both session digests. Each destination file was fetched back and verified before the old path was deleted; each old path was then checked to confirm it no longer resolves.
- Updated repository README navigation to the new `work/` paths and verified the saved README.
- Added `work/README.md` to define the area as temporary, thesis-agnostic scaffolding that can be removed at full thesis release without changing thesis or research content.
- Added compact human-readable and JSON lookup registries for recurring concepts (`C-001` onward) and active work items (`T-001` onward). These IDs are internal only, are not thesis references, and do not replace citations, source IDs, section references or figure references.
- Kept the thesis and all substantive research documents untouched by this organisational change. Existing thesis and research references remain authoritative.

### Boundary and lifecycle

- `/work/` is coordination machinery, not part of the research architecture or thesis deliverable.
- Internal IDs shorten our lookup and continuation; they must not be inserted into thesis/research prose.
- A task is extinguished when its substantive outcome is reconciled into the thesis and supporting research, evidence limits are recorded, and no further work remains. IDs are not recycled.
- Before release, verify that no enduring document depends on `/work/`; then remove the directory.

### Verification boundary

- Destination operational files, lookup registries and README were read back and content-verified after writes.
- All five superseded `project/` files were deleted only after verified copies existed; each deletion was checked by attempting to fetch the old path.
- Full repository-wide relative-link validation remains to be run after the remaining continuity-record and digest updates.

### Next

1. Finish updating the moved state, roadmap and log; refresh both digests last.
2. Run a repository-wide audit for stale `project/` paths, broken Markdown links and accidental internal-ID leakage into thesis/research documents.
3. Continue `T-001`: seek complete source texts for SRC-033, SRC-034 and SRC-036; preserve partial-review labels until methods, results and limitations are inspected.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · Thesis-product lifecycle and work-backlog remit clarified

### Infrastructure checkpoint

- Clarified the product model: the thesis is the sole product; `thesis.md` is the one active manuscript in staging; production is a frozen release of that same thesis, not a separate thesis or parallel product.
- Defined staging and production as lifecycle states of the same thesis, preserving one continuous identity, provenance, citations, evidential limits, uncertainty and author responsibility.
- Recast `/work/` as the temporary store of work to be done to develop, analyse, explain, scrutinise and release the thesis. Its remit includes research/source reviews, route/comparator analysis, protocol-boundary reconciliation, thesis synthesis, diagrams, validation, peer-review preparation/response and release checks.
- Clarified that enduring arguments, definitions, evidence and citations remain in `thesis.md` and substantive research documents; `/work/` contains actionable work and internal navigation only.
- Strengthened the peer-review boundary: scope, reviewer comments/evidence, author responses, dispositions, unresolved dissent and resulting changes must be traceable. No reviewer group or completed independent review is implied.
- Expanded the internal task registry through diagram, peer-review and release-integrity stages. Internal IDs remain private lookup handles, not thesis references.
- Kept thesis content and enduring research documents unchanged by this infrastructure-only clarification.

### Verification

- The complete infrastructure clarification is consolidated in checkpoint `TIP-WORK-INFRA-2026-11-16`; its final checkpoint commit and tree were read back from `main`.
- The thesis manuscript was not edited as part of this infrastructure change.

### Continuation

Next substantive action remains T-001: seek full texts for SRC-033, SRC-034 and SRC-036, preserving partial-review labels until methods, results and limitations are inspected. Later work includes route evidence, protocol analysis, thesis synthesis, stable-argument diagram work, substantive peer review and release integrity.

**Theory only · No implementation · Not audited.**


## 2026-11-16 · T-001 publisher-indexed source-review pass

### Work performed

- Revisited the publisher-hosted ScienceDirect records for SRC-033 (MRAS), SRC-034 (DRAS) and SRC-036 (active destruction of robust steganography), including the additional indexed section material exposed by search.
- SRC-033: clarified the paper's stated robustness, imperceptibility and steganalysis metrics (extraction error, PSNR/SSIM and classifier error), named comparators (MINICER, DMMR, GMAS and SS), BOSSbase evaluation and LinkedIn test. Full parameter tables, dataset split, platform procedure and limitations remain unavailable.
- SRC-034: clarified the RoLoS-ablation and PMAS comparisons, Q95-to-Q85/Q80/Q75 scenarios, payload-dependent evaluation dimensions and author-reported approximately 87% extraction-error reduction / order-of-magnitude speed claim. The indexed record names WhatsApp, X and LinkedIn tests. Complete tables, sample sizes, payload settings, platform procedure and limitations remain unavailable; headline figures are not independently checked.
- SRC-036: clarified the two-module end-to-end CNN (attack/filtering plus image-quality optimisation with joint loss), BOSSbase 1.01 split (8,000 train / 2,000 test), BOWS2 second-dataset check and JPEG QF75 context. Full equations, training configuration, exact tested methods/payloads, result tables, runtime and generalisation limits remain unavailable.

### Evidence and limitations

- Publisher records were discoverable and exposed indexed abstract/section material; direct page opening returned access-denied/403 and no complete paper text was obtained.
- These additional snippets improve the precision of the partial reviews but do not satisfy the full-text review requirement. No paper is upgraded to full review; no author-reported result is treated as independently verified.
- No experiments, code execution, reproduction or audit were performed. No claims are made about current platform processing or universal defeat/survival.
- The source register was updated with the added evidence and explicit residual gaps; project state was reconciled. T-001 remains open.

### Next action

Seek author manuscripts, institutional repository copies or library-accessible full texts for all three sources. If unavailable, record the access route and retain partial-review status; then proceed to T-002 only as a separately tracked task, without silently treating T-001 as complete.

**Theory only · No implementation · Not audited.**


## 2026-11-17 · Thesis route profiles and lifecycle/observer synthesis integrated

### Work performed

- Merged the six evidence-bounded route profiles from `docs/route-comparison-framework.md` into thesis §8.2: IMG-QIAO-2023, IMG-MRAS-2026, IMG-DRAS-2026, FILE-DROPBOX-LINK, E2E-SIGNAL-PROTOCOL and MIX-ECHOMIX-PIGEONHOLE.
- Preserved the distinct evidence classes and configuration limits: published literature conditions, partial publisher-indexed/code-inspection evidence, service documentation, protocol specification and integrated paper/specification reference. No profile is represented as a pinned deployed evaluation.
- Expanded thesis §8.8 with a lifecycle/observer comparison covering identity/session preparation, publication, discovery/retrieval, transformation, validation and reconstruction, retry/ordering/continuity, expiry/retention and observer visibility.
- Integrated the prior-art pressure into the thesis decision analysis: SRC-043 already demonstrates multi-image fragmentation, numbered fragments, redundant image carriage and reconstruction using robust watermarking; SRC-044–SRC-045 establish the need to consider pooled detection under their stated assumptions.
- Added a bounded conclusion: current evidence establishes a platform-transformation research burden for image carriage, not a demonstrated privacy, reliability or delivery advantage. Its decision relevance remains conditional on a measurable use-case benefit exceeding transformation, collection-detection, discovery, metadata and usability costs.
- Reconciled the verified thesis result into PROJECT_STATE.md. WORKPLAN.md remains unchanged because the stable sequence and dependencies have not changed.

### Verification and limits

- Both thesis edits were committed to `main` and fetched back; exact saved content matched.
- Thesis structure checks found one §8.2 heading, one §8.8 heading and one following §9 heading. All six profile identifiers and the decision-analysis section are present.
- The route profiles remain documentary. No actual Dropbox, Signal or Katzenpost/Pigeonhole deployment/client configuration was pinned; no platform, route, cryptographic or usability experiment was run.
- SRC-033, SRC-034 and SRC-036 remain partial reviews. No full-text review, independent reproduction, implementation, formal proof, peer review or audit is claimed.
- No diagrams were created; existing text-only illustration prompts remain deferred until the argument and evidence stabilise.

### Exact next action

Continue T-001 by seeking complete texts for SRC-033, SRC-034 and SRC-036. Preserve partial-review labels until full methods, results and limitations are inspected. T-004 remains open for actual service/client/release/configuration pinning after the source-review sequence.

**Theory only · No implementation · Not audited.**


## 2026-11-17 · Operational handover clarified as an execution loop

### User direction

The four operational documents exist to prevent repeated work and reduce the user's need to supervise continuity. They are practical progress/handover controls, not an additional project, thesis product or reason to produce repeated plans and lengthy status narratives. The working rhythm is: manage the work, ask only when necessary, execute within the available turn/token runway, update the records, summarise actual work, and repeat.

### Changes made

- Clarified `PROJECT_STATE.md` with an explicit working cycle: read and reconcile the live checkpoint; select the next useful unblocked action; ask only where a missing decision or material ambiguity prevents progress; execute; record actual outcomes; fetch and verify writes; continue while useful runway remains; then hand over concisely.
- Reworked the session-continuity section of `WORKPLAN.md` into an operational loop: read → decide → do → record → verify → repeat. It distinguishes the four documents' roles, makes `WORK_LOG.md` the factual chronology, and treats Markdown/JSON digests as paired retrieval formats.
- Explicitly discouraged repeated planning instead of execution, unnecessary confirmation requests, broad preference questions when the next step is known, inflated claims about incremental changes and progress reports that substitute for work.
- Preserved the existing research sequence, thesis/research boundaries, verification requirements and maturity statement. This is a workflow clarification, not a change to research priorities or technical conclusions.
- Prepared matching ChatGPT Project Instructions for the user to place in the external Project settings. The GitHub repository cannot itself change those ChatGPT settings.

### Verification

- `PROJECT_STATE.md` fetched after update; exact saved content matched. Blob SHA: `230ba7dd3064c1001509275433bb77b927a837a8`.
- `WORKPLAN.md` fetched after update; exact saved content matched. Blob SHA: `2ddb360e796fa51be2a7e3c4f9d04c6cd58d10b4`.
- `WORK_LOG.md` is being updated for this entry; its final blob SHA will be recorded in the refreshed digests after read-back.
- No thesis argument, research finding, implementation, experiment, review or audit status was changed by this operational update.

### Exact next action

Refresh `SESSION_DIGEST.md` from the verified state, then refresh `SESSION_DIGEST.json` last. Fetch and verify both digests and confirm their hashes match the current state, workplan and log.

**Theory only · No implementation · Not audited.**


## 2026-11-17 · Source-review access expansion and protocol comparison integrated

### Work performed

- **T-001:** Re-searched exact titles/DOIs and current publisher previews for SRC-033 MRAS, SRC-034 DRAS and SRC-036 active sanitisation. The previews now expose additional scope and method details: MRAS is specifically framed around matching JPEG recompression; DRAS around high-to-lower-quality downward recompression with RoLoS/CARE and Q95→Q85/Q80/Q75 scenarios; SRC-036 describes an attack/filtering plus image-quality optimisation CNN and BOSSbase/BOWS2/QF75 setup. These additions are recorded in docs/source-register.md §7.1.1. Direct ScienceDirect page opening returned 403; no complete papers, full tables or full limitations were obtained. All three remain partial reviews.
- **T-002:** Located the author-linked SRC-047 repository, zyzhu19/Image-Sanitization, and fetched its README. It identifies Scaling-Net/SC-Net, colour/grayscale model variants, MATLAB R2020b PSNR/SSIM/NIQE measurement and an external Baidu model download. Attempts to fetch testmy.py, test.py, model/README.md and requirements.txt returned 404 through the available GitHub interface. SRC-046 OpenReview retrieval redirected to browser verification; SRC-048's IEEE Xplore abstract/metadata was inspected. Findings and exact access limits are in docs/source-register.md §7.2.1.
- **T-003:** Located an indexed abstract/summary for SRC-049 describing encrypted/repeated secret mapping into diffusion latent variables, per-frame extraction and inter-frame validation, with author-reported near-100% accuracy under stated attacks. This is not a full-paper or proof review and does not resolve the already recorded selected-code limitations. Added a bounded note to docs/source-register.md §7.2.2.
- **T-005:** Compared Signal PQXDH/Double Ratchet, MLS and HPKE at their distinct native scopes. Signal is retained as a 1:1 asynchronous establishment/ratchet reference; MLS as a group key-establishment/lifecycle reference; HPKE as a lower-level KEM/KDF/AEAD composition reference. Explicitly distinguished ratchet skipped-message handling from fragment-set reconstruction, MLS group epochs from the current 1:1 scope, and HPKE stateful ordering/loss/replay duties from a complete messaging protocol.
- Integrated the comparison into thesis §6.2 and docs/protocol-boundary-analysis.md §9.1. Added explicit protocol-boundary links and test questions to W2 and W4; checked existing W3 and traceability integration; updated the contribution/bias assessment to state that protocol-composition obligations are correctness requirements, not a novelty claim.
- Updated the internal task registry: T-005 is complete; T-001–T-003 remain open with precise acquisition blockers and no upgrade of partial-review status. WORKPLAN.md was not changed because priorities and dependencies did not change.

### Research judgement

The new source material strengthens the evidence that image-carrier robustness, downward/matching recompression, active sanitisation and sanitizer-aware counter-adaptation are established topics. It does not establish current platform deployment, universal payload survival/removal, endpoint-authenticated message semantics or a privacy advantage. No new thesis novelty claim is adopted.

The protocol comparison narrows the design space without selecting a protocol. Primitive names are not a protocol composition; message ordering, fragment-set reconstruction, service delivery and route observers remain distinct responsibilities.

### Verification

- Every substantive file changed in this batch was fetched after writing and exact saved content matched:
  - docs/source-register.md — `87b4866d9a4cc2f5d4f9efb8b1714e26887dd673`
  - docs/protocol-boundary-analysis.md — `14a56004e515ebf1caae2a656f1402aef9d28609`
  - thesis.md — `cbc06935901d007542cec32a44332ac8b975baa6`
  - docs/w2-threat-model.md — `d6996524d4c847ce5bb67b3e41be41d8c4b385ca`
  - docs/w4-risks-and-evaluation.md — `f53da96c10753b16ddfab2ccce77cceb4ed14682`
  - docs/thesis-contribution-and-bias-assessment.md — `d8d3879f41251fcdbf9cf40c1e42cc04a849520d`
  - work/lookup/TASKS.md — `1561731adf5b2608a45f57209c555bd44eb3dfa3`
  - work/lookup/TASKS.json — `7c49fca455074620bfe05cab5ed32544c03dc6f5`
  - work/PROJECT_STATE.md — `494486517e1fd86852c5eef83fe42755d3bad79f`
- WORKPLAN.md was read and left unchanged.
- No full-paper review, code execution, experiment, reproduction, formal proof, protocol selection, implementation, independent review or audit is claimed.

### Exact next action

Continue T-001 by seeking complete texts for SRC-033, SRC-034 and SRC-036 through author/institutional access. Continue T-002/T-003 acquisition work where useful. Preserve partial-review status until full methods, results, formal arguments and limitations are inspected.

**Theory only · No implementation · Not audited.**
