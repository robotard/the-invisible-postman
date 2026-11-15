# The Invisible Postman: Project State

**Researcher:** @robotard  
**Working title:** *The Invisible Postman: A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging*  
**Checkpoint:** 2026-11-15  
**Status:** Theory only · No implementation · Not audited

## Purpose

This is the changing progress record. `project/WORKPLAN.md` is the stable roadmap. Update this file after meaningful work. Only report repository changes after checking GitHub's returned commit result and, where material, fetching the changed file again.

## Verified repository baseline (2026-11-15)

- Repository: https://github.com/robotard/the-invisible-postman
- Default branch: `main`
- Repository visibility: public.
- GitHub connector permissions currently report `push: true` and `admin: true`. Direct repository writes are available in this session; earlier HTTP 403 notes are superseded by this verified permission result.
- `README.md` exists and contains a project overview, scope boundaries, links to the intended starting documents, and the assurance label.
- `project/WORKPLAN.md` and `project/PROJECT_STATE.md` exist on `main`.
- `docs/w3-architecture.md`, `docs/w4-risks-and-evaluation.md`, and `docs/traceability.md` exist on `main`.
- `thesis.md` exists on `main`, but its current content is an older password-based, single-user Flask application concept. It conflicts with the newer endpoint-controlled, authenticated-messaging research direction and must not be treated as the current integrated thesis without reconciliation.
- The expected paths `docs/W1-research-framing.md` and `docs/W2-threat-model.md` were not found at the paths checked. Their presence elsewhere has not yet been verified.
- Recent GitHub history shows temporary thesis/PDF/archive operations on 2026-11-14. The current branch state, not those commit messages, is authoritative.

## Completed and verified in this checkpoint

- Located the intended GitHub repository and confirmed current write permission.
- Read the current `README.md`, `project/WORKPLAN.md`, `project/PROJECT_STATE.md`, `thesis.md`, `docs/w3-architecture.md`, `docs/w4-risks-and-evaluation.md`, and `docs/traceability.md`.
- Identified the material thesis inconsistency: the current root thesis still describes a password-derived, single-user Flask model, while the newer architecture places plaintext, private keys, identity verification, and cryptographic authority at participant endpoints.
- Confirmed that W3, W4, and traceability documents are present in the repository.
- Confirmed that direct GitHub writes are available now. No ZIP is required if the repository can be updated and verified directly.

## Finished / remaining / blocked

### Finished
- W0 baseline and stable workplan are present.
- W3 architecture exists in the repository.
- W4 risks and evaluation exists in the repository.
- Research/design traceability exists in the repository.
- README has substantive project content.
- GitHub write access is currently verified.

### Remaining
1. Locate and verify the latest source versions of W1, W2, the thesis manuscript, and the corrected stylised diagram assets. Do not assume a local/library artifact is the latest version without checking provenance and contents.
2. Reconcile the thesis with W1–W4 and the endpoint-controlled architecture. Retire or clearly archive superseded password-based Flask material rather than silently blending incompatible models.
3. Inspect and correct the stylised diagrams, their labels, captions, numbering, and references in the manuscript.
4. Publish the approved thesis and supporting documentation directly to GitHub, using the existing repository structure where sensible.
5. Update README links and this progress record to match the actual published files.
6. Fetch changed files from GitHub after writes and verify commit SHAs, content, paths, links, and repository state.

### Blocked / unresolved
- The latest authoritative W1 and W2 source locations have not yet been confirmed.
- The corrected diagram image files and the exact thesis source intended for integration have not yet been identified and visually checked.
- The existing root `thesis.md` is demonstrably out of date relative to the newer architecture; it is not safe to publish as the final integrated thesis without substantial revision.
- No complete manuscript/diagram package has yet been published and verified in this checkpoint.

## Next task

**Reconcile the current thesis against the latest W1–W4 research and architecture, after locating the authoritative thesis and diagram sources.** Then publish changes directly to GitHub and verify them there.

Do not create a repository ZIP unless direct GitHub publication proves unavailable or the user explicitly requests an archive.

## GitHub-first operating rules

- Interact with the connected GitHub repository directly: inspect, create, update, and verify files using the available GitHub actions.
- Prefer small, reviewable commits with descriptive messages. Fetch existing files and use their current blob SHAs before updating them.
- Never overwrite or delete existing material merely because a similarly named local file exists. Compare provenance, content, and repository history first.
- After every material write, record the returned commit SHA and fetch the changed path again to verify the saved content.
- Summarise only what changed, what was verified, and what remains. Do not narrate routine tool operations.
- Do not ask the user to copy, upload, download, or manually edit files when the connected tools can perform the action.
- Ask the user to intervene only when a genuine human decision, unavailable permission, authentication step, conflict, ambiguous source, or required visual judgement cannot be resolved safely by the assistant.
- Never claim a file was saved, completed, published, or verified unless the relevant GitHub response or independent read-back confirms it.
- Keep the scope theoretical. Do not implement the messaging system.

## Assurance statement

**Theory only · No implementation · Not audited.**
