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
  research_units: "W1-W4 drafted; aligned message-multiplicity terminology, definition/comparison blocks and text-only illustration prompts are embedded."
  source_register: "45 entries, SRC-001 through SRC-045."
  multi_message_model: "Distinct logical messages, protected objects, fragment sets, redundant carriage, independent-message batches, conversation/session continuity, retries/duplicates and cross-route copies."
  steganography: "Separate per-carrier concealment, robust watermarking, extraction/reconstruction, collection-level steganalysis and observer linkage. SRC-043 is robust DFT/DCT watermarking prior art; SRC-044 pooled batch detection; SRC-045 a bounded theorem with explicit assumptions."
  route_profiles: "Six evidence-bounded profiles; documentary comparison and expanded lifecycle/event/observer ledger. Live client/service versions and configurations remain unpinned."
  protocol_analysis: "Protocol-boundary analysis covers key scope, HKDF salt/info, transcript binding, nonce uniqueness, AAD, replay, ordering and safe fallback. No protocol selected."
  implementation: none
  independent_audit: none
  illustrations: "W1-F01..F03, W2-F01, W3-F01..F02, W4-F01..F02 are text-only prompts indexed in diagrams/README.md; no artwork generated."
completed:
  - "Multi-message relationship definitions and package-encapsulation boundaries integrated into W1-W4 and thesis/supporting research."
  - "Route comparison ledger extended for fragment-set membership, redundancy, independent messages/conversation continuity, retry/duplicate and cross-route linkage, collection-level steganalysis."
  - "W1-W4 and route-comparison changed-file relative-link audit: no broken links."
  - "Every changed GitHub file fetched back and exact content verified."
next_actions:
  - "Seek full text for SRC-033, SRC-034 and SRC-036; preserve partial-review labels until methods/results and limitations are inspected."
  - "Pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/configuration profiles before deployed-route claims."
  - "Continue protocol-boundary reconciliation into W2/W3/W4, decision records and thesis; compare Signal, MLS and HPKE without premature primitive selection."
  - "Reconcile new route findings into W1-W4, contribution assessment and integrated thesis."
  - "Run fresh repository-wide relative-link, ZIP/archive-instruction, exact-status, terminology, illustration-placeholder and image-reference audits."
deferred:
  - "Create actual diagrams only after the comparative argument and evidence stabilise; never use ASCII art."
  - "External peer-review preparation until a coherent thesis candidate exists."
  - "Implementation, platform experiments, extraction tests, steganalysis benchmarks, formal proof and security audit."
invariants:
  - "Image carriage is a required research comparison, not a mandatory runtime route."
  - "Orchestration is optional; analyse each service role separately."
  - "Protected object remains invariant unless explicit authenticated conversion is defined."
  - "Package encapsulation is not endpoint authentication."
  - "Endpoint-authenticated linkage and observer-inferred linkage are distinct."
  - "Per-image concealment does not establish collection-level concealment."
  - "No anonymity/security inference from carrier uniqueness, concealment or extra hops."
  - "Preserve dissent, provenance, uncertainty and historical work; distinguish proposals from demonstrated properties."
verified_working_documents:
  project/PROJECT_STATE.md: "447fd642e5eb36b558da6de8a56251b7fd96ad26"
  project/WORKPLAN.md: "2c9b0bb9034ea9c1855d58f518927edf4ca18cac"
  project/WORK_LOG.md: "c846f616f288919291879b621479e65515586777"
latest_commit_before_digest_refresh: "9186257eb6b769cbed5071d50d02893c2aea77bd"
checkpoint_close_order:
  - "Reconcile PROJECT_STATE.md, WORKPLAN.md and WORK_LOG.md."
  - "Fetch and verify all three working documents."
  - "Refresh SESSION_DIGEST.md from verified state."
  - "Refresh SESSION_DIGEST.json last."
  - "Fetch and verify both digests against the three working documents."
