---
schema: tip.session-digest.v2
checkpoint: "2026-11-18 · SRC-061 Sony forensic-watermark comparison integrated into thesis §8.3 and supporting research; supplied PDFs mapped to reviewed SRC-043/050/051; operational drift reconciled; T-001–T-004 deferred; no thesis-critical blocker"
branch: main
project_status: "Theory only · No implementation · Not audited."
status_semantics: project_metadata_only_not_chat_footer
chat_status_footer: prohibited
authority: "GitHub main and commit history are authoritative; digests are retrieval aids only."
thesis_product:
  canonical_manuscript: thesis.md
  status: "One active manuscript in staging; production is a frozen release of the same thesis."
operating_boundary:
  message: "The protected message is the standalone architectural entity. Endpoints own identity/key trust, authentication, decryption, multipart association, reconstruction and acceptance."
  excluded_dependencies: "No server, directory, database, index, fixed address, rendezvous service, coordinator, orchestration service or external resolver is required for message identity, key resolution, decryption, fragment membership, reconstruction or acceptance."
  identity_vs_address: "Cryptographic peer identity and locally held key trust are distinct from a network address, platform account, storage locator or persistent recipient-to-location relationship."
  carriage: "External platforms, hosts, networks and carriers are untrusted, replaceable means of conveying bytes. Route-native acquisition is a delivery condition and comparative observer topic, not a message-protocol function."
  multipart: "Any required authenticated membership and reconstruction context travels within the protected representation. No external manifest host, lookup or coordinator is required."
  granularity: "Whole-object representation remains baseline; sender-selectable segmentation is optional, independent of carrier/transport, and has no assumed privacy/security benefit."
completed:
  T-005: "Protocol-boundary analysis reconciled into W2/W3/W4, decisions and thesis."
  T-006: "Current route/source evidence and documentary fault matrix reconciled into thesis and supporting research."
  T-007: "Static cross-document consistency review completed; prior 60-source pass plus targeted 61-source check after SRC-061."
  T-013: "Former Candidate D model retained as comparative prior-art analysis only; retired as architecture/contribution candidate."
  T-014: "Pinned APIR audit: predicate COUNT returns an authenticated scalar aggregate over a server-held population, not matching indices; separate point-PIR requires an index already known to the client. No server-side composition or replacement database pursued."
  T-015: "Optional sender-controlled whole-object/segmented representation principle integrated; separate supporting note retained."
current_research:
  source_register: "61 unique entries, SRC-001 through SRC-061."
  supplied_papers: "910.pdf maps to SRC-051 UnifOMR; 2369.pdf and StOMR-camera-ready.pdf map to SRC-050 StOMR; sensors-24-00627-v2.pdf maps to SRC-043 multi-image robust fragment hiding. These sources are already represented in the research record."
  sony_comparison: "SRC-061 and prior-art-comparison §3.8 record Sony's 1999 Galaxy-group and 2001 VWM-group participation, separate 2005 Academy screener recipient-watermark reporting, and the author's reported Sony R&D experience as context only. Bounded finding integrated into thesis §8.3, W1, W4, observer/property matrix, contribution assessment and RQ6 traceability. No claim that Sony developed the screener system or that the programmes were identical."
  prior_art: "OMR/APIR/AAD/vPIR/range-query systems remain comparative prior art only. Former Candidate D is retired; no database, directory, server-side index or retrieval composition is proposed."
  evidence: "No implementation, experiment, formal proof, platform deployment test, independent review or security audit."
evidence_limits:
  SRC-033_034_036: "Partial source review; full papers remain unavailable. Optional follow-up only if a defined thesis claim needs details."
  SRC-046_047_048: "Full texts/assets remain incomplete; SRC-047 repository is README-only. Optional follow-up only if claim-specific."
  SRC-049: "Code source-inspected; paper/proof/results and model assets remain unavailable; no execution or reproduction."
  SRC-056: "APIR range-query PDF inaccessible; indexed-text-only review."
  SRC-059: "VPRQ technical paper inaccessible; abstract/introduction-only review."
  SRC-060: "Full paper reviewed; located formal theorem establishes trapdoor privacy, not a separate malicious-cloud soundness theorem."
task_position:
  T-001_T-003: "Deferred source-specific evidence expansions, not dependencies of thesis construction."
  T-004: "Deferred controlled-route evidence; public documentation/source profiles suffice for current theoretical comparison."
  next_action: "No thesis-critical blocker. Continue only where a defined claim, contradiction or route decision gives a specific evidential reason. Do not wait for unrelated papers or controlled deployments."
gates:
  diagrams: "Deferred until underlying arguments and evidence stabilise."
  peer_review: "No independent reviewer activity yet; prepare only when a coherent thesis candidate exists."
  release: "Requires coherent reviewed/frozen thesis and proof that no enduring document depends on /work/."
verified_main_blob_pins:
  thesis.md: b40d19d7d6795d20e702b8ba41834cbefb0be264
  docs/source-register.md: 5e0b966a00265288defcb15526f24a1865acbc00
  docs/prior-art-comparison.md: 28893e7ef54bc58b2089f15a92ed6f688fd86912
  docs/traceability.md: 7b222b2087c264ee9090e5cf7e56021e668cb5bd
  docs/w1-research-framing.md: 5a432dcaad8575817faebc053f249de71c98c2e6
  docs/w4-risks-and-evaluation.md: 5e75bd895ca9c4d7cca6595523d5a709846740eb
  docs/thesis-contribution-and-bias-assessment.md: 96caac183662aca20187cf7993c5ffb1aac6c3d4
  docs/observer-property-matrix.md: fb18733122cd4d82b1042d8525aee51332d92f8d
  work/lookup/TASKS.md: fa0c8136f4215d3ebd59107e3748a49b54538fd7
  work/lookup/TASKS.json: 99d59c3254d8385bfc2e2bc9ce53a2e88e698da3
  work/PROJECT_STATE.md: edadfc957b59a8da8cf57507ea1fd2c903cd291d
  work/WORKPLAN.md: aea1531882cf56f7ae5fac6879d503c3a27ad531
  work/WORK_LOG.md: 52c0dd7c964766d579870a4bf96e7f2ef5b4edbf
