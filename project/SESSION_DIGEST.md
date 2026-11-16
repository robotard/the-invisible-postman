---
schema: tip.session-digest.v1
checkpoint: "2026-11-16"
branch: main
project_status: "Theory only · No implementation · Not audited."
status_semantics: project_metadata_only
operating_instruction_boundary:
  chatgpt_project_instructions: "Thin operating layer for continuation, execution and verification; follow live GitHub records."
  thesis_research_rules: "Substantive methodology, terminology, technical constraints, arguments and evidence standards stay in thesis/research documents."
  repository_authority: "Live GitHub files and commit history; digests are retrieval aids only."
  external_settings: "ChatGPT Project Instructions are managed outside GitHub; repository records the boundary but cannot edit ChatGPT settings."
document_roles:
  project_state: "Changing verified progress, blockers, dependencies and exact next action."
  workplan: "Stable roadmap, priorities, sequencing and dependencies."
  work_log: "Chronological evidence and change history."
  markdown_digest: "Compact machine-readable handover only."
  json_digest: "Compact machine-readable handover only."
read_first:
  - project/SESSION_DIGEST.md
  - project/SESSION_DIGEST.json
  - project/PROJECT_STATE.md
  - project/WORKPLAN.md
  - project/WORK_LOG.md
  - thesis.md
  - docs/source-register.md
  - docs/route-comparison-framework.md
  - docs/multi-message-linkage-and-steganographic-carriage.md
current_state:
  thesis: "Working draft; final contribution and review readiness remain open."
  research_units: "W1-W4 drafted; aligned definitions/comparisons, message-multiplicity terminology and text-only illustration prompts embedded."
  source_register: "49 entries, SRC-001 through SRC-049."
  multi_message_model: "Distinguishes logical messages, protected objects, fragment sets, redundant carriage, independent-message batches, conversation/session continuity, retries/duplicates and cross-route copies."
  steganography: "Separates per-carrier concealment, robust watermarking, extraction/reconstruction, collection-level steganalysis and observer linkage. SRC-043–SRC-045 cover multi-image redundancy and batch detection; SRC-049 covers redundancy across frames inside one GIF carrier."
  sanitization: "SRC-036 and SRC-046–SRC-047 describe active payload sanitization; SRC-048 describes keyed counter-adaptation to a known sanitizer. These are partial reviews and do not establish deployment by any named platform."
  route_profiles: "Six evidence-bounded profiles; documentary comparison and expanded lifecycle/event/observer ledger. Live client/service versions and configurations remain unpinned."
  protocol_analysis: "Key scope, HKDF salt/info, transcript binding, nonce uniqueness, AAD, replay, ordering and safe fallback analysed as obligations; no protocol selected."
  implementation: none
  independent_audit: none
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
source_review_boundaries:
  SRC-033: "MRAS publisher-indexed text and public MATLAB demo inspected; full methods/tables/limitations remain partial."
  SRC-034: "DRAS publisher-indexed text and public MATLAB demo inspected; full methods/tables/limitations remain partial."
  SRC-036: "Publisher-indexed attack/optimisation, datasets/split and QF75 sections inspected; full methods/results/generalisation remain partial."
  SRC-046: "Abstract/metadata only; full paper/results not inspected."
  SRC-047: "Abstract/metadata only; Scaling-Net/SC-Net described; source repository not yet inspected."
  SRC-048: "IEEE abstract/author record only; full method/evaluation not inspected."
  SRC-049: "IEEE metadata and author-linked implementation README inspected; full paper/formal security argument not reviewed; code not run or audited."
next_actions:
  - "Complete full-text/source-level review for SRC-033, SRC-034 and SRC-036; retain partial-review labels until methods/results and limitations are inspected."
  - "Inspect SRC-046–SRC-048 full texts and SRC-047 implementation where available."
  - "Inspect SRC-049 full paper/formal security argument and implementation beyond its README where available."
  - "Pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/configuration profiles before deployed-route claims."
  - "Continue protocol-boundary reconciliation into W2/W3/W4, decision records and thesis; compare Signal, MLS and HPKE without premature primitive selection."
  - "Reconcile new route findings into W1-W4, contribution assessment and integrated thesis."
  - "Continue broader terminology and cross-document consistency review."
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
  - "No anonymity/security inference from carrier uniqueness, concealment or extra hops."
  - "Preserve dissent, provenance, uncertainty and historical work; distinguish proposals from demonstrated properties."
verified_working_documents:
  project/PROJECT_STATE.md: "3c9b1bf01a0ee58ce133a43335ea08184bd9ed69"
  project/WORKPLAN.md: "bc5a458269897e2e652f1e4a6f1283378edc7655"
  project/WORK_LOG.md: "ac893858faf73ee82f4fc0c6d6cc4de175cc2cb0"
  docs/source-register.md: "4017472ae9eeb925e6f8f124416212bee53684ac"
latest_commit_before_digest_refresh: "269693329cf124785f9ba8c3048ac7ca434d4a2d"
checkpoint_close_order:
  - "Reconcile PROJECT_STATE.md, WORKPLAN.md and WORK_LOG.md."
  - "Fetch and verify all three working documents."
  - "Refresh SESSION_DIGEST.md from verified state."
  - "Refresh SESSION_DIGEST.json last."
  - "Fetch and verify both digests against the three working documents."
