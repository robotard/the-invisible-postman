# The Invisible Postman: Project State

**Working title:** The Invisible Postman: A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging  
**Checkpoint:** 2026-11-14  
**Status:** Theory only · No implementation · Not audited

## Verified repository and publication state

The current working branch is `work/reconcile-research-and-repository`.

The repository reconciliation work was pushed to GitHub and verified by fetching all ten changed files from the branch. Pull request [#1 · Reconcile thesis and research repository](https://github.com/robotard/the-invisible-postman/pull/1) is open and unmerged. The changes are not yet part of `main`.

The reconciliation includes:
- corrected README navigation;
- thesis aligned with W1–W4;
- updated project state and workplan;
- security-scope notes;
- critical review questions; and
- four editable Mermaid diagrams.

## Research status

- W0–W5: completed as research/documentation waypoints.
- W1–W4: substantive research framing, threat model, architecture and evaluation documents exist.
- Thesis: integrated working edition aligned to W1–W4.
- W6: protocol specification dossier drafted; major decisions remain open.
- W7–W8: not started.

## W6 progress

Created `docs/w6-protocol-specification.md` as a protocol design dossier and `diagrams/04-protocol-decision-flow.mmd` as its dependency map. It identifies:
- synchronous versus asynchronous/offline delivery as a foundational decision;
- identity-key binding and first-contact verification;
- recipient-side sender authentication versus transferable signatures;
- canonical envelope and authenticated associated data;
- key separation, KDF and nonce requirements;
- replay-state persistence and rollback;
- authenticated multipart manifest and bounded reconstruction;
- versioning, downgrade, metadata and resource limits.

The draft recommends treating asynchronous delivery as in-scope unless the use case is explicitly narrowed, while leaving D1 open for confirmation. It deliberately does not select a final cryptographic suite or invent a bespoke handshake. A technical correction is recorded in the multipart section: a ciphertext digest cannot be included in pre-encryption associated data; any post-encryption checksum is only an untrusted early-corruption hint, while the reconstructed object must pass the selected authenticated-encryption verification.

## Remaining research work

1. Decide whether asynchronous sending to offline recipients is a core requirement.
2. Decide the required sender-authentication semantics: recipient-side peer authentication or transferable signatures.
3. Select and review an authenticated session-establishment design appropriate to the operating model.
4. Specify identity verification, key changes, device lifecycle and compromise response.
5. Finalise canonical envelope encoding, cryptographic profile, key separation and nonce policy.
6. Specify replay-state scope, persistence and rollback behaviour.
7. Validate the multipart manifest construction, size limits and rejection rules.
8. Define metadata visibility, retention and coordinator permissions.
9. Decide whether concealment offers a defensible benefit; recovery remains outside the minimum architecture.
10. Define reproducible adversarial tests and justified acceptance thresholds.
11. Obtain independent cryptographic and implementation review before implementation or security claims.

## Verification limits

Files added or updated on the working branch must be fetched back before they are described as verified. Mermaid source files are editable, but their rendered appearance has not yet been visually reviewed. No implementation, executable protocol tests, formal proof, independent review or security audit is claimed.

The open pull request is not a merged publication to `main`.

**Theory only · No implementation · Not audited.**
