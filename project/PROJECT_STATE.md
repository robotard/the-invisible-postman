# The Invisible Postman: Project State

**Working title:** The Invisible Postman: A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging  
**Checkpoint:** 2026-11-14  
**Status:** Theory only · No implementation · Not audited

## Verified repository state

The following files were fetched from the GitHub `main` branch during this checkpoint:

- `README.md`
- `thesis.md`
- `project/PROJECT_STATE.md`
- `project/WORKPLAN.md`
- `docs/w1-research-framing.md`
- `docs/w2-threat-model.md`
- `docs/w3-architecture.md`
- `docs/w4-risks-and-evaluation.md`
- `docs/traceability.md`

W1–W4 and traceability are substantive documents and form a coherent research sequence around endpoint-held cryptographic authority, untrusted transport, authenticated identity and context, image-carried capsules, multipart validation, lifecycle limits and evidence-led evaluation.

## Material discrepancy found

The previous `thesis.md` described a different, single-user Python/Flask prototype based on password-derived keys, Argon2id, XChaCha20-Poly1305 and image embedding. It did not represent the newer endpoint-to-endpoint architecture in W1–W4.

That earlier proposal is exploratory history, not an adopted protocol. Its candidate primitives and implementation plan must not silently override the current research framing. The integrated thesis now follows W1–W4 and records the earlier prototype direction as superseded exploration.

## Repository corrections in this checkpoint

- Replaced stale README links and claims with paths verified against the repository.
- Added security-scope notes and a focused technical review agenda.
- Added editable Mermaid diagrams for trust boundaries, lifecycle and research traceability.
- Reconciled the thesis with W1–W4 while preserving the earlier proposal's status as exploratory work.
- Removed obsolete checkpoint claims about an available ZIP, embedded DOCX diagrams and unresolved GitHub write access.
- Updated the workplan to reflect the documents that already exist.

## Remaining research work

1. Resolve protocol decisions: authenticated key establishment, first-contact verification, canonical encoding, key separation, nonce policy, sender authentication and replay state.
2. Specify the authenticated multipart manifest and precise rejection behaviour.
3. Define metadata visibility, retention and coordinator permissions.
4. Decide whether concealment offers a defensible benefit for any stated threat model.
5. Decide whether recovery is justified; it remains outside the minimum architecture.
6. Define reproducible tests and justified acceptance thresholds before implementation.
7. Obtain independent cryptographic and implementation review before making security claims.

## Verification and publication

This checkpoint records the files and changes actually verified in the repository workflow. It does not claim a rendered diagram review, executable tests, protocol validation, implementation, formal proof or independent audit.

The reconciliation changes are being prepared on a dedicated branch. They must be committed and then verified by fetching the resulting branch contents and commit metadata before publication is described as complete.

**Theory only · No implementation · Not audited.**
