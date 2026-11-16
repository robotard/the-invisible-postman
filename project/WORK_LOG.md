

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
- Updated project/WORKPLAN.md to preserve this reuse-first approach.
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
- Updated `project/WORKPLAN.md` with an explicit construction-first sequence and review gates.
- Added a GitHub deployment-digest routine requiring exact paths, purpose, commit links, actual read-back/verification, outstanding gaps and only genuinely blocking decisions.
- Explicitly did not add a CI bot or untested GitHub Actions. The digest is generated from actual GitHub writes and read-backs.
- Updated `project/PROJECT_STATE.md` with the new priority, verified workplan commit and next construction tasks.
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
- Marked W0.1 complete in `project/WORKPLAN.md`.
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

- Added `project/SESSION_DIGEST.json` as an intentionally small machine-readable retrieval index for new chat sessions.
- Linked the digest from `README.md`, `project/PROJECT_STATE.md` and `project/WORKPLAN.md`.
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
- Established the concrete rule: every session must use and reconcile project/PROJECT_STATE.md, project/WORKPLAN.md and project/WORK_LOG.md. Before stopping, all three must agree on completed work or an explicitly parked continuation point. Parked work must include evidence, current state, blockers/dependencies, exact next action, relevant paths and constraints.

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

