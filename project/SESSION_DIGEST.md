---
schema: tip.session-digest.v1
checkpoint: "2026-11-16"
branch: main
project_status: "Theory only · No implementation · Not audited."
status_semantics: project_metadata_only
research_exposition_location:
  - thesis.md
  - docs/
operational_authority:
  - project/PROJECT_STATE.md
  - project/WORKPLAN.md
  - project/WORK_LOG.md
digest_authority: "Operational handover only; live repository files and commit history remain authoritative."
document_roles:
  project_state: "Changing verified progress snapshot; next action and blockers."
  workplan: "Stable roadmap, principles, sequencing and dependencies."
  work_log: "Chronological evidence and change history."
  markdown_digest: "Machine-readable shorthand only."
  json_digest: "Machine-readable shorthand only."
continue_trigger:
  phrase: "continue"
  actions:
    - "Fetch live default branch and both digests."
    - "Read PROJECT_STATE.md, WORKPLAN.md, WORK_LOG.md and relevant research/supporting files."
    - "Identify verified completions, remaining tasks, blockers and dependencies."
    - "Resume the next unfinished unblocked task without requesting repeated project history."
    - "Update affected records after meaningful progress; verify every GitHub write by read-back."
diagram_policy:
  format: "Genuine visual illustration; never ASCII art."
  timing: "Create or improve when the argument and evidence are stable; otherwise defer."
  preferred: "Editable SVG with accessible exports."
claim_discipline:
  - "Do not claim saved, completed, published, deployed, tested or audited without matching evidence."
  - "Distinguish drafted, committed, read-back verified, tested and independently reviewed."
read_first:
  - project/SESSION_DIGEST.md
  - project/SESSION_DIGEST.json
  - project/PROJECT_STATE.md
  - project/WORKPLAN.md
  - project/WORK_LOG.md
  - thesis.md
  - docs/source-register.md
  - docs/route-comparison-framework.md
current_state:
  thesis: working_draft
  research_units: "W1-W4 drafted; alignment remains open"
  route_profiles: "not yet named and evidence-populated"
  source_reviews: "SRC-033-SRC-037 full-text review remains open"
  implementation: none
  independent_audit: none
next_actions:
  - "Complete high-value full-text reviews for SRC-033-SRC-037."
  - "Select evidenced named/versioned profiles for image-platform, file/attachment, conventional E2E and Echomix/Katzenpost routes."
  - "Populate route lifecycle events and observer views using source-backed evidence; mark unknowns."
  - "Check W3 numbering and traceability references."
  - "Reconcile material findings into thesis and research-supporting documents."
  - "Run fresh relative-link, status and cross-document consistency audits."
deferred:
  - "New diagrams until the comparative argument stabilises."
  - "External peer-review packaging until a coherent thesis candidate exists."
  - "Implementation and experiments; do not imply they have occurred."
document_boundaries:
  thesis_and_research: "Substantive argument, technical principles, evidence, contribution assessment, uncertainty and limitations."
  operational_documents: "Verified status, priorities, dependencies, blockers, paths and next actions; link to research files."
  session_digests: "Structured operational handover; no duplicated thesis exposition."
  assistant_working_notes: "Maintain the same separation; mention project status only when relevant."
checkpoint_close_order:
  - "Reconcile PROJECT_STATE.md, WORKPLAN.md and WORK_LOG.md."
  - "Read back and verify all three working documents."
  - "Refresh SESSION_DIGEST.md from verified state."
  - "Refresh SESSION_DIGEST.json last."
  - "Verify both digests against the three working documents."
