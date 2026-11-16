---
schema: tip.session-digest.v1
checkpoint: "2026-11-16"
branch: main
project_status: "Theory only · No implementation · Not audited."
status_semantics: project_metadata_only
operating_instruction_boundary:
  chatgpt_project_instructions: "Thin operating layer for continuation, execution and verification; follow live GitHub records."
  thesis_research_rules: "Remain in thesis and research-supporting documents; do not duplicate or override them in ChatGPT instructions."
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
current_state:
  thesis: working_draft
  research_units: "W1-W4 drafted; final alignment remains."
  source_register: "42 entries; SRC-041 RFC 5869 and SRC-042 RFC 9180 added and inspected."
  route_profiles: "Six evidence-bounded starting profiles; MRAS/DRAS profile rows now include expanded indexed method/metric and author-reported platform details. Documentary comparison and initial lifecycle/event observer ledger exist. Service versions/configurations and deeper observer/collusion evidence remain open."
  protocol_analysis: "Initial protocol boundary analysis drafted and linked to W3, W4, thesis, traceability and README. Covers key scope, HKDF salt/info, transcript binding, nonce uniqueness, AAD, replay, ordering and safe fallback. No protocol selected."
  source_reviews: "SRC-035 and SRC-037 full text inspected; SRC-033, SRC-034 and SRC-036 expanded publisher-indexed partial inspection; SRC-038-SRC-042 source documents inspected."
  implementation: none
  independent_audit: none
next_actions:
  - "Seek full text for SRC-033, SRC-034 and SRC-036; retain partial review states until methods/results are inspected."
  - "Pin actual Dropbox, Signal and Katzenpost/Pigeonhole client/release/configuration profiles before making deployed-route claims."
  - "Extend the lifecycle/event/observer ledger with source-specific discovery, retrieval, retries, expiry, collusion and human-observer evidence; retain unknowns."
  - "Reconcile protocol-boundary analysis into W2/W3/W4, decision records and the thesis; test obligations against Signal, MLS and HPKE references without premature selection."
  - "Reconcile route findings into W1-W4 and the contribution assessment."
  - "Run a fresh full-tree relative-link, exact-status, terminology and image-reference audit."
deferred:
  - "New diagrams until the comparative argument and evidence stabilise."
  - "External peer-review preparation until a coherent thesis candidate exists."
  - "Implementation, platform experiments, extraction tests, steganalysis benchmarks, formal proof and security audit."
invariants:
  - "Image carriage is a required research comparison, not a mandatory runtime route."
  - "Orchestration is optional; analyse service roles separately."
  - "Protected object remains invariant unless explicit authenticated conversion is defined."
  - "No anonymity/security inference from carrier uniqueness, concealment or extra hops."
  - "Salt is not a nonce or identity proof; HKDF salt and info have distinct roles."
  - "Nonce uniqueness is per AEAD key, not per carrier."
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
