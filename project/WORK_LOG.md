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
- Created docs/self-review-register.md with twelve author-identified challenges covering proposition value, security-claim discipline, identity verification, protocol composition, carrier value, steganalysis evidence, metadata exposure, multipart ordering and validation, lifecycle/recovery complexity, evaluation design, scope and source grounding.
- Each issue records its location, challenged claim or assumption, reviewer question, evidence needed, proposed action, priority, status and response/resolution.
- Explicitly labelled the items as author-identified, not external peer-review findings or endorsements.
- Linked the register from the README, Phase 1 W0.2 work unit and research traceability register.
- Preserved the ability for reviewers to add competing interpretations, challenge the central proposition and retain unresolved dissent.

### Initial critical finding

A notable protocol-design question is the treatment of reordered multipart capsules. Transport arrival order and authenticated logical order are not necessarily the same. The receiver may be able to reassemble safely reordered fragments when their indices and message-set binding are authenticated; the specification should distinguish this from conflicting, duplicated, substituted or incomplete sets. This is recorded as SELF-08 and remains open.

### Deferred

- Complete the authors' claim-by-claim self-review and source verification.
- Reconcile the active thesis against W1–W4 and the decision register.
- Develop the full external reviewer guide, contribution templates and response workflow.
- Stabilise the manuscript before further illustration work.

**Theory only · No implementation · Not audited.**
