# The Invisible Postman · Research Source Register

**Purpose:** Track authoritative technical specifications, standards, protocol designs and research literature used to ground the thesis.  
**Research status:** Initial source-reconciliation pass · Not a completed literature review  
**Last checked:** 2026-11-18  
**Assurance:** Theory only · No implementation · Not audited.

## 1. How to use this register

This register is a provenance and claim-control tool, not a bibliography-count exercise. A source may support only a narrow technical statement. It does not validate the architecture as a whole.

For each source, distinguish:

- **What it specifies or studies:** the actual subject and scope of the document.
- **What it can support:** the narrow claims for which it is relevant.
- **What it cannot establish:** adjacent claims that must not be inferred from it.
- **Status:** final standard, informational RFC, protocol specification, implementation documentation, draft or research paper.
- **Review state:** bibliographic details checked, full text examined, or further examination required.

The date in this register records when the source was checked, not the date of the source itself. Recheck living specifications, standards and status pages before publication.

## 2. Cryptographic primitives and constructions

### SRC-001 · X25519 and X448

- **Source:** Langley, A., Hamburg, M. and Turner, S. (2016), *Elliptic Curves for Security*, RFC 7748.
- **Publisher/status:** IETF RFC; Informational.
- **Link:** https://www.rfc-editor.org/rfc/rfc7748
- **Relevant to:** W3 session-establishment discussion; thesis §6.
- **Supports:** The specified X25519 and X448 functions and their use in Diffie–Hellman key agreement.
- **Does not establish:** Peer identity, authenticated key exchange, key confirmation, transcript binding, a complete session protocol or anonymity.
- **Review state:** Primary specification inspected; protocol-composition implications remain to be analysed.

### SRC-002 · HKDF

- **Source:** Krawczyk, H. and Eronen, P. (2010), *HMAC-based Extract-and-Expand Key Derivation Function (HKDF)*, RFC 5869.
- **Publisher/status:** IETF RFC; Informational.
- **Link:** https://www.rfc-editor.org/rfc/rfc5869
- **Relevant to:** W3 key derivation and key separation; thesis §6.
- **Supports:** The extract-then-expand construction, use of salt and context-specific `info`, and derivation of output keying material from input keying material.
- **Does not establish:** That an arbitrary protocol using HKDF is secure, that the input secret is authenticated, or that HKDF is a password-hardening function.
- **Review state:** Primary specification inspected; application-specific context and key-separation requirements remain open.

### SRC-003 · EdDSA and Ed25519

- **Source:** Josefsson, S. and Liusvaara, I. (2017), *Edwards-Curve Digital Signature Algorithm (EdDSA)*, RFC 8032.
- **Publisher/status:** IRTF/CFRG RFC; Informational, not an Internet Standards Track specification.
- **Link:** https://www.rfc-editor.org/rfc/rfc8032
- **Relevant to:** W3 sender-authentication candidates; thesis §6.
- **Supports:** The EdDSA signature scheme, including Ed25519 and Ed448 definitions and test vectors.
- **Does not establish:** Human identity, key ownership by an intended person, authenticated key agreement, or the correctness of a protocol's signing context.
- **Review state:** Primary specification inspected; exact role, message coverage and identity binding are not selected.

### SRC-004 · ChaCha20-Poly1305

- **Source:** Nir, Y. and Langley, A. (2018), *ChaCha20 and Poly1305 for IETF Protocols*, RFC 8439.
- **Publisher/status:** IETF Standards Track RFC.
- **Link:** https://www.rfc-editor.org/rfc/rfc8439
- **Relevant to:** W3 authenticated message-protection candidates; thesis §§4 and 6.
- **Supports:** The IETF ChaCha20-Poly1305 AEAD construction and its nonce requirements.
- **Does not establish:** The correctness of an application protocol, safe nonce management by an implementation, or the XChaCha20-Poly1305 variant.
- **Important distinction:** RFC 8439 specifies the IETF ChaCha20-Poly1305 construction. It must not be cited as the specification for XChaCha20-Poly1305.
- **Review state:** Primary specification inspected; application-level nonce lifecycle remains open.

### SRC-005 · Argon2 and Argon2id

- **Source:** Biryukov, A., Dinu, D., Khovratovich, D. and Josefsson, S. (2021), *Argon2 Memory-Hard Function for Password Hashing and Proof-of-Work Applications*, RFC 9106.
- **Publisher/status:** IRTF/CFRG RFC; Informational.
- **Link:** https://www.rfc-editor.org/rfc/rfc9106
- **Relevant to:** Historical password-derived model and conditional alternative; W3 §2.5; W4 E10.
- **Supports:** Argon2's memory-hard design, variants, inputs, parameters and parameter-selection guidance.
- **Does not establish:** Sender authentication, peer identity, forward secrecy, or the suitability of one fixed parameter set for every device and deployment.
- **Review state:** Primary specification inspected; any future parameter profile requires hardware, latency and resource-exhaustion analysis.

### SRC-006 · XChaCha20-Poly1305 implementation documentation

- **Source:** libsodium documentation, *ChaCha20-Poly1305* and *XChaCha20-Poly1305 construction*.
- **Publisher/status:** Implementation/library documentation; not an IETF RFC or formal protocol standard.
- **Links:** https://doc.libsodium.org/secret-key_cryptography/aead/chacha20-poly1305 and https://doc.libsodium.org/secret-key_cryptography/aead/chacha20-poly1305/xchacha20-poly1305_construction
- **Relevant to:** Candidate AEAD discussion in W3 and thesis §6.
- **Supports:** The behaviour and API characteristics of libsodium's XChaCha20-Poly1305 construction, including its extended 192-bit nonce and the library's guidance on random nonces.
- **Does not establish:** Universal interoperability, a formal IETF specification for XChaCha20-Poly1305, or that the construction has been selected for this project.
- **Important distinction:** The libsodium documentation notes that XChaCha20 is not widely implemented outside libsodium and lacks a formal specification. Portability and interoperability are therefore explicit evaluation dimensions.
- **Review state:** Official library documentation inspected; no implementation dependency selected.

## 3. Protocol and key-management comparators

### SRC-007 · Messaging Layer Security (MLS)

- **Source:** Barnes, R. et al. (2023), *The Messaging Layer Security (MLS) Protocol*, RFC 9420.
- **Publisher/status:** IETF Standards Track RFC; Proposed Standard.
- **Link:** https://www.rfc-editor.org/rfc/rfc9420
- **Relevant to:** Comparison of authenticated group key establishment, message protection and asynchronous membership; W1 RQ2; W3; W4.
- **Supports:** A specified asynchronous group key-establishment protocol with forward secrecy and post-compromise security for groups.
- **Does not establish:** That MLS is the right protocol for this project's intended use, that an image-carriage route is useful, or that group and one-to-one messaging requirements are interchangeable.
- **Review state:** Abstract, protocol structure and security context inspected; detailed suitability comparison remains outstanding.

### SRC-008 · Signal PQXDH

- **Source:** Kret, E. and Schmidt, R., *The PQXDH Key Agreement Protocol*, Revision 3 (2023-05-24; page updated 2024-01-23).
- **Publisher/status:** Signal protocol specification.
- **Link:** https://signal.org/docs/specifications/pqxdh/
- **Relevant to:** Asynchronous first-contact key establishment, prekey publication and identity binding; W1 RQ1–RQ2; W3.
- **Supports:** A concrete protocol design for asynchronous shared-secret establishment using published identity/prekey material, with post-quantum forward secrecy and a stated authentication model.
- **Does not establish:** Anonymous agreement, absence of server-visible metadata, or a drop-in protocol for this architecture. The current specification explicitly describes the remaining classical discrete-log basis for mutual authentication in this revision.
- **Review state:** Official specification and security-section structure inspected; full comparison and threat-model mapping remain outstanding.

### SRC-009 · Signal Double Ratchet

- **Source:** Perrin, T. (editor), *The Double Ratchet Algorithm*, Revision 4 (2025-11-04).
- **Publisher/status:** Signal protocol specification.
- **Link:** https://signal.org/docs/specifications/doubleratchet/
- **Relevant to:** Per-message key evolution, forward-secrecy reasoning, post-compromise recovery concepts and out-of-order message processing; W1 RQ2/RQ4; W3; W4.
- **Supports:** A specified stateful ratcheting construction used after an initial shared secret, including symmetric-key and Diffie–Hellman ratchet steps and handling for out-of-order messages.
- **Does not establish:** That transport capsule fragmentation is the same problem as ratchet message ordering, or that a ratchet alone supplies identity verification, delivery, image carriage or a complete application.
- **Review state:** Revision 4 and table of contents inspected; detailed comparison with the proposed message lifecycle remains outstanding.

### SRC-010 · NIST pair-wise key establishment

- **Source:** NIST SP 800-56A Revision 3 (2018), *Recommendation for Pair-Wise Key-Establishment Schemes Using Discrete Logarithm Cryptography*.
- **Publisher/status:** NIST final publication; NIST planning note dated 2026-01-06 says the publication will be updated.
- **Link:** https://csrc.nist.gov/pubs/sp/800/56/a/r3/final
- **Relevant to:** Key agreement, key confirmation and key-establishment requirements; W3 session establishment.
- **Supports:** NIST's specified pair-wise key-establishment schemes and terminology.
- **Does not establish:** That a candidate X25519 composition in this project conforms to NIST requirements, or that the current revision will remain unchanged.
- **Review state:** NIST publication record inspected; update status must be checked again before final citation.

### SRC-011 · NIST key management

- **Source:** NIST SP 800-57 Part 1 Revision 5 (2020), *Recommendation for Key Management: Part 1 – General*; Revision 6 Initial Public Draft (2025-12-05).
- **Publisher/status:** Revision 5 is final; Revision 6 page is an initial public draft with comments closed 2026-02-05. A final Revision 6 publication was not identified in this source check.
- **Links:** https://csrc.nist.gov/pubs/sp/800/57/pt1/r5/final and https://csrc.nist.gov/pubs/sp/800/57/pt1/r6/ipd
- **Relevant to:** Key lifecycle, protection, compromise, rotation, archival and retirement; W1 RQ2/RQ9; W3 lifecycle.
- **Supports:** General key-management guidance and the need to address key type, purpose, protection and lifecycle.
- **Does not establish:** A project-specific identity, recovery or revocation policy.
- **Review state:** Publication records inspected; use Revision 5 as the final cited edition unless a final Revision 6 is confirmed.

## 4. Image metadata and concealment research

### SRC-012 · CIPA Exif standards

- **Source:** Camera & Imaging Products Association (CIPA), DC-008-Translation-2026, *Exchangeable image file format for digital still cameras: Exif Version 3.1* (published 2026-01-30); DC-010-2026, *Exif metadata for XMP* (published 2026-06-01).
- **Publisher/status:** CIPA standards.
- **Link:** https://www.cipa.jp/e/std/std-sec.html
- **Relevant to:** W2/W3/W4 image metadata inventory and image-carrier processing.
- **Supports:** The current Exif and Exif/XMP metadata specification landscape.
- **Does not establish:** Which fields a particular platform preserves, strips, rewrites or logs, or that a metadata-removal tool removes every relevant field.
- **Review state:** CIPA's official standards list and update history inspected; detailed field-level mapping remains outstanding.

### SRC-013 · IPTC Photo Metadata

- **Source:** IPTC Photo Metadata Working Group, *IPTC Photo Metadata Standard 2025.1*, revision 1 (2025-11-26).
- **Publisher/status:** IPTC specification.
- **Link:** https://www.iptc.org/std/photometadata/specification/IPTC-PhotoMetadata-2025.1.html
- **Relevant to:** W2/W3/W4 carrier metadata inventory, metadata allowlisting and removal verification.
- **Supports:** The semantics and technical expression of IPTC Core and Extension properties, including XMP namespaces and image-related descriptive, creator, rights and location fields.
- **Does not establish:** That every image format stores these fields identically or that removing embedded properties erases platform, host, network or access-log records.
- **Review state:** Current specification version and property structure inspected; field-by-field allowlist design remains outstanding.

### SRC-014 · Adobe XMP specifications

- **Source:** Adobe, *XMP Specifications*, including Part 1 (data model, serialization and core properties), Part 2 (additional properties) and Part 3 (storage in files).
- **Publisher/status:** Technical specification documentation; XMP is also covered by ISO 16684.
- **Link:** https://developer.adobe.com/xmp/docs/xmp-specifications/
- **Relevant to:** W2/W3/W4 metadata processing and reconciliation of embedded metadata representations.
- **Supports:** XMP's data model, serialization and embedding/storage concepts.
- **Does not establish:** Platform-specific retention or transformation behaviour.
- **Review state:** Official overview inspected; detailed format-specific requirements remain outstanding.

### SRC-015 · Image steganography and steganalysis survey

- **Source:** Kombrink, M. H., Geradts, Z. J. M. H. and Worring, M. (published 2024), *Image Steganography Approaches and Their Detection Strategies: A Survey*, ACM Computing Surveys, 57(2), Article 33, DOI: 10.1145/3694965.
- **Publisher/status:** Peer-reviewed survey article.
- **Link:** https://doi.org/10.1145/3694965
- **Relevant to:** Thesis §8; W4 E6; concealment and steganalysis evaluation.
- **Supports:** A broad survey of image-steganography and steganalysis research, with the abstract reporting a review of 456 references.
- **Does not establish:** The performance of any method selected for this project, resistance to a particular platform transformation, or a universal detectability threshold.
- **Review state:** Bibliographic record and abstract inspected; full-text examination and claim-level citation remain required.

### SRC-016 · The Loopix Anonymity System

- **Source:** Piotrowska, A. M., Hayes, J., Elahi, T., Meiser, S. and Danezis, G. (2017), *The Loopix Anonymity System*, Proceedings of the 26th USENIX Security Symposium, pp. 1199–1216.
- **Publisher/status:** Peer-reviewed USENIX Security conference paper.
- **Link:** https://www.usenix.org/conference/usenixsecurity17/technical-sessions/presentation/piotrowska
- **Relevant to:** W1 RQ3/RQ7/RQ8; W2 observer model; W3 train and discovery boundary; W4 E6/E9.
- **Supports:** A concrete low-latency mix-network design using Poisson mixing, cover traffic and deliberate message delays to resist traffic analysis under a stated adversary model.
- **Does not establish:** That variable image placement or per-carriage carrier uniqueness provides equivalent protection. Loopix is a distinct network architecture with traffic overhead, delay and infrastructure assumptions.
- **Review state:** Publisher abstract and bibliographic record inspected; full paper is available and detailed comparison remains outstanding.

### SRC-017 · Tor v3 rendezvous specification

- **Source:** Tor Project, *Tor Rendezvous Specification – Version 3*, live technical specification.
- **Publisher/status:** Maintained protocol specification; versioned v3 document, live source.
- **Link:** https://spec.torproject.org/rend-spec/rendezvous-protocol.html
- **Relevant to:** W1 RQ7; W2 discovery/observer model; W3 recipient discovery and train; W4 E6/E9.
- **Supports:** A concrete example in which discovery, introduction and rendezvous are explicit protocol functions with defined participants, descriptors, circuits and rendezvous values.
- **Does not establish:** That Tor's anonymity properties or threat model transfer to this architecture, or that a simple locator or changing image placement is an anonymous rendezvous mechanism.
- **Review state:** Current protocol page and rendezvous flow inspected; detailed comparison and version pinning remain outstanding.

### SRC-018 · Traffic analysis of encrypted instant messaging

- **Source:** Bozorgi, A., Bahramali, A., Rezaei, F., Ghafari, A., Houmansadr, A., Soltani, R., Goeckel, D. and Towsley, D. (2023), *I Still Know What You Did Last Summer: Inferring Sensitive User Activities on Messaging Applications Through Traffic Analysis*, IEEE Transactions on Dependable and Secure Computing, 20(5), pp. 4135–4153. DOI: 10.1109/TDSC.2022.3218191.
- **Publisher/status:** Peer-reviewed IEEE journal article; author-version PDF inspected.
- **Link:** https://doi.org/10.1109/TDSC.2022.3218191
- **Relevant to:** W1 RQ3/RQ8; W2 network-observer capabilities; W3 metadata and behavioural correlation; W4 E9.
- **Supports:** The paper's evaluated traffic-analysis attacks use timing and size characteristics of encrypted messaging traffic; its IMProxy countermeasure explores added delays and dummy traffic, with measurable performance/privacy trade-offs.
- **Does not establish:** That the same attack or accuracy applies to this proposed system, every messaging platform, image publication or every observer model.
- **Review state:** Author-version full text inspected; final publication details checked against IEEE journal index.

### SRC-019 · Metadata correlation in encrypted IM call services

- **Source:** Li, C.-Y. (2026), *Identity Leakage in Encrypted IM Call Services: An Empirical Study of Metadata Correlation*, Future Internet, 18(1), Article 12. Published online 2025-12-26. DOI: 10.3390/fi18010012.
- **Publisher/status:** Peer-reviewed open-access journal article.
- **Link:** https://doi.org/10.3390/fi18010012
- **Relevant to:** W1 RQ3/RQ7/RQ8; W2 network-observer model; W3 discovery and metadata; W4 E9.
- **Supports:** An empirical study of pairwise traffic correlation in three IM call services using endpoint identifiers, shared server connectivity, timing, traffic volume and signaling artifacts. The reported experiment uses two smartphones, three applications and 180 controlled call trials.
- **Does not establish:** Equivalent leakage for ordinary text messages, this project's image route, every platform or all network settings. Its authors explicitly identify broader device, OS and application coverage as future work.
- **Review state:** Full article sections covering threat model, method, experiments and conclusion inspected; generalisation must remain bounded to the study.


### SRC-020 · Oblivious Message Retrieval

- **Source:** Liu, Z. and Tromer, E. (2022), *Oblivious Message Retrieval*. In *Advances in Cryptology – CRYPTO 2022*, Lecture Notes in Computer Science 13507, pp. 751–781. DOI: 10.1007/978-3-031-15802-5_26.
- **Publisher/status:** Peer-reviewed CRYPTO 2022 conference paper; IACR-hosted full text inspected.
- **Link:** https://doi.org/10.1007/978-3-031-15802-5_26
- **Relevant to:** Thesis §8.4; W2 discovery/rendezvous threat; W3 train/discovery boundary; W4 E9; RQ7.
- **Supports:** Recipient-side discovery and retrieval can itself reveal message-recipient relationships even when message contents are encrypted. The paper formalises oblivious message detection/retrieval for a bulletin-board model and explains the privacy risks of long-lived detection keys and naive follow-up retrieval queries. It provides a technically demanding comparator for privacy-preserving discovery.
- **Does not establish:** A ready-made solution for image hosts, social platforms, variable image placement or this architecture. Its bulletin-board model, cryptographic machinery, assumptions and costs must be examined before any adaptation. It does not make ordinary random URLs or changing folders private.
- **Review state:** Full paper inspected, including system model, non-DoS and DoS threat models, formal OMR/OMD definitions, constructions, key-unlinkability treatment, performance evaluation, integration discussion and limitations. The paper explicitly excludes application-specific payload encryption, contact discovery, key establishment, privacy-preserving board posting and recipient subscription to detectors.

### SRC-021 · Media forensics on social media platforms

- **Source:** Pasquini, C., Amerini, I. and Boato, G. (2021), *Media forensics on social media platforms: a survey*. EURASIP Journal on Information Security, 2021, Article 4. DOI: 10.1186/s13635-021-00117-2.
- **Publisher/status:** Peer-reviewed open-access survey.
- **Link:** https://link.springer.com/article/10.1186/s13635-021-00117-2
- **Relevant to:** Thesis §§8.3, 8.6 and 8.8; W2 image-transformation and metadata threats; W3 image adapter; W4 E6/E9.
- **Supports:** Social and messaging platforms may resize, recompress and otherwise alter shared media; those transformations can both degrade forensic signals and leave platform-specific traces. The survey reviews source-camera identification, integrity verification and platform-provenance analysis, including metadata and image-signal cues.
- **Does not establish:** That every platform performs the same transformation, that every metadata field is stripped, or that carrier fingerprints can always be identified. The survey reports heterogeneous methods, platforms and conditions; project-specific route testing remains necessary.
- **Review state:** Full article overview, platform-processing discussion, source-identification findings and platform-provenance sections inspected; individual underlying studies and current platform behaviour remain to be checked.

### SRC-022 · Social engineering as situated deception

- **Source:** Steinmetz, K. F., Pimentel, A. and Goe, W. R. (2021), *Performing social engineering: A qualitative study of information security deceptions*. Computers in Human Behavior, 124, Article 106930. DOI: 10.1016/j.chb.2021.106930.
- **Publisher/status:** Peer-reviewed qualitative research article.
- **Link:** https://doi.org/10.1016/j.chb.2021.106930
- **Relevant to:** Thesis §8.7; W2 behavioural probing; W3 human-interaction boundary; W4 E9; RQ8.
- **Supports:** A grounded-theory analysis of 37 interviews with social engineers identifies social context, routines, timing, rapport, familiarity, authenticity and adaptation to a target's reactions as relevant features of deception practices.
- **Does not establish:** A quantitative probability of compromise, a universal behavioural model, or that every listed pattern is observable through this messaging architecture. The sample reports perpetrators' accounts of their practices, not a controlled experiment measuring recipient susceptibility.
- **Review state:** Full manuscript inspected for abstract, method, sample and reported themes; findings are used as bounded qualitative support, not as universal or causal claims.

### SRC-023 · Multipart parser resource exhaustion

- **Source:** Go project, issue #59153 (2023), *net/http, net/textproto, mime/multipart: denial of service from excessive resource consumption* (CVE-2023-24536).
- **Publisher/status:** Primary Go project vulnerability/fix record.
- **Link:** https://github.com/golang/go/issues/59153
- **Relevant to:** Thesis §§7.2 and 10.2; W2 parser/resource-exhaustion threat; W3 encapsulation and decapsulation limits; W4 E5.
- **Supports:** A real multipart parser could consume excessive CPU and memory when handling very large numbers of parts and small allocations; the Go project response added accounting improvements and explicit part/header limits. This is concrete evidence that multipart parsing requires resource bounds, not merely syntactic validation.
- **Does not establish:** A vulnerability in this proposed capsule format, a direct equivalence between MIME form parsing and authenticated capsule reassembly, or the correct numerical limits for this research. It is an implementation-level cautionary example, not a protocol proof.
- **Review state:** Primary issue description, failure mechanism and recorded remediation limits inspected; broader parser-security guidance and format-specific limits remain to be researched.

### SRC-024 · PerfOMR: Oblivious Message Retrieval with Reduced Communication and Computation

- **Source:** Liu, Z., Tromer, E. and Wang, Y. (2024), *PerfOMR: Oblivious Message Retrieval with Reduced Communication and Computation*, USENIX Security 2024.
- **Publisher/status:** Peer-reviewed USENIX Security conference paper.
- **Link:** https://www.usenix.org/conference/usenixsecurity24/presentation/liu-zeyu
- **Relevant to:** Thesis §8; W1 RQ7; W2 discovery and access-pattern threats; W3 recipient discovery; W4 privacy and cost evaluation.
- **Supports:** OMR constructions have concrete computation, communication and key-size costs; the paper proposes optimisations and a Ring-LWE-based variant to reduce these costs.
- **Does not establish:** That OMR is appropriate for this project's image-carriage setting, or that its privacy guarantees transfer to a different discovery protocol.
- **Review state:** Full PerfOMR paper inspected, including its system model, malicious-party receiver-privacy threat model, adapted OMR definition, Ring-LWE constructions, implementation benchmarks and Zcash integration considerations.

### SRC-025 · Oblivious Signaling

- **Source:** Shuhan, M. K. B., Baldimtsi, F. and Ateniese, G. (2026), *Oblivious Signaling*, USENIX Security 2026, pp. 4207–4226.
- **Publisher/status:** USENIX Security 2026 conference paper.
- **Link:** https://www.usenix.org/conference/usenixsecurity26/presentation/shuhan
- **Relevant to:** Thesis §8; W1 RQ7; W2 recipient privacy; W3 discovery/retrieval alternatives; W4 cost and privacy comparison.
- **Supports:** A distinct privacy-preserving delivery design that shifts work from recipient retrieval to sender-side uniform updates across encrypted inboxes, changing the cost model and the relationship between global traffic and recipient checking.
- **Does not establish:** That this construction fits the project's intended deployment, image-carriage route or operational constraints.
- **Review state:** Full USENIX paper inspected, including system model, formal receiver-privacy definition, malicious-server threat model, uniform encrypted-inbox update, implementation/evaluation, cost comparison and limitations. Receiver privacy is the focus; sender anonymity depends on an external anonymous channel, network-level metadata remains possible, correctness assumes protocol-following updates, and fixed-capacity FIFO inboxes evict older messages.

### SRC-026 · Dead-drop covert messaging pipeline

- **Source:** Bauer, L. A., Howes IV, J. K., Markelon, S. A., Bindschaedler, V. and Shrimpton, T. (2024), *Leveraging Generative Models for Covert Messaging: Challenges and Tradeoffs for "Dead-Drop" Deployments*, Proceedings of the ACM Conference on Data and Application Security and Privacy (CODASPY 2024), pp. 67–78. DOI: 10.1145/3626232.3653264.
- **Publisher/status:** Peer-reviewed ACM conference paper.
- **Link:** https://doi.org/10.1145/3626232.3653264
- **Relevant to:** Thesis §§3 and 8; W1 RQ5–RQ8; W2 platform and observer threats; W3 transport/discovery boundary; W4 route and operational evaluation.
- **Supports:** Practical covert messaging over public-platform dead drops involves pipeline-level algorithmic challenges and performance/security trade-offs beyond the embedding or cover-generation method alone.
- **Does not establish:** That its generative text-cover pipeline is equivalent to image-carried capsules, or that its proposed solutions transfer directly to this architecture.
- **Review state:** Full version inspected, including MBFTE construction, rendezvous/key-table model, overt/covert hints, platform constraints, fragmentation, retrieval, threat model, naturalness/detectability evaluation and limitations. The adversary cannot control the platform or observe fine-grained user actions/IP addresses; platform cooperation is explicitly left outside the model.

### SRC-027 · Provably Secure Covert Messaging Using Image-based Diffusion Processes

- **Source:** Bauer, L. A., Bao, W. and Bindschaedler, V. (2025), *Provably Secure Covert Messaging Using Image-based Diffusion Processes*, IEEE Conference on Secure and Trustworthy Machine Learning (SatML 2025).
- **Publisher/status:** Conference paper; bibliographic record and abstract located.
- **Link:** https://www.vbinds.ch/node/155
- **Relevant to:** Thesis §8; W1 RQ5/RQ6; W2 concealment and observer threats; W4 steganalysis/robustness evaluation.
- **Supports:** Image-based covert communication has been studied using diffusion-model outputs, including formal indistinguishability claims under the paper's stated model and empirical trade-offs among capacity, recovery and transformations.
- **Does not establish:** Equivalence to embedding protected capsules in externally hosted or user-selected images; the generated-image model and assumptions differ.
- **Review state:** Full paper inspected, including generated-image channel, pre-shared-key assumption, adversary model, latent-space indistinguishability argument, proof discussion, transformation assumptions and empirical evaluation. It explicitly does not study how the generated image is delivered; its target is low-volume covert communication, not frequent low-latency high-capacity messaging.

### SRC-028 · SophOMR: Improved Oblivious Message Retrieval from SIMD-Aware Homomorphic Compression

- **Source:** Lee, K. and Yeo, Y. (2026), *SophOMR: Improved Oblivious Message Retrieval from SIMD-Aware Homomorphic Compression*, 35th USENIX Security Symposium, pp. 3219–3238.
- **Publisher/status:** USENIX Security 2026 conference paper.
- **Link:** https://www.usenix.org/conference/usenixsecurity26/presentation/lee-keewoo
- **Full text:** https://www.usenix.org/system/files/conference/usenixsecurity26/sec26_prepub_lee.pdf
- **Relevant to:** Thesis §8; W1 RQ7; W2 recipient-privacy observer model; W3 discovery/retrieval comparison; W4 E6/E9.
- **Supports:** A 2026 single-server OMR construction that improves homomorphic compression using SIMD-aware techniques. Its reported evaluation compares against PerfOMR and reports concrete runtime, digest-size and key-size improvements under specified workloads.
- **Does not establish:** A complete messaging or publication architecture, contact discovery, sender anonymity, platform/carrier concealment, or protection against observations outside its stated public-board and message-recipient-linkage model.
- **Review state:** Full paper inspected, including OMR model, passive receiver-linkage threat model, construction, evaluation and comparison with PerfOMR. The paper states that its focus is efficiency and does not expand the underlying OMR privacy model.

### SRC-029 · InstantOMR: Oblivious Message Retrieval with Low Latency and Optimal Parallelizability

- **Source:** Liang, H., Liu, Z., Tromer, E., Xie, X. and Yu, Y. (2026), *InstantOMR: Oblivious Message Retrieval with Low Latency and Optimal Parallelizability*, 35th USENIX Security Symposium, pp. 4227–4246.
- **Publisher/status:** USENIX Security 2026 conference paper.
- **Link:** https://www.usenix.org/conference/usenixsecurity26/presentation/liang
- **Full text:** https://www.usenix.org/system/files/conference/usenixsecurity26/sec26_prepub_liang.pdf
- **Relevant to:** Thesis §8; W1 RQ7; W2 recipient-privacy observer model; W3 discovery/retrieval comparison; W4 latency, throughput and privacy evaluation.
- **Supports:** A hybrid TFHE/RLWE OMR construction targeting low latency and high parallelisability. The paper compares it with PerfOMR and SophOMR and identifies a latency/throughput trade-off: streaming and small-batch retrieval favour InstantOMR, while large accumulated batches can favour SophOMR.
- **Does not establish:** A complete messaging lifecycle, contact discovery, platform publication privacy, image-carriage concealment or broader network anonymity. Its stated OMR threat model protects recipient-message linkage; the conference paper defers correctness/integrity against malicious detectors to the full version.
- **Review state:** Full USENIX paper inspected, including system summary, OMR threat model, construction, benchmark methodology, performance trade-offs and scope statements. Formal details referenced as deferred to the full version are not treated as independently checked here.

### SRC-030 · Group Oblivious Message Retrieval (GOMR)

- **Source:** Liu, Z., Tromer, E. and Wang, Y. (2024), *Group Oblivious Message Retrieval*, IEEE Symposium on Security and Privacy 2024, pp. 4367–4385. DOI: 10.1109/SP54263.2024.00115.
- **Publisher/status:** Peer-reviewed IEEE S&P 2024 paper; IACR-hosted full text inspected.
- **Link:** https://doi.org/10.1109/SP54263.2024.00115
- **Full text:** https://eprint.iacr.org/2023/534.pdf
- **Relevant to:** Thesis §§5 and 8.4; W1 RQ7; W2 recipient/discovery observer model; W3 discovery/retrieval alternatives; W4 E9.
- **Supports:** Formal oblivious retrieval for ad-hoc and fixed recipient groups, extending single-recipient OMR. It defines group privacy, detection-key unlinkability and DoS-resistance variants, and evaluates FHE/lattice-based constructions. It demonstrates that group delivery and recipient retrieval privacy are established, technically developed areas.
- **Does not establish:** Application payload encryption, authenticated contact/key discovery, privacy-preserving board posting, image-carrier processing, platform transformation or a complete endpoint messaging protocol. The paper distinguishes its privacy adversary from the assumptions used for some integrity/DoS properties.
- **Review state:** Full paper inspected, including model, threat definitions, group constructions, lower bound, DoS analysis, benchmarks and discussion of private retrieval, multi-recipient encryption and MLS. No implementation or benchmark was reproduced.

### SRC-031 · Remise: Authorized Anonymous Communication Systems

- **Source:** Ravi, R., Shukla, P. and Vadapalli, A. (2026), *Remise: Authorized Anonymous Communication Systems*, 35th USENIX Security Symposium, pp. 3199–3218.
- **Publisher/status:** Peer-reviewed USENIX Security 2026 paper; official full text inspected.
- **Link:** https://www.usenix.org/conference/usenixsecurity26/presentation/ravi-rohan
- **Full text:** https://www.usenix.org/system/files/usenixsecurity26-ravi-rohan.pdf
- **Relevant to:** Thesis §§5, 8.4 and 9; W1 RQ7/RQ9; W2 server/network observer assumptions; W3 discovery and authorization boundary; W4 E9.
- **Supports:** A two-server DORAM-based anonymous communication system with an anonymous bulletin-board mode and an authorized communication-channel mode. It studies hidden access indices, writer-reader relationships, secret-shared authorization tokens, cover traffic and revocable read access. Its model includes a global network adversary observing client-server communications.
- **Does not establish:** A general image-carriage or social-platform media pipeline, the proposed endpoint identity/message-protection protocol, image metadata minimisation, platform transformation tolerance or human behavioural unlinkability. Privacy requires non-colluding servers; integrity requires both servers to follow the protocol; servers are assumed semi-honest. RemiseCC's read tokens are distributed out of band, and the paper identifies privacy-preserving token distribution as open. A malicious server may drop writes.
- **Review state:** Full USENIX paper inspected, including system taxonomy, threat model, ideal functionality, DORAM and authorization mechanisms, security claims, evaluation and limitations. No implementation or performance result was reproduced.

### SRC-032 · Echomix: a Strong Anonymity System with Messaging

- **Source:** Infeld, E. J., Stainton, D., Ryge, L. and Threebit Hacker (2025), *Echomix: a Strong Anonymity System with Messaging*, arXiv:2501.02933v2 (paper dated October 2024).
- **Publisher/status:** arXiv preprint; not recorded as peer-reviewed conference publication in the inspected record.
- **Link:** https://arxiv.org/abs/2501.02933
- **Full text:** https://arxiv.org/html/2501.02933v2
- **Related implementation/documentation:** Katzenpost, https://katzenpost.network/; live threat model, https://katzenpost.network/docs/threat_model/
- **Relevant to:** Thesis §§3, 5, 8 and 10; W1 RQ3/RQ5/RQ7/RQ8/RQ9/RQ10; W2 global and active observers, compromised contacts and role collusion; W3 service, discovery, storage and carriage boundaries; W4 E6/E9.
- **Supports:** An integrated practical mix-network and messaging design combining global and active adversary analysis, traffic/decoy coupling, anonymous service access, BACAP capability-derived unlinkable storage locations, Pigeonhole asynchronous messaging, couriers and replicas, reliability/backfill and tombstone semantics, and hybrid post-quantum Sphinx packet formats. It explicitly analyses statistical disclosure from human online routines and role-specific collusion.
- **Does not establish:** That its guarantees transfer to ordinary image-hosting/social-platform routes, image recompression/transcoding/metadata rewriting, external platform account and engagement records, or the proposed carrier extraction pipeline. It is not evidence that image-carriage is novel. The paper's own operational costs and residual leakage must be retained.
- **Review state:** Full arXiv HTML paper inspected, including threat model, architecture, Loopix comparison, BACAP, Pigeonhole, reliability, collusion analysis, post-quantum packet variants, latency/bandwidth evaluation and conclusion. Katzenpost's current threat-model page was also inspected; its site states that the evolving page does not yet incorporate all designs in the paper. No code, benchmark or proof was independently reproduced.

### SRC-033 · MRAS: Matching Robust Adaptive Steganography for JPEG Images over Social Networking Platforms

- **Source:** Kumar, R., Bansal, S. and Bansal, R. K. (2026). *MRAS: a matching robust adaptive steganography scheme for JPEG images over social networking platforms*. Signal Processing, article 110172.
- **DOI:** https://doi.org/10.1016/j.sigpro.2025.110172
- **Relevant to:** Image-carrier transformation, JPEG recompression, payload recovery, robustness/undetectability/imperceptibility/capacity trade-offs and platform-specific evaluation.
- **Supports:** A recent robust JPEG steganography design explicitly targeting social-network processing. Publisher-indexed article text describes DCT-coefficient stabilisation, lattice-based adaptive embedding and post-processing; it reports BOSSbase benchmark experiments across payload/recompression conditions, extraction-error, PSNR/SSIM and steganalysis-classification metrics, comparisons with named prior methods, and LinkedIn platform testing.
- **Does not establish:** General robustness across platforms or processing paths, exact current LinkedIn behaviour, message-level identity/authentication, private discovery, lifecycle privacy or security of an end-to-end messaging architecture. Exact dataset split, payload values, platform/client configuration, full result tables and limitations are not verified from the accessible material.
- **Public implementation inspected (2026-11-16):** Author-linked [MRAS MATLAB repository](https://github.com/R4K35H-K/MRAS-JPEG-Steganography), pinned at commit `a14777047f82715bdbefcfed2cbb85427add23bc`. README, `MRAS_Demo.m`, `src/MRAS_Embed.m`, `src/MRAS_Extract.m` and `src/MRAS_PreProcess.m` inspected. The public demo loops over ten cover images, invokes a per-image embed/extract path, and simulates the channel by local JPEG re-encoding with MATLAB `imwrite`; each embedding call loads `SecretMsg.mat` and takes a prefix of its sample message. The inspected API does not expose a multi-image fragment manifest, cross-image set reconstruction or conversation/session linkage. This describes the inspected repository/demo, not every experiment reported in the paper. No code was run and no result reproduced.
- **Implementation evidence boundary:** The repository is author-published MATLAB reference code, not independent verification. Its local recompression demo must not be represented as the article's reported LinkedIn platform test.
- **Additional publisher-indexed pass (2026-11-16):** The ScienceDirect record exposes the paper's stated evaluation dimensions and comparator set more clearly: message-extraction error for robustness, PSNR/SSIM for imperceptibility, classifier error for steganalysis resistance, and comparisons including MINICER, DMMR, GMAS and SS. The indexed text confirms BOSSbase evaluation across payload/recompression conditions and a LinkedIn test, but does not expose the complete parameter tables, dataset split, platform procedure or limitations. This remains an indexed-section review, not full-text inspection or reproduction.
- **Review state:** Publisher-indexed article text, abstract, introduction and structured method/evaluation section snippets inspected. Direct publisher full-text retrieval returned access denied; full methods, tables and limitations remain unverified. No experiment was reproduced.

### SRC-034 · DRAS: Downward Recompression for Robust JPEG Steganography

- **Source:** Kumar, R., Bansal, S. and Bansal, R. K. (2026). *Dealing with downward recompression for robust steganography in high quality JPEG images*. Journal of Visual Communication and Image Representation, 118, article 104817.
- **DOI:** https://doi.org/10.1016/j.jvcir.2026.104817
- **Relevant to:** Downward JPEG recompression, stable coefficient selection, extraction error, payload capacity and real-platform validation.
- **Supports:** A recent method specifically addressing high-quality-to-lower-quality JPEG recompression. Publisher-indexed text describes RoLoS coefficient selection from cover/channel quantisation relationships and CARE predictive channel modelling with syndrome-trellis coding; the publisher reports Q95-to-Q85/Q80/Q75 evaluations, comparison with PMAS, extraction-error and runtime results, and tests on WhatsApp, LinkedIn and X.
- **Does not establish:** General carrier survival under resizing, transcoding or repeated arbitrary transformations; exact platform/client configurations; platform metadata/observer privacy; or end-to-end delivery security. The reported 87% extraction-error reduction and order-of-magnitude speed claim remain author-reported, not independently checked here.
- **Public implementation inspected (2026-11-16):** Author-linked [DRAS MATLAB repository](https://github.com/R4K35H-K/DRAS-JPEG-Steganography), pinned at commit `ad81f8785b473e03765ec3a859dad7ceb73ff9ea`. README, `DRAS_Demo.m`, `src/DRAS_Embed.m`, `src/DRAS_Extract.m` and `src/DRAS_GetRobustLoc.m` inspected. The public demo loops over ten cover images, locally recompresses each cover/stego image using MATLAB `imwrite`, and calls per-image embed/extract routines. Each embedding call loads `SecretMsg.mat` and takes a prefix of its sample message; the inspected API has no multi-image fragment manifest, cross-image set reconstruction or conversation/session linkage. This describes the inspected repository/demo, not every experiment reported in the paper. No code was run and no result reproduced.
- **Implementation evidence boundary:** The repository is author-published MATLAB reference code, not independent verification. Its local recompression demo must not be represented as the article's reported WhatsApp, LinkedIn or X platform tests.
- **Additional publisher-indexed pass (2026-11-16):** The ScienceDirect record exposes the stated DRAS evaluation structure: a RoLoS-ablation baseline and PMAS comparator, with robustness, undetectability, imperceptibility and runtime assessed across Q95-to-Q85/Q80/Q75 conditions and different payloads. The abstract/indexed text attributes an approximately 87% extraction-error reduction and order-of-magnitude speed improvement to the authors, and names WhatsApp, X and LinkedIn deployment tests. The accessible material does not provide the complete tables, sample sizes, payload settings, platform acquisition procedure or full limitations; these headline figures remain author-reported, not independently checked. This remains an indexed-section review, not full-text inspection or reproduction.
- **Review state:** Publisher abstract, highlights and indexed introduction/overview/evaluation snippets inspected. Direct full-text retrieval was not completed; complete methods, tables, platform configurations and limitations remain unverified. No result was reproduced.

### SRC-035 · Robust Steganography in Practical Communication: A Comparative Study

- **Source:** Qiao, T., Xu, S., Wang, S., Wu, X., Liu, B., Zheng, N., Xu, M. and Pan, B. (2023). *Robust steganography in practical communication: a comparative study*. EURASIP Journal on Image and Video Processing, 2023, article 15.
- **DOI:** https://doi.org/10.1186/s13640-023-00615-y
- **Relevant to:** Comparative evaluation of capacity, imperceptibility, undetectability and robustness under compression and social-network transmission.
- **Supports:** Empirical comparison across simulated channels and Facebook, Twitter and WeChat; highlights that simulated compression conditions do not fully represent platform processing.
- **Does not establish:** A universal platform transformation model or a complete message-delivery security architecture.
- **Review state:** Full publisher HTML inspected, including the dirty-channel model, three representative robust methods, metric definitions, simulated compression comparisons and Facebook/Twitter/WeChat experiments. The reported platform results are bounded to the paper's 50-image sample, payload and stated upload/download modes; no experiment was independently reproduced.

### SRC-036 · Destroying Robust Steganography in Online Social Networks

- **Source:** Zhu, Z., Li, S., Qian, Z. and Zhang, X. (2021). *Destroying robust steganography in online social networks*. Information Sciences, 581, 605–619.
- **DOI:** https://doi.org/10.1016/j.ins.2021.10.023
- **Relevant to:** Active carrier transformation, steganographic payload removal, adversarial media processing and image-quality-preserving attacks.
- **Supports:** A learned image-processing approach intended to remove hidden payloads while maintaining image quality, demonstrating that carrier processing may be adversarial rather than merely incidental. Indexed publisher text describes an attack module plus an optimisation module, BOSSbase 1.01 and BOWS2 datasets (10,000 512×512 images each), an 8,000/2,000 BOSSbase train/test split, and JPEG QF75 experiments.
- **Does not establish:** That every platform performs such processing, that the method defeats every current scheme, or that endpoint message protection and other lifecycle properties are addressed. Complete model configuration, training details, result tables and generalisation limits remain unverified.
- **Full-text status unchanged:** No public source-code repository or complete paper text was inspected in this pass; indexed sections remain partial evidence.
- **Additional publisher-indexed pass (2026-11-16):** The ScienceDirect record confirms the stated two-module end-to-end CNN design: an attack/filtering module intended to destroy hidden payloads and an optimisation module intended to restore image quality, with a joint loss. Indexed experimental text identifies BOSSbase 1.01 (8,000 training / 2,000 test images), BOWS2 as a second-dataset check, and JPEG QF75. The indexed material does not expose the complete attack/optimisation equations, training configuration, exact steganography methods and payloads, comparative result tables, runtime measurements or generalisation limits. The paper's broad abstract-level claim of countering multiple robust methods must therefore remain bounded to its reported experimental setup; it is not evidence that arbitrary contemporary schemes or all platform pipelines are defeated. This remains an indexed-section review, not full-text inspection or reproduction.
- **Review state:** Publisher abstract and indexed article sections inspected, including architecture, dataset split and QF75 experimental context. Direct full-text retrieval was not completed; complete method details, tables and limitations remain unverified. No model or experiment was reproduced.

### SRC-037 · Image Steganography Approaches and Their Detection Strategies: A Survey

- **Source:** Kombrink, M. H., Geradts, Z. J. M. H. and Worring, M. (2025). *Image Steganography Approaches and Their Detection Strategies: A Survey*. ACM Computing Surveys, 57(2), article 33.
- **DOI:** https://doi.org/10.1145/3694965
- **Publication record:** Published online 10 October 2024; volume 57, issue 2.
- **Relevant to:** Image embedding methods, steganalysis, evaluation practice and the breadth of established prior art.
- **Supports:** A broad survey based on 456 references, useful for preventing narrow or outdated claims about the image-steganography field.
- **Does not establish:** The novelty or security of this project's specific architecture, nor platform-specific performance of any proposed route.
- **Review state:** Full 40-page published survey examined from the University of Amsterdam repository copy, including scope, literature-selection method, embedding taxonomy, steganalysis taxonomy, comparative performance discussion and practical implications. The survey itself is a secondary synthesis of 456 references; its reported cross-paper rankings inherit differences in datasets, methods and experimental settings and are not a controlled common benchmark. No underlying experiment was reproduced.

The [prior-art comparison](prior-art-comparison.md) synthesises the full-text reviews of SRC-020 and SRC-024–SRC-037 and pressure-tests candidate contributions A/B/C. It is a working synthesis, not a systematic literature review or originality determination.

### SRC-038 · Signal PQXDH and Double Ratchet current protocol specifications

- **Sources:** Signal, *The PQXDH Key Agreement Protocol*, revision 3 (2023-05-24; last updated 2024-01-23), https://signal.org/docs/specifications/pqxdh/; Signal, *The Double Ratchet Algorithm*, revision 4 (2025-11-04), https://signal.org/docs/specifications/doubleratchet/.
- **Relevant to:** A named conventional E2E protocol reference for asynchronous 1:1 session establishment, ratcheting, skipped/out-of-order messages, key evolution and protocol-specific replay limitations.
- **Supports:** PQXDH describes asynchronous key establishment using published prekey material and explicitly states that its mutual authentication in this revision is not post-quantum secure; its specification discusses replay of initial messages and key-reuse precautions. Double Ratchet revision 4 describes message-key evolution, DH ratcheting, skipped-message handling and bounded MAX_SKIP.
- **Does not establish:** Signal Messenger's complete service implementation, server-visible metadata, delivery/read receipts, attachment/file handling, current client release configuration or all product-level privacy properties. Protocol specifications are not a full deployed-service profile.
- **Client-release snapshot (checked 18 November 2026):** The official Signal GitHub repositories' latest non-prerelease releases were Android `v8.35.2` (tag commit `d507a800a61cd5819a3670fe71e84e103efa7bda`), iOS `8.37.0.1993` (commit `1c925a184f7d0412c64ad754bab2ed2cc09682e9`) and Desktop `v8.35.0` (tag commit `cb584b71326470abb8865bee5dd8c1b4631cbf9c`). These are client source/release pins only; they do not pin Signal's service backend, account settings, linked-device state, delivery/backup configuration or a tested deployment.
- **Review state:** Current official protocol specifications and latest public platform release tags inspected. The release tags provide a reproducible client snapshot, not a deployed-service profile. Product/service metadata, retention, delivery events, backup settings and actual account configuration remain unverified.

### SRC-039 · Dropbox file activity and shared-link permission documentation

- **Sources:** Dropbox Help, *How to view file activity in Dropbox*, updated 5 November 2026, https://help.dropbox.com/organize/file-activity; Dropbox Help, *How do I see who's viewing my files?*, updated 10 October 2023, https://help.dropbox.com/share/viewer-information; Dropbox Help, *How to set shared link permissions*, https://help.dropbox.com/share/set-link-permissions.
- **Relevant to:** A named file-host/shared-link candidate profile, including owner/editor-visible file activity, optional viewer information and link download controls.
- **Supports:** Dropbox's current file-activity help page says the feature is available to all users on dropbox.com and records additions, edits, moves, renames, version reverts and sharing/access changes; owners and people with Can edit access can see all file activity, while Can view users cannot. Viewer information is a separate setting: it can show current viewers, and eligible plans can expose viewer history when enabled. A guest opening a shared link without signing in appears as Guest rather than a named person; a direct download without previewing on dropbox.com does not appear in viewer information. Plan eligibility, account settings and link configuration therefore materially affect the observer view. Disabling downloads through a shared link does not prevent recipients saving content by other means.
- **Does not establish:** End-to-end encryption of application-protected message content, anonymity, absence of provider-side access/metadata, or a guarantee that link permissions prevent copying. Any client-side protected-object wrapper is a comparison condition, not a Dropbox feature claimed by these sources.
- **Additional sharing-path source (11 November 2026):** Dropbox's current *How to share in Dropbox* guide distinguishes direct invitations (recipient must sign in with a Dropbox account to view/edit) from view-only shared links (can be used without an account). Link restrictions apply to users entering through that link; directly invited users and people who already have access retain their existing permissions. Invited collaborators may share the item onward. This means “Dropbox shared link” is not one uniform identity or permission profile; the access path must be fixed before testing.
- **Profile boundary:** The documentary baseline is a browser-based view-only shared-link route. Desktop/mobile app versions are not pinned because the current comparison does not yet select those clients. A controlled evaluation must record the actual account plan, link type, password/expiry/download settings, viewer-info toggle, recipient sign-in state, preview-versus-direct-download path and owner/editor roles.
- **Review state:** Current official help pages inspected; no Dropbox account, file, link or live sharing workflow tested. The profile is documentation-pinned, not account- or deployment-pinned.

### SRC-040 · Katzenpost Pigeonhole protocol and deployment documentation

- **Sources:** Katzenpost, *Pigeonhole Protocol Specification*, https://katzenpost.network/docs/specs/pigeonhole/; Katzenpost, *Introduction to Pigeonhole Protocol*, 5 November 2026, https://katzenpost.network/blog/2026/11/05/introduction-to-pigeonhole-protocol/; Katzenpost project repository, https://github.com/katzenpost/katzenpost.
- **Relevant to:** A current named storage/messaging profile above a mix network, capability-controlled asynchronous streams, courier/replica separation, fixed-size boxes, retention and network-independent composition.
- **Supports:** The project documentation describes Pigeonhole as a storage layer using BACAP capabilities, couriers and replicas; the November 2026 article describes Pigeonhole as a network-independent abstraction that can run over more than one underlying network. The current Pigeonhole specification also defines AllOrNothing streams, which provide an atomic success/failure view for a set of associated writes to a replica or second-party client reader; it specifies courier-mediated reads/writes, replica roles, duplicate-envelope handling, a replica-epoch acceptance window corresponding to roughly two weeks of data retention at the stated one-week default epoch, and a minimum four-replica deployment requirement for the specified intermediate/final replica disjointness property. The repository describes implemented BACAP/Pigeonhole components and points to normative specifications.
- **Does not establish:** That Pigeonhole alone provides the full anonymity properties of Echomix; those depend on the underlying network and deployment. The public documentation is evolving and does not, by itself, pin a mutually compatible deployed release/configuration or independently validate all security claims.
- **Compatible source-release snapshot (checked 18 November 2026):** Katzenpost's canonical [build-from-source page](https://katzenpost.network/docs/build_from_source/) publishes one mutually compatible set: server-side components and `kpclientd` at `katzenpost v0.0.90` (tag commit `d5a6349a34c4a2d4bca587f4be86ce92f2873b12`); Rust/Python thin-client libraries at `thin_client 0.0.23` (commit `a92a130f136e60152d810557ed7f800743574664`); and `katzenqt 0.0.2` (tag commit `94175d5f7a0c8cfd1a2ebede83d33d786d7773d2`). The Go thin client is in the katzenpost repository at the server/client tag. These are mutually compatible source pins, not evidence of a running or independently audited deployment.
- **Maturity qualification:** The pinned build page warns that `katzenqt` is in active development and is not appropriate to rely on for anonymity, security or privacy. The Katzenpost repository README labels the project pre-alpha and not audited. Pigeonhole protocol/implementation availability must not be conflated with an assurance claim for the complete deployed stack or the UI client.
- **Pinned implementation source review (18 November 2026):** Read, without executing, the `v0.0.90` source at commit `d5a6349a34c4a2d4bca587f4be86ce92f2873b12`: `client/pigeonhole.go` (blob `06dae7d74339c4b7925546f796fdcf0b4fd7dc8b`); `courier/server/plugin.go` (blob `ef60bf2c6fdc98a7b9252a1c0de35e2f45b8eaa0`); `replica/handlers.go` (blob `c3f87077e0855184c14898bef00cde6853aad9e6`); `replica/state.go` (blob `fdafeaf7050f78a4eb6c5d304b62fbfb8529bc06`); and the Copy dispatch/status tests (blobs `c7a481d0e5a0a3fcccd8fa86fe3168aabe0b0566`, `77dc561652858f9fab0a948faf515dda866d27c1`). The protocol specification states that AllOrNothing gives atomic success/failure from a replica or second-party reader's perspective. In the inspected courier path, decoded destination envelopes are dispatched sequentially; a failed envelope returns `CopyStatusFailed` with its 1-based index after earlier envelopes may already have been dispatched. Each successful replica write is persisted independently by `state.handleReplicaWrite`; the inspected failure path contains no rollback of previously written destination boxes. Temporary-stream tombstoning is launched on the success path after all envelopes, not before an early failure return. This creates a specification/implementation question about partial reader visibility, not a confirmed vulnerability.
- **Pinned application-client review:** Also inspected `katzenqt 0.0.2` at commit `94175d5f7a0c8cfd1a2ebede83d33d786d7773d2`: README blob `21a161005a38c50c0071cf65042055aa8f700fe1` and `src/katzenqt/network.py` blob `ce2d081c91259dc68106f4484c99084b469bdc00`. The README describes pre-alpha developer software and warns against relying on it for anonymity, security or privacy. The inspected application receive path uses its own BACAP stream chunk assembler; `_try_assemble` returns a complete message only when a terminal `F` chunk and its contiguous predecessors decode, while gaps/open chains remain unassembled. Each received piece is persisted before that assembly decision, but conversation dispatch occurs only after a complete chain is assembled. No direct AllOrNothing call was identified in this inspected receive path. This is an application-level display/acceptance gate, not proof of atomic storage or a validation of the separate AllOrNothing copy operation.
- **Pinned thin-client API/test review (18 November 2026):** Inspected `thin_client 0.0.23` at commit `a92a130f136e60152d810557ed7f800743574664`: `katzenpost_thinclient/pigeonhole.py` (blob `eabd9e220374ea0dae72fccfcef6631fd0bbfcbd`), `src/pigeonhole.rs` (blob `5d8415d89e87c5d85fd1844abd38a110cc26b7ec`), `katzenpost_thinclient/core.py` (blob `f6412245ecb7f12593b41e7addc224e53e987cc0`) and `tests/test_new_pigeonhole_api.py` (blob `59b15ff1da5bdfda9dd465fe4bbf5d97c7d80235`). The sender API `start_resending_copy_command` accepts the temporary stream WriteCap and optional courier identity/queue, then waits for the courier result; it exposes no recipient ReadCap or reader-side commit control. The multi-channel tests read destination data only after successful Copy completion. The failure test `test_copy_onto_already_existing_box_error` deliberately fails on the first destination envelope, so it does not exercise a successful prefix followed by a later failure. No inspected thin-client test establishes concurrent or post-failure reader visibility. This is a test-coverage gap, not proof of a protocol defect.
- **Review state:** Current protocol documentation, project repository overview, 5 November 2026 project article, canonical pinned-version page, selected `v0.0.90` server/client files/tests and selected `katzenqt 0.0.2` application files inspected. Source tags, commit targets and relevant blob IDs are recorded above. No code build, tests, deployment, configuration capture or independent reproduction performed. Do not describe the possible partial-visibility issue as a confirmed vulnerability; a read-side test is still required.

### SRC-041 · HKDF extract-and-expand key derivation

- **Source:** Krawczyk, H. and Eronen, P. (2010), *HMAC-based Extract-and-Expand Key Derivation Function (HKDF)*, RFC 5869.
- **Publisher/status:** IETF Informational RFC.
- **Relevant to:** Extracting pseudorandom key material from input keying material; separating the extract-stage `salt` from expand-stage `info`; domain/context-specific key derivation.
- **Supports:** HKDF-Extract accepts an optional non-secret salt (defaulting to a hash-length zero string); salt may be reused and should be independent of input keying material. HKDF-Expand accepts `info` as application/context-specific information, which can include protocol identifiers, algorithm identifiers and identities. Extract concentrates existing entropy; it does not amplify entropy.
- **Does not establish:** A complete authenticated key-exchange protocol, identity verification, key confirmation, nonce uniqueness, replay protection or a safe application key schedule without a specified composition.
- **Review state:** Full RFC text inspected. No implementation or protocol composition tested.

### SRC-042 · Hybrid Public Key Encryption (HPKE)

- **Source:** Barnes, R. et al. (2022), *Hybrid Public Key Encryption*, RFC 9180.
- **Publisher/status:** IETF Standards Track RFC.
- **Relevant to:** A compositional reference combining KEM, KDF and AEAD; context setup; stateful nonce management; authenticated modes; exporter-based key separation; application-level non-goals.
- **Supports:** HPKE defines base, PSK, authenticated and authenticated-PSK modes; a key schedule with `info`; AAD for AEAD operations; stateful sequence-based nonce construction; and a secret-export interface. The RFC explicitly leaves transport of public parameters and recipient-key identification to the application. For multi-message contexts, the application must preserve order, detect loss and provide replay protection beyond the limited stream property. HPKE is not forward secret against recipient compromise in any mode.
- **Does not establish:** A complete asynchronous messaging service, application identity ceremony, general replay protection, loss-tolerant delivery, product metadata privacy or the project's selected protocol. Base mode does not authenticate the remote party.
- **Review state:** Full RFC text inspected, including Sections 5.1–5.3 and 9.7. No implementation or application protocol built.

### SRC-043 · Covert Communication through Robust Fragment Hiding in a Large Number of Images

- **Source:** Wang, P., Zhong, H., Feng, Y., Gong, L., Tang, Y., Lu, Z.-M. and Wang, L. (2024), *Covert Communication through Robust Fragment Hiding in a Large Number of Images*. Sensors, 24(2), 627.
- **DOI:** https://doi.org/10.3390/s24020627
- **Publisher/status:** Peer-reviewed open-access journal article; full publisher HTML inspected.
- **Relevant to:** Thesis §§7–8; W1 RQ4/RQ6/RQ7; W2 fragment mixing, carrier loss and platform observers; W3 multipart/carrier adapters; W4 E5/E6/E9.
- **Supports:** A direct multi-image covert-communication comparator. It fragments a secret file, embeds fragment number and content in images, redundantly embeds each fragment across multiple carriers, and reconstructs by collecting enough stego images. Its proposed carrier method combines a DFT-based synchronisation watermark layer and a DCT/QIM information watermark layer. The per-carrier header includes a marker and fragment number; redundant copies are combined using majority voting during reconstruction. The authors report recovery under stated rotation/scaling/cropping and carrier-loss experiments, including complete recovery with 30% of received images lost and partial recovery under higher loss.
- **Does not establish:** Endpoint cryptographic identity, authenticated sender/recipient/session binding, modern end-to-end message protocol semantics, privacy-preserving discovery, collection-level undetectability, or universal performance across current platforms. The paper's own text distinguishes robust watermarking from steganography; its recovery results must not be treated as proof of stealth. Author-reported experiments were not independently reproduced.
- **Review state:** Full publisher HTML inspected, including abstract, motivation, framework, fragment numbering/redundancy, DFT/DCT embedding approach and reported experiment summary. The loss experiment uses 1,000 images, 208 fragments and redundancy r=4 (832 embedded carriers plus 168 non-watermarked images); its success rate is defined as restored bytes divided by total file bytes. It reports full restoration with 30% image loss and 61.1% byte recovery with 80% image loss. The extraction algorithm majority-votes duplicate fragment copies and marks missing fragment bytes with `?`, so partial reconstruction is an explicit native outcome, not authenticated logical-message acceptance. The paper's scope and terminology distinctions are recorded; no implementation or result was reproduced.

### SRC-044 · Batch Steganography and Pooled Steganalysis

- **Source:** Ker, A. D. (2007), *Batch Steganography and Pooled Steganalysis*. In: Information Hiding, Lecture Notes in Computer Science, vol. 4437, pp. 265–281. Springer.
- **Publisher/status:** Peer-reviewed conference proceedings paper; full paper PDF inspected.
- **DOI:** https://doi.org/10.1007/978-3-540-74124-4_18
- **Link:** https://www.cs.ox.ac.uk/people/andrew.ker/docs/ADK18D.pdf
- **Relevant to:** Thesis §8; W1 RQ6/RQ7; W2 collection-level observer model; W4 E6 and multi-carrier evaluation.
- **Supports:** A warden can combine imperfect per-object steganalysis statistics across a batch. The paper formalises batch embedding and pooled detection, analyses alternative pooling strategies, and validates selected results using LSB replacement and large simulation runs. Its model fixes and makes known the batch size, assumes equal cover capacities and random selection of embedded covers, and relies on stated component-detector response assumptions; it explicitly leaves sequential acquisition/testing as a different problem. The abstract reports a square-root secure-capacity relationship, but the proceedings paper frames the capacity relation as a conjecture; the formal asymptotic theorem is proved in the separate follow-up SRC-045. Its pooled-detection analysis and LSB experiments remain bounded to the paper's detector and batch assumptions.
- **Does not establish:** The same quantitative result for modern adaptive JPEG methods, social-platform processing, robust watermarking, arbitrary cover distributions or this project's proposed carriers. Its theoretical and experimental assumptions must be retained; the numerical result is not transferred as a universal law.
- **Review state:** Full paper inspected, including problem formulation, shift assumptions, pooling strategies, theoretical results and LSB simulation section. No experiment was independently reproduced.

### SRC-045 · A Capacity Result for Batch Steganography

- **Source:** Ker, A. D. (2007), *A Capacity Result for Batch Steganography*. IEEE Signal Processing Letters, 14(8), 525–528.
- **DOI:** https://doi.org/10.1109/LSP.2006.891319
- **Publisher/status:** Peer-reviewed IEEE journal article; full author-hosted paper PDF inspected.
- **Relevant to:** Thesis §7.3 and §8.3; W1 RQ6/RQ7; W2 collection-level observer assumptions; W4 E6 and collection-level evaluation.
- **Supports:** A formal asymptotic square-root bound for secure steganographic capacity under a stated mathematical model. The theorem assumes equal cover capacities, a detector whose response follows the shift hypothesis (with stated regularity conditions), independent steganalysis errors across covers and a batch size known to both parties. It defines acceptable risk through explicit false-positive/false-negative bounds and proves upper/lower asymptotic bounds.
- **Does not establish:** A universal payload law for real-world platforms, dependent or adaptively selected images, robust watermarking, modern adaptive JPEG methods, sequential/longitudinal acquisition or arbitrary detector families. The paper explicitly identifies the known-batch and independence assumptions and notes that practical bounds may be loose.
- **Review state:** Full paper inspected, including theorem assumptions, proof outline, independence discussion and limitations. No independent proof reproduction or empirical replication performed.

### SRC-046 · Breaking Robust Data Hiding in Online Social Networks

- **Source:** Wei, P., Zhu, Z., Luo, G., Qian, Z. and Zhang, X. (2022). *Breaking Robust Data Hiding in Online Social Networks*. IEEE Signal Processing Letters, 29, 2682–2686.
- **DOI:** https://doi.org/10.1109/LSP.2022.3233539
- **Publisher/status:** Peer-reviewed IEEE journal article; publisher/author-indexed abstract and bibliographic records inspected.
- **Relevant to:** Active image sanitization, robust steganography and watermarking removal, image-quality-preserving transformations, adversarial carrier survival.
- **Supports:** The authors propose a general end-to-end secret-data-remover (SDR) for OSN image processing. The abstract describes a learned attack plus image-fusion and latent-renewal techniques intended to remove hidden data while maintaining or improving visual quality; it is presented as applicable to both robust steganography and robust watermarking.
- **Does not establish:** That a named social platform deploys SDR, that it defeats every current hiding method, or that its claims transfer to arbitrary image formats, payloads or platform pipelines. It does not address endpoint-authenticated messaging, message-set semantics or recipient discovery.
- **Review state:** Abstract and bibliographic metadata inspected through IEEE/author-indexed records. Full paper and complete experimental tables were not inspected; no reproduction performed.

### SRC-047 · Image Sanitization in Online Social Networks: A General Framework for Breaking Robust Information Hiding

- **Source:** Zhu, Z., Wei, P., Qian, Z., Li, S. and Zhang, X. (2023). *Image Sanitization in Online Social Networks: A General Framework for Breaking Robust Information Hiding*. IEEE Transactions on Circuits and Systems for Video Technology, 33(6), 3017–3029.
- **DOI:** https://doi.org/10.1109/TCSVT.2022.3224243
- **Publisher/status:** Peer-reviewed IEEE journal article; publisher/author-indexed abstract and bibliographic records inspected.
- **Relevant to:** Active image sanitization, scaling-aware payload removal, adversarial transformation and image-quality constraints.
- **Supports:** The abstract describes a sanitization framework with two neural networks: Scaling-Net for oversized images and SC-Net for other images, plus a discriminator for adversarial image-quality optimisation. It targets robust information hiding that survives lossy OSN channels, including methods resistant to scaling. The authors report source code and pretrained models.
- **Does not establish:** That any particular platform deploys this framework, that all robust hiding methods are defeated, or that image sanitization supplies a complete platform-side privacy/security policy. It does not define endpoint identity, authenticated message-set membership or delivery semantics.
- **Review state:** Abstract, DOI/bibliographic metadata and author-indexed source-code availability inspected. Full paper, full result tables and code repository have not yet been reviewed; no reproduction performed.

### SRC-048 · Covert Communication in Sanitized Online Social Networks

- **Source:** Zhu, Z., Ba, Z., Li, G., Qian, Z. and Zhang, X. (2025). *Covert Communication in Sanitized Online Social Networks*. 2025 IEEE International Workshop on Information Forensics and Security (WIFS), pp. 144–149.
- **DOI:** https://doi.org/10.1109/WIFS66636.2025.00033
- **Publisher/status:** Peer-reviewed IEEE workshop/conference paper; IEEE abstract and author-indexed bibliographic record inspected.
- **Relevant to:** Adversarial adaptation to active sanitization, keyed receiver recovery, robust covert communication under a declared sanitizer.
- **Supports:** The abstract describes joining a sanitizing network with a decoder whose weights are generated from a secret seed. The sender iteratively optimises a cover image so the sanitiser's output triggers the decoder to produce the intended secret; an authorised receiver with the seed reconstructs the decoder and recovers the data from the sanitised image.
- **Does not establish:** General robustness across sanitizers or platforms, anonymity, authenticated human identity, recipient discovery, conversation/message-set semantics or a complete secure messaging protocol. The full method and evaluation conditions remain uninspected.
- **Review state:** IEEE abstract and author-indexed publication record inspected. Full paper and experimental details unavailable in this pass; no method or result reproduced.

### SRC-049 · Provably Secure and Robust Training-Free GIF Steganography

- **Source:** Wang, H., Sun, L., Zhu, Z., Jiang, Q., Zhang, X. and Qian, Z. (2026). *Provably Secure and Robust Training-Free GIF Steganography*. IEEE Transactions on Multimedia, 28, 12544–12554.
- **DOI:** https://doi.org/10.1109/TMM.2026.3718262
- **Publisher/status:** IEEE journal publication metadata, author-linked implementation README and selected implementation files inspected.
- **Relevant to:** Animated-image carriage, frame-level redundancy, majority-vote recovery, diffusion-based hiding and the distinction between one multi-frame carrier and multiple separate image carriers.
- **Supports:** The README and inspected code describe a 16-frame pipeline with two repetition levels: intra-frame repetition of each secret bit and inter-frame majority voting across 16 frame reconstructions. Each frame receives an independently generated ChaCha20 key and nonce in the PyCryptodome path; the code stores per-frame key material locally. The sender path writes individual PNG frame files, and the receiver reads 16 frame PNGs plus local key and ground-truth files. The README documents OTP and ChaCha20 modes, AnimateDiff generation, DDIM-inversion extraction and simulated JPEG-distortion evaluation instructions.
- **Implementation observations and limits:** The inspected receiver asserts that the extracted frame/key lists equal the configured frame count (16); missing-frame erasure tolerance is therefore not established by this code path, despite majority voting across frame-level bit errors. The inspected StreamCipher uses raw ChaCha20 encryption/decryption without an authentication tag visible in this path; the README's IND-CPA description must not be read as authenticated integrity. If PyCryptodome is unavailable, the code falls back to a 32-bit seeded NumPy PRNG XOR explicitly labelled TEST ONLY. The group ID is used in local filenames and generation-seed handling, not as an authenticated message-set identifier. These are code-reading observations, not a security audit.
- **Does not establish:** Multi-post or multi-image fragment-set semantics, conversation linkage, platform-specific GIF transformation behaviour, recipient discovery or a complete endpoint-controlled messaging protocol. The paper's formal security claims and experimental tables have not been independently inspected; repository code has not been audited or reproduced.
- **Implementation provenance:** Public repository https://github.com/SRope-2/Provable-GIF-Stego, branch main, commit 4a5d2503623b06d17517ecf7a8b7527e1edc315d (2026-05-09). Inspected blobs: README c6a3fd63324404992f5b84c529b20afb09f4f3b1; core/method_core.py a024cf92893c5fb8411f1ded9c9d64488914757c; scripts/run_stego.py e41bb02cd90499c9774b60ef5343415a1630a93b; core/pipeline_stego.py 557252922bc079e85573e0ea6ffcf4dd241e34a3.
- **Review state:** README, core/method_core.py, scripts/run_stego.py and selected pipeline code inspected at the pinned repository revision. The code was read but not executed, modified or independently audited. Paper full text and formal security argument remain unreviewed; no reproduction performed.

## 7.2.1 SRC-046–SRC-048: additional access and implementation inspection (2026-11-17)

A further public-source retrieval pass was performed for the three sanitisation/counter-adaptation references. This adds source-specific evidence but does not upgrade any of the papers to full-text review.

- **SRC-046 · SDR:** The OpenReview record URL identified by the public scholarly index redirects in this environment to an automated browser-verification challenge; the full paper/PDF could not be retrieved. The available abstract is consistent across IEEE/author-indexed records: a general end-to-end Secret Data Remover (SDR) for robust steganography and robust watermarking, with image-fusion and latent-renewal techniques intended to improve image quality while removing hidden data. This remains abstract-level evidence. No complete architecture, training configuration, attacked-method list, dataset split, quantitative table or limitations were inspected. No code was located or executed.
- **SRC-047 · Scaling-Net / SC-Net:** The author-linked repository was located at [zyzhu19/Image-Sanitization](https://github.com/zyzhu19/Image-Sanitization), default branch `main`. Its README was fetched and inspected (blob `fc058c120d1b8dbb1486c198c5448955d905a916`). The README identifies the repository as public code for the cited TCSVT paper and describes two networks, Scaling-Net and SC-Net, with colour and grayscale model variants. Its brief Chinese usage instructions say to place stego images in `test-data`, choose a model under `model`, run `testmy.py`, and find outputs in `test_result`; it states that PSNR, SSIM and NIQE were measured using MATLAB R2020b built-in functions. The README points to a Baidu-hosted download for model material. Attempts to fetch `testmy.py`, `test.py`, `model/README.md` and `requirements.txt` through the available GitHub file interface returned 404; repository code, model files, commit-pinned source implementation and experimental outputs were therefore not inspected. Do not describe the implementation as code-reviewed or reproduced. The README is implementation-discovery evidence only.
- **SRC-048 · Sanitizer-aware covert communication:** The IEEE Xplore record is accessible at [10.1109/WIFS66636.2025.00033](https://ieeexplore.ieee.org/abstract/document/11458538) and provides the abstract and publication metadata. It describes joining a sanitizing network with a decoder whose weights are generated from a secret seed, then iteratively optimising a cover image so the sanitiser's output causes the joined decoder to produce the intended secret. A receiver holding the seed rebuilds the decoder and recovers data from the sanitised image. IEEE metadata gives WIFS 2025, Perth, 1–4 December 2025, and the record was added to Xplore on 2 April 2026. ResearchGate explicitly reports no full text available; no full paper, complete algorithm, seed/key derivation, evaluation tables, sanitizer set, image-quality results or limitations were inspected. The abstract supports only a specific sanitizer-aware counter-adaptation proposal, not general robustness across unknown sanitizers or an authenticated messaging protocol.

### T-002 access outcome

- SRC-047's public code repository has now been located and its README inspected, but the actual implementation and pretrained model material remain unavailable through the inspected GitHub paths; the README points to an external Baidu download. Repository presence must not be equated with reproducible implementation access.
- SRC-046 and SRC-048 remain abstract/metadata-level reviews. Full papers were not obtained in this pass.
- No code was executed, no model was run, and no result was reproduced or independently checked.
- The next useful action is to seek complete copies of SRC-046 and SRC-048 and a retrievable snapshot of SRC-047 source/model files; meanwhile preserve these precise access boundaries and continue with the next unblocked research task.

## 7.2.2 SRC-049: publisher-preview and author-page cross-check (2026-11-17)

A further search located an indexed abstract/summary for the IEEE TMM article and the corresponding author's publication page. No full paper, proof appendix or complete experimental tables were obtained; the existing review boundary remains unchanged.

- The indexed abstract-level summary describes a training-free GIF steganography pipeline in which the sender duplicates and encrypts a secret, maps it into latent variables, integrates those variables with text/motion conditioning during iterative diffusion denoising, and generates a GIF. The receiver splits the GIF into frames and extracts from individual frames; a validation stage calibrates inter-frame comparisons. The summary describes distribution alignment to a standard Gaussian as the basis for a theoretical undetectability claim and reports near-100% accuracy under various attacks. These are author/publisher-indexed claims, not independently checked results or a reviewed formal proof.
- This abstract-level description is consistent with the already inspected repository's broad architecture (diffusion-generated GIF, frame-wise extraction and inter-frame majority voting), but it does not resolve the code-level limits recorded above: the inspected receiver expects the configured 16-frame set, local key/watermark material is required, the inspected ChaCha20 path shows no authentication tag, and the fallback PRNG is explicitly TEST ONLY. The paper may define additional security mechanisms not visible in the selected code; do not infer that it does not.
- The author publication page links to the public implementation, confirming provenance of the repository pointer. The paper is a comparator for redundancy and recovery *within one animated carrier*. It is not evidence of a multi-post fragment manifest, authenticated cross-carrier membership or conversation/session continuity.
- Full text, formal security definitions/proof assumptions, attack set, evaluation protocol, complete accuracy tables and limitations remain unreviewed. No code was run and no result reproduced.

## 5. Claim-to-source map

| Thesis/research claim area | Primary or high-value sources | Remaining work |
|---|---|---|
| X25519 key agreement primitive | SRC-001; SRC-010 | Separate primitive from authenticated protocol; examine key confirmation and identity binding |
| HKDF and key separation | SRC-002; SRC-010; SRC-041 | Define context inputs, labels, key purposes and transcript binding in any future protocol; distinguish salt from info |
| Ed25519 signatures | SRC-003 | Specify what is signed, under which identity key, and how that key is verified |
| AEAD and nonce handling | SRC-004; SRC-006; SRC-042 | Do not conflate ChaCha20-Poly1305 with XChaCha20-Poly1305; define nonce state, ordering, loss, replay and limits |
| Password-derived alternative | SRC-005 | Select parameters only after device/resource and offline-guessing assumptions are stated |
| Authenticated key establishment | SRC-007–SRC-010; SRC-038; SRC-041–SRC-042 | Compare 1:1 and group protocols, asynchronous requirements, identity models, transcript binding and application responsibilities |
| Key lifecycle | SRC-010–SRC-011 | Recheck current NIST revisions and derive project-specific lifecycle semantics |
| Image metadata and platform transformations | SRC-012–SRC-014; SRC-021 | Separate semantic metadata from format/codec and forensic fingerprints; test each named route and platform instead of assuming universal stripping |
| Mixnet-backed messaging, global observers and integrated discovery/reliability | SRC-016; SRC-032 | Compare route-native guarantees, role collusion, traffic coupling, capability distribution, human routine leakage and image-platform-specific residual observations |
| Steganography and steganalysis | SRC-015 | Read full survey; define detector, dataset, payload rate, transformation chain and false-positive/negative metrics |
| Multi-image fragment carriage and batch steganalysis | SRC-043–SRC-045; SRC-049 | Separate robust watermarking, batch detection and bounded capacity theory; distinguish multi-frame GIF redundancy from multi-object fragment sets and retain each source's assumptions |
| Active sanitization and counter-adaptation | SRC-036; SRC-046–SRC-048 | Compare passive platform transformation, learned sanitization, scaling-aware sanitization and keyed sanitizer-aware covert communication; do not infer any platform deployment or universal success |
| Recipient discovery and transport unlinkability | SRC-016; SRC-017; SRC-020; SRC-024; SRC-025; SRC-028; SRC-029; SRC-030; SRC-031 | Compare full-scan, rendezvous, capability, OMR-family variants, oblivious signaling and mix-network mechanisms; state their distinct models, costs and assumptions |
| Traffic-level behavioural correlation and social graph inference | SRC-018; SRC-019 | Map their specific observer models and measurable timing/size/flow features to the proposed route; do not generalise beyond their tested settings |
| Human social engineering and interpersonal behavioural mimicry | SRC-022; SRC-018–SRC-019 for adjacent traffic/behavioural evidence | Separate qualitative perpetrator accounts, measured traffic features and unverified project-specific behavioural propositions; add recipient/usability studies where needed |
| Multipart transport reconstruction and parser safety | SRC-009 as a protocol comparator; SRC-023 as an implementation-level resource-exhaustion example | Specify authenticated manifests and reassembly separately from parser resource budgets; do not equate MIME parsing with capsule parsing |

## 6. Research gaps and source discipline

The initial source pass is strongest on cryptographic primitives, established messaging protocols and image metadata standards. It is not yet sufficient to support the thesis's complete claims.

Priority research gaps:

1. Authenticated key-establishment composition, identity assurance, key confirmation and deniability distinctions.
2. Protocol state, replay, forward secrecy, post-compromise security and device replacement.
3. Traffic analysis, rendezvous discovery, mix systems, cover traffic, access-pattern correlation and the usability/latency cost of obfuscation.
4. Human behavioural linkability, usable privacy and social-engineering resistance.
5. Image transformation and platform-specific media processing.
6. Multipart manifest design, parser/resource-exhaustion risks and safe reconstruction.
7. Steganalysis methodology, datasets, detector assumptions and reproducibility.
8. Comparative research on image-carried protected data versus simpler file and messaging routes.
9. Privacy-preserving recipient discovery and retrieval, including full-scan, stable locators, capability-style references, OMR/GOMR, oblivious signaling, two-server DORAM, and the cost of decoys or query hiding.
10. Platform-specific image transformations and forensic fingerprints, including the distinction between removable descriptive metadata and technical image-signal traces.
11. Resource-bounded parsing and reassembly: byte, part, header, nesting, CPU, memory, disk, decompression and lifetime budgets.
12. Whole-pipeline covert/dead-drop messaging research, image-generation-based covert channels, group retrieval and authorized anonymous communication; distinguish these from image-carried capsules and endpoint-controlled cryptographic messaging.

Rules:

- Prefer primary specifications and peer-reviewed work over summaries or vendor marketing.
- Use implementation documentation to describe that implementation, not to claim a universal standard.
- Record draft/final status and version. Do not cite a draft as a final standard.
- Do not cite an abstract as though the full paper has been examined.
- Do not use a primitive specification to claim a complete secure protocol.
- Cite sources at the claim they support and preserve limitations alongside the claim.
- A source's inclusion is not endorsement of the source's design or proof that the project should adopt it.

## 7.1 SRC-033–SRC-037 review outcome (2026-11-16; expanded indexed-text inspection)

- **SRC-033 MRAS:** Expanded partial inspection. Publisher-indexed text exposes the introduction, design outline and evaluation-section snippets: DCT-coefficient stabilisation, lattice-based adaptive embedding, post-processing, BOSSbase payload/recompression experiments, extraction-error, PSNR/SSIM and steganalysis-classification metrics, named comparator methods and LinkedIn testing. Direct full-text retrieval returned access denied; full tables, exact dataset/payload settings, platform configuration and limitations remain unverified. Do not describe this as a complete full-text review or general platform validation.
- **SRC-034 DRAS:** Expanded partial inspection. Publisher-indexed text describes RoLoS quantisation-table-based coefficient selection and CARE predictive channel modelling with syndrome-trellis coding; indexed evaluation text identifies Q95-to-Q85/Q80/Q75 scenarios and comparison with PMAS. The publisher reports an 87% extraction-error reduction, an order-of-magnitude speed improvement and WhatsApp/LinkedIn/X tests. These remain author-reported claims; full methods, baseline details, tables, platform configurations and limitations remain outstanding.
- **SRC-035 Qiao et al.:** Full publisher HTML inspected. The paper defines capacity, imperceptibility, undetectability and robustness; compares transmission-channel matching, intermediate-image and DCT-sign approaches; and reports simulated JPEG plus Facebook, Twitter and WeChat tests. Its 50-image social-platform sample and stated payload/configuration are narrow. Results show materially different outcomes by platform and sending mode: some methods that performed well in simulated channels failed on platform paths; WeChat original-image and default/non-original sending behaved differently. The paper itself warns that a simple JPEG-compression channel is an inadequate model of platform processing. No experiment was reproduced.
- **SRC-036 Zhu et al.:** Expanded partial inspection. Publisher-indexed sections describe an end-to-end CNN with attack and image-quality optimisation modules; BOSSbase 1.01 and BOWS2 datasets of 10,000 512×512 images each; an 8,000/2,000 BOSSbase training/test split; and JPEG QF75 experiments. Full architecture/training details, complete result tables and generalisation boundaries remain unavailable. Do not infer platform deployment or universal defeat of current methods.
- **SRC-037 Kombrink et al.:** Full 40-page survey inspected. It classifies embedding approaches across spatial, transform and deep-learning domains, and steganalysis as visual, signature, targeted and universal. It emphasises poor generalisation across hiding methods, non-reversibility in some deep-learning approaches, and the need for comparable evaluations. Its topological comparisons are assembled from results reported by separate papers, not a unified controlled experiment. The survey is useful for taxonomy and claim discipline, not a direct benchmark of this project.

### Cross-source implications

1. Extraction robustness, visual imperceptibility, steganalysis resistance, endpoint authenticity/integrity and observer privacy are separate properties; success on one does not establish another.
2. Platform media processing is path-dependent and may involve more than one JPEG recompression. The Qiao study reports that simulated-channel performance did not reliably predict Facebook, Twitter or WeChat outcomes under its tested configurations.
3. Active transformation may target payload survival rather than merely detect steganography. SRC-036 and SRC-046–SRC-047 describe learned sanitization approaches; SRC-048 describes a keyed counter-adaptation. These are competing adversarial capabilities, not evidence of deployment by any named platform. A route evaluation must include extraction failure and integrity-safe rejection, not just detectability.
4. Multi-frame redundancy within one animated GIF (SRC-049) is a different carrier topology from fragmenting one message across separate image objects or posts. Evaluate frame loss/distortion, frame correlation and cross-frame recovery separately from account/time-window collection analysis.
5. A single universal detector or universal transformation model must not be assumed. The survey identifies generalisation as a major unresolved difficulty.
6. The strongest defensible next step is to define exact platform/version, upload method, account/post visibility, retrieval method, media type and client path for each image profile. Record unknown transformations as unknown until measured or sourced.

## 7.1.1 SRC-033, SRC-034 and SRC-036: further publisher-preview retrieval (2026-11-17)

A further retrieval pass used exact-title/DOI searches against the publisher records and secondary scholarly indexes, including the current ScienceDirect article previews. The publisher records continue to show institutional access or PDF purchase rather than an openly retrievable full article. Direct page opening returned HTTP 403 in this research environment. No lawful author/institutional full-text copy was located in this pass. The evidence below therefore extends the indexed-preview record; it does not change any source to full-text-reviewed.

- **SRC-033 MRAS:** The current publisher preview exposes substantially more of the introduction and section structure. It describes the paper's target as *matching recompression* (recompression at the same JPEG quality factor), distinguishes this from more general platform processing, and places the method in the STC-plus-distortion family. The paper's stated pipeline is DCT-coefficient stabilisation, lattice-based adaptive embedding in robust locations, and post-processing to correct embedding-induced distortion. The preview states that the BOSSbase experiments vary payload and recompression conditions and assess extraction error, PSNR/SSIM and steganalysis classification error; LinkedIn is the named live-platform test. The preview also names MINICER, DMMR, GMAS and sign steganography (SS) as comparators, and describes capacity limitations at higher embedding rates for some comparators. It does not expose the full equations, complete experimental tables, exact payload/dataset configuration, LinkedIn account/client/upload/retrieval procedure or full limitations. These remain author-described methods and results, not independently verified findings.
- **SRC-034 DRAS:** The current publisher preview exposes a more developed account of the problem and claimed method. It defines *downward recompression* as high-quality JPEG input being recompressed at a lower quality factor, with the resulting quantisation and loss of high-frequency coefficients reducing the available embedding domain. It contrasts this with matching-recompression methods and describes prior downward-recompression approaches, including PMAS as an iterative sender-side simulate-and-correct comparator. The proposed DRAS pipeline is RoLoS (Robust Location Selection), using cover/channel quantisation-table relationships to select coefficients claimed to remain stable, and CARE (Content-Adaptive Robust Embedding), combining predictive channel modelling with STCs in a single pass. The preview identifies a RoLoS ablation and PMAS comparison across payloads and Q95→Q85/Q80/Q75 conditions, assessing extraction robustness, undetectability, imperceptibility and computation time. It repeats the authors' approximately 87% extraction-error reduction and order-of-magnitude speed claims and names WhatsApp, LinkedIn and X platform tests. The preview does not expose the complete stability derivation, equations, parameter tables, sample counts, payload rates, platform procedure, complete results or limitations. The mathematical guarantee language in the abstract is therefore a claim to inspect in the full method, not a property established by this review.
- **SRC-036 Zhu et al.:** The current publisher preview confirms an end-to-end CNN receiving a stego image and producing a processed image, with an attack/filtering module followed by an image-quality optimisation module and a loss function intended to account for both objectives. The preview describes processing all uploaded images rather than relying only on a detector to identify stego images. It gives BOSSbase 1.01 and BOWS2 as the datasets, 10,000 spatial images of 512×512 per dataset, an 8,000/2,000 BOSSbase train/test split, and JPEG QF75. It does not expose complete module equations, training schedule/hyperparameters, the full set of attacked embedding methods and payloads, complete image-quality/payload-recovery tables, runtime measurements or cross-dataset/generalisation analysis. The paper's broad "universal" language must remain bounded to the tested methods and conditions, which the preview does not fully enumerate.

### Cross-source interpretation

The three papers address different positions in the carrier lifecycle and must not be collapsed into one robustness result:

1. **MRAS** addresses matching JPEG recompression and reports a LinkedIn test; it is not a general model of arbitrary resizing, format conversion, multi-hop processing or every platform.
2. **DRAS** addresses a specified high-to-lower-quality JPEG channel and reports WhatsApp, LinkedIn and X tests; its coefficient-stability guarantee is conditional on the assumed/predicted channel quantisation model. The live-platform tests do not, from the preview alone, establish that a platform's complete processing pipeline is known or stable.
3. **SRC-036** is an active sanitisation comparator, not merely a passive platform transformation. Its architecture deliberately modifies candidate uploads to remove hidden data while maintaining visual quality. It is evidence that an adversarial carrier processor is technically studied, not evidence that a named social platform deploys this model.

For all three, extraction-error performance is not evidence of message authenticity, authenticated fragment membership, set completeness, conversation continuity, sender/recipient identity, confidentiality or delivery. The inspected MRAS/DRAS demos remain per-image APIs without cross-image message-set reconstruction; that code observation is independent of what their papers may have evaluated internally. No experiment was reproduced and no source has been upgraded to full-text review.

**Acquisition result:** full texts remain outstanding. The next acquisition path is a direct author/institutional request or access through a subscribing library; until a complete copy is obtained and checked page-by-page, retain partial/indexed-preview status.

## 7.2 SRC-046–SRC-049 review outcome (2026-11-16)

- **SRC-046 Wei et al.:** IEEE/author-indexed abstract and metadata inspected. SDR is described as a general end-to-end remover for robust steganography and watermarking, using attack, image-fusion and latent-renewal components. Full paper/results remain unavailable.
- **SRC-047 Zhu et al.:** Abstract and author-indexed source-code availability inspected. Scaling-Net and SC-Net are described as separate sanitization paths, with a discriminator for image-quality optimisation. The repository and complete results remain to be inspected.
- **SRC-048 Zhu et al.:** IEEE abstract and author publication record inspected. The reported countermeasure is a secret-seed-conditioned decoder jointly optimised with the sanitizing network. Full method/evaluation unavailable; treat as a counter-adaptation concept, not a demonstrated general bypass.
- **SRC-049 Wang et al.:** IEEE metadata, author-linked README, core/method_core.py and scripts/run_stego.py inspected. The implementation uses intra-frame repetition and inter-frame majority voting across 16 frames; each frame has separate key/nonce material in the PyCryptodome path. The receiver asserts a full 16-frame set, so missing-frame erasure tolerance is not established. The inspected ChaCha20 path exposes no authentication tag; the fallback is a 32-bit NumPy PRNG explicitly marked TEST ONLY. The demo stores per-frame keys and ground truth locally and writes frame PNGs. These are code-reading observations, not an audit. The paper/formal security argument remains unreviewed.


### SRC-050 · StOMR: Stateful Oblivious Message Retrieval

- **Source:** Gouert, C., Lee, K., Mouris, D., Tselekounis, Y. and Watson, J.-L. (2026), *StOMR: Stateful Oblivious Message Retrieval*, ACM Conference on Computer and Communications Security (CCS 2026). DOI: 10.1145/3830454.3846701. Cryptology ePrint 2026/2369.
- **Publisher/status:** CCS 2026 paper; official IACR ePrint record identifies publication at CCS and supplies the DOI.
- **Links:** https://eprint.iacr.org/2026/2369 ; https://doi.org/10.1145/3830454.3846701 ; https://www.sigsac.org/ccs/CCS2026/program/schedule.html
- **Relevant to:** Thesis §§5 and 8; W1 RQ7; W2 discovery and receiver-privacy observers; W3 bootstrap, shared state and retrieval; W4 privacy/cost evaluation.
- **Supports at abstract level:** A stateful OMR model in which senders and receivers maintain lightweight private state; an OMR-KEM intended to establish that shared state without an out-of-band channel; and reported sender-signal-size reductions relative to PerfOMR, SophOMR and InstantOMR while preserving detector performance.
- **Does not yet establish for this review:** The detailed OMR-KEM construction, formal security definitions, setup/refresh/recovery assumptions, state compromise behaviour, complete leakage model, exact evaluation conditions or whether the stateful model changes the endpoint message-set acceptance problem. Do not infer these from the abstract.
- **Review state:** Official IACR ePrint metadata/abstract and the ACM CCS 2026 programme entry inspected. The linked full-text PDF request returned HTTP 403 in this review; the paper has **not** received full-text, construction, proof, code or benchmark review. Claims are therefore abstract-level only.


### SRC-051 · UnifOMR: Oblivious Message Retrieval with Near-optimal Concrete Efficiency

- **Source:** Fisch, B., Liu, Z., Tromer, E. and Wang, Y. (2026), *UnifOMR: Oblivious Message Retrieval with Near-optimal Concrete Efficiency*, ACM Conference on Computer and Communications Security (CCS 2026); Cryptology ePrint 2026/910.
- **Publisher/status:** CCS 2026 accepted/published-work record is corroborated by the authors' institutional publication listings; the IACR ePrint record identifies a major revision and publication elsewhere at CCS 2026.
- **Links:** https://eprint.iacr.org/2026/910 ; https://www.sigsac.org/ccs/CCS2026/program/accepted-papers.html ; https://yacl.cs.yale.edu/
- **Relevant to:** Thesis §8; W1 RQ7; W2 receiver-privacy and retrieval-service observers; W3 OMR/PIR comparison; W4 communication, latency and interaction costs.
- **Supports at abstract level:** The paper states that OMR with strong detection-key unlinkability is at least as hard as PIR and that existing OMR constructions satisfy this property. It presents UnifOMR using batch PIR, reporting 20×–1080× faster server runtime than SophOMR under stated practical parameter settings, with trade-offs including an asymptotically linear digest, two detector/client interaction rounds and substantial server time spent in batch PIR.
- **Does not yet establish for this review:** The full reduction proof, exact formal definitions and assumptions, complete benchmark methodology, implementation details, robustness/correctness boundaries or implications for a multi-carrier endpoint acceptance protocol. Abstract-level claims must not be treated as independently checked theorem or reproduced performance.
- **Review state:** Official IACR ePrint metadata/abstract and institutional/CCS publication listings inspected. The linked full-text PDF request returned HTTP 403 in this review; the paper has **not** received full-text, proof, code or benchmark review. Claims are therefore abstract-level only.

## 7. Status

This is an evolving bibliography and claim-mapping pass. It is not a systematic literature review, complete bibliography, protocol selection or independent validation. Source-to-thesis integration and full-text examination remain in progress.

**Theory only · No implementation · Not audited.**
