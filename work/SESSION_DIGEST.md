---
schema: tip.session-digest.v2
checkpoint: "2026-11-18 · Endpoint-only architecture corrected and cross-document consistency verified; T-007/T-013/T-014/T-015 complete; no unblocked substantive task; SRC-001–SRC-060 registered"
branch: main
project_status: "Theory only · No implementation · Not audited."
status_semantics: project_metadata_only_not_chat_footer
chat_status_footer: prohibited
authority: "GitHub main and commit history are authoritative; digests are retrieval aids only."
thesis_product:
  canonical_manuscript: thesis.md
  status: "One active manuscript in staging; no second thesis or implementation product."
operating_boundary:
  message: "The protected message is the standalone architectural entity. Endpoints own identity/key trust, authentication, decryption, multipart association, reconstruction and acceptance."
  excluded_dependencies: "No server, directory, database, index, fixed address, rendezvous service, coordinator, orchestration service or external resolver is required for message identity, key resolution, decryption, fragment membership, reconstruction or acceptance."
  identity_vs_address: "Cryptographic peer identity and locally held key trust are distinct from a network address, platform account, storage locator or persistent recipient-to-location relationship."
  carriage: "External platforms, hosts, networks and carriers are untrusted, replaceable means of conveying bytes. Route-native acquisition is a delivery condition and comparative observer topic, not a message-protocol function."
  multipart: "Any required authenticated membership and reconstruction context travels within the protected representation. No external manifest host, lookup or coordinator is required."
  granularity: "Whole-object representation remains baseline; sender-selectable segmentation is optional, independent of carrier/transport, and has no assumed privacy/security benefit."
completed:
  T-013: "Former Candidate D model retained as comparative prior-art analysis only; retired as architecture/contribution candidate."
  T-014: "Pinned APIR audit: predicate COUNT returns an authenticated scalar aggregate over a server-held population, not matching indices; separate point-PIR requires an index already known to the client; gRPC server loads local PGP data and exposes database-info/query RPCs. No server-side composition or replacement database pursued."
  T-007: "Post-correction static consistency pass completed across 15 core documents; 60 unique source IDs, no unknown citations, all 22 local link targets exist, no broken core anchors, no duplicate heading slugs, no stale train/coordinator/orchestration dependencies."
  T-015: "Optional sender-controlled whole-object/segmented representation principle integrated; separate supporting note retained."
source_boundaries:
  SRC-054: "APIR paper and artifact source inspected; follow-up artifact pin 7a7f2041bc1e0907ef089f8e8e55252ef7f18e0f. No build, test, benchmark or security review."
  SRC-056: "APIR range-query PDF inaccessible; indexed-text-only review. Do not claim full proof/algorithm review."
  SRC-059: "VPRQ technical paper inaccessible; abstract/introduction-only review."
  SRC-060: "Full paper reviewed; formal theorem found is trapdoor privacy, not a separate malicious-cloud soundness theorem."
  other: "SRC-001–SRC-060 registered; preserve each source's recorded access and evidence limits."
current_research:
  thesis: "Thesis §1 and §8 now state endpoint-only, self-contained message semantics; carrier acquisition and external retrieval systems are comparative prior art, not architecture components."
  architecture: "W3 rewritten around endpoints, protected object, optional self-contained multipart representation, endpoint-side encapsulation, external carriage routes and lifecycle obligations."
  prior_art: "APIR/AAD/vPIR/range-query/OMR systems compared as service-dependent prior art. Former Candidate D is retired; no database, directory, server-side index or retrieval composition is proposed."
  route_comparison: "Image carriage remains a required research comparison, not a mandatory runtime route or presumed winner. Carrier variation, extra hops and concealment imply no anonymity or security guarantee."
  evidence: "No implementation, experiment, formal proof, platform deployment test, independent review or security audit."
blockers:
  T-001: "Full-text/source access for SRC-033/SRC-034/SRC-036."
  T-002: "Full texts/model assets for SRC-046/SRC-048; SRC-047 repository has README only and external model archive inaccessible."
  T-003: "SRC-049 full paper/formal argument/results and model assets unavailable; code not executed."
  T-004: "No controlled Dropbox account/link, installed Signal account/service state or running Katzenpost/Pigeonhole deployment."
gates:
  diagrams: "Deferred until arguments/evidence stabilise."
  peer_review: "No independent reviewer activity yet."
  release: "Requires coherent reviewed/frozen thesis and removal of all /work/ dependencies."
verified_main_blob_pins:
  thesis.md: c1a37ae11ce23a25bf8f87fe40277a4c84ebfda4
  docs/w1-research-framing.md: 301f33dfe89dec86bd2718373e96500a7574cf1d
  docs/w2-threat-model.md: cf7f4663e5fa88afda638ac7f0ec929b2b40b6e2
  docs/w3-architecture.md: 4fe685480d15c1bc0fa9c767b206e5bbb4dda7e0
  docs/w4-risks-and-evaluation.md: 8a71a3df58f51582524fc302fc3c722bceda73d3
  docs/traceability.md: 8a87dc3c6855538a248f30f8550ced5b1d4c84c5
  docs/source-register.md: 588f81eedf010cbcdff0cb3f8a2b800282f36ccb
  docs/prior-art-comparison.md: 5be042697f843f5a66a914948e173c2961914990
  docs/thesis-contribution-and-bias-assessment.md: 72270278bade7b027962365093698733362adb4b
  docs/multi-message-linkage-and-steganographic-carriage.md: f0e8f2e610f69520c12cd2791967f8d8f0e9dff0
  docs/optional-message-granularity.md: bc3050d897a53cd471fdb8d564f90875e9b4f22d
  work/PROJECT_STATE.md: d692b0b89c7ed2f1cb395a122a5722288a599a16
  work/WORKPLAN.md: d63b7579e007ba1ac8624ed632012649a96e943a
  work/WORK_LOG.md: 80fa98e2686732e24bc531b8b0bfb2d604287327
  work/lookup/TASKS.json: 1bb100028ca383ddf441b38d62641614214109f0
  work/lookup/TASKS.md: 16563aa9fc4d7d6b040ad463fd580c19aae51df2
next_task: "T-001 (blocked; resume only when primary-source access becomes available)"
immediate_next_action: "No unblocked substantive task remains. Resume T-001–T-004 only when their recorded source or controlled-environment blockers are resolved; keep diagrams, peer review and release gated."
