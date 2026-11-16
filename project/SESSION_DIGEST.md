---
schema: tip.session-digest.v1
checkpoint: "2026-11-16"
branch: main
project_status: "Theory only · No implementation · Not audited."
status_semantics: project_metadata_only
operating_instruction_boundary:
  chatgpt_project_instructions: "Thin operating layer for continuation, execution and verification; follow live GitHub records."
  thesis_research_rules: "Substantive research rules, evidence and argument stay in thesis/research documents; do not duplicate or override them in ChatGPT instructions."
  repository_authority: "Live GitHub files and commit history; digests are retrieval aids only."
  external_settings: "ChatGPT Project Instructions are managed outside GitHub; repository notes do not claim to change those settings."
document_roles:
  project_state: "Changing verified progress snapshot, blockers and next action."
  workplan: "Stable roadmap, principles, sequencing and dependencies."
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
  - docs/protocol-boundary-analysis.md
  - docs/multi-message-linkage-and-steganographic-carriage.md
current_state:
  thesis: working_draft
  research_units: "W1-W4 drafted; aligned multi-message definitions, evaluation distinctions and text-only illustration prompts integrated; final thesis alignment remains."
  source_register: "45 entries, SRC-001 through SRC-045. SRC-043–SRC-045 full-text reviewed."
  route_profiles: "Six evidence-bounded starting profiles; documentary comparison and initial lifecycle/event observer ledger exist. Service versions/configurations and deeper observer/collusion evidence remain open."
  multi_message_analysis: "Dedicated analysis covers single-carrier messages, fragment sets, redundancy, independent messages, conversations, retries, cross-route copies, package encapsulation, observer linkage, pooled steganalysis and evaluation."
  prior_art_boundary: "Wang et al. 2024 uses robust DFT/DCT watermarking for fragmented multi-image covert communication with redundant copies and majority-vote reconstruction; not proof of ordinary steganographic stealth. Ker 2007 pooled detection and separate square-root capacity theorem are bounded by detector, cover, independence and known-batch assumptions."
  protocol_analysis: "Key scope, HKDF salt/info, transcript binding, nonce uniqueness, AAD, replay, ordering and safe fallback analysed. HPKE is a comparator; no protocol selected."
  illustration_planning: "Text-only prompts with placement and must-not-imply guardrails in W1-W4; indexed in diagrams/README.md. No new artwork."
  source_reviews: "SRC-035 and SRC-037 full text inspected; SRC-033, SRC-034 and SRC-036 expanded publisher-indexed partial inspection; SRC-038-SRC-045 source documents inspected."
  implementation: none
  independent_audit: none
verified:
  markdown_files: 29
  relative_markdown_links: "0 broken"
  archive_generation_instructions: none
  source_entries: 45
  work_documents: "W1-W4 contain definition/comparison blocks and illustration placeholders"
  w4_heading_hierarchy: normalized
  route_framework_subsection_numbering: corrected
next_actions:
  - "Extend the lifecycle/event/observer ledger using SRC-043-SRC-045: fragment-set membership, redundant carrier events, independent messages, conversation/session continuity, retries, cross-route copies, discovery and collection-level detection; state observer vantage, collection size, time window and dependence assumptions."
  - "Seek full text for SRC-033, SRC-034 and SRC-036; retain partial review labels until methods/results are inspected."
  - "Pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/configuration profiles before making deployed-route claims."
  - "Reconcile protocol-boundary analysis into W2/W3/W4, decision records and thesis; test against Signal, MLS and HPKE references without premature selection."
  - "Complete exact-status, terminology, image-reference, thesis heading/numbering and illustration-placeholder consistency audits."
deferred:
  - "Actual diagrams until the argument and comparative evidence stabilise; prompts only at present."
  - "External peer-review preparation until a coherent thesis candidate exists."
  - "Implementation, platform experiments, extraction tests, steganalysis benchmarks, formal proof and security audit."
invariants:
  - "Image carriage is a required research comparison, not a mandatory runtime route."
  - "Orchestration is optional; analyse service roles separately."
  - "Protected object remains invariant unless explicit authenticated conversion is defined."
  - "Fragment set, redundant carriage, independent messages, conversation, retry and cross-route copy are distinct."
  - "Encapsulation is not authentication; optional steganography is not encryption."
  - "No anonymity/security inference from carrier uniqueness, concealment or extra hops."
  - "HKDF salt is not a nonce or identity proof; salt and info have distinct roles."
  - "AEAD nonce uniqueness is per key, not per carrier."
  - "Preserve dissent, provenance and historical work; distinguish proposal from demonstrated result."
diagram_policy:
  format: "Genuine visual illustrations; never ASCII art."
  timing: "Create or improve only when the underlying argument and evidence are stable."
  preferred: "Editable SVG with accessible exports."
claim_discipline:
  - "Never claim saved, completed, published, deployed, tested or audited without matching evidence."
  - "Distinguish drafted, committed, read-back verified, tested and independently reviewed."
checkpoint_close_order:
  - "Reconcile PROJECT_STATE.md, WORKPLAN.md and WORK_LOG.md."
  - "Read back and verify all three working documents."
  - "Refresh SESSION_DIGEST.md from verified state."
  - "Refresh SESSION_DIGEST.json last."
  - "Read back both digests and verify agreement."
