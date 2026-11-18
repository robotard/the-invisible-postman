# Work Log — The Invisible Postman

## 2026-11-18 · Candidate D formal model and nearest-prior-art synthesis

### Work performed

- Consolidated the primary-source review of APIR (SRC-054), AAD (SRC-055), vPIR (SRC-057) and multi-query vPIR (SRC-058), alongside the partial APIR-range review (SRC-056), partial VPRQ review (SRC-059), and full Basudan/Alamer range-query review (SRC-060). Existing OMR/StOMR/UnifOMR and downstream SRC-052 boundaries remain separate.
- Refined the APIR distinction: multi-server point and predicate/aggregate queries use an at-least-one-honest-server model; the single-server out-of-band-digest construction is point-query only. Predicate queries return weighted aggregates, not a variable-length enumeration of every matching record.
- Integrated the range-query prior art as direct counterexamples to generic private/verifiable range retrieval. APIR-range is indexed-text-only and describes a static owner-signed tree with access-count/timing/volume leakage; VPRQ remains abstract/introduction-only; Basudan/Alamer's full paper uses trusted data owners/seekers and a primarily semi-honest cloud, with its explicit theorem proving trapdoor privacy rather than a separate malicious-cloud soundness theorem.
- Formalised Candidate D in thesis.md with distinct parties and collusion assumptions, sender intent versus manifest commitment, admission receipts, authenticated snapshot/epoch, retrieval soundness/completeness, manifest closure, endpoint acceptance, fork/freshness, predicate privacy and selective-failure resistance.
- Defined a leakage function covering snapshot/epoch size, result cardinality, query/access count and pattern, timing, bytes/proof size, retries/aborts and manifest length; added a total-cost model for admission, snapshot, retrieval, proof, verification, manifest and gossip.
- Added a limited pre-admission-omission indistinguishability proposition: without a pre-admission commitment to an expected set or independent receipt path, two worlds differing only in an unsubmitted intended carrier produce identical authenticated verifier views. This is a bounded negative result, not a proof that all Candidate D constructions are impossible.
- Refined prior-art and contribution-assessment language to state that generic private/verifiable range retrieval is established prior art and Candidate D is only the narrower OMR-specific dynamic-predicate/admission/manifest-closure hypothesis. No construction or novelty claim is made.

### Evidence judgement and limits

- Candidate D must specify whether its output is an aggregate or a complete variable-length set; point-query consistency and authenticated membership are not result-set completeness.
- APIR, vPIR, multi-query vPIR, APIR-range, VPRQ, AAD and OMR have different database, trust, leakage, output and update models; their properties cannot be concatenated without a composition proof.
- SRC-056 and SRC-059 remain partial and are explicitly marked as such. Their missing full texts prevent complete proof/cost assessment; this does not block the bounded model but remains a prior-art review limitation.
- The pre-admission omission proposition is conditional on the verifier receiving no independent commitment to the sender's expected set. A pre-admission sender-authenticated manifest changes the view, but proves only the set the sender actually committed, not unexpressed intent.
- No Candidate D implementation, construction proof, benchmark, formal re-proof of source papers, independent review or security audit was performed.

### Verification

- Updated thesis, prior-art comparison and contribution assessment were fetched after writing and exact saved content was verified. Source-register entries SRC-054–SRC-060 and observer/traceability integrations were checked against the live repository.
- All claims preserve the full-text versus indexed/abstract-only evidence distinctions.

### Next

Complete T-007's post-T-013 consistency pass: verify source IDs, internal paths and heading anchors; reconcile the stale prior-art section reference in traceability; check Candidate D wording and task/state/digest consistency. Then refresh both session digests at handover (Markdown first, JSON last).

---

## 2026-11-18 · Candidate D: privacy-preserving verifiable message-set closure

### Work performed

- Directly inspected the attached 56-page UnifOMR paper and 15-page StOMR camera-ready paper as the current OMR baselines; their exact source findings and limitations remain recorded in SRC-051 and SRC-050.
- Expanded the related-work comparison to authenticated private information retrieval (APIR; Colombo et al., USENIX Security 2023) and append-only authenticated dictionaries (AAD; Tomescu et al., CCS 2019). The APIR review covers its integrity model, multi-server point and predicate/aggregate queries, single-server point-query database-digest assumption and selective-failure concern. The AAD review covers complete keyed lookup, append-only consistency and fork consistency.
- Identified a conditional research direction: a recipient-private proof that every matching record in a declared authenticated publication snapshot was retrieved, followed by endpoint verification that the retrieved carriers close into a sender-authenticated, hiding multi-carrier manifest.
- Added SRC-054 (APIR) and SRC-055 (AAD), a new thesis subsection defining admission/snapshot scope, private retrieval completeness, logical-object closure and endpoint acceptance as separate proof obligations, and Candidate D in the prior-art and contribution assessments.
- Explicitly bounded the proposal: APIR's predicate constructions are not a generic arbitrary result-set enumeration proof; AAD does not provide query privacy; SRC-052 already implements service-scoped completeness/cursor recovery; a log cannot prove an item was never submitted; and a manifest proves only the sender-committed set. Candidate D is not yet a novelty claim.
- Preserved two secondary research questions: UnifOMR candidate-capacity accounting remains an unresolved primary-text ambiguity, not a demonstrated defect; StOMR rollback/fork/concurrent-state recovery is an operational gap to investigate, not an assumed novelty.

### Evidence and judgement

- The strongest potential differentiation is compositional: OMR-style hidden recipient predicates + authenticated snapshot/result completeness + sender-authenticated multi-carrier object closure, without a public linkage handle.
- This is a plausible research gap, not a confirmed unique contribution. It requires a full technical comparison of APIR/AAD/OMR composition, a formal leakage and collusion model, and a construction, impossibility result or cost/leakage trade-off analysis.
- No cryptographic construction, formal proof, implementation, experiment, benchmark reproduction or independent review was performed.

### Verification

- Exact post-write read-back verified for `thesis.md`, `docs/source-register.md`, `docs/prior-art-comparison.md` and `docs/thesis-contribution-and-bias-assessment.md`.
- All four source/research files were fetched after each write and matched the intended saved content.

### Next

Complete T-007 cross-document consistency for the new SRC-054/SRC-055 and Candidate D references. Then start T-013: formalise Candidate D's adversary, snapshot/admission model, hidden-predicate completeness statement, manifest closure predicate, leakage function and feasibility boundary. Check whether existing APIR/AAD/OMR primitives already compose to satisfy it before proposing a new mechanism.

---

## 2026-11-18 · Sanitisation source access and GIF implementation review

### Work performed

- Rechecked T-002 access for SRC-046–SRC-048. SRC-046 is indexed as open access and has an author-linked OpenReview record, but OpenReview forum/PDF and IEEE PDF endpoints are blocked by browser/access checks. SRC-048 remains closed at the publisher and ResearchGate reports no full text.
- Re-fetched the complete recursive tree for the author-linked SRC-047 repository at commit 44474d9ca551bb052d5796fb43181612fb160763. It contains only README.md; the README describes Scaling-Net/SC-Net and points to an external Baidu model archive, which could not be opened. No source files, model weights, test scripts or results are present in the GitHub tree.
- Re-opened the complete SRC-049 repository tree at commit 4a5d2503623b06d17517ecf7a8b7527e1edc315d and inspected the remaining core modules, image utilities, inverse/modified diffusion pipelines, requirements and sender/receiver code paths.
- Added source-level qualifications to SRC-049: the receiver asserts a full 16-frame/key set; the same group-ID seed is reapplied per frame when random crop/drop is enabled, repeating rectangular masks and correlating subsequent RNG-dependent noise; crop/drop are fixed-size synthetic masks; key/nonce and ground-truth watermark are persisted in local .npy files; the inspected path provides no secure key transport or authenticated message manifest; the repository has no tests, paper PDF, model weights or environment lockfile, and AnimateDiff/model weights are external.
- Integrated the SRC-049 correlated-distortion and key-material boundaries into the thesis and W4 evaluation plan. The paper's formal proof and full experimental tables remain unreviewed.

### Evidence judgement and limits

- SRC-046/048 full papers remain unavailable. SRC-047's README is implementation-discovery evidence only; repository presence is not code access.
- SRC-049 code has been read at a pinned commit but not executed, modified, tested or independently audited. The same-seed finding is a direct code-path observation; its effect on reported paper results is unknown because the paper and evaluation protocol were not fully reviewed.
- No claim is made that the paper's formal security theorem is invalidated by the repository limitations. The code-level key, frame-loss and synthetic-distortion boundaries are not substitutes for a full-paper review.
- No model was downloaded from Baidu; no author contact was sent.

### Verification

- SRC-047 repository tree and SRC-049 full tree were fetched at pinned commits. Updated source-register, thesis and W4 files were fetched after writing and exact saved content was verified.
- No code build, model execution, benchmark, reproduction, formal re-proof, independent review or security audit was performed.

### Next

The current source-access tasks are blocked on full-paper copies and, for SRC-047, the external model archive. Keep the partial-review labels. Resume any source only when an author/institutional copy or retrievable artifact becomes available; do not substitute abstracts, READMEs or adjacent papers for the missing primary text.

---

## 2026-11-18 · MRAS/DRAS author-code review and T-006 closure

### Work performed

- Pinned and inspected the README-labelled MRAS repository at `R4K35H-K/MRAS-JPEG-Steganography`, commit `a14777047f82715bdbefcfed2cbb85427add23bc`, and DRAS repository at `R4K35H-K/DRAS-JPEG-Steganography`, commit `ad81f8785b473e03765ec3a859dad7ceb73ff9ea`.
- MRAS code exposes same-QF JPEG recompression, iterative block preprocessing, lattice/frequency selection and STC embedding; its demo uses ten sample covers, 10% payload, QF80 and local MATLAB `imwrite`. The passed `midFreqPattern` is not used by `MRAS_GetLoc`; the current code randomises all 63 AC frequency lattices. The post-processing branch is triggered by an immediate post-write extraction check, not the demo's later channel-recompression BER result; full-paper Algorithm 3 is unavailable to reconcile that path.
- DRAS code exposes downward-QF recompression, odd-multiple quantisation-ratio selection, predictive channel modelling and STC. Its demo uses ten sample covers, 10% payload and local MATLAB QF95+-to-QF80 recompression. If STC capacity is short, the embedder truncates the requested message and the demo computes BER over the resulting actual length; requested and achieved payload must be reported separately.
- Both repositories process the first JPEG component, load a sample-message prefix separately for each image, include Windows `.mexw64` binaries without MEX source/build instructions, and omit full benchmark datasets, baseline implementations and live-platform test harnesses. Their code demonstrates per-image JPEG-channel routines, not cross-image message linkage. No code was built or run.
- Rechecked publisher/ResearchGate/author pages for SRC-033/034/036. The complete MRAS/DRAS papers remain inaccessible; a bounded GitHub search found no matching public SRC-036 implementation. Publisher-indexed text remains partial evidence.
- Integrated findings into SRC-033/034/036, prior-art comparison, multi-message carriage analysis, route-comparison framework, route/fault matrix and thesis evidence table. Exact post-write read-back verified.
- T-006 is complete for this documentary checkpoint: the route/fault matrix is minimalised and decision-relevance assessed; W1–W4, traceability, prior-art and thesis records are reconciled. Candidate C remains a conditional evaluation method only; no route winner, mechanism-level novelty or image-carriage advantage is established.

### Evidence limits

- Full papers, complete method/result tables, platform acquisition details and limitations for SRC-033/034/036 remain unavailable.
- Paper-reported LinkedIn/WhatsApp/X results remain author-reported; the available MRAS/DRAS demos are local simulations and were not reproduced.
- No independent code review, build, test, platform interaction or security audit was performed.

### Next

Continue T-001 by seeking complete SRC-033/034/036 manuscripts through author or institutional access. The inspected code is useful source evidence but does not replace the papers; do not stall unrelated thesis work if access remains blocked. Then continue T-002 and T-003 source access.

---

## 2026-11-18 · Route/fault matrix minimality audit and Candidate C reassessment

### Work performed

- Audited the route/fault/evidence matrix for duplicated universal fault cases, route-native applicability and decision relevance.
- Separated the common delivery/acceptance fault catalogue from source-specific diagnostic checks: UnifOMR candidate-capacity accounting; StOMR collision/state assumptions; Signal receipt, queue and conditional fanout semantics; Dropbox owner-facing activity/permission omissions; and Pigeonhole copy/read visibility.
- Removed the repeated minimum-fault list and clarified that delayed-but-eventually-available differs from unavailable at the acceptance deadline; SRC-043 redundant fragment copies are not themselves duplicate-delivery faults.
- Replaced the full-factorial minimum test proposal with a staged design: three primary treatments (SRC-043-style multi-image set, single-file Dropbox object, raw Pigeonhole AllOrNothing); a separate katzenqt application-gate observation; Signal as a reference profile unless a comparable product-level set operation is established; OMR-family work as retrieval comparators. The first discriminating omissions are one redundant image copy missing/delayed, all copies of one fragment missing, and Pigeonhole E1 success followed by E2 delay/rejection with an already-authorised concurrent reader.
- Reconciled the staged design into the route-comparison framework, prior-art comparison §10.3, thesis §§8.8 and 11, W4 and the contribution assessment. Reviewed W1, W2, W3 and traceability: their source and terminology boundaries remain aligned; no further edits were required. Cleaned a duplicated W4 cross-route evidence bullet and its malformed emphasis.
- Reassessed Candidate C against the documentary record. The matrix audit itself is not an empirical result. Pigeonhole reader-visible partial persistence remains untested; UnifOMR's candidate-capacity issue remains a primary-text ambiguity, not a demonstrated failure; SRC-043's partial byte recovery is established prior art. No controlled route comparison or rigorous counterexample currently changes a route choice, invalidates an assurance claim or exposes a gap beyond prior art. Candidate C remains a conditional evaluation-method candidate, not an established contribution. No route ranking or image-carriage advantage is supported.

### Verification and evidence boundary

- Exact post-write read-back verified for every changed file.
- No controlled route test, deployment, benchmark, fault injection, reader-visibility observation, code execution, independent reproduction, formal re-proof, independent review or security audit was performed.
- T-006's specified synthesis and matrix-audit work is integrated into the thesis and enduring research documents; it is closed pending materially new source evidence. T-001–T-004 remain open for source access and controlled-configuration evidence.

### Next

Continue T-001–T-003 source access where full methods, results, limitations or code materially affect thesis claims, prioritising complete MRAS/DRAS and sanitisation evidence. Continue T-004 only where actual Dropbox account/link settings, Signal client/account/backend state or a running Katzenpost deployment can be obtained. Preserve partial-review and deployment boundaries; do not let inaccessible sources block other thesis work.

---

## 2026-11-18 · Matrix minimality audit and renewed image-source access search

### Work performed

- Audited the route/fault/evidence matrix against its nine common minimum fault cases and the profile-specific OMR, StOMR, Signal and Dropbox rows. Clarified that source-specific rows are diagnostic probes, not universal tests; group/multi-recipient Signal transaction-boundary testing is conditional on that use case, while the smallest comparison fixture remains 1:1.
- Reassessed the decision-relevance rule against the integrated thesis and prior-art comparison. The current documentary evidence establishes different native route semantics and evidence surfaces, but no controlled result or rigorous counterexample that changes a route choice, invalidates a material assurance claim or exposes a gap beyond prior art. Candidate C remains a conditional reproducible evaluation method; no mechanism-level novelty claim is restored.
- Rechecked full-text access for SRC-033, SRC-034 and SRC-036 using ScienceDirect, ResearchGate, author publication/ORCID pages and the SRC-036 author's public homepage. Publisher full text remains access-restricted; ResearchGate reports no full text for SRC-036 and provides an author-request route; the author page lists the paper but no copy. A distinct 2023 scaling-aware sanitisation follow-up was identified but not substituted for SRC-036.
- Updated SRC-033/034/036 review states with the renewed access result. Their current full-paper methods, tables and limitations remain unreviewed.

### Evidence judgement and limits

- The matrix now separates common route-fault cases from source-specific parameter and product-behaviour probes. No controlled route test was run.
- No route winner, image-carriage advantage or new protocol mechanism is established by the documentary comparison.
- SRC-033/034/036 remain partial reviews; the search did not locate full author manuscripts. No author contact was sent.
- Candidate C survives only as a conditional evaluation method pending a decision-relevant result beyond prior art.

### Verification

- Changed matrix, source-register and thesis/research records were fetched after writing and exact saved content was verified.
- No experiment, build, model execution, benchmark, independent reproduction, formal proof, peer review or security audit was performed.

### Next

Continue T-001–T-003 source access where complete papers, methods/results, limitations or code materially affect the thesis. Start with any newly available author/institutional copy for SRC-033/034/036; otherwise retain partial status and move to the next accessible source. Keep T-004 live service configurations gated on access.

---

## 2026-11-18 · Signal service-source transaction and acknowledgement boundary reconciled

### Work performed

- Re-opened the pinned public Signal-Server snapshot at commit `cbbfc3966a89a87b3b2d3592b0b22d4d6fe4f758` and checked `MessageDispatcher.java`, `ReceiptSender.java`, `FoundationDbMessageStore.java` and `FoundationDbMessageStream.java` at their recorded blobs.
- Confirmed the source documents per-device message streaming, client acknowledgement, queue removal on acknowledgement, conditional server delivery receipts and a queue-empty signal scoped to messages waiting when the device connected (which may wait for messages arriving during the stream).
- Confirmed the FoundationDB source groups all messages for the same recipient in one transaction for the insertion operation, while multi-recipient work may be split by shard and transaction-size chunks. This creates a transaction-boundary question; no partial-fanout failure was injected or observed.
- Reconciled the source snapshot and product support limits into thesis §§8.2/8.4/8.8, W1, W2, W3, W4 E9, the route-comparison framework and route/fault/evidence matrix. The matrix now includes a separate Signal multi-recipient transaction-boundary case.
- Reconciled Dropbox's direct invitation/shared-folder/view-only-link permissions, owner/editor activity, configurable viewer information, Guest and direct-download omissions, and direct-sharing download-control limits across SRC-039, thesis, W2/W4 and route comparison.
- Reconciled the RQ7 traceability source range to include SRC-038–SRC-039.

### Evidence judgement and limits

- The Signal source is a pinned public repository snapshot, not proof that the production backend runs that commit or configuration. No server was built, deployed or tested; no queue, transaction or receipt behaviour was observed live.
- The FoundationDB code shows transaction grouping/splitting but does not establish the outcome of a controlled mid-operation failure across recipients/shards.
- Dropbox material remains official documentation only. No account, plan, role, link, admin setting or live event record was available.
- Product support indicators, server-generated delivery receipts and optional Read receipts remain distinct evidence types. None establishes human comprehension or arbitrary multi-message atomic acceptance.

### Verification

- Changed thesis/research/traceability files were fetched after writing and exact saved content was verified.
- No build, test, deployment, failure injection, independent reproduction, formal proof, independent review or security audit was performed.

### Next

Audit the route/fault/evidence matrix for minimal, non-duplicative, decision-relevant cases. Then reassess Candidate C against the current prior-art and route evidence; keep it conditional unless a controlled result or rigorous counterexample changes a route decision, invalidates a material assurance claim or exposes a gap beyond prior art.

---

## 2026-11-18 · Signal and Dropbox product-evidence boundaries integrated

### Work performed

- Re-opened the current official Signal support pages for message status, read receipts, linked devices, message details and delivery issues, alongside the pinned PQXDH and Double Ratchet specifications.
- Recorded the product distinction between Sent (to Signal service), Delivered (to recipient device) and optional Read (both parties enable receipts). Delivery issues can be ambiguous between direct and group origin; resends may retain original timestamps. Linked-device support documentation describes synchronisation, a five-device limit, primary-phone online requirements and inactivity unlinking. These are product-facing support statements, not a backend audit or proof of human comprehension.
- Re-opened current Dropbox Help pages for file activity, viewer information, view-only links and sharing permissions. Recorded owner/editor versus viewer access to activity, separate/configurable viewer information, plan-dependent history, unsigned Guest views, direct-download omission from the viewer-info surface and no-account view-only link access. Explicitly distinguished owner-facing UI omissions from absence of backend records.
- Integrated these boundaries into SRC-038–SRC-039, thesis §8.2 and §8.4, W2, W4 E9, the route-comparison framework, the route/fault/evidence matrix and RQ7 traceability.
- Refined the matrix so Signal's service acknowledgement without endpoint acceptance is marked as a native product-event case; retained separate rows for protocol replay, delivery/read status, linked-device expiry and Dropbox viewer-info omissions.
- Corrected the Pigeonhole probe's C4 table alignment and changed its persistence ledger from “durable-write timestamp” to database Put/replica-acceptance timestamp, reflecting the lack of explicitly synchronous RocksDB writes in the inspected path.

### Evidence judgement and limits

- Signal protocol guarantees, user-visible support statuses and linked-device lifecycle statements are distinct evidence layers. No Signal account, client workflow, service backend, queue or receipt event was tested.
- Dropbox file activity and viewer information are owner-facing documentation surfaces. Missing viewer information is not proof that Dropbox's backend did not observe an access or download. No account, plan, link or workflow was tested.
- The Signal and Dropbox public documentation boundaries are now integrated; actual service-profile pinning remains blocked on access to the relevant accounts/settings and service-side evidence.
- The Pigeonhole reader-visibility probe remains design only. No controlled test, build, deployment or concurrent reader observation was run.

### Verification

- Each changed research/traceability file was fetched after writing and exact saved content was verified.
- No product test, service/backend inspection, implementation, benchmark reproduction, independent review or security audit was performed.

### Next

Audit the route/fault/evidence matrix for minimality and decision relevance, then reconcile any remaining W1/W3/traceability terminology gaps. Assess whether the documentary route findings identify a defensible gap beyond prior art; retain Candidate C as a conditional evaluation method unless a controlled, decision-relevant result supports more.

---

## 2026-11-18 · Refined Pigeonhole reader-visibility probe against pinned thin-client API

### Work performed

- Re-read the Pigeonhole test-design record and cross-checked the pinned `katzenpost v0.0.90` courier/replica source plus `thin_client 0.0.23` Rust/Python APIs and tests.
- Confirmed the courier's `CopyDedupCacheTTL` is 30 minutes and deduplication is keyed by the temporary-stream WriteCap hash. A same-WriteCap reissue during the TTL returns the cached terminal status rather than re-running the copy.
- Confirmed the normal read API retries `BoxIDNotFound` indefinitely by default, with an explicit no-retry option. The reader-visibility probe now requires no-retry reads during timed observation windows.
- Confirmed thin-client Copy returns courier completion/failure details but exposes no reader-side commit control. Existing multi-channel tests read only after successful Copy; the inspected failure test rejects the first destination envelope, not a later envelope after a successful prefix.
- Qualified the replica persistence evidence: the inspected RocksDB write path uses default WriteOptions without explicitly requesting synchronous writes. The probe records Put/replica acceptance, not crash-durable persistence.
- Updated `docs/pigeonhole-reader-visibility-probe.md`, SRC-040, the Echomix comparator, W4 and the route/fault/evidence matrix. Exact post-write read-back verified.

### Evidence boundary

- The source inspection establishes sequential dispatch, early failure and no rollback in the inspected path; it does not establish recipient-visible partial persistence.
- The probe remains test design only. No controlled deployment, fault injection, concurrent read, build or test was run.

### Next

Finish the Signal protocol-versus-product/service evidence boundary, then the Dropbox direct-invitation/shared-link and viewer-activity evidence boundary. Keep live account/device/service tests gated on access.

---

## 2026-11-18 · Direct review of UnifOMR primary paper and capacity-accounting analysis

### Work performed

- Read the complete 56-page user-supplied `910.pdf` for UnifOMR (ePrint 2026/910), including its OMR definitions, threat model, OMR-to-PIR reduction, construction, Theorem 6.1, parameter selection, benchmarks, appendices and open questions.
- Upgraded SRC-051 from abstract-level to direct primary-paper review. Recorded the two-round RLWE/BFV clue-detection plus batch-PIR retrieval flow, the OMR-to-PIR reduction and stated 1/N² security loss, the asymptotically linear digest/recipient-work trade-off, author-reported benchmark parameters, and the separation between malicious-detector privacy and honest-but-curious completeness/soundness.
- Cross-checked SRC-053's candidate-capacity concern against Algorithm 1 and Theorem 6.1. The paper bounds k̄ by true pertinent messages, but Algorithm 1 randomly truncates a candidate set larger than k̄; the proof does not explain how true matches survive when false-positive candidates consume capacity. At N=2^19, the stated per-item false-positive bounds permit expected false-positive counts up to approximately 16 (Param1) and 0.125 (Param2). Recorded this as a source-text accounting ambiguity, not a demonstrated failure.
- Inspected the paper's cited GitHub repository README and tree. Its README identifies a proof-of-concept for the 2021 OMR paper; the inspected tree does not expose identifiable UnifOMR/VecBatchPIR code or 2026 evaluation scripts. No code was built or run.
- Integrated the primary-paper review into the source register, prior-art comparison, thesis §8.4, route/fault/evidence matrix, W2, W3, W4 and observer/property matrix.

### Research judgement and limits

- UnifOMR materially strengthens the established prior-art baseline for private candidate retrieval and its concrete efficiency trade-offs; it is not a complete publication/index integrity or endpoint message-set acceptance protocol.
- The paper explicitly leaves malicious single-server detector integrity open. Privacy against a malicious detector must not be conflated with correct/complete candidate output.
- The fixed-capacity candidate truncation and formal completeness statement require clarification or an exact implementation/author response. The expected false-positive calculations sum the stated per-message bounds; they do not assume independence and do not establish an observed failure.
- The cited repository check is bounded to its README/tree and does not prove that no separate UnifOMR artifact exists elsewhere.
- Author-reported performance figures, proofs and implementation behaviour were not reproduced or independently audited.

### Verification

- Each changed thesis/research file was fetched after writing and exact saved content was verified.
- No UnifOMR build, test, benchmark reproduction, formal re-proof, independent review or security audit was performed.

### Next

Continue T-006 with the live workplan's next action: design the Pigeonhole successful-prefix/later-failure concurrent-reader probe from the pinned v0.0.90 courier/replica write path and thin-client v0.0.23 API/tests. Then finish Signal and Dropbox product/service evidence boundaries. Image transformation cells have already been source-audited with unknowns preserved.

---

**Project maturity:** Theory only · No implementation · Not audited.  
**Record rule:** Entries document the work actually performed and its evidence limits. This metadata is not a required chat-response footer.

---

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

## 2026-11-17 · Keyed work registry and uniform commit checkpoints

### User requirement

Reduce /work/ coordination overhead while making every commit obey the same discipline: do the work, update the work records, commit, read the saved result back, and only then report completion. Avoid making the user supervise routine continuity.

### Changes made

- Added a single commit checkpoint contract to work/README.md, applying equally to thesis, research, supporting and operational changes.
- Added the same workflow gate to WORKPLAN.md without changing the research sequence or priorities.
- Replaced the positional tasks[] array in work/lookup/TASKS.json with a keyed tasks object under schema tip.work.registry.v3. Each immutable T-### key maps to one value record with type, title, status, priority, targets, dependencies, next action, blockers and completion rule.
- Reduced work/lookup/TASKS.md to a human-readable index of that registry. The JSON is canonical for task lookup; the Markdown file is not a second task plan.
- Preserved the distinction between internal task keys and thesis/source/evidence identifiers. No thesis content or research finding was changed by this infrastructure update.

### Commit checkpoints and read-back

Each of the following commits was followed by fetching its changed file from main; exact content matched:

| Checkpoint | Commit | Changed file | Result |
|---|---|---|---|
| TIP-WORKFLOW-2026-11-17-A | [c3767d9](https://github.com/robotard/the-invisible-postman/commit/c3767d9b7c547f811e76a56c817ef70fcb73672a) | work/README.md | Exact read-back verified |
| TIP-WORKFLOW-2026-11-17-B | [51821d7](https://github.com/robotard/the-invisible-postman/commit/51821d76a0138c386b9aec31befe983ca418bd5d) | work/WORKPLAN.md | Exact read-back verified |
| TIP-WORKFLOW-2026-11-17-C | [009f59a](https://github.com/robotard/the-invisible-postman/commit/009f59af236130fce25ed630dea8c49dadb5970b) | work/lookup/TASKS.json | Exact read-back verified; JSON parsed during transformation |
| TIP-WORKFLOW-2026-11-17-D | [64224e4](https://github.com/robotard/the-invisible-postman/commit/64224e48a70e903303066539daa1e0e2a676bf72) | work/lookup/TASKS.md | Exact read-back verified |

### Verification and limits

- All four changed files were fetched from the live main branch after their commits; saved text matched the submitted content.
- The keyed registry contains all existing T-001 through T-012 records; T-005 remains complete; source-access tasks remain open/in progress; diagram, peer-review and release gates remain deferred/blocked as before.
- This is an operational workflow/schema change only. It does not claim research progress, implementation, experiment, independent review or audit.
- The task registry is now simpler to address by key, while the four operational records retain their distinct responsibilities.

### Exact next action

Continue T-001 as recorded in the keyed registry: seek complete SRC-033, SRC-034 and SRC-036 texts through author/institutional access, retaining partial-review status. Continue T-002/T-003 access work where useful. For every resulting work unit, apply the same pre-commit update, one coherent commit, exact post-commit read-back and factual recording.

## Checkpoint close · 2026-11-17

- Recorded and read-back verified the operational handover updates in commit 5c501f2 (WORK_LOG), 2b5794f (PROJECT_STATE), f1be362 (SESSION_DIGEST.md) and 0ebfd71 (SESSION_DIGEST.json).
- The JSON digest was refreshed last, parsed successfully after fetch, and its verified map matches the fetched README, WORKPLAN, PROJECT_STATE, WORK_LOG, TASKS.md, TASKS.json and Markdown digest blobs.
- Corrected the README section heading to make the WORKPLAN link anchor exact; the heading-only correction is in the next commit and was fetched back with exact content.
- The final digest refresh below records the corrected README blob and current pre-JSON head. The final JSON commit itself is verified by exact read-back after creation; no recursive self-hash is stored.

## Registry status semantics correction · 2026-11-17

Final consistency review caught an over-broad conversion: the initial v3 migration mapped every legacy open task to in_progress. That would falsely imply active execution. Corrected T-004 and T-006 to ready, and T-007 to blocked pending T-006 synthesis/stabilisation. T-001–T-003 remain in_progress because source-acquisition work is active; T-005 remains complete; diagram/review/release gates retain their deferred or blocked states.

- Registry correction commit: 10e4a357c596de3589ca92e4f740b0614d59348f (work/lookup/TASKS.json), exact read-back verified.
- Human index correction commit: 3a546c229398d0f67a6f216ddba5136333c3e772 (work/lookup/TASKS.md), exact read-back verified.
- This correction changes workflow metadata only; research priorities, evidence claims and thesis content are unchanged.


## 2026-11-17 · Rebuilt ChatGPT Project operating instructions and context recovery

### Work performed
- Added `work/CHATGPT_PROJECT_INSTRUCTIONS.md` as the concise, copy-ready source for the Project's external instructions.
- Defined GitHub `main` as project authority and a minimal new-chat/continue read sequence: both digests, project state, workplan and work log, followed only by research files needed for the next action.
- Reasserted substantive work priorities: thesis drafting/integration, research gaps, evidence/citations, terminology and multi-message steganographic encapsulation/linkage.
- Reduced operational overhead: no repetitive planning/status narration, no unnecessary questions, no bookkeeping-only edits, task statuses change only with actual work, digests refresh at handover.
- Explicitly separated external ChatGPT Project settings from repository files. The GitHub connector exposes no action for editing ChatGPT Project Instructions, so the repository now contains the exact text to install; the external setting itself is not claimed as changed.
- Added context-limit recovery instructions: preserve the old chat, create a new chat inside the same Project and resume from GitHub plus the automatic summary.

### Verification boundary
- This is an operational instruction/documentation update only. No thesis research task status changed; the task registry remains unchanged.
- All changed GitHub files are to be fetched back and checked before reporting completion.
- The external ChatGPT Project Instructions still require installation through the Project settings UI; repository writes cannot perform that external action.


### Post-write verification
- Exact read-back matched the intended content for:
  - `work/CHATGPT_PROJECT_INSTRUCTIONS.md` — blob `874f8131dec085696db6f7dc45903f922084ae0e`
  - `work/PROJECT_STATE.md` — blob `fe904e93eb6ddb8fbcb32eef93e1d2e28cc3aa41`
  - `work/WORKPLAN.md` — blob `f3715002ed298a15842fd76078e6f98bc4dcfa0d`
  - `work/README.md` — blob `a44d20de217e2b02b2ec801bd2a02d538bdcf800`
  - `README.md` — blob `537acfe40679a6525769188b3daf6c7167c4b7d5`
  - `work/SESSION_DIGEST.md` — blob `fc3c7ea5c20c09d00c5a65f15701793c71d5b549`
  - `work/SESSION_DIGEST.json` — blob `621b36b6afa679ff431c62268d917d815450b92a`; parsed successfully as JSON.
- The `WORK_LOG.md` update itself is now being read back; the external ChatGPT Project setting remains the sole manual installation step.


## 2026-11-17 · Added single-entry automatic re-entry bootstrap

- Created `work/START_HERE.md` as the one canonical entry point for new chats and context-limit recovery.
- Updated the copy-ready Project Instructions to require reading START_HERE first.
- Documented the boundary honestly: repository files cannot automatically attach themselves to ChatGPT Project sources or change external Project settings. One-time manual installation of the updated Project Instructions is still required; thereafter the assistant is instructed to fetch the bootstrap at every new/resumed chat.
- No thesis task or research status was changed.

### Bootstrap read-back verification
- `work/START_HERE.md` fetched and verified: `36749a44b6596fcc6b3592425e682554e44a5fc7`.
- `work/CHATGPT_PROJECT_INSTRUCTIONS.md` fetched and verified with the START_HERE-first rule: `46673d1c0a349a2de0db933475d59a4f60b34ed8`.
- `work/PROJECT_STATE.md`: `5d289bf5dd866db75a46f4027b411d3d36e03f51`.
- `work/WORKPLAN.md`: `033a4ef2a2535bbc976bec388aa0914044eb1b0a`.
- `work/WORK_LOG.md` verification entry will be verified after this write.
- `work/README.md`: `80bba3a0824e627ff6afb881105114e0dba0dd69`.
- Root `README.md`: `9f3d4d36a930d0a6ad14fe828e719f841b42a294`.


### Post-commit read-back verification · TIP-THESIS-FIRST-2026-11-17

The eight sequential GitHub Contents API commits were fetched from the live main branch and the resulting file blobs read back. The Git Data ref-update action was failing with a GitHub GraphQL error, so the supported Contents API was used sequentially; each update used the fetched current blob SHA. This produced a linear commit chain rather than one atomic multi-file commit. No concurrent changes were overwritten.

- thesis.md — commit fa798ab041dc6ba18f27a8b31573c00cae0d8544; read-back blob cdf2a278b9669032e1df9743a509e90bb1e53d9d.
- docs/w3-architecture.md — commit 615d3d634a108b1fc39984f82464575d9c864474; read-back blob 1e0fc3c7dab11cfd2333388ce39575320c6cea75.
- docs/multi-message-linkage-and-steganographic-carriage.md — commit cdfce464078cec5e87bd6d070cf6eeba7b630336; read-back blob 5137e55e25140ed1d05d8267b3f86f7349fd7ff8.
- work/README.md — commit 0282018fca4c25ae495a5bb390587fbdc1e4947b; read-back blob 80bba3a0824e627ff6afb881105114e0dba0dd69.
- work/WORKPLAN.md — commit a6716f1a7387b0d61724bc5ddd07b70a951b77d8; read-back blob 033a4ef2a2535bbc976bec388aa0914044eb1b0a.
- work/PROJECT_STATE.md — commit 3814f7c3c7a67e83219096d9a2fbad1084960303; read-back blob 5d289bf5dd866db75a46f4027b411d3d36e03f51.
- work/lookup/TASKS.json — commit a80144bb14a8b31850873c8264abb491e1362514; read-back blob 3bf31ec458c1210bb6b0a4396bc8a35504a345ce.
- work/WORK_LOG.md — commit 6280c4cf077cbd0f12561111441c9e43331fb5c9; read-back blob 9f3431af883896fa80f5062a7c802fb13facad1d.

The task registry confirms T-006 is in_progress and next; T-001–T-003 remain in_progress for parallel source access; T-004 remains ready; T-007 remains blocked pending stable synthesis. Read-back confirmed the thesis sections, W3 and multi-message integration, thesis-first plan, cache discipline and state record. No new sources or experimental evidence were obtained.


### Cross-reference correction · thesis-first sprint

- Corrected the W3 relative link to the canonical file name, docs/multi-message-linkage-and-steganographic-carriage.md.
- W3 corrective commit: dc972d88a9700c860bb76c406a2239dc79147434; resulting blob: dfe97fbcfdde96d940e414a3dc976c7dcc3ec28f. Exact read-back and relative-path existence checked in the close verification.


## 2026-11-17 · Thesis synthesis: sender attribution boundary in multipart acceptance

### Substantive result
- Continued T-006 thesis-first synthesis from §§7.3.1–7.3.2.
- Identified and addressed an ambiguity: “endpoint authentication” can be misread as unique sender attribution. The thesis now distinguishes (1) object integrity/authenticity relative to a cryptographic key and context, (2) attribution to a protocol key/session, and (3) identity assurance about a real-world person.
- Explicitly records that an AEAD check under a symmetric key shared by multiple participants does not, by itself, identify which participant created the object. Signature/session attribution remains dependent on a separate peer-key verification process for any person-level claim.
- Applied the distinction to manifest issuer/authority and authenticated fragment-set relationships without selecting a cryptographic construction.

### Files changed
- `thesis.md`: added the distinction to §7.3.2.
- `docs/w3-architecture.md`: aligned receiver-acceptance responsibility and sender-attribution boundary.
- `docs/multi-message-linkage-and-steganographic-carriage.md`: aligned manifest authority and relationship acceptance.
- `docs/w4-risks-and-evaluation.md`: added sender-attribution and manifest-authority questions/acceptance criteria to E5.

### Evidence and limits
- This is conceptual analysis and documentary integration only. No protocol, wire format, signature scheme, key hierarchy or identity ceremony has been selected or tested.
- No task is marked complete. T-006 remains in progress.


### Checkpoint reconciliation after sender-attribution synthesis
- Corrected the exact continuation block in `PROJECT_STATE.md`: T-006 is the primary thesis-first task; T-001–T-003 remain parallel evidence-access work; T-004 is ready; T-005 complete; T-007 remains gated.
- Removed the stale statement that T-001 was the next unblocked action and corrected duplicate numbering in the continuation list.
- Updated the T-006 registry next action to record the completed sender-attribution integration and direct the next session to the next consequential thesis gap.
- No task status was changed. T-006 remains in_progress.


## 2026-11-17 · Evaluation and traceability integration for relationship authority

- Extended thesis §10.2 with explicit relationship-authority/linkage and receiver-acceptance evaluation domains.
- Extended W4 E5 with questions and proposed acceptance conditions for authenticated versus inferred relationships, untrusted carrier assertions, distinct receiver states and event-specific acknowledgements.
- Updated traceability RQ4 and the RQ10 claim/evidence mapping to connect relationship authority and receiver acceptance to the thesis, W3, W4 E5 and the multi-message analysis.
- Added the in-session cached working-set rule to the copy-ready ChatGPT Project Instructions: hydrate on scope entry, retain baseline blob SHAs while active, expand only for dependencies, and re-fetch after conflict/commit rather than every edit.
- No new source was obtained. These are conceptual requirements and proposed evaluation criteria, not implemented or tested behaviour.


### Post-write verification · evaluation and traceability integration

Read-back checks passed for the second integration unit. Exact saved blob SHAs:

- thesis.md — 11f3566e78dd56a7c1178f30f2a27a8cdbe5ef2a
- docs/w4-risks-and-evaluation.md — 1f47173eb2c187f774805d824128c7b6e778f271
- docs/traceability.md — 0cc48d92ecc5d8a8c409bd4b17be1b04a7fa3bbb
- work/CHATGPT_PROJECT_INSTRUCTIONS.md — 62e36bf75dd0519e7f1983c847013af2134d9f9d
- work/PROJECT_STATE.md — a1aa3dd8818ac148465538e122ce0dc017d243a1

Checks confirmed the thesis evaluation rows, W4 E5 acceptance criteria, RQ4/RQ10 traceability, and cached working-set instruction. No new source, implementation, experiment or audit was added.


## 2026-11-17 · Thesis §8.4 discovery and linkage synthesis

- Expanded thesis §8.4 with a comparative table of shared-feed scanning, stable locator/rendezvous, public or random set tokens, keyed/recipient-specific tokens and encrypted manifests, short-lived capabilities, cryptographic private/oblivious retrieval, and endpoint-local conversation mapping.
- For each family, separated recipient requirements, route/observer exposure and claims the mechanism cannot establish.
- Connected discovery to §§7.3.1–7.3.2: discovery returns candidate carriers; endpoint-authenticated membership, completeness, conversation continuity and logical-message acceptance remain endpoint decisions.
- Preserved the source boundary: this is a synthesis of alternatives already analysed in §8.4 and the dedicated multi-message research, not a selected mechanism, new source finding or measured comparison.


### Post-write verification · thesis §8.4 discovery synthesis

- thesis.md §8.4 read-back blob: ec579e0c24cdee06f2b2efe2c3130f60c0f3844c.
- work/PROJECT_STATE.md read-back blob: 65a8bae72c8f47f66c1cf1141c9c138b73769403.
- work/lookup/TASKS.json read-back blob: 294c85a3acd56931d19e6993754c652bcfdeb809.
- work/lookup/TASKS.md was updated to identify §8.4 discovery/linkage synthesis as the current T-006 focus.
- Checks confirmed the discovery comparison table, candidate-carrier rule, updated state and active task. No new sources, implementation or empirical evaluation were added.


## 2026-11-17 · Thesis synthesis: decompose discovery into distinct privacy and authority functions

### Substantive result
- Continued T-006 from thesis §8.4 rather than reopening already integrated sender-attribution or acceptance-state work.
- Added an explicit decomposition of discovery into bootstrap/trust establishment, publication/indexing, candidate enumeration, recipient pertinence/retrieval authorisation, and endpoint conversation association.
- Added a compositional observer analysis: private retrieval does not itself conceal publication; anonymous publication does not itself conceal retrieval; capability use remains observable to the receiving service; out-of-band bootstrap moves rather than removes the trust/metadata boundary; endpoint-local conversation mapping is not candidate enumeration.
- Pressure-tested the distinctions against the existing documentary comparators: OMR/GOMR, Oblivious Signaling, Remise and Echomix/Pigeonhole. Preserved each system's native model and limits rather than treating “private discovery” as one interchangeable property.
- Integrated the same distinctions into W3's discovery responsibility, W4 E9 evaluation questions/acceptance conditions, the multi-message linkage analysis and RQ7 traceability.

### Files changed
- `thesis.md` §8.4.
- `docs/multi-message-linkage-and-steganographic-carriage.md` §4.7.
- `docs/w3-architecture.md` discovery boundary.
- `docs/w4-risks-and-evaluation.md` E9.
- `docs/traceability.md` RQ7.
- `work/PROJECT_STATE.md`, `work/lookup/TASKS.json` and `work/lookup/TASKS.md` updated to record the actual next synthesis action.

### Evidence and limits
- This is a synthesis of already reviewed or explicitly bounded documentary material in SRC-020, SRC-024–SRC-032 and the existing Echomix comparator; no new source was acquired in this work unit.
- OMR/GOMR, Oblivious Signaling, Remise and Echomix/Pigeonhole are not treated as equivalent protocols. Their threat models, trust/collusion assumptions, cost placement and out-of-band dependencies remain distinct.
- No discovery mechanism, wire format, protocol or privacy guarantee is selected. No implementation, measurement, experiment, reproduction, formal proof, independent review or audit is claimed.

### Verification
- Each changed file is committed below and fetched from `main`; exact saved content is checked before reporting completion.

### Exact next action
- Continue T-006 by pressure-testing the new discovery decomposition against the lifecycle/event observer ledger in `docs/route-comparison-framework.md`, especially whether each named profile records bootstrap, publication, enumeration, pertinence/authorisation, retrieval and endpoint association without inventing service behaviour. Then revise any missing route-specific row and align thesis §8.8 / §10.2 as warranted.


### Post-commit read-back verification · discovery decomposition and route ledger

The discovery-synthesis unit was committed through sequential GitHub Contents API updates. The following commits and fetched blob SHAs were identified from the repository history and live file read-backs:

| File | Commit | Read-back blob | Result |
|---|---|---|---|
| `thesis.md` §8.4 | [fa9356f](https://github.com/robotard/the-invisible-postman/commit/fa9356f5c0fdd93f7d34d999bcd18eb9aa5c2826) | `d0fd2e5ec08f843dfb2906bedc162a6717345d22` | Required section and content markers fetched |
| `docs/multi-message-linkage-and-steganographic-carriage.md` §4.7 | [166f360](https://github.com/robotard/the-invisible-postman/commit/166f360dcbd74311ce94d02ef0c31ec4cbca85d5) | `49a31755a13dd47f7b0ff80833b1711250c68b4f` | Required section fetched |
| `docs/w3-architecture.md` | [cd163d4](https://github.com/robotard/the-invisible-postman/commit/cd163d4f55f0c7605262386b4ea0b3b3568b78f7) | `9ad8f905ce2a015dfeda5ebf3ba51556dc4bf46b` | Discovery-boundary addition fetched |
| `docs/w4-risks-and-evaluation.md` E9 | [6a0dfda](https://github.com/robotard/the-invisible-postman/commit/6a0dfda179b04d0e8814c529e2b249d8613a2cb4) | `2393502288434425e4cbaae1000e0a95a0aba3a2` | New questions and acceptance conditions fetched |
| `docs/traceability.md` RQ7 | [a632bce](https://github.com/robotard/the-invisible-postman/commit/a632bcee8ffc3afa80d47927a992655fd433fbab) | `838b3b3133ea496335e7a2b32d284c2e031b5fae` | RQ7 mapping fetched |
| `work/PROJECT_STATE.md` | [e5397ae](https://github.com/robotard/the-invisible-postman/commit/e5397aed0277904dd24c9fb5155812862dc9cbdd) | `ae138696502d92207e06a07067a47e7a0863c3d0` | Continuation point fetched |
| `work/lookup/TASKS.json` | [f7afd38](https://github.com/robotard/the-invisible-postman/commit/f7afd385bb4e687c181d504345a813e6d6596f5a) | `e7d72dcb5bcf6e6533e8f49cd233540a47fb3ceb` | T-006 next action fetched |
| `work/lookup/TASKS.md` | [f149eca](https://github.com/robotard/the-invisible-postman/commit/f149ecaf1e211969fc50ab06f7942e71534905ea) | `f1845b2581df79ea3a8dd4fff8445102274cf635` | Human index fetched |
| `work/WORK_LOG.md` | [efc2367](https://github.com/robotard/the-invisible-postman/commit/efc2367d470117f77c7831139da7fdf7b024ee79) | `0d2a5e00c4a5a76fbff2e54dcfda5c6824da9af8` | Work record fetched |
| `thesis.md` §§8.8, 10.2 | [b621d96](https://github.com/robotard/the-invisible-postman/commit/b621d962f219247267a4936f06c882b487b12ce7) | `deaee671bff4f15c805f89d836c18dd3dd4f1a5b` | Exact content equality verified after fetch |
| `docs/route-comparison-framework.md` §5.7 | [7cb906e](https://github.com/robotard/the-invisible-postman/commit/7cb906e39f74232f4d9b1d63648cee8606c0dd7d) | `adab2115324da2d5dbd664de7c3759d26ab9ea24` | Exact content equality verified after fetch |
| `docs/route-comparison-framework.md` §5.6 | [bee0b61](https://github.com/robotard/the-invisible-postman/commit/bee0b617bf9f1230d69507667652220ef0d7f993) | `e701005693341d35565b7c18a17db81537cebc18` | Exact content equality verified after fetch |

The first nine-file write batch was interrupted only after the commits had been created, when the tool-call limit was reached during the combined verification loop. All nine resulting files were subsequently fetched individually and the expected new section/continuation markers were confirmed. The two later thesis/route-ledger updates were compared byte-for-byte against the submitted content after fetch. This distinction is retained rather than overstating the first batch as byte-for-byte verified.


### Project checkpoint heading alignment · 2026-11-17

- Updated the PROJECT_STATE checkpoint heading to reflect the completed discovery decomposition and route-observer integration rather than the preceding relationship-authority-only sprint.
- Commit: [a25d371](https://github.com/robotard/the-invisible-postman/commit/a25d371d7ecec887d164fe0b1d4afc0b4f0a35c5); fetched blob `e9e17d1f6c318565be9477aa25b735654ce75fce`; exact content equality verified.


## 2026-11-18 · T-006 discovery event-chain adversarial pressure test

### Substantive work performed

- Extended thesis §8.4 with a seven-case adversarial pressure test covering bootstrap substitution, malicious publication, index equivocation/suppression, retrieval-service manipulation, cross-role collusion, retention/later disclosure, and suppression/delay ambiguity.
- Added the core asymmetry: endpoint authentication can validate an object that arrives, but does not prove publication/index completeness or explain why an expected object is absent; service-reported events establish only the reporting service's bounded event, not endpoint identity or acceptance.
- Distinguished four evidence classes throughout the analysis: endpoint-authenticated protocol facts, service-reported events, externally observed metadata, and analyst-inferred correlations.
- Explicitly modelled pairwise publisher/index/retrieval collusion and all-role combinations, with candidate join keys, retention windows and clock-alignment uncertainty.
- Reconciled the attack surface into W2 attacker capabilities and threat rows; W3 discovery-role boundary; W4 E9 evaluation questions and acceptance conditions; the multi-message linkage analysis; the observer/property matrix; the route-comparison lifecycle ledger; thesis §8.8 route-profile rows and §10.2 evaluation domains; and RQ7 traceability.
- Preserved the boundary that no discovery mechanism, index-consistency mechanism, transparency system, deletion guarantee, wire format or privacy mitigation has been selected.

### Research judgement and evidence limits

- A successful index response is not proof of index completeness; absence from one view is not proof of non-publication.
- A capability-use record does not identify a human user by itself. Endpoint rejection does not identify which intermediary altered or withheld an object.
- Provider policy is not observed retention behaviour. Unknown internal service behaviour and retention remain unknown.
- These are threat-model counterexamples and evaluation obligations, not findings about a named provider or a demonstrated vulnerability in a cited comparator.
- No new sources were acquired. No implementation, platform measurement, experiment, reproduction, formal proof, independent peer review or audit was performed.

### Files changed and exact read-back verification

| File | Commit | Fetched blob SHA | Result |
|---|---|---|---|
| `thesis.md` §8.4 | [977dc55](https://github.com/robotard/the-invisible-postman/commit/977dc55e0af5e8b61547ba69848c35321dfe1569) | `34fd3dde9bba054004cd62d5cf56fb694526357a` | Exact expected blob SHA fetched; required attack cases present |
| `docs/w2-threat-model.md` | [c795066](https://github.com/robotard/the-invisible-postman/commit/c7950662146619c7160e1794a4edb8afdb2c5bc2) | `ca9e83731a32052d7188db981934e6886e328d1f` | Exact expected blob SHA fetched; new threat rows present |
| `docs/w4-risks-and-evaluation.md` E9 | [527148c](https://github.com/robotard/the-invisible-postman/commit/527148cb8131360825c3869b8430cfa528134ba4) | `664598b222d98bada990d8b258837d5840c1a1ad` | Exact expected blob SHA fetched; adversarial questions and acceptance criteria present |
| `docs/multi-message-linkage-and-steganographic-carriage.md` §4.7 | [0449796](https://github.com/robotard/the-invisible-postman/commit/04497966499fe0bec70dc860d32addcd1b3ef377) | `64c9cb8f8b3a820ba5b4edbb535f76c849cfcd15` | Exact expected blob SHA fetched; service manipulation and evidence boundaries present |
| `docs/observer-property-matrix.md` §4.1 | [d627df1](https://github.com/robotard/the-invisible-postman/commit/d627df1f9dbe0ff9a26741409ace75000d6a10c7) | `7f700e7d3ca5f28cf8d3635b345de9893b5f1e76` | Exact expected blob SHA fetched; seven adversarial cases present |
| `docs/route-comparison-framework.md` §4 | [8ecc867](https://github.com/robotard/the-invisible-postman/commit/8ecc86779a9e980e5f2648d7be8f344794997b3b) | `b68ebb2b8db2371b95147718d95c48cccc2a99e8` | Exact expected blob SHA fetched; index, retrieval and collusion fields present |
| `docs/traceability.md` RQ7 | [519d86e](https://github.com/robotard/the-invisible-postman/commit/519d86e0e34df17ffa8640af902fe3ade58e3fb8) | `9e5eebbcf3b09840dd2d267c45ef01c71abac59e` | Exact expected blob SHA fetched; RQ7 mapping aligned |
| `docs/w3-architecture.md` discovery boundary | [1836cc7](https://github.com/robotard/the-invisible-postman/commit/1836cc7f7a980ed926a0b8c88cac585322aba03f) | `a4d69b9c6e6247635c85b9537b0e44c1555960e4` | Exact expected blob SHA fetched; role/collusion boundary present |
| `thesis.md` §8.8 and §10.2 | [e59a974](https://github.com/robotard/the-invisible-postman/commit/e59a974cc29bf716afa751ac199c65a0aac294ba), [c317321](https://github.com/robotard/the-invisible-postman/commit/c317321ae13e12cd07f39d3d112b6abd40e1673f) | `f87c6f4b2a8eb9baccd4a4976335f41b0d6ac6a0` | Latest thesis blob fetched; route-profile rows and evaluation domain present |

### Exact next action

- Continue T-006 by testing whether these adversarial cases produce a concrete, defensible cross-layer comparison or falsifiable result across the six named route profiles. Keep each profile's native guarantees and evidence class intact; do not infer unobserved service behaviour. Then reconcile any material result into the thesis and W1–W4. T-004 route configuration evidence remains ready in parallel. T-007, diagrams, peer review and release remain gated until substantive synthesis stabilises.


## 2026-11-18 · Project-maturity wording and chat-footer correction

### User clarification

The phrase “Theory only · No implementation · Not audited.” is to remain accurate project-maturity metadata in the GitHub working/research records. It is not a mandatory sign-off for ordinary assistant responses. The previous response incorrectly appended it despite the repository's existing instruction that it is metadata, not a conversational refrain.

### Changes made

- Strengthened `work/CHATGPT_PROJECT_INSTRUCTIONS.md` and `work/START_HERE.md`: explicitly prohibit appending the status phrase as a routine chat footer.
- Added matching operating constraints to `work/PROJECT_STATE.md` and `work/WORKPLAN.md`.
- Added project-maturity metadata and its non-chat-footer semantics to `work/README.md`, `work/WORK_LOG.md`, `work/lookup/TASKS.md` and `work/lookup/TASKS.json`.
- Kept the paired session digests' project status as structured metadata.
- Moved the confidence/evidence model's project-assurance statement into its opening metadata rather than leaving it only at the end.
- Existing README, thesis, W1–W4 and supporting research documents already carry relevant status/assurance metadata; no blanket footer was added to every paragraph or historical log entry.

### Verification

Every changed file was fetched after its write and compared byte-for-byte with the submitted content. Exact saved blob SHAs are recorded in the current session digest. No research claim, task completion status or project maturity level was changed by this administrative correction.


## 2026-11-18 · T-006 six-profile adversarial discovery comparison

### Substantive work performed

- Applied the seven-case discovery pressure test to all six named profiles: IMG-QIAO-2023, IMG-MRAS-2026, IMG-DRAS-2026, FILE-DROPBOX-LINK, E2E-SIGNAL-PROTOCOL and MIX-ECHOMIX-PIGEONHOLE.
- Added route framework §5.8 with profile-specific bootstrap/publication, index/retrieval/collusion, retention/suppression and evidence-limit analysis.
- Integrated the comparative result into thesis §8.8: the current source set does not close the full publication-to-acceptance chain for any pinned deployment; Echomix/Pigeonhole has the richest documented role/collusion model, but compatible deployment and captured service events remain unpinned.
- Specified a falsifiable deployment evaluation using endpoint ground truth and independently timestamped publication, candidate-view, retrieval and endpoint-acceptance evidence; controlled false/stale/duplicate candidates, divergent views, delayed/withheld retrievals and selected collusions; and explicit classification of non-publication, indexing omission, retrieval withholding, invalid/replayed content and endpoint acceptance.
- Expanded W1 RQ7 to include bootstrap, publication/index integrity, candidate enumeration, retrieval authorisation, cross-role collusion, retention, suppression and evidence distinguishing these events.
- Preserved all source-review limits. No provider vulnerability, mitigation, index-consistency mechanism or deployed behaviour is asserted.

### Evidence judgement and limits

- IMG-QIAO-2023 supports bounded published image-transfer/extraction observations, not a messaging discovery protocol.
- IMG-MRAS-2026 and IMG-DRAS-2026 remain partial literature profiles; publisher-indexed platform claims are not upgraded to verified platform configurations, and inspected public demos remain local per-image operations.
- Dropbox evidence remains shared-link/activity documentation, not proof of cryptographic identity, complete candidate enumeration or universal retention.
- Signal evidence remains PQXDH/Double Ratchet protocol reference, not product-level service metadata, retrieval or retention evidence.
- Echomix/Pigeonhole is the strongest documentary integrated comparator for capability discovery, role separation and collusion analysis; deployment/version and captured service-event evidence remain open.
- A service record supports only a bounded claim about the reporting service's event. Endpoint authentication does not prove publication/index completeness or explain absence. Silence remains ambiguous.
- No new sources, implementation, platform measurements, experiment, reproduction, formal proof, independent peer review or audit were added.

### GitHub writes and exact read-back verification

| File | Commit | Fetched blob SHA | Result |
|---|---|---|---|
| `docs/route-comparison-framework.md` §5.8 | `73fe93c3f2417eed8b4b58457977ad581926cb9c` | `707cf1e9f66b04d1c9822976ecf9893340680c07` | Required six profile rows and comparative/falsifiable result present |
| `thesis.md` §8.8 | `6c2828243c94404b23efdaccf79a3052accc6f76` | `717b91e8f928cc42f772b68a19137d55b0b48569` | Thesis synthesis and bounded evaluation present |
| `docs/w1-research-framing.md` RQ7 | `265a2fd5b78fe8b88b472164e9bf0b8ff3d25a8c` | `24247221c32dbbdfa2bb486cb28ba04a7595ad5d` | Research question aligned with adversarial event chain |

Each substantive file was fetched after writing. Marker checks passed for all six profile identifiers and the thesis synthesis. One auxiliary literal-string check for the token "no-publication" did not match because the prose uses the equivalent phrase "non-publication"; this was a check-string mismatch, not missing content. The route and thesis read-back SHA values match the write responses.

### Exact next action

- Continue T-006 with a source-by-source audit of every row in route framework §5.8 and thesis §8.8 against the source register and cited review boundaries. Tighten any claim that exceeds the evidence. Then continue T-006 synthesis or advance ready T-004 route configuration work where authoritative version/configuration evidence is obtainable.


## 2026-11-18 · T-006 source audit and profile-boundary refinement

### Source-by-source audit

- **IMG-QIAO-2023 / SRC-035:** The source register confirms a full-paper review of a bounded 50-image experiment across stated Facebook, Twitter and WeChat paths/modes. It supports platform-specific extraction observations, not authenticated bootstrap, indexing, provider access logs or a complete discovery protocol.
- **IMG-MRAS-2026 / SRC-033:** Publisher-indexed text reports LinkedIn testing, but complete methods, parameters, platform configuration and limitations remain unavailable. The pinned public demo is per-image and locally recompressed; it is not a live discovery client.
- **IMG-DRAS-2026 / SRC-034:** Publisher-indexed text reports WhatsApp, LinkedIn and X tests, but full methods, data/settings, platform paths and limitations remain unavailable. The pinned public demo is per-image with local recompression; it does not define message-set discovery.
- **FILE-DROPBOX-LINK / SRC-039:** Refined the evidence boundary using the official file-activity and viewer-information help pages. File activity is visible to owners/editors; viewer information is separately configurable; viewer history is plan-dependent; unsigned link viewers appear as Guest; direct downloads without a dropbox.com preview do not appear in viewer information. No account/plan/link workflow was tested.
- **E2E-SIGNAL-PROTOCOL / SRC-038:** The cited PQXDH and Double Ratchet documents remain protocol references. They establish protocol-level key/session mechanics but not product-level service index completeness, access logs, selective withholding, retention or deployment metadata. Public GitHub version-stamp commits are source-tree observations, not proof of a shipped App Store/Play Store build; no Signal client version is claimed as pinned.
- **MIX-ECHOMIX-PIGEONHOLE / SRC-032/SRC-040:** Inspected the current Pigeonhole specification in addition to the full Echomix paper and project documentation. The spec defines AllOrNothing streams with atomic success/failure semantics from the replica/second-party reader's perspective, courier-mediated operations, duplicate-envelope handling, a replica-epoch acceptance window corresponding to roughly two weeks at the stated one-week default epoch, and a minimum four-replica condition for the stated intermediate/final replica disjointness property. These are protocol/deployment requirements, not captured measurements of a running deployment. Capability bootstrap remains out of band; role-specific/colluding observers remain explicit. This nuance was integrated without implying that Pigeonhole supplies an independent external audit trail across publication, complete candidate view, retrieval and endpoint acceptance.

### Cross-document reconciliation

- Updated SRC-039 to cite the Dropbox viewer-information help page and clarify plan/settings conditions.
- Updated SRC-040 and the Echomix comparator with Pigeonhole AllOrNothing, retention-window and replica-topology requirements.
- Refined thesis §8.8 and route framework §5.8 to preserve Echomix's native atomic set semantics while distinguishing protocol guarantees from independent deployment evidence.
- Linked observer/property matrix §4.1 and W4 E9 to route framework §5.8; W1 RQ7 now names the adversarial event boundaries.
- No source was upgraded beyond its recorded review state. No deployment, experiment, reproduction, implementation, formal proof, peer review or audit was performed.

### Latest exact read-back verification

| File | Fetched blob SHA |
|---|---|
| `docs/source-register.md` | `fd7c4cd552e1c2a23643843965b3d0a8ff840d51` |
| `docs/echomix-katzenpost-comparator.md` | `cac1ce39d05264f795fd2740060847a3821c5054` |
| `docs/route-comparison-framework.md` | `d5739b0d07735b1771b10fb582ade03c7c1189c3` |
| `thesis.md` | `f4e6ca892c11dccebdd58a7ee9b36deb154f6614` |
| `docs/observer-property-matrix.md` | `1380f082a0ea69f6074a1c3d16b6125b8a799a86` |
| `docs/w4-risks-and-evaluation.md` | `e0cbafb35380fed7ce202e54ed856a31caf1b6e5` |
| `docs/w1-research-framing.md` | `24247221c32dbbdfa2bb486cb28ba04a7595ad5d` |

All required semantic markers were present in the read-back. The comparison remains documentary; no deployment evidence has been collected.

### Exact next action

- Challenge whether the six-profile comparison supports a decision-relevant thesis contribution beyond a descriptive evidence map. Use the observer/property matrix and contribution/bias assessment to test novelty and falsifiability. Keep T-004 ready for actual pinned client/release/account evidence; do not promote protocol or source-tree snapshots to deployed configurations.


## 2026-11-18 · T-006 set-level atomicity and contribution challenge

### Research work performed

- Challenged the six-profile documentary result against the contribution/bias assessment and observer/property matrix.
- Confirmed the comparison is not yet a demonstrated attack, new privacy guarantee, measured cross-route result or novelty finding. Candidate A remains an architectural organising principle; Candidate B remains conditional; Candidate C requires reproducible, decision-relevant output beyond a descriptive table.
- Identified a narrower, falsifiable comparison axis: route-native set-level atomicity versus endpoint-managed partial-set detection and completeness.
- Added route framework §5.9 with six profile rows and controlled cases: complete set, missing item, delayed item, identical duplicate, conflicting duplicate, out-of-order arrival, cross-set substitution and retry after uncertain acknowledgement.
- Added set-level atomicity/completeness to the route comparison dimensions, thesis §8.8 and §10.2, and W4 E5.
- Preserved Pigeonhole AllOrNothing as a native atomic success/failure guarantee for associated writes from the replica/second-party reader's perspective. This is not proof of human receipt, external publication completeness or an independently audited event history.
- Explicitly treated absent equivalent semantics in image, Dropbox and Signal source material as an evidence boundary, not proof those products lack such functionality.
- Updated the contribution/bias assessment and observer/property matrix to state that the six-profile result remains descriptive pending a repeatable evaluation.

### Current judgement

The new axis is more precise than generic “multipart delivery”, but it is not yet a contribution. It may become decision-relevant if an evaluation demonstrates that separately published image carriers create partial-visibility, completeness or linkage costs not present, or differently handled, in a single-file route or Pigeonhole's native atomic stream. If no measurable difference survives a fair comparison, do not preserve Candidate B by assertion.

### Verification and limits

- Thesis, route framework and W4, contribution assessment and observer matrix were fetched after writing; required markers and the set-atomicity test cases were present. Exact saved blob SHAs: `thesis.md` `4156ae2aaeac41a79360818e150ec72bfdf8d324`; `docs/route-comparison-framework.md` `12bb0d53157ea7c9d61fd499a74ab5b2d0d83d68`; `docs/w4-risks-and-evaluation.md` `33342224e945e3d4ed3d1816c28c4d9f406a523d`; `docs/thesis-contribution-and-bias-assessment.md` `fa500391d600442c1f7e504757744d1bef28486a`; `docs/observer-property-matrix.md` `e951b74a965dde75ff6984d7879c76b80e971dd8`. Project state, log and task index/registry were also fetched back.
- No new sources, implementation, deployed configuration, platform measurement, experiment, reproduction, formal proof, independent review or audit was performed.

### Exact next action

- Audit set-level atomicity and partial visibility against SRC-043, Pigeonhole AllOrNothing, and the native scopes of Dropbox/Signal. Define the smallest fair evaluation that could confirm or reject a decision-relevant Candidate B/C result. T-004 remains available for pinned client/release/account evidence; no deployment claim is authorised.

## 2026-11-18 · T-006 source-level atomicity audit and T-004 route pins

### Work completed

- Pinned the current public route references: Dropbox's direct-invitation versus view-only shared-link distinction; official Signal Android/iOS/Desktop client release tags; and the mutually compatible Katzenpost source set (`katzenpost v0.0.90`, `thin_client 0.0.23`, `katzenqt 0.0.2`) with resolved commit IDs.
- Read the Pigeonhole specification and inspected selected source files at `katzenpost v0.0.90` / commit `d5a6349a34c4a2d4bca587f4be86ce92f2873b12`: client envelope construction, courier Copy processing/dispatch, replica write handling/state, and Copy dispatch/status tests. No code or tests were executed.
- Source observation: `processCopyCommand` dispatches decoded destination envelopes sequentially; a later failure returns `CopyStatusFailed` with a 1-based failed-envelope index. Earlier successful destination writes are independently persisted by the replica state path. No rollback of that successful prefix appears in the inspected failure path. Temporary-stream tombstoning is launched on the success path after all envelopes, not before an early failure return.
- This creates a specification/implementation question because the Pigeonhole specification claims reader-side atomic success/failure. It does **not** establish that a recipient can read the prefix: reader capability distribution, poll timing and any application-level gate remain material.
- Inspected pinned `katzenqt 0.0.2` README and receive path. The app persists received BACAP pieces but only dispatches a message to the conversation log when its own assembler finds a terminal `F` chunk and contiguous decodable chain. This is an application-level display/acceptance gate, not AllOrNothing or atomic storage. The README identifies the client as pre-alpha and warns against relying on it for anonymity/security/privacy.
- Refined route framework §5.9, thesis §8.8, W4 E5, the contribution/bias assessment and observer/property matrix to distinguish specification claim, server write behaviour and application-level message assembly.
- Specified the smallest fair evaluation: two image carriers; one single-file object; raw Pigeonhole AllOrNothing with an already-authorised reader and a capability-shared-after-success control; and a separate katzenqt application-assembly observation. Faults: success, delayed second write, deterministic second-write failure after first success, and retry after uncertain acknowledgement. Record storage, reader visibility, app display, endpoint acceptance, cleanup/rollback and observer events separately. Signal remains outside this first atomicity experiment because the cited protocol specs do not define arbitrary multi-message transactions.
- Updated T-004 to `in_progress` with public source pins and an explicit runtime-configuration blocker. Updated T-006's next action to inspect any application-level commit barrier/capability handoff and finish the read-side test specification.
- Added the standing work-cycle rule to START_HERE, CHATGPT_PROJECT_INSTRUCTIONS and WORKPLAN: reconcile operational and substantive research documents, execute all unblocked work, and ask only for genuinely user-only input/access/decisions.

### Evidence boundaries

- The Pigeonhole partial-prefix issue is a **potential reader-visibility gap**, not a confirmed defect or vulnerability. No reader-side integration test, code execution or deployment was performed.
- The katzenqt assembler is a separate app-level mechanism. It does not validate AllOrNothing, and the client is pre-alpha/not suitable to rely on for privacy.
- Signal tags pin public client source releases, not backend/service version or account settings.
- Dropbox documentation pins the access-path distinctions, not a live account, link configuration or actual viewer/activity events.
- Katzenpost source tags are reproducible build pins, not a running deployment, configured topology or independent audit.
- No implementation, platform experiment, reproduction, formal proof, independent review or audit was performed.

### Exact next action

- Check the pinned Pigeonhole application path for any explicit reader commit barrier or capability handoff that could explain the specification's reader-atomicity claim; distinguish it from the separate katzenqt chunk-assembly gate. Then finalise the smallest read-side fault-test specification against SRC-043 multi-image recovery and the single-file baseline. Keep T-004 runtime configuration blocked only at the point it genuinely needs controlled accounts/deployment access.

## 2026-11-18 · Receiver acceptance versus partial reconstruction

### Work completed

- Extended SRC-043 review with exact native semantics: the paper's loss experiment uses 1,000 images, 208 fragments and redundancy r=4 (832 embedded carriers plus 168 non-watermarked images). Its success metric is restored bytes / total file bytes; full recovery is reported at 30% carrier loss and 61.1% byte recovery at 80% loss. The extraction procedure majority-votes duplicate fragment copies and marks missing fragment bytes with `?`.
- Read the publisher's full method and experiment text. The result is partial byte reconstruction, not authenticated logical-message acceptance or proof of sender/session/set authenticity.
- Inspected the pinned thin-client v0.0.23 sender API and tests. `start_resending_copy_command` accepts the temporary stream WriteCap and optional courier identity/queue, then waits for the courier result; it exposes no recipient ReadCap or reader-side commit control. Multi-channel tests read after success; the existing failure test deliberately fails on the first envelope. No inspected test covers a successful prefix followed by a later failure with a concurrent reader.
- Corrected the minimum image comparison: preserve SRC-043's native redundancy with a small semantic fixture of S=2 fragments and r=4 carriers per fragment (8 stego images); test one redundant copy missing/delayed and all copies of one fragment missing. Keep the paper's 1,000/208/r=4 benchmark separate; do not transfer its reported percentages to the small fixture.
- Integrated the distinction between carrier receipt, fragment extraction, byte-level reconstruction, complete-set validation and endpoint acceptance into route framework §5.9, thesis §8.8, W4 E5, the contribution/bias assessment, observer/property matrix and multi-message analysis §6.
- Updated T-006's next action: compare the existing receiver-acceptance state model with the six route profiles and closest prior art; identify already-known mechanisms versus any potentially defensible cross-route invariant/evaluation contribution. Updated PROJECT_STATE accordingly.

### Evidence judgement and limits

- SRC-043 explicitly tolerates missing carriers and can output a partial file. Its success rate is a byte-recovery metric; it is not an authenticated-message success rate.
- Pigeonhole's spec/code/test distinction remains unresolved at the reader boundary: sequential persisted writes and sender-side completion status are documented, but no concurrent reader test has been run.
- `katzenqt 0.0.2` app-level chunk assembly is a separate display/acceptance gate, not AllOrNothing or atomic storage; the client is pre-alpha and unsuitable to rely on for privacy.
- No implementation, test execution, platform experiment, reproduction, deployment, formal proof, independent review or audit was performed.

### Exact next action

- Compare the existing endpoint receiver-acceptance state model with SRC-043, Pigeonhole/katzenqt, Dropbox single-object and Signal per-message scopes plus the closest prior art. State precisely which elements are standard/known, which are merely evidence gaps, and whether any cross-route invariant or evaluation method remains decision-relevant. Do not inflate the framework into a novelty claim.
## 2026-11-18 · Acceptance-contract contribution challenge

### Work completed

- Added a known-mechanism versus contribution-candidate table to the contribution/bias assessment. It distinguishes established image fragmentation/redundancy, Pigeonhole copy semantics, katzenqt app-level assembly, standard endpoint integrity/completeness obligations and existing private-discovery systems from the remaining route-agnostic receiver-acceptance/evidence contract.
- Integrated the candidate contract into thesis §8.8: keep carrier observation, retrieval, extraction, authenticated fragment membership, set completeness, reconstruction, whole-object validation, freshness and logical-message acceptance distinct; keep service acknowledgements and observer evidence non-authoritative for endpoint acceptance.
- Linked SRC-043 partial reconstruction into multi-message analysis §6: partial extraction/byte recovery remains incomplete state; message acceptance waits for authenticated set context, completeness and whole-object validation. Any threshold reconstruction rule must be explicit.
- Updated T-006 to expand the prior-art crosswalk across SRC-043, Pigeonhole/katzenqt, Dropbox, Signal, OMR/GOMR, Oblivious Signaling, Remise and Echomix. The purpose is to determine what the candidate contract adds and whether it changes a real route decision, not to assert novelty.

### Current judgement

- Fragmentation/redundant image recovery is established prior art; Pigeonhole already specifies AllOrNothing copy semantics; authenticated manifests, membership, completeness and replay handling are standard protocol obligations; private discovery has substantial prior art.
- The remaining candidate is a route-agnostic endpoint acceptance/evidence contract that keeps native route units and event evidence distinct. It is a systems/analysis synthesis candidate only. It becomes a contribution only if prior-art mapping and a reproducible result/counterexample show decision-relevant value beyond the existing mechanisms.
- No contribution score or novelty claim was increased. No implementation, experiment, proof, independent review or audit was performed.

### Exact next action

- Complete the prior-art crosswalk and test whether the endpoint acceptance contract adds a decision-relevant invariant or evaluation method beyond the existing route mechanisms. Narrow or retire Candidate C if the distinction is already covered or does not change a route decision.
## 2026-11-18 · Cross-route receiver-acceptance prior-art crosswalk

### Work completed

- Added `docs/prior-art-comparison.md` §10, a mechanism-by-mechanism crosswalk covering OMR/PerfOMR/SophOMR/InstantOMR/GOMR, Oblivious Signaling, Remise, dead-drop covert messaging, image-based diffusion covert messaging, SRC-043 multi-image fragmentation, Echomix/Pigeonhole/Katzenpost, Dropbox shared files and Signal protocol messages.
- Compared native units and set semantics, reconstruction/atomicity, endpoint validation/acceptance, observer/evidence boundaries and the implication for the candidate contract. The table explicitly treats 'not specified in the inspected source' as an evidence boundary, not proof of absent product functionality.
- Refined Candidate C from a generic route comparison to a route-agnostic receiver-acceptance/evidence comparison. It separates carrier observation, retrieval, extraction, authenticated membership, set completeness, reconstruction, whole-object validation, freshness and logical-message acceptance while retaining route-native semantics.
- Linked the new §10 crosswalk from thesis §8.8 and the contribution/bias assessment. Updated T-006, TASKS.md and PROJECT_STATE to source-audit the crosswalk row by row and test whether the candidate changes a concrete route decision.

### Provisional judgement

- The constituent mechanisms are established prior art: private retrieval/group pertinence, uniform inbox updates, two-server anonymous access control, public-platform covert pipelines, image covert channels, multi-image redundancy, capability-addressed asynchronous storage, copy batching and application-level incomplete-set gating.
- The remaining candidate is a methodological/systems synthesis only. It has no novelty status until a source-audited crosswalk and a reproducible result or counterexample show a decision-relevant distinction beyond those mechanisms.
- No contribution score or novelty claim was increased. No implementation, code execution, experiment, proof, independent review or audit was performed.

### Exact next action

- Stress-test prior-art-comparison §10 row by row against source-register entries and underlying papers/specifications. Check native units, fragment completeness, reconstruction, atomicity, endpoint acceptance, observer leakage and event evidence. Then determine whether the candidate contract changes a concrete route decision or merely restates standard protocol discipline; narrow or retire Candidate C if no decision-relevant difference survives.

## 2026-11-18 · OMR prior-art update: StOMR and UnifOMR

### Work completed

- Rechecked the OMR-family row in prior-art comparison §10 against the source register and current primary publication records. The existing crosswalk omitted two relevant CCS 2026 developments.
- Added SRC-050, StOMR: official IACR ePrint abstract/metadata, DOI and CCS 2026 programme entry establish a stateful OMR model, private sender/receiver shared state, and an OMR-KEM intended to establish that state without an out-of-band channel. Reported sender-signal-size comparisons are recorded only as abstract claims.
- Added SRC-051, UnifOMR: official IACR ePrint abstract/metadata and institutional/CCS records establish the stated OMR-to-PIR relationship for strong detection-key unlinkability, and the abstract's reported batch-PIR performance/interaction trade-offs.
- Both full-text PDF requests returned HTTP 403. Neither paper has received full-text, proof, code or benchmark review. The source register explicitly limits their evidential status to abstracts and bibliographic records.
- Expanded prior-art-comparison §10's OMR row to distinguish public-key OMR, GOMR, stateful OMR and PIR-related efficiency constructions. Updated thesis related-work and discovery taxonomy, W1, W2, W3, W4, observer/property matrix, route-comparison references, contribution assessment and RQ7 traceability.
- Corrected the bootstrap framing: out-of-band setup is not a universal property of all private retrieval; StOMR's abstract specifically proposes an OMR-KEM for shared-state establishment without an out-of-band channel. Its detailed security and lifecycle properties remain unknown pending full-text review.

### Research judgement

- These additions deepen the established private-discovery prior art; they do not solve arbitrary multi-carrier endpoint message-set acceptance and do not create a new contribution claim.
- StOMR makes shared-state bootstrap, refresh, compromise and recovery important comparison questions. UnifOMR makes the PIR lower-bound relationship, two-round interaction and digest-size/server-cost trade-off explicit.
- Candidate C remains a methodological/systems synthesis candidate only. Its decision relevance remains unproven.

### Exact next action

- Continue source-auditing prior-art-comparison §10 against accessible full texts. Seek an author/institutional full-text route for SRC-050 and SRC-051; until available, keep their claims abstract-level. Compare OMR/PIR and stateful OMR with the other route profiles, then test whether the receiver-acceptance/evidence method changes a concrete route decision beyond prior art.

### Assurance

- Repository file writes are being read-back verified. No implementation, code execution, protocol experiment, proof, benchmark reproduction, independent review or security audit was performed.


### 2026-11-18 correction · StOMR full-text and artifact access

The initial 403 result applied to the IACR ePrint PDF endpoint, not to all copies. A co-author's institutional publication page exposed the complete 15-page CCS 2026 paper, and the public artifact repository supplied the camera-ready PDF and source.

- Full paper reviewed: stateful Signal/Decode semantics, detection-key update during Decode, multi-query receiver-privacy definition, OMR-KEM key flow, correctness/receiver-privacy/IND-CPA definitions, security reductions, threat model and future-work scope.
- Threat model: passive adversary sees public bulletin board, public keys and all participant communications; it may collude with any party except the target sender and receiver. It does not model active malicious publication/detector deviation. The public-key delivery steps do not themselves define authenticated human/contact identity binding. Stateful group OMR is future work.
- Artifact pin: yiannisdt/StOMR main c28d02d5dddf6360e9d2d39e5335ed77f73645e0, updated 2026-11-03. Inspected README, artifact appendix, CPU/GPU CLI, CPU setup/run/decode and GPU run/decode paths, and the static/mock test script. The CLI/core executes a local synthetic tag/payload matching-compression-decode pipeline; it is not a networked bulletin-board/detector deployment. No OMR-KEM setup/encapsulation/decapsulation path appears in the inspected entry points.
- No build, tests, benchmark or code execution performed. The code review is source inspection only.
- SRC-050, prior-art §10, thesis, W1–W4, observer matrix and contribution assessment updated. UnifOMR SRC-051 remains abstract-level because its ePrint PDF request still returns HTTP 403.

## 2026-11-18 · Downstream UnifOMR integration pressure test

### Work completed

- Located and source-pinned a third-party downstream UnifOMR integration in Nighthawk Apps' wallet and lightwalletd repositories: wallet commit 44d41aecd5d4944cb1f43731635dfd2e6164ca4d (2026-11-13), server commit d5ea5730be86501f65534b74a986f56d22c1d560 (2026-11-10). Registered as SRC-052; explicitly not the paper authors' official artifact or a peer-reviewed source.
- Inspected the server feature gate, digest and PIR handlers, UnifOMR detector, PIR server, clue-key directory, client sync path and verification checklist.
- Confirmed the integration's own source describes an opt-in `fhe-omr` server feature; Cargo default features are empty and the default server is trial-decryption only. The wallet docs describe OMR as experimental/not maintained until mainnet contracts are live.
- The service returns a digest `complete` flag and slot-to-height map, stops before cache holes, truncates only at whole-height boundaries, and lets the client clamp its scan cursor so uncovered heights are retried. It uses striped batch PIR for matching payloads and retains full-window trial-decryption fallback.
- The integration also includes a clue-key registration/ownership proof binding network byte, key version, payment public key and clue public key; fixed-size decoy clue keys and timing padding; rate/size/concurrency limits; and explicit service-side completeness/recovery semantics.
- The repository's checklist reports a testnet registration/digest matrix, but funded end-to-end receive/send and full cross-client parity remain unchecked. These are self-reported claims; no build, test, live service or funded transaction was run or independently reproduced.
- Added SRC-052, linked it from the route framework, and integrated the case study into prior-art §10, thesis related work, W1–W4, observer matrix, contribution assessment and RQ7 traceability.

### Research consequence

- Generic range-completeness flags, slot maps, whole-unit truncation and retryable cursors are already demonstrated in an application-level OMR integration; they cannot be claimed as novel.
- This does not itself solve arbitrary multi-carrier manifest membership, whole-logical-message acceptance, freshness or cross-route evidence provenance. Those distinctions must be made explicit and shown to alter a route decision before Candidate C survives.
- T-006 now tests that narrower boundary. UnifOMR's own full paper remains abstract-level in this review; StOMR is full-text reviewed.

### Exact next action

- Compare the remaining multi-carrier acceptance/freshness/evidence requirements against the image, file/link and conventional messaging profiles. Determine whether the route-agnostic contract adds a decision-relevant invariant beyond StOMR, UnifOMR's available abstract, and the SRC-052 integration; narrow or retire Candidate C if not.

## 2026-11-18 · Receiver-acceptance candidate narrowed after prior-art stress test

### Work completed

- Reconciled the latest OMR and multi-route findings against the existing receiver-acceptance sequence and crosswalk. Authenticated manifest membership, completeness, whole-object validation and freshness/replay handling are standard endpoint protocol obligations; OMR/StOMR/UnifOMR concern private retrieval, receiver privacy, state and retrieval efficiency rather than a universal multi-carrier acceptance transaction.
- Added prior-art comparison §10.3 defining a decision-relevance test for the only surviving Candidate C: a reproducible cross-route evaluation method that holds the protected endpoint object and validation policy constant, preserves route-native semantics, injects applicable faults, and separates endpoint ground truth, service reports and observer inference.
- Added minimum route baselines and fault/evidence requirements, including explicit limits on forcing equivalence between image fragment sets, a single file, per-message protocol state, OMR retrieval windows and capability-addressed asynchronous copies.
- Integrated the narrowed contribution boundary into thesis §8.8 and the contribution/bias assessment. The thesis now states that the endpoint acceptance contract is not itself a novelty claim and that Candidate C earns contribution status only through a controlled result or rigorous counterexample that changes a stated route choice, invalidates a material assurance claim, or exposes a gap beyond prior art.
- Rechecked the public UnifOMR ePrint record: the PDF endpoint still returns HTTP 403; the accessible record confirms abstract-level claims only. SRC-051 remains correctly marked abstract-level. SRC-052 remains a third-party experimental source inspection, not reproduced deployment evidence.
- Read-back fetched docs/prior-art-comparison.md, thesis.md and docs/thesis-contribution-and-bias-assessment.md; the new sections/paragraphs and exact saved blob SHAs were confirmed.

### Research judgement and limits

- The mechanism-level novelty claim for a generic route-independent receiver-acceptance contract is retired unless a specific uncovered property survives further prior-art review. The evaluation-method candidate remains conditional and unproven.
- No route ranking, image-carriage advantage, implementation, test execution, platform experiment, benchmark reproduction, formal proof, independent review or audit is claimed.

### Exact next action

- Operationalise the §10.3 decision test into a minimal route/fault/evidence matrix. Separate comparisons that can be evaluated from pinned public sources from those requiring controlled Dropbox/Signal/Katzenpost configurations or an image-platform experiment. Use that matrix to identify the smallest decision-relevant experiment; do not start diagrams or raise novelty status.


## 2026-11-18 · Route/fault/evidence matrix created

### Work completed

- Created docs/route-fault-evidence-matrix.md as the operational form of prior-art comparison §10.3 and thesis §8.8.
- Defined one common endpoint fixture without imposing an artificial manifest on single-file or per-message routes; specified a small S=2/r=4 multi-image semantic fixture, explicitly not a reproduction of SRC-043's benchmark.
- Recorded the six named route profiles (Qiao, MRAS, DRAS, Dropbox, Signal, Echomix/Pigeonhole), SRC-043 as a supplemental multi-image set baseline, and OMR/StOMR/UnifOMR as separate discovery/retrieval comparators.
- Added a fault-applicability matrix covering delay/withholding, missing, duplicate, conflict, reordering, stale/replay, incomplete candidate view and service acknowledgement without endpoint acceptance. The legend distinguishes native faults, wrapper-only faults, unknown behaviour and non-applicable cases.
- Added three independent evidence ledgers: endpoint ground truth/authenticated transitions; route/service reports; observer-visible/inferred events. Added decision output and the boundary between documentary work and controlled tests.
- Linked the matrix from prior-art §10.3, route-comparison framework §7, thesis §8.8, W4 E5 and traceability RQ4/RQ10. Updated WORKPLAN, TASKS.md, TASKS.json and PROJECT_STATE with the completed matrix and next source-audit action.

### Verification and limits

- New matrix file was fetched back from GitHub and its seven section headings, all six route profiles, fault cases, three ledgers and explicit non-execution boundary were checked.
- This is a documentary test design, not an executed experiment. No Dropbox account, Signal app/service, Pigeonhole deployment, image-platform upload/download or performance measurement was available or run.
- Candidate C remains only a reproducible evaluation-method candidate. The matrix itself does not establish originality, a route ranking or an image-carriage advantage.

### Exact next action

- Source-audit each fault-applicability cell against pinned source-register entries and route profiles. Separate route-native faults from wrapper-only faults; distinguish protocol claims from product/service behaviour; mark each controlled test dependency. Then decide whether any controlled result can change a route choice or expose a material evidence/failure gap beyond prior art.

## 2026-11-18 · User-supplied StOMR camera-ready paper reviewed

### Work completed

- Directly inspected the complete 15-page `StOMR-camera-ready.pdf` supplied in this conversation; title, authors, DOI and CCS 2026 camera-ready identity match SRC-050.
- Reconciled the paper's S-OMR evolving sender/receiver state, detection-key refresh and OMR-KEM shared-state bootstrap with the existing prior-art account. Preserved the distinction between private retrieval/state establishment and authenticated human identity, global candidate-view completeness or multi-carrier logical-message acceptance.
- Reconfirmed the stated threat model is passive and protocol-following; active malicious publication, detector deviation and service omission are outside that model. The paper's state syntax is not a production crash/rollback/fork recovery protocol; group S-OMR is future work.
- Identified a concrete-parameter caveat: experiments use 32-bit PRF signal outputs and include boards up to 2^16 entries, while Appendix C.1 gives an all-pairs cross-user collision upper bound of `binom(|BB|, 2) / 2^m`, approximately 0.5 at that point. Recorded that this is a loose bound, not a target-specific false-match estimate; the paper provides no tighter concrete privacy-advantage calculation or collision stress test for the largest board. Kept this distinct from the ≥128-bit BFV parameter claim.
- Updated SRC-050 in `docs/source-register.md`, the decision boundary in `docs/prior-art-comparison.md`, the related-work analysis in `thesis.md`, and the OMR comparator notes in `docs/route-fault-evidence-matrix.md`.

### Verification and limits

- All four substantive GitHub changes were fetched back and exact saved content verified.
- The state checkpoint and this work-log entry were also fetched back and verified.
- The paper's reported performance remains author-reported. No code was built or executed, no benchmark reproduced, no formal proof re-proved, and no independent review or audit performed.

### Exact next action

- Continue the source audit of the route/fault/evidence matrix. Preserve the StOMR signal-collision and passive-adversary caveats in the OMR row; next resolve the remaining fault-applicability cells against pinned image, Dropbox, Signal and Pigeonhole evidence, separating documentary claims from controlled tests.


## 2026-11-18 · UnifOMR full-paper secondary assessment integrated

### Work completed

- The direct IACR ePrint PDF request for UnifOMR 2026/910 remained HTTP 403. Located and read a detailed third-party technical assessment dated 2026-09-12 that reports full inspection of the 56-page paper, its cited implementation URL and upstream VecBatchPIR backend. The assessment is recorded as SRC-053, separate from the primary paper entry SRC-051 and downstream wallet integration SRC-052.
- Preserved the provenance boundary: SRC-053's claimed PDF hash, paper extraction, proof/appendix inspection, arithmetic and source review are reported by that assessor and were not independently repeated here. The primary UnifOMR PDF, proof and experiment scripts were not directly inspected in this project.
- Integrated the reported two-round clue-digest/batch-PIR retrieval flow, detector work linear in the board, and distinction between malicious-detector recipient privacy and correct/complete recovery into the thesis and prior-art comparison.
- Recorded the assessment's unresolved candidate-capacity accounting question (T true matches, F false positives, B padded PIR capacity; lossless retrieval requires T + F <= B). At the representative Param1 values, the assessor calculates an expected false-positive upper bound of about 16. This is a potential capacity/slack issue, not a demonstrated defect; no implementation failure is asserted.
- Updated the OMR row commentary in the route/fault/evidence matrix and the contribution/bias assessment. OMR candidate-view completeness remains distinct from duplicate/conflict semantics for authenticated message-set members.

### Verification and limits

- docs/source-register.md, thesis.md, docs/prior-art-comparison.md, docs/route-fault-evidence-matrix.md and docs/thesis-contribution-and-bias-assessment.md were each fetched after commit and their saved contents matched the submitted content exactly.
- Official author project-page claims were cross-checked against the secondary assessment. The direct paper link remains HTTP 403 in this environment. The secondary report's claims and calculations were not independently reproduced; no UnifOMR code was built, run or benchmarked, and no theorem was re-proved.

### Exact next action

- Continue T-006's route/fault/evidence audit. Treat OMR incomplete/divergent candidate view as a native retrieval fault; keep duplicate, conflict, order and replay semantics at the protected-object/application wrapper layer unless a route-native protocol source says otherwise. Next audit the image-specific transformation cells and the Signal/Dropbox/Pigeonhole evidence boundaries, recording which outcomes are documentary and which require controlled tests.


## 2026-11-18 · Source audit of image and route-native fault cells

### Work completed

- Audited the image-specific transformation rows against the current source-register evidence: Qiao (SRC-035) supports JPEG/compression-channel conditions; MRAS (SRC-033) supports matching JPEG recompression; DRAS (SRC-034) supports downward quality-factor recompression; SRC-043 supports rotation/scaling/cropping and carrier-loss experiments. Other transformation cells remain unknown because the reviewed sources do not establish them. MRAS/DRAS platform claims remain indexed publisher evidence, not independently checked platform configurations.
- Clarified the OMR-specific fault rows so StOMR signal-tag collisions, StOMR state rollback/fork, and UnifOMR false-positive candidate/PIR-capacity overflow are not conflated. The latter remains a secondary-assessment question, not a demonstrated defect.
- Tightened the route-boundary notes: Signal's duplicate/replay/out-of-order handling is limited to protocol-message semantics; Dropbox is a single-file profile whose multi-object ordering requires a wrapper and whose viewer visibility is configuration/plan dependent; Pigeonhole's duplicate-envelope and AllOrNothing specification semantics remain distinct from the inspected sequential courier writes/no-rollback path and unresolved reader-visible partial state; katzenqt's chunk-chain assembly remains a separate application layer.
- Kept applicability marks distinct from successful detection/mitigation and retained unknowns where a controlled test or deployment-specific evidence is required.

### Verification and limits

- The updated route/fault/evidence matrix was fetched after each commit and exact saved content verified.
- The image rows are documentary comparisons only. No image transformation test, Dropbox account workflow, Signal service/backend test or Pigeonhole concurrent reader-visibility test was run. Public Signal specifications/client tags and Dropbox documentation do not establish live product/backend behaviour; Pigeonhole source inspection does not resolve reader visibility.

### Exact next action

- Continue the matrix audit against the remaining route-specific source profiles and evaluate whether the current fault cases are minimal and decision-relevant. Prioritise the Pigeonhole successful-prefix/later-failure reader-visibility test design and the unresolved product/service evidence boundaries for Signal and Dropbox; keep actual tests gated on access to controlled configurations/deployments.
