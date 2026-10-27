# The Invisible Postman: Project State

**Researcher:** @robotard  
**Project:** The Invisible Postman  
**Working title:** A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging  
**Last checkpoint:** 2026-10-27  
**Status:** Theory only · No implementation · Not audited

## 1. Purpose of this file

This is the living project checkpoint. It records verified progress, outstanding work, blockers, and the next action required to resume the project.

Update this file after meaningful progress. Keep `WORKPLAN.md` as the stable roadmap and waypoint definition.

Do not treat a planned, attempted, or drafted action as completed without evidence.

## 2. Current verified position

| Waypoint | State | Notes |
|---|---|---|
| W0: Baseline and workplan | Established | Project framing and workplan exist in the recorded project history. |
| W1: Research framing | Drafted | Local Markdown artifact was created. Repository publication is unverified. |
| W2: Threat model | Drafted | Local Markdown artifact was created. Repository publication is unverified. |
| W3: Architecture | Pending verification | Reconcile architecture against the thesis and supporting specifications. |
| W4: Risks and evaluation | Pending verification | Establish explicit limitations, evaluation criteria, and acceptance conditions. |
| W5: Integrated thesis | Pending verification | Reconcile the thesis with the research framing, threat model, and design decisions. |
| W6: Publication package | In progress | Required repository ZIP has not been verified as created. |
| W7: Repository verification | Pending | Verify package contents and repository state after publication. |

These statuses describe the latest recorded checkpoint, not a fresh inspection of every project file.

## 3. Immediate next task

Create and verify an upload-ready ZIP package for the public repository:

`robotard/the-invisible-postman`

Proposed archive name:

`invisible-postman-repository-package.zip`

Proposed contents:

- `README.md`
- `WORKPLAN.md`
- `PROJECT_STATE.md`
- `.gitignore`
- `SECURITY.md`
- `CHANGELOG.md`
- `UPLOAD-INSTRUCTIONS.md`
- `docs/thesis.md`
- `docs/W1-research-framing.md`
- `docs/W2-threat-model.md`
- `docs/architecture.md`
- `diagrams/` containing the approved, polished diagrams
- `review/REVIEW_QUESTIONS.md`

Adapt the structure to the actual source files and their formats. Preserve the original thesis and supporting materials. Do not invent missing source content or overwrite better versions without review.

### ZIP acceptance criteria

1. Inspect available thesis, Markdown, specification, and diagram sources.
2. Identify the authoritative thesis version and the approved stylised diagrams.
3. Reconcile terminology and claims across the thesis, research framing, threat model, and README.
4. Ensure the README accurately describes the project as theoretical research.
5. Include upload instructions and a suitable `.gitignore`.
6. Exclude `.git/`, credentials, private keys, recovery codes, private correspondence, and unrelated working material.
7. Inspect the final archive listing and confirm required files are present and readable.
8. Verify the generated file's exact path and existence before providing a download link.
9. Record the actual outcome in this file.

The ZIP is a repository-documentation package, not an executable secure-messaging application.

## 4. Current blockers

### File generation

At the last recorded attempt, the data-analysis/file-generation tool was temporarily unavailable. The reported estimated recovery time was approximately 23 hours and 49 minutes from 2026-10-27 03:25 UTC. This was an estimate, not a guarantee.

**Next action:** Check actual tool availability before attempting archive creation. Do not claim the ZIP has been generated until verified.

### GitHub publishing

A GitHub write attempt returned HTTP 403:

`Resource not accessible by integration`

Read access to the public repository was available in previous checks. The repository's `WORKPLAN.md` was observed on `main`; the README was previously reported as a placeholder.

**Next action:** Recheck current repository state and authorised write capability. Do not claim write access has been restored or bypass the permission failure. If publishing remains blocked, provide the verified ZIP for manual upload when possible.

### Durable checkpoint

This checkpoint content has been prepared in the conversation but has not yet been verified as saved to the repository.

**Next action:** Save this file as `PROJECT_STATE.md` in the project/repository when an authorised, available file-writing route exists. Read it back to verify the saved version.

## 5. Technical and research guardrails

- Endpoints are trust anchors; transport services and image hosts are not trusted with plaintext or sole decryption capability.
- Keep confidentiality, sender authentication, carrier formatting, and steganographic concealment conceptually separate.
- Images are carriers, not cryptographic keys or guaranteed sources of entropy.
- Telegram usernames and chat identifiers do not independently establish human identity.
- First-contact authentication requires explicit identity verification; public-key agreement alone does not prove who a person is.
- Candidate primitives such as X25519, HKDF-SHA-256, Ed25519, and XChaCha20-Poly1305 are candidates, not an audited or fully specified protocol.
- Public salts and nonces are not secret keys; nonce handling must follow the selected primitive's requirements.
- Ciphertext fragmentation is not threshold secret sharing.
- Expiry and revocation cannot recall plaintext or keys already obtained.
- Do not claim implementation, formal verification, demonstrated concealment resistance, deployment readiness, or independent audit without evidence.
- Preserve design weaknesses and unresolved decisions in the public research record. Never use security through obscurity as a substitute for sound design.

## 6. Publication and disclosure rules

Include the architecture, design rationale, threat model, candidate algorithms, limitations, diagrams, and reviewer questions.

Exclude actual secrets, credentials, private keys, recovery codes, personal data, private correspondence, non-public infrastructure details, and uncoordinated exploit details.

Do not conceal legitimate design weaknesses merely to make the project appear more secure.

## 7. Progress log

### 2026-10-27: Latest recorded checkpoint

- W0 established.
- W1 research framing drafted.
- W2 threat model drafted.
- Repository ZIP planned but not created or delivered in the last recorded attempt.
- GitHub write failure remains unresolved.
- Dynamic `continue` workflow designed but not installed or verified as an automated mechanism.

Add dated entries below after meaningful work. Record evidence and outcomes rather than intentions.

## 8. Next action

1. Read this checkpoint and `WORKPLAN.md`.
2. Inspect available source documents and diagrams.
3. Check whether file-generation tools are available.
4. Build and validate the repository ZIP if possible.
5. Otherwise, continue with independent source reconciliation and document preparation that does not require the blocked capability.
6. Update this checkpoint with verified results and the next actionable task.

**Project status: Theory only · No implementation · Not audited.**
