# Echomix / Katzenpost Comparator: Integrated Messaging and Observer Boundaries

**Checkpoint:** 2026-11-18  
**Source:** SRC-032  
**Status:** Theory only · No implementation · Not audited.

## 1. Why this comparator matters

Echomix is the strongest integrated comparator inspected in this research batch. It is not merely a mix-network transport paper: it joins a global and active adversary model, decoy/application traffic coupling, anonymous service access, persistent multi-client messaging, cryptographic capability-derived storage locations, reliability, deletion semantics, and post-quantum packet protection. Its implementation is Katzenpost, and its Pigeonhole/BACAP components provide messaging and storage semantics above the mix network.

This materially changes the comparison baseline. Earlier work in the repository treated Loopix as a useful network-level example and OMR, Oblivious Signaling, Remise and dead-drop work as separate retrieval or delivery comparators. Echomix shows that a practical system can integrate many of those concerns into a single messaging architecture. The project must compare against that integrated design directly rather than imply the same combination is unoccupied.

## 2. Source and inspection boundary

- Infeld, E. J., Stainton, D., Ryge, L. and Threebit Hacker, *Echomix: a Strong Anonymity System with Messaging*, arXiv:2501.02933v2 (7 January 2025; paper dated October 2024).
- Full HTML paper inspected: threat model; comparison with Tor and mix networks; Echomix architecture; decoy traffic and traffic coupling; Loopix critique; BACAP; Pigeonhole storage; replication and couriers; reliability and all-or-nothing backfills; security properties and collusion analysis; post-quantum Sphinx variants; latency and bandwidth analysis; conclusion.
- Current Katzenpost threat-model documentation also inspected. Its own site states that the live threat-model document is evolving and does not yet incorporate all designs introduced in Echomix. The paper and the operational threat-model document must therefore be treated as separate, versioned sources.
- No code, benchmarks or security proofs were reproduced. This entry records the paper's claims and stated model, not independent verification.

## 2.1 Reproducible source-release snapshot · 18 November 2026

The canonical Katzenpost build page publishes a mutually compatible source set:

| Component | Repository tag | Resolved commit |
|---|---|---|
| Mix server, directory authority, courier, replica and `kpclientd` | `katzenpost v0.0.90` | `d5a6349a34c4a2d4bca587f4be86ce92f2873b12` |
| Rust/Python thin-client libraries | `thin_client 0.0.23` | `a92a130f136e60152d810557ed7f800743574664` |
| Qt group-chat client | `katzenqt 0.0.2` | `94175d5f7a0c8cfd1a2ebede83d33d786d7773d2` |

The Go thin client is in the katzenpost repository at `v0.0.90`. These pins resolve the source-version question for a reproducible build candidate, but they do not establish a deployed network configuration, directory-authority set, replica topology, account state, retained service events or observed route behaviour.

The pinned build page explicitly warns that `katzenqt` is in active development and is not appropriate to rely on for anonymity, security or privacy. The repository README describes Katzenpost as pre-alpha and not audited. Accordingly, the strongest comparator remains the **Echomix paper plus Pigeonhole protocol/source specifications**; the source tags make an implementation study reproducible, not security-assured. A future test must pin the actual deployment configuration and treat UI/client maturity as a separate limitation.

Source: [Katzenpost canonical pinned-version/build page](https://katzenpost.network/docs/build_from_source/); [Katzenpost repository README](https://github.com/katzenpost/katzenpost).

## 3. What the system already integrates

### 3.1 Network observer and active adversary

The paper models an adversary with global visibility over all or a significant portion of Internet connections, active ability to disable or compromise network elements and contacts, substantial computational resources, potential quantum capability, and rich external context. It also acknowledges limits: compromise of the whole system or critical combinations of authority and path elements can defeat the design.

The design separates gateways, layered mix nodes and service nodes. Gateways do not maintain persistent client relationships. Services sit behind the mix network. Client traffic and decoys are coupled so that application activity does not create a distinguishable traffic stream under the stated model.

### 3.2 Traffic coupling and the Loopix comparison

Echomix identifies a specific Loopix weakness: at the final hop, legitimate traffic is directed to a recipient's designated provider while decoy traffic is distributed uniformly. That difference can create a statistically visible signal. Echomix's response is not simply to increase decoy volume; it constructs application and decoy traffic as one coupled process and changes the persistent-provider model.

The important lesson is methodological: a cover-traffic claim must be evaluated across every hop and endpoint boundary, not inferred from the existence of decoys. A local-looking asymmetry at the service edge can defeat a broad anonymity narrative.

### 3.3 Persistent messaging, discovery and storage

BACAP derives per-message capabilities, pseudorandom box identifiers and encryption keys from shared capability material. Servers can verify writes and read permissions without learning that different boxes belong to one conversation under the paper's stated assumptions. Pigeonhole uses this to provide asynchronous storage and messaging.

This is directly relevant to the project's discovery question. Echomix does not treat recipient discovery as a generic locator problem: it integrates blinded, capability-derived storage addresses and cryptographic read/write authority. Its initial read capability is distributed out of band, and the design explicitly analyses what servers can infer from read/write patterns.

### 3.4 Reliability, retries and user behaviour

The paper treats acknowledgements, retransmissions and online-state inference as privacy-sensitive. Couriers separate acknowledgement/retry handling from box identifiers; read requests and retries are shaped to reduce query-rate leakage; acknowledgements and retransmissions are not automatic in the long-term reliability design, but are opportunistically coupled to user-initiated activity. The current Pigeonhole specification makes the associated set semantics more precise: an AllOrNothing stream is intended to succeed or fail atomically from the replica/second-party reader's point of view, avoiding disclosure of partial transmission progress. It uses a temporary stream and a courier-mediated copy operation, not a generic proof of completeness for arbitrary external publication feeds. However, the pinned v0.0.90 server source review finds sequential destination writes, independent persistence and no rollback of a successful prefix on the inspected early-failure path. Whether a reader can observe that prefix remains untested, so the specification's reader-atomicity claim is not yet verified against implementation behaviour. The specification also defines a roughly two-week data TTL from its one-week replica-epoch window and requires at least four storage replicas for the stated intermediate/final replica disjointness property. These are normative protocol/deployment conditions, not measurements of a live deployment.

Crucially, the authors acknowledge that correlated human online behaviour can still reveal relationships. The architecture reduces some service and traffic observations; it does not make human routines irrelevant.

### 3.5 Residual leakage and collusion

The security analysis is role-specific. A global passive observer learns who uses the mix network and sees traffic patterns. Contacts can infer that a writer was online within a latency window. Replicas see box IDs and read/write times. Couriers see retry rates and can link retries from one client, while not learning the associated box IDs. Particular colluding pairs can combine observations to infer activity or relationships. The paper does not claim that every collusion combination is harmless.

The design also exposes costs and trade-offs: storage retention is finite; reads and writes expose some probabilistic ordering; reliability can require user-triggered disclosures; post-quantum packet variants increase header and bandwidth costs; latency and continuous cover traffic are operational constraints.

## 4. Comparison against The Invisible Postman

| Project boundary | What Echomix already provides | What remains distinct in this project, if supported |
|---|---|---|
| Endpoint message protection | BACAP encryption/signatures, key-derived per-message capabilities and authenticated boxes | A comparative account of the project's intended endpoint identity/session semantics and how they map to each carriage route; do not imply those functions are absent from Echomix |
| Anonymous publication and access | Mixnet publication/service access, pseudorandom storage locations, anonymous reads/writes and decoy coupling | Image-carrier publication through ordinary external media platforms is not the system studied by Echomix |
| Discovery and retrieval | Capability-derived box IDs, blinded storage addressing, courier/replica separation and read/write authorisation | The project's image-carrier discovery and collection model may differ, but must be compared against this stronger integrated baseline |
| Network metadata | Global-observer model, cover traffic, traffic coupling, route mixing and role-collusion analysis | Platform-side image transformations, image metadata, hosting logs and social-platform account/engagement observations require a separate evidence model |
| Reliability and lifecycle | Courier acknowledgements, retries, backfills, tombstones, storage retention and group channels | Compare exact message-set and route-failure semantics; do not claim general lifecycle coverage as new |
| Human behaviour | Explicitly acknowledges statistical disclosure from correlated online habits and limits of technical mitigation | Any additional human-factors contribution must be grounded in specific methods/evidence, not merely mention behaviour |
| Media transformation | Not an ordinary social-image-carriage pipeline | Carrier recompression, resizing, metadata rewriting, transcoding, moderation, media forensics and extraction failure remain relevant route-specific concerns |

## 5. Consequences for the research direction

1. **A broad integrated privacy-lifecycle contribution is no longer defensible as a differentiator.** Echomix already integrates network anonymity, messaging, discovery/storage, access capabilities, reliability and metadata analysis under a demanding observer model.
2. **The train/transport separation must be compared carefully.** Echomix already has distinct network, service, courier and replica responsibilities. A responsibility-separated architecture is useful as an organising principle, not a standalone novelty claim.
3. **The strongest remaining comparative boundary is media carriage through ordinary image platforms.** The paper does not study a message object carried as a user-selected or platform-processed image, nor the effects of social-platform recompression, image metadata rewriting, file identifiers, moderation, hosting logs and carrier extraction on an otherwise common endpoint-protected message.
4. **This boundary is not automatically original or useful.** It must be tested against image steganography, platform forensics, covert dead-drop systems and systems that bridge mixnets to external services. A comparison must identify an observable difference or practical decision, not just a missing feature in one paper.
5. **Human behaviour is not a blank space.** Echomix explicitly recognises online-routine correlation. The project's remaining question is whether image-platform interactions add distinct observables or failure modes, and what evidence could demonstrate that.
6. **A route-comparison study may be the most honest contribution shape.** Compare the same endpoint-protected message semantics across image carriage, ordinary file/attachment carriage, conventional messaging and a mixnet-backed messaging baseline. Use common observer capabilities and measure the differences in publication, discovery, retrieval, transformations, access patterns, reliability, usability and residual metadata. Keep each system's native guarantees and assumptions visible; do not pretend the routes are interchangeable.

## 6. Next research actions

1. Extend the observer/property matrix with Echomix as an integrated system, not merely as a transport.
2. Update the thesis related-work and contribution sections to state the overlap plainly.
3. Update W2 to include global passive/active, compromised-contact, colluding-role and platform-specific observers as distinct capabilities rather than one undifferentiated adversary.
4. Update W3 to compare the train's responsibilities with Echomix's gateway/mix/service/courier/replica split and its capability-derived discovery.
5. Update W4 E6/E9 with like-for-like route comparison, observable media transformations, access patterns, reliability signalling, traffic overhead and human routines.
6. Add source mappings to W1, traceability and the source register.
7. Reassess the central contribution only after the image-platform boundary is compared with the closest integrated image/dead-drop systems.

## 7. References

- Infeld, E. J., Stainton, D., Ryge, L. and Threebit Hacker. (2025). *Echomix: a Strong Anonymity System with Messaging* (arXiv:2501.02933v2; paper dated October 2024). https://arxiv.org/abs/2501.02933
- Stainton, D. and Infeld, E. J. (n.d.). *Katzenpost Threat Model*. https://katzenpost.network/docs/threat_model/

**Theory only · No implementation · Not audited.**
