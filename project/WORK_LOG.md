# Work Log

**Project:** The Invisible Postman  
**Purpose:** Dated record of work sessions, decisions, verification and deferred tasks.  
**Assurance:** Theory only · No implementation · Not audited.

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
