---
schema: tip.session-digest.v2
checkpoint: "2026-11-16 · TIP-WORK-INFRA-2026-11-16"
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
  thesis: "One active manuscript at thesis.md in staging; production will be a frozen release of that same thesis. Final contribution and review readiness remain open."
  research_units: "W1-W4 drafted; aligned definitions/comparisons, message-multiplicity terminology and text-only illustration prompts embedded."
  source_register: "49 entries, SRC-001 through SRC-049."
  multi_message_model: "Distinguishes logical messages, protected objects, fragment sets, redundant carriage, independent-message batches, conversation/session continuity, retries/duplicates and cross-route copies."
  steganography: "Separates per-carrier concealment, robust watermarking, extraction/reconstruction, collection-level steganalysis and observer linkage. SRC-043–SRC-045 cover multi-image redundancy and batch detection; SRC-049 covers within-GIF frame redundancy."
  sanitization: "SRC-036 and SRC-046–SRC-047 describe active payload sanitization; SRC-048 describes keyed counter-adaptation to a known sanitizer. These are partial reviews and do not establish deployment by any named platform."
  gif_code_review: "SRC-049 README, core/method_core.py and scripts/run_stego.py inspected at pinned external repo commit 4a5d2503623b06d17517ecf7a8b7527e1edc315d. Two redundancy levels: d-fold repetition within frame and majority voting across 16 frames. Receiver asserts a complete 16-frame/key set; missing-frame erasure tolerance is not established. Raw ChaCha20 path shows no authentication tag; 32-bit NumPy PRNG fallback is labelled TEST ONLY. Local keys/group ID are not an authenticated message-set protocol. Code not executed or audited; paper/formal proof unreviewed."
  route_profiles: "Six evidence-bounded profiles; documentary comparison and expanded lifecycle/event/observer ledger. Live client/service versions and configurations remain unpinned."
  protocol_analysis: "Key scope, HKDF salt/info, transcript binding, nonce uniqueness, AAD, replay, ordering and safe fallback analysed as obligations; no protocol selected."
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
source_review_boundaries:
  SRC-033: "MRAS publisher-indexed text and public MATLAB demo inspected; full methods/tables/limitations remain partial."
  SRC-034: "DRAS publisher-indexed text and public MATLAB demo inspected; full methods/tables/limitations remain partial."
  SRC-036: "Publisher-indexed attack/optimisation, datasets/split and QF75 sections inspected; full methods/results/generalisation remain partial."
  SRC-046: "Abstract/metadata only; full paper/results not inspected."
  SRC-047: "Abstract/metadata only; Scaling-Net/SC-Net described; source repository not yet inspected."
  SRC-048: "IEEE abstract/author record only; full method/evaluation not inspected."
  SRC-049: "Pinned README and selected implementation files inspected; no execution/audit. Full paper/formal security argument and complete results unreviewed."
next_actions:
  - "Complete full-text/source-level review for SRC-033, SRC-034 and SRC-036; retain partial-review labels until methods/results and limitations are inspected."
  - "Inspect SRC-046–SRC-048 full texts and SRC-047 implementation where available."
  - "Review SRC-049 full paper/formal security argument and complete experimental results; selected code has been read but not run or audited."
  - "Pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/configuration profiles before deployed-route claims."
  - "Continue protocol-boundary reconciliation into W2/W3/W4, decision records and thesis; compare Signal, MLS and HPKE without premature primitive selection."
  - "Reconcile new route findings into W1-W4, contribution assessment and integrated thesis."
  - "Continue broader terminology and cross-document consistency review."
  - "Use work/lookup/TASKS.md for continuation across research, routes, diagrams, peer review and release work."
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
verified_working_documents:
  work/README.md: "87af6d60e02598929a01fc311a25f73f9abccdc6"
  work/PROJECT_STATE.md: "127f1b9dbecdd90b7a60d5bafc78e6ec479c117b"
  work/WORKPLAN.md: "683e115c73d5eb874370f75c12aaed48fc89f094"
  work/WORK_LOG.md: "e663ae7d7ae75e06b0f20c46619b5a523d4bc727"
  work/lookup/TASKS.md: "0dd84320ff59321769276dce873b608065ed5202"
  work/lookup/TASKS.json: "0e5a1c05f937301b89cb586d65545d869e391ef5"
  README.md: "ce2d0c914df2506c0611518cdeb4b454384dc588"
  docs/source-register.md: "e3a69287e95ab2ca4e2544b70494ab8a45238485"
latest_commit_before_infrastructure_checkpoint: "a38ad832d634ca297698a5d0b8abdabdfdcb3f94"
checkpoint_close_order:
  - "Reconcile PROJECT_STATE.md, WORKPLAN.md and WORK_LOG.md."
  - "Fetch and verify all three working documents."
  - "Refresh SESSION_DIGEST.md from verified state."
  - "Refresh SESSION_DIGEST.json last."
  - "Fetch and verify both digests against the three working documents."
