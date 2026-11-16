---
schema: tip.session-digest.v2
checkpoint: "2026-11-17 · confidence/evidence integration"
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
  project_state: "Changing verified progress, blockers, dependencies and exact next action."
  workplan: "Stable roadmap, priorities, sequencing and dependencies."
  work_log: "Chronological evidence and change history."
  markdown_digest: "Compact machine-readable handover only."
  json_digest: "Compact machine-readable handover only."
read_first:
  - work/SESSION_DIGEST.md
  - work/SESSION_DIGEST.json
  - work/PROJECT_STATE.md
  - work/WORKPLAN.md
  - work/WORK_LOG.md
  - thesis.md
  - docs/source-register.md
  - docs/route-comparison-framework.md
  - docs/multi-message-linkage-and-steganographic-carriage.md
next_task: T-001
work_backlog: work/lookup/TASKS.md
work_backlog_schema: tip.work.tasks.v2
current_state:
  thesis: "One active manuscript at thesis.md in staging; confidence/evidence framing integrated as a provisional organising principle. Final contribution and review readiness remain open."
  research_units: "W1-W4 drafted; aligned message-multiplicity and confidence/evidence definitions, claim boundaries and text-only illustration prompts embedded."
  source_register: "49 entries, SRC-001 through SRC-049."
  multi_message_model: "Distinguishes logical messages, protected objects, fragment sets, redundant carriage, independent-message batches, conversation/session continuity, retries/duplicates and cross-route copies."
  steganography: "Separates per-carrier concealment, robust watermarking, extraction/reconstruction, collection-level steganalysis and observer linkage. SRC-043–SRC-045 cover multi-image redundancy and batch detection; SRC-049 covers within-GIF frame redundancy."
  sanitization: "SRC-036 and SRC-046–SRC-047 describe active payload sanitization; SRC-048 describes keyed counter-adaptation to a known sanitizer. These are partial reviews and do not establish deployment by any named platform."
  gif_code_review: "SRC-049 README, core/method_core.py and scripts/run_stego.py inspected at pinned external repo commit 4a5d2503623b06d17517ecf7a8b7527e1edc315d. Two redundancy levels: d-fold repetition within frame and majority voting across 16 frames. Receiver asserts a complete 16-frame/key set; missing-frame erasure tolerance is not established. Raw ChaCha20 path shows no authentication tag; 32-bit NumPy PRNG fallback is labelled TEST ONLY. Local keys/group ID are not an authenticated message-set protocol. Code not executed or audited; paper/formal proof unreviewed."
  route_profiles: "Six evidence-bounded profiles; documentary comparison and expanded lifecycle/event/observer ledger. Live client/service versions and configurations remain unpinned."
  protocol_analysis: "Key scope, HKDF salt/info, transcript binding, nonce uniqueness, AAD, replay, ordering and safe fallback analysed as obligations; no protocol selected."
  confidence_evidence: "Claim-centred model distinguishes object validity, identity, fragment membership, set completeness, conversation continuity, observer linkage and delivery events; endpoint-local/minimal-disclosure direction; no numeric score."
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
  - "All changed GitHub files were fetched back and exact content verified."
  - "The operational work area was moved to work/ and its disposable boundary defined."
  - "Thesis lifecycle clarified: one manuscript in staging; production is a frozen release of the same thesis."
  - "The work backlog indexes research, route analysis, thesis synthesis, diagrams, peer review and release integrity."
  - "Integrated a provisional confidence/evidence model into the thesis, W1-W4, threat model, architecture, evaluation, contribution assessment, decision register and traceability."
  - "Added explicit boundaries for trust/assurance/security/truth, multi-message linkage and delivery-event semantics; rejected universal confidence scoring and central evidence tracking as defaults."
source_review_boundaries:
  SRC-033: "MRAS publisher-indexed text and public MATLAB demo inspected; full methods/tables/limitations remain partial."
  SRC-034: "DRAS publisher-indexed text and public MATLAB demo inspected; full methods/tables/limitations remain partial."
  SRC-036: "Publisher-indexed attack/optimisation, datasets/split and QF75 sections inspected; full methods/results/generalisation remain partial."
  SRC-046: "Abstract/metadata only; full paper/results not inspected."
  SRC-047: "Abstract/metadata only; Scaling-Net/SC-Net described; source repository not yet inspected."
  SRC-048: "IEEE abstract/author record only; full method/evaluation not inspected."
  SRC-049: "Pinned README and selected implementation files inspected; no execution/audit. Full paper/formal security argument and complete results unreviewed."
next_actions:
  - "Challenge the new confidence/evidence model against source and route evidence; verify protocol delivery semantics and assess whether it improves claim precision without introducing privacy costs."
  - "Continue seeking complete paper texts for SRC-033, SRC-034 and SRC-036. A further publisher-indexed pass clarified evaluation dimensions and method context, but complete methods, tables and limitations remain unavailable; all three reviews remain partial."
  - "Inspect SRC-046–SRC-048 full texts and SRC-047 implementation where available."
  - "Review SRC-049 full paper/formal security argument and complete experimental results; selected code has been read but not run or audited."
  - "Pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/configuration profiles before deployed-route claims."
  - "Continue protocol-boundary reconciliation into W2/W3/W4, decision records and thesis; compare Signal, MLS and HPKE without premature primitive selection."
  - "Reconcile new route findings into W1-W4, contribution assessment and integrated thesis."
  - "Continue broader terminology and cross-document consistency review."
  - "Use work/lookup/TASKS.md for continuation across research, routes, diagrams, peer review and release work."
source_review_update:
  date: "2026-11-16"
  SRC-033: "Publisher-indexed pass clarified extraction-error, PSNR/SSIM and classifier-error metrics, named comparators, BOSSbase and LinkedIn evaluation; complete parameters, tables and limitations unavailable."
  SRC-034: "Publisher-indexed pass clarified RoLoS ablation, PMAS comparison, Q95-to-Q85/Q80/Q75 scenarios and author-reported 87% extraction-error / order-of-magnitude runtime claims; full tables and platform procedure unavailable."
  SRC-036: "Publisher-indexed pass clarified attack/filtering plus optimisation modules, joint loss, BOSSbase 8,000/2,000 split, BOWS2 and QF75; full equations, training details, results and generalisation limits unavailable."
  review_status: "T-001 remains open; all three reviews remain partial. No full paper text, experiment reproduction or audit obtained."
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
  work/README.md: "87af6d60e02598929a01fc311a25f73f9abccdc6"
  work/PROJECT_STATE.md: "1c3648f6d698d8daca53656ca32c0feffd2e0ec0"
  work/WORKPLAN.md: "9d22a5d1b54dff351b60e6cb9348739e66b6a727"
  work/WORK_LOG.md: "7fa6bef611783250df8fbc7dd4c97d4bf7934774"
  work/lookup/TASKS.md: "0dd84320ff59321769276dce873b608065ed5202"
  work/lookup/TASKS.json: "0e5a1c05f937301b89cb586d65545d869e391ef5"
  README.md: "ce2d0c914df2506c0611518cdeb4b454384dc588"
  docs/source-register.md: "2215ef95c14356ed543279b2e93e0bf0de532849"
verified_research_documents:
  docs/confidence-and-evidence-model.md: "c7130a8e736286489fa63a8271a7af5552ca9e31"
  thesis.md: "e67f5ed4c1599c5eddfe20c6e8e281d933302abb"
  docs/w1-research-framing.md: "133f463871956538004a86f5daa2337cb1f4283f"
  docs/w2-threat-model.md: "ef9ca072917cdc0c8405b908c3039f508080f55b"
  docs/w3-architecture.md: "dd8ecca36e3117d73596e688fda64fd484c140ec"
  docs/w4-risks-and-evaluation.md: "d3a4137b29238b073ca2b994b40053a0d25a13ce"
  docs/thesis-contribution-and-bias-assessment.md: "e93f774158ec57adeb98b37daf02c8114d39e232"
  docs/decision-register.md: "8a011d15d2941ce37909b6fe6da23485170303e5"
  docs/traceability.md: "8c9baa47af0351a31abe5f3234d87e2378435dbc"
latest_verified_project_head: "ae02cf3e8bfcb01174a0a112c5257773baad7d33"
latest_commit_before_infrastructure_checkpoint: "a38ad832d634ca297698a5d0b8abdabdfdcb3f94"
checkpoint_close_order:
  - "Reconcile PROJECT_STATE.md, WORKPLAN.md and WORK_LOG.md."
  - "Fetch and verify all three working documents."
  - "Refresh SESSION_DIGEST.md from verified state."
  - "Refresh SESSION_DIGEST.json last."
  - "Fetch and verify both digests against the three working documents."
