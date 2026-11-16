# The Invisible Postman · Research Source Register

**Purpose:** Track authoritative technical specifications, standards, protocol designs and research literature used to ground the thesis.  
**Research status:** Initial source-reconciliation pass · Not a completed literature review  
**Last checked:** 2026-11-16  
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
- **Review state:** Publisher-indexed article text, abstract, introduction and structured method/evaluation section snippets inspected. Direct publisher full-text retrieval returned access denied; full methods, tables and limitations remain unverified. No experiment was reproduced.

### SRC-034 · DRAS: Downward Recompression for Robust JPEG Steganography

- **Source:** Kumar, R., Bansal, S. and Bansal, R. K. (2026). *Dealing with downward recompression for robust steganography in high quality JPEG images*. Journal of Visual Communication and Image Representation, 118, article 104817.
- **DOI:** https://doi.org/10.1016/j.jvcir.2026.104817
- **Relevant to:** Downward JPEG recompression, stable coefficient selection, extraction error, payload capacity and real-platform validation.
- **Supports:** A recent method specifically addressing high-quality-to-lower-quality JPEG recompression. Publisher-indexed text describes RoLoS coefficient selection from cover/channel quantisation relationships and CARE predictive channel modelling with syndrome-trellis coding; the publisher reports Q95-to-Q85/Q80/Q75 evaluations, comparison with PMAS, extraction-error and runtime results, and tests on WhatsApp, LinkedIn and X.
- **Does not establish:** General carrier survival under resizing, transcoding or repeated arbitrary transformations; exact platform/client configurations; platform metadata/observer privacy; or end-to-end delivery security. The reported 87% extraction-error reduction and order-of-magnitude speed claim remain author-reported, not independently checked here.
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
- **Review state:** Current official specification pages inspected. A Signal application/service profile remains incomplete pending pinned client version and authoritative product/service documentation.

### SRC-039 · Dropbox file activity and shared-link permission documentation

- **Sources:** Dropbox Help, *How to view file activity in Dropbox*, updated 5 November 2026, https://help.dropbox.com/organize/file-activity; Dropbox Help, *How to set shared link permissions*, https://help.dropbox.com/share/set-link-permissions.
- **Relevant to:** A named file-host/shared-link candidate profile, including owner/editor-visible file activity, optional viewer information and link download controls.
- **Supports:** Dropbox documents activity entries for additions, edits, moves, renames, version reverts and sharing/access changes. Viewer information can reveal who viewed a file when enabled. Disabling downloads through a shared link does not prevent recipients saving content by other means.
- **Does not establish:** End-to-end encryption of application-protected message content, anonymity, absence of provider-side access/metadata, or a guarantee that link permissions prevent copying. Any client-side protected-object wrapper is a comparison condition, not a Dropbox feature claimed by these sources.
- **Review state:** Current official help pages inspected; no Dropbox account, file or live sharing workflow tested.

### SRC-040 · Katzenpost Pigeonhole protocol and deployment documentation

- **Sources:** Katzenpost, *Pigeonhole Protocol Specification*, https://katzenpost.network/docs/specs/pigeonhole/; Katzenpost, *Introduction to Pigeonhole Protocol*, 5 November 2026, https://katzenpost.network/blog/2026/11/05/introduction-to-pigeonhole-protocol/; Katzenpost project repository, https://github.com/katzenpost/katzenpost.
- **Relevant to:** A current named storage/messaging profile above a mix network, capability-controlled asynchronous streams, courier/replica separation, fixed-size boxes, retention and network-independent composition.
- **Supports:** The project documentation describes Pigeonhole as a storage layer using BACAP capabilities, couriers and replicas; the November 2026 article describes Pigeonhole as a network-independent abstraction that can run over more than one underlying network. The repository describes implemented BACAP/Pigeonhole components and points to normative specifications.
- **Does not establish:** That Pigeonhole alone provides the full anonymity properties of Echomix; those depend on the underlying network and deployment. The public documentation is evolving and does not, by itself, pin a mutually compatible deployed release/configuration or independently validate all security claims.
- **Review state:** Current protocol documentation, project repository overview and 5 November 2026 project article inspected. No code build, deployment or independent reproduction performed.

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
- **Review state:** Full publisher HTML inspected, including abstract, motivation, framework, fragment numbering/redundancy, DFT/DCT embedding approach and reported experiment summary. The paper's scope and terminology distinctions are recorded; no implementation or result was reproduced.

### SRC-044 · Batch Steganography and Pooled Steganalysis

- **Source:** Ker, A. D. (2007), *Batch Steganography and Pooled Steganalysis*. In: Information Hiding, Lecture Notes in Computer Science, vol. 4437, pp. 265–281. Springer.
- **Publisher/status:** Peer-reviewed conference proceedings paper; full paper PDF inspected.
- **Link:** https://www.cs.ox.ac.uk/people/andrew.ker/docs/ADK18D.pdf
- **Relevant to:** Thesis §8; W1 RQ6/RQ7; W2 collection-level observer model; W4 E6 and multi-carrier evaluation.
- **Supports:** A warden can combine imperfect per-object steganalysis statistics across a batch. The paper formalises batch embedding and pooled detection, analyses alternative pooling strategies, and validates selected results using LSB replacement and large simulation runs. Its model fixes and makes known the batch size, assumes equal cover capacities and random selection of embedded covers, and relies on stated component-detector response assumptions; it explicitly leaves sequential acquisition/testing as a different problem. Its abstract reports a square-root secure-capacity relationship under its model and reports high-reliability pooled detection in its evaluated setting. This is not a general law independent of cover, detector, dependency, acquisition or embedding assumptions.
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
3. Active transformation may target payload survival rather than merely detect steganography. A route evaluation must include extraction failure and integrity-safe rejection, not just detectability.
4. A single universal detector or universal transformation model must not be assumed. The survey identifies generalisation as a major unresolved difficulty.
5. The strongest defensible next step is to define exact platform/version, upload method, account/post visibility, retrieval method, media type and client path for each image profile. Record unknown transformations as unknown until measured or sourced.

## 7. Status

This is an evolving bibliography and claim-mapping pass. It is not a systematic literature review, complete bibliography, protocol selection or independent validation. Source-to-thesis integration and full-text examination remain in progress.

**Theory only · No implementation · Not audited.**
