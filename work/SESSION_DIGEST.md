---
schema: tip.session-digest.v2
checkpoint: "2026-11-17 · thesis-first sprint: relationship authority and receiver acceptance"
branch: main
project_status: "Theory only · No implementation · Not audited."
status_semantics: project_metadata_only
operating_instruction_boundary:
  chatgpt_project_instructions: "Thin operating layer for continuation, execution and verification; follow live GitHub records."
  thesis_research_rules: "Substantive methodology, terminology, technical constraints, arguments and evidence standards stay in thesis/research documents."
  repository_authority: "Live GitHub files and commit history; digests are retrieval aids only."
  external_settings: "ChatGPT Project Instructions are managed outside GitHub; repository records the boundary but cannot edit ChatGPT settings."
thesis_product:
  canonical_manuscript: thesis.md
  staging: "The one active thesis manuscript under development."
  production: "A frozen, versioned release of the same thesis; not a separate product or thesis."
  continuity: "Preserve one thesis identity, provenance, citations, evidence limits, uncertainty and review history."
peer_review:
  status: "Not yet independently reviewed."
  rule: "Only claim independent review after actual review; preserve scope, reviewer evidence/comments, author responses, dispositions, dissent and resulting changes."
confidence_model:
  status: "Provisional thesis organising principle; usefulness, originality, usability and privacy cost remain unevaluated."
  principle: "The Invisible Postman does not promise certainty. It makes the basis, boundaries and limitations of confidence explicit."
  meaning: "Verifier-relative judgement about a specific claim, grounded in evidence provenance, scope, assumptions, threat model, freshness and unresolved alternatives."
  constraints: "No universal score, no central confidence ledger, no mandatory telemetry; distinguish trust, assurance, security, authenticity, integrity, discoverability and truth."
  integration: "thesis.md §4.1 and §10.5; W1-W4; docs/confidence-and-evidence-model.md; contribution assessment; D-13; traceability."
work_area:
  path: work/
  purpose: "Temporary store of actionable work to develop, analyse, explain, scrutinise and release the thesis."
  includes: [research, source_review, route_analysis, protocol_analysis, thesis_synthesis, diagrams, validation, peer_review, release_integrity]
  lifecycle: temporary_disposable_after_release
  thesis_dependency: none
  internal_ids: "C-### concept keys and T-### task keys are private lookup handles only; never thesis references."
  release_rule: "Transfer substantive outcomes to thesis/research records; verify no enduring document depends on work/; then remove it in full."
document_roles:
  project_state: "Current verified position, remaining work, blockers, dependencies and exact next action."
  workplan: "Stable roadmap, priorities, sequence and dependencies; change only for genuine workflow or priority changes."
  work_log: "Chronological record of actions actually performed, evidence, limitations and verification."
  markdown_digest: "Compact retrieval/handover format; mirrors JSON digest."
  json_digest: "Compact retrieval/handover format; mirrors Markdown digest."
operating_loop:
  - "Read live GitHub state, four operational records and only relevant research sources."
  - "Reconcile completed, remaining, blocked and dependent work; do not repeat recorded work."
  - "Ask only when a material decision or ambiguity blocks safe/correct progress."
  - "Execute the next useful unblocked action; do not substitute plans or progress narration for work."
  - "Use available turn/token runway; complete coherent work units and continue while useful work remains."
  - "Record actual outcomes and limitations in WORK_LOG.md; reconcile PROJECT_STATE.md."
  - "Fetch changed files and verify exact saved content; distinguish draft, commit, read-back, test and independent review."
  - "Refresh Markdown and JSON digests at handover; summarise actual work and exact next action concisely."
read_first:
  - work/START_HERE.md
  - work/CHATGPT_PROJECT_INSTRUCTIONS.md
  - work/SESSION_DIGEST.md
  - work/SESSION_DIGEST.json
  - work/PROJECT_STATE.md
  - work/WORKPLAN.md
  - work/WORK_LOG.md
  - "Then inspect only the task registry and research documents required for the next unblocked action."
next_task: T-001
work_backlog: work/lookup/TASKS.md
work_backlog_schema: tip.work.tasks.v2
current_state:
  thesis: "One active manuscript at thesis.md in staging; §8.2 now includes six named evidence-bounded route profiles and §8.8 integrates lifecycle/observer comparison plus conditional image-carriage decision analysis. No deployed route advantage is established; originality and review readiness remain open."
  thesis_argument:
    central_question: "How can endpoint-controlled messaging preserve authenticated message semantics across replaceable, untrusted carriage routes, including image carriage, and what can route-specific evidence establish under defined observer models?"
    proposition: "Transport independence requires authenticated message semantics to remain under endpoint control across route-specific encapsulation and delivery, with explicit observer evidence."
    contributions: "Responsibility-separated architecture; common route-comparison method; message-relationship/lifecycle analysis; claim-centred evidence discipline."
    route_synthesis: "Image studies inform media transformation; Dropbox documents shared-link/file-host visibility; Signal specifications inform protocol mechanics but not the full service; Echomix/Pigeonhole is the strongest integrated comparator. Documentary evidence is asymmetric; no overall ranking."
    prior_art_pressure: "Thesis now explicitly confronts OMR/GOMR and PerfOMR/SophOMR/InstantOMR, Oblivious Signaling, Remise, dead-drop covert messaging and image-diffusion covert communication; generic private-discovery, whole-pipeline and image-covert-channel novelty claims are not supportable."
    limits: "No deployed route comparison, implementation, experiment, formal proof, independent review or audit."
  research_units: "W1-W4 drafted; W1 and traceability aligned to ten thesis research questions, with confidence/evidence integrated into RQ10 rather than a separate eleventh question."
  source_register: "49 entries, SRC-001 through SRC-049."
  multi_message_model: "Distinguishes logical messages, protected objects, fragment sets, redundant carriage, independent-message batches, conversation/session continuity, retries/duplicates and cross-route copies."
  steganography: "Separates per-carrier concealment, robust watermarking, extraction/reconstruction, collection-level steganalysis and observer linkage. SRC-043–SRC-045 cover multi-image redundancy and batch detection; SRC-049 covers within-GIF frame redundancy."
  sanitization: "SRC-036 and SRC-046–SRC-047 describe active payload sanitization; SRC-048 describes keyed counter-adaptation to a known sanitizer. These are partial reviews and do not establish deployment by any named platform."
  gif_code_review: "SRC-049 README, core/method_core.py and scripts/run_stego.py inspected at pinned external repo commit 4a5d2503623b06d17517ecf7a8b7527e1edc315d. Two redundancy levels: d-fold repetition within frame and majority voting across 16 frames. Receiver asserts a complete 16-frame/key set; missing-frame erasure tolerance is not established. Raw ChaCha20 path shows no authentication tag; 32-bit NumPy PRNG fallback is labelled TEST ONLY. Local keys/group ID are not an authenticated message-set protocol. Code not executed or audited; paper/formal proof unreviewed."
  route_profiles: "Six named profiles integrated into thesis §8.2: Qiao, MRAS, DRAS, Dropbox shared link, Signal protocol reference and Echomix/Pigeonhole. Thesis §8.8 integrates lifecycle/observer comparison; actual deployed client/service versions and configurations remain unpinned."
  protocol_analysis: "Key scope, HKDF salt/info, transcript binding, nonce uniqueness, AAD, replay, ordering and safe fallback analysed; Signal PQXDH/Double Ratchet, MLS and HPKE compared at distinct scopes; no protocol selected."
  confidence_evidence: "Claim-centred model distinguishes object validity, identity, fragment membership, set completeness, conversation continuity, observer linkage and delivery events; SRC-034/SRC-036 documentary examples added; endpoint-local/minimal-disclosure direction; no numeric score. Not independently validated."
  implementation: none
  independent_audit: none
  peer_review: "Not yet independently reviewed; preparation deferred until a coherent thesis candidate exists."
  illustrations: "W1-F01..F04, W2-F01..F02, W3-F01..F03, W4-F01..F03 are text-only prompts indexed in diagrams/README.md; no artwork generated."
completed:
  - "Integrated multi-message relationships, package-encapsulation boundaries, active sanitization and animated-carrier distinctions into W1-W4 and thesis/supporting research."
  - "Extended route-comparison ledger for fragment sets, redundancy, independent messages/conversations, retries/duplicates, cross-route linkage and collection-level steganalysis."
  - "Added separate evaluation and threat distinctions for passive processing, active sanitization and keyed adaptation to a known sanitizer."
  - "Added explicit distinction between GIF frames within one carrier, separate carrier objects and distinct protected messages."
  - "Static audit of all 29 Markdown files: no broken repository-relative links or Markdown image references; no active ZIP/archive-generation instructions."
  - "All 12 unique W1-W4 illustration prompt IDs match the diagram index exactly."
  - "Each W1-W4 document contains aligned definition/comparison blocks and package, message-multiplicity, steganography, animated-carrier and sanitizer distinctions."
  - "All changed GitHub files were fetched back and exact content verified. On 2026-11-17, six evidence-bounded route profiles were integrated into thesis §8.2 and lifecycle/observer plus conditional image-carriage decision analysis into §8.8; exact read-back verified."
  - "The operational work area was moved to work/ and its disposable boundary defined."
  - "Thesis lifecycle clarified: one manuscript in staging; production is a frozen release of the same thesis."
  - "The work backlog indexes research, route analysis, thesis synthesis, diagrams, peer review and release integrity."
  - "Integrated a provisional confidence/evidence model into the thesis, W1-W4, threat model, architecture, evaluation, contribution assessment, decision register and traceability."
  - "Added explicit boundaries for trust/assurance/security/truth, multi-message linkage and delivery-event semantics; rejected universal confidence scoring and central evidence tracking as defaults."
  - "Expanded SRC-033/034/036 publisher-preview evidence and recorded exact full-text access limits; SRC-047 author repository README inspected, SRC-046/048 abstract-level only, and SRC-049 indexed abstract summary added without upgrading partial-review status."
  - "Compared Signal PQXDH/Double Ratchet, MLS and HPKE at their distinct 1:1, group and lower-level composition scopes; integrated the bounded comparison into thesis §6.2 and protocol-boundary analysis."
  - "Reconciled protocol-boundary obligations into W2/W4, checked W3 and traceability alignment, and clarified in the contribution assessment that protocol obligations are not novelty claims."
source_review_boundaries:
  SRC-033: "Publisher preview expanded on 2026-11-17: matching recompression, DCT stabilisation/lattice embedding/postprocessing, metrics/comparators and LinkedIn test; full equations/tables/configuration/limitations unavailable. Public MATLAB demo inspected, not run."
  SRC-034: "Publisher preview expanded on 2026-11-17: downward recompression, RoLoS/CARE, PMAS comparison and Q95→Q85/Q80/Q75; full derivation/tables/platform procedure/limitations unavailable. Public MATLAB demo inspected, not run."
  SRC-036: "Publisher preview confirms attack/filtering plus image-quality optimisation CNN, BOSSbase/BOWS2, 8,000/2,000 split and QF75; complete equations/training/results/generalisation remain unavailable."
  SRC-046: "Abstract/metadata only; OpenReview full-text access blocked by browser verification; no full paper/results."
  SRC-047: "Author repository located; README inspected (Scaling-Net/SC-Net and external model download); source files/model weights not retrieved."
  SRC-048: "IEEE abstract/metadata inspected; full method/evaluation not inspected."
  SRC-049: "Pinned README/selected implementation inspected, not executed; indexed abstract summary added; full paper/formal security argument/results unreviewed."
next_actions:
  - "T-001: seek full texts for SRC-033, SRC-034 and SRC-036 through author/institutional access; retain partial-review status."
  - "T-002: seek full SRC-046/SRC-048 papers and a retrievable SRC-047 code/model snapshot; README-only inspection is not code review."
  - "T-003: seek SRC-049 full paper, formal security argument and complete results; selected code review remains read-only and unaudited."
  - "T-004: pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/account configurations and service-side lifecycle evidence."
  - "T-006/T-007: challenge confidence/evidence against protocol delivery semantics and multi-message reconstruction; reconcile route/source findings into W1-W4, thesis and traceability."
  - "Keep confidence/evidence within RQ10; do not reintroduce an eleventh research question or a universal confidence score."
  - "Keep diagrams deferred until arguments and evidence stabilise."
source_review_update:
  date: "2026-11-16"
  SRC-033: "Publisher-indexed pass clarified extraction-error, PSNR/SSIM and classifier-error metrics, named comparators, BOSSbase and LinkedIn evaluation; complete parameters, tables and limitations unavailable."
  SRC-034: "Publisher-indexed pass clarified RoLoS ablation, PMAS comparison, Q95-to-Q85/Q80/Q75 scenarios and author-reported 87% extraction-error / order-of-magnitude runtime claims; full tables and platform procedure unavailable."
  SRC-036: "Publisher-indexed pass clarified attack/filtering plus optimisation modules, joint loss, BOSSbase 8,000/2,000 split, BOWS2 and QF75; full equations, training details, results and generalisation limits unavailable."
  review_status: "T-001 remains open; all three reviews remain partial. No full paper text, experiment reproduction or audit obtained."
source_review_update_2026_11_17:
  SRC-033: "Publisher preview distinguishes matching recompression; outlines DCT stabilisation, lattice embedding, postprocessing, BOSSbase metrics/comparators and LinkedIn test. Full methods/tables/configuration/limitations unavailable; direct page open 403."
  SRC-034: "Publisher preview distinguishes downward recompression; outlines RoLoS/CARE, PMAS ablation/comparison, Q95→Q85/Q80/Q75 and author-reported metrics/platform tests. Full derivation/tables/platform procedure/limitations unavailable; direct page open 403."
  SRC-036: "Publisher preview outlines attack/optimisation CNN, BOSSbase/BOWS2 and QF75. Full equations/training/results/generalisation unavailable; direct page open 403."
  SRC-046: "OpenReview full-text URL blocked by browser-verification challenge; abstract/metadata only."
  SRC-047: "Author repository README inspected; implementation/model assets not retrieved through available GitHub file access."
  SRC-048: "IEEE Xplore abstract/metadata inspected; full paper not obtained."
  SRC-049: "Indexed abstract summary added; formal proof and complete results unreviewed."
  status: "T-001–T-003 remain open; partial review boundaries preserved. No paper fully reviewed in this pass; no code executed or result reproduced."
deferred:
  - "Create actual diagrams only after comparative argument and evidence stabilise; never use ASCII art."
  - "External peer-review preparation until a coherent thesis candidate exists."
  - "Implementation, platform experiments, extraction tests, steganalysis benchmarks, formal proof and security audit."
invariants:
  - "Image carriage is a required research comparison, not a mandatory runtime route."
  - "Orchestration is optional; analyse service roles separately."
  - "Protected object remains invariant unless explicit authenticated conversion is defined."
  - "Package encapsulation is not endpoint authentication."
  - "Endpoint-authenticated linkage and observer-inferred linkage are distinct."
  - "Per-image concealment does not establish collection-level concealment."
  - "GIF frames within one carrier are not separate image posts or logical messages."
  - "Majority voting over bit errors does not establish missing-frame erasure tolerance."
  - "No anonymity/security inference from carrier uniqueness, concealment or extra hops."
  - "Preserve dissent, provenance, uncertainty and historical work; distinguish proposals from demonstrated properties."
  - "Confidence is claim-specific, verifier-relative, evidence-bounded and time-sensitive; it is not a cryptographic property or semantic truth."
  - "A valid fragment does not establish set completeness; a complete set does not establish conversation continuity."
  - "Transport acceptance is not endpoint receipt, decryption, display, human reading or comprehension."
  - "Prefer endpoint-local evidence and minimum necessary disclosure; no central confidence ledger or universal score by default."
verified_working_documents:
  work/lookup/TASKS.md: "1561731adf5b2608a45f57209c555bd44eb3dfa3"
  work/lookup/TASKS.json: "7c49fca455074620bfe05cab5ed32544c03dc6f5"
  work/PROJECT_STATE.md: "494486517e1fd86852c5eef83fe42755d3bad79f"
  work/WORKPLAN.md: "2ddb360e796fa51be2a7e3c4f9d04c6cd58d10b4"
  work/WORK_LOG.md: "6da4820d6eaae98dc7178ac2e1715123fc4f5fc3"
verified_research_documents:
  thesis.md: "cbc06935901d007542cec32a44332ac8b975baa6"
  docs/w1-research-framing.md: "8a772f0c1f63a033d31d77e4ceb3f83ddd94b897"
  docs/traceability.md: "6baf3c2e466a7ac94004d041472ad0beb1c701cd"
  docs/confidence-and-evidence-model.md: "402a83a787977bc4e06ef0e7c0beef241a61c4fa"
  docs/source-register.md: "87b4866d9a4cc2f5d4f9efb8b1714e26887dd673"
  docs/protocol-boundary-analysis.md: "14a56004e515ebf1caae2a656f1402aef9d28609"
  docs/w2-threat-model.md: "d6996524d4c847ce5bb67b3e41be41d8c4b385ca"
  docs/w4-risks-and-evaluation.md: "f53da96c10753b16ddfab2ccce77cceb4ed14682"
  docs/thesis-contribution-and-bias-assessment.md: "d8d3879f41251fcdbf9cf40c1e42cc04a849520d"
latest_verified_project_head: "e838e4de8d4b85556c7a00368f561a616287c4e1"
latest_commit_before_infrastructure_checkpoint: "a38ad832d634ca297698a5d0b8abdabdfdcb3f94"
checkpoint_close_order:
  - "Reconcile PROJECT_STATE.md, WORKPLAN.md and WORK_LOG.md."
  - "Fetch and verify all three working documents."
  - "Refresh SESSION_DIGEST.md from verified state."
  - "Refresh SESSION_DIGEST.json last."
  - "Fetch and verify both digests against the three working documents."

## 2026-11-17 · Work registry and commit discipline

- Canonical task lookup is keyed JSON: work/lookup/TASKS.json, schema tip.work.registry.v3, tasks[T-###].
- TASKS.md is a compact human index only.
- Every commit must reconcile task/work records before commit, contain one coherent work unit, then be fetched and exact-read-back verified. Completion is reported only after verification. Do not create bookkeeping-only commits when verification can be recorded in the next substantive checkpoint.
- Workflow commits verified: c3767d9 (README), 51821d7 (WORKPLAN), 009f59a (keyed TASKS.json), 64224e4 (TASKS.md).
- Research priorities unchanged; T-001 remains next unblocked task. T-005 remains complete; diagrams, peer review and release remain gated.

### Final close verification

- README anchor correction: 68e9fed; exact read-back verified.
- WORK_LOG close record: 4888f68; exact read-back verified.
- The JSON digest is refreshed after this Markdown digest and remains the final write in the handover cycle.

### Registry status correction

- Corrected legacy open-task conversion: T-004 and T-006 are ready; T-007 is blocked pending T-006; T-001–T-003 are in_progress because source acquisition is active; T-005 remains complete.
- Registry and Markdown index corrections are recorded in WORK_LOG.md and read-back verified.

project_instructions:
  source: "work/CHATGPT_PROJECT_INSTRUCTIONS.md"
  purpose: "Concise operating instructions for the external ChatGPT Project settings."
  installation: "Manual copy into The Invisible Postman > Project settings > Project instructions; repository connector cannot edit external ChatGPT settings."
  priorities: "Substantive thesis drafting/integration, research gaps, evidence/citations, coherent terminology and multi-message linkage; minimise planning/admin narration."
  context_limit: "Preserve old chat; start a new chat inside the same Project; resume from live GitHub checkpoint and automatic summary."
  status_label: "Project metadata only; mention only when relevant, never as a conversational refrain."

automatic_reentry:
  entrypoint: "work/START_HERE.md"
  instruction_source: "work/CHATGPT_PROJECT_INSTRUCTIONS.md"
  behaviour: "Every new or resumed chat in this Project reads START_HERE first, reconciles the live checkpoint, then resumes substantive work without reconstructing the project."
  context_limit: "Preserve old chat; open a new chat inside this same Project; use automatic summary only as a clue and GitHub as authority."
  external_installation: "One-time manual installation of CHATGPT_PROJECT_INSTRUCTIONS.md into Project settings is required; GitHub cannot modify ChatGPT Project settings or attach its files automatically."
  status_label: "Project metadata only; mention only when relevant."
verified_current:
  work/START_HERE.md: "36749a44b6596fcc6b3592425e682554e44a5fc7"
  work/CHATGPT_PROJECT_INSTRUCTIONS.md: "62e36bf75dd0519e7f1983c847013af2134d9f9d"
  work/PROJECT_STATE.md: "5d289bf5dd866db75a46f4027b411d3d36e03f51"
  work/WORKPLAN.md: "033a4ef2a2535bbc976bec388aa0914044eb1b0a"
  work/WORK_LOG.md: "3a1c9eaffb66568a30d4baa1401c65158e8b983e"
  work/README.md: "80bba3a0824e627ff6afb881105114e0dba0dd69"
  README.md: "9f3d4d36a930d0a6ad14fe828e719f841b42a294"
  work/lookup/TASKS.md: "74dd6ff684a6cf69ba96f4f6cf74591cb9e760bc"
  work/lookup/TASKS.json: "3bf31ec458c1210bb6b0a4396bc8a35504a345ce"
  thesis.md: "cdf2a278b9669032e1df9743a509e90bb1e53d9d"
  docs/w3-architecture.md: "dfe97fbcfdde96d940e414a3dc976c7dcc3ec28f"
  docs/multi-message-linkage-and-steganographic-carriage.md: "5137e55e25140ed1d05d8267b3f86f7349fd7ff8"
  docs/w4-risks-and-evaluation.md: "1f47173eb2c187f774805d824128c7b6e778f271"
  docs/traceability.md: "0cc48d92ecc5d8a8c409bd4b17be1b04a7fa3bbb"


## 2026-11-17 · Thesis-first sprint

- T-006 is the active task. Thesis drafting/integration takes priority; source access T-001–T-003 continues in parallel only where it materially resolves claims.
- Thesis §§7.3.1–7.3.2 define relationship authority and receiver acceptance across fragment membership, conversation continuity, retries, redundancy, cross-route equivalence, observer inference and untrusted carrier assertions.
- W3 and the dedicated multi-message linkage analysis now share the same endpoint-authority and receiver-acceptance boundary.
- Working-set rule: hydrate relevant GitHub files once when they enter scope; retain content and baseline blob SHAs while active; diff across the cached set; expand only for dependencies; reconcile remote changes; verify changed files after writing. Cache is in-session, not persistent local storage.
- T-001–T-003 remain in_progress, T-004 ready, T-006 in_progress, T-007 blocked. Update task status only when actual work changes.
- Next action: continue thesis-first drafting from the relationship/acceptance model and select the next consequential argument gap.


## 2026-11-17 · Evaluation and traceability integration

- Thesis §10.2 and W4 E5 now explicitly evaluate relationship authority, observer-inferred linkage, receiver acceptance states and event-specific acknowledgements.
- RQ4/RQ10 traceability connects these requirements across thesis, W3, W4 and the multi-message analysis.
- Copy-ready Project Instructions now preserve the active in-session cached working set with baseline blob SHAs; no user-side clone is required.
- Next action remains thesis-first T-006; choose the next consequential argument/evidence weakness and write it into the manuscript.
