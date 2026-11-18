# W3 · Architecture

**Status:** Working architecture proposal  
**Research basis:** W1 · Research Framing; W2 · Threat Model  
**Assurance status:** Theory only · No implementation · Not audited.

## 1. Purpose

W3 translates the research questions and threat model into an endpoint-only message architecture. It does not define a complete cryptographic protocol, claim implementation readiness, or establish that the proposed design is secure.

The protected message is the architectural entity. It is created, authenticated, decrypted and validated at the communicating endpoints. Its authenticated meaning and acceptance do not depend on a server, directory, database, fixed address, rendezvous service, coordinator, storage provider or transport-specific service.

External platforms, hosts, networks and carriers may convey, store, transform, delay, reorder, copy, suppress or withhold bytes. They are untrusted carriage environments, not architectural authorities. No such entity supplies identity, keys, decryption state, multipart membership, reconstruction instructions or acceptance decisions.

Image carriage is a required research comparison route, not a mandatory runtime route or privileged default. Other routes are compared using their native semantics and evidence boundaries. Optional steganographic concealment remains separate from encryption, authentication and transport.

## 2. Governing invariants

1. **Message self-containment:** The protected object carries the authenticated context needed for endpoint validation and decryption. If represented in parts, the protected representation carries the authenticated information needed to associate and reconstruct those parts.
2. **Endpoint cryptographic authority:** Identity verification, key custody, authenticated key establishment, encryption, decryption, message validation and acceptance remain endpoint responsibilities.
3. **Identity is not location:** A cryptographic peer identity or locally held key-to-identity binding is not a network address, platform account, storage locator or persistent recipient-to-location relationship.
4. **No external resolver:** No server, directory, database, index, rendezvous point, coordinator or external lookup is required to resolve keys, identify message membership, reconstruct the object or decide acceptance.
5. **Transport agnosticism:** The same protected object remains logically and cryptographically invariant across carriage routes unless an explicit, authenticated protocol conversion is specified and evaluated.
6. **Untrusted carriage:** External routes may expose metadata, transform or withhold carriers, and report their own events. Their reports do not establish endpoint receipt, completeness, authenticity or acceptance.
7. **No inferred anonymity:** Carrier uniqueness, variable placement, extra hops, concealment or transport diversity do not by themselves establish anonymity, unlinkability, confidentiality or security.

## 3. Endpoint responsibilities

### 3.1 Sender endpoint

The sender endpoint is responsible for:

- Creating the logical message and authenticated context.
- Establishing or verifying the relevant peer identity and cryptographic key state.
- Protecting the message and authenticating the required context.
- Choosing whole-object or, where justified, segmented representation.
- Including all required authenticated membership and reconstruction information within the protected representation.
- Applying any route-specific encapsulation locally before conveyance.
- Retaining the necessary local lifecycle state for replay, expiry and key management.

The sender does not need to register the message, recipient or carrier location with a central service.

### 3.2 Recipient endpoint

The recipient endpoint is responsible for:

- Obtaining the bytes through any available route.
- Reversing route-specific encapsulation and checking bounded structural framing.
- Validating authenticated message and fragment context.
- Associating parts and reconstructing the protected object without relying on arrival order or an external resolver.
- Verifying peer/session context, authenticity, integrity and freshness.
- Decrypting and accepting only a complete, unambiguous, valid object.
- Maintaining local replay, expiry, key-change and relevant lifecycle state.

A service acknowledgement, download event or successful carrier extraction is not endpoint acceptance.

### 3.3 Identity and address boundary

Cryptographic identity is a verified binding between a peer and key material under a stated trust process. It is not a routing address. An endpoint may already hold a peer's verified public key or obtain it through a separately evaluated trust ceremony, but no directory or address service is part of message decryption or acceptance. A locator may be used by a particular external route; it is not the message's identity and must not become a fixed cross-route dependency.

## 4. Protected object and multipart representation

### 4.1 Whole-object baseline

The baseline representation is one self-contained protected object. The object must contain or cryptographically bind the context needed to validate its sender, recipient/key scope, protocol version, message identity, freshness and authenticated meaning. Exact fields and canonical encoding remain protocol decisions.

### 4.2 Optional segmented representation

Segmentation is a sender-side representation choice, not a security mode, privacy switch or transport requirement. Whole-object representation remains the baseline. A segmented representation is admissible only where the endpoint can establish, from authenticated information carried with the protected set:

- Which parts belong to the same logical object.
- The expected membership, index and relevant size/length constraints.
- Completeness under the declared reconstruction rule.
- The treatment of duplicate, conflicting, missing, delayed and reordered parts.
- The relationship between reconstructed bytes and the authenticated protected object.

No external manifest host, index, lookup service, fixed address or coordinator may be required to establish those facts. The optional [message-granularity note](optional-message-granularity.md) compares whole-object and segmented profiles without selecting a linkage mechanism.

Fragmentation is not secret sharing, redundancy is not fragmentation, and cross-route copies are not automatically independent messages. The [multi-message linkage analysis](multi-message-linkage-and-steganographic-carriage.md) keeps logical-message identity, fragment membership, redundancy, conversation continuity, retry and route-equivalence relationships distinct.

### 4.3 Safe acceptance

The recipient must distinguish object validity, fragment membership, byte reconstruction, set completeness, conversation continuity and endpoint acceptance. A valid fragment does not prove a complete set. A successful reconstruction does not prove sender authenticity. A service report does not prove endpoint receipt. Missing, conflicting, substituted, replayed, mixed or ambiguous material must fail safely rather than be silently accepted as a complete message.

## 5. Endpoint-side encapsulation and decapsulation

Encapsulation and decapsulation are endpoint-side transformations around the protected object. They are not remote services or security authorities.

Sender-side encapsulation may provide:

- Bounded framing and declared lengths.
- Route-format identification and versioning.
- Minimal structural information required by the selected carrier.
- A route-specific representation that preserves the protected object's authenticated meaning.

Recipient-side decapsulation may:

- Extract the protected object from the obtained carrier.
- Check framing, declared lengths, format/version support and extraction completeness.
- Enforce parser and resource limits.
- Return the recovered bytes to endpoint validation.

Structural checks can detect malformed or truncated carriage. They do not establish authenticity, sender identity or intended message membership. Security-relevant bindings must be authenticated by the endpoint protocol.

The specification must define justified limits for encoded size, per-part size, fragment count, manifest/header length, nesting, decompression expansion, aggregate memory/disk, CPU/time, concurrent incomplete sets and expiry. Reject inconsistent or excessive declarations before allocation or expensive decoding, use bounded streaming where appropriate, and release temporary resources on every failure path. Numerical values remain open pending target-device and route profiles.

## 6. External carriage routes

External routes are comparison profiles, not architectural components. A route may use its own accounts, addresses, locators, publication conventions, storage and delivery events. Those are properties of that route and do not become message identity, decryption state, fragment authority or persistent cross-route relationships.

The research compares at least:

- Image-platform carriage, with and without optional steganographic concealment.
- Encrypted file or attachment carriage.
- A named conventional end-to-end messaging protocol/service profile where evidence permits.
- A mixnet-backed messaging baseline, represented by Echomix/Katzenpost.

Each profile must retain its native identity, publication, discovery, access, delivery, retention and observer semantics. Do not force a service's delivery model into an image-style abstraction or infer equivalent guarantees from superficially similar events.

### 6.1 Image carriage

An image is a carrier, not a key, identity credential or guaranteed entropy source. Image-specific handling belongs in endpoint-side adapters. Optional steganography attempts to make embedded material less apparent; it does not encrypt, authenticate or hide all transfer metadata.

Platforms may resize, recompress, transcode, strip metadata, moderate or otherwise transform media. Evaluation must distinguish per-image extraction, multi-part reconstruction and collection-level detection. Multiple images may support redundancy and recovery while also giving an observer more evidence to pool or correlate. SRC-043 provides a direct multi-image fragmentation/redundancy comparator; SRC-044 establishes collection-level steganalysis as a distinct concern. Neither dictates the message architecture or proves universal platform behaviour.

### 6.2 Route acquisition and observer exposure

The recipient must physically obtain the bytes, but how a particular route makes them available is a route-specific delivery condition. It is not a message-protocol function. No discovery service, stable locator, remote index or rendezvous mechanism is selected or required.

OMR/GOMR, Oblivious Signaling, Remise, StOMR, UnifOMR, APIR, vPIR and capability-addressed asynchronous stores are compared as external prior art only. Their boards, detectors, databases, directories, capabilities, admission logs and retrieval services are parts of those systems' models. The [observer/property matrix](observer-property-matrix.md) and [prior-art comparison](prior-art-comparison.md) record their assumptions, leakage, service dependencies and evidence limits. The APIR predicate COUNT and point-query primitives do not form a self-contained message mechanism: a count reports cardinality, while a point query retrieves an index already known to the client.

For every route, record what the publisher, platform/host, storage provider, network observer and recipient can observe; distinguish service-reported events from endpoint-authenticated facts and analyst-inferred correlations. A second hop, changing carrier or variable location does not inherently improve anonymity.

## 7. Protocol and lifecycle obligations

W3 does not select a cryptographic protocol. Before one can be specified, it must define:

- Identity verification and transcript binding.
- Key hierarchy and purpose separation.
- HKDF salt and context inputs.
- AEAD nonce uniqueness, including retries, concurrency, crash recovery and rollback.
- Authenticated message context and canonical encoding.
- Replay, ordering, duplicate and freshness state.
- Key changes, expiry, revocation and device recovery.
- Downgrade-resistant failure behaviour.
- Bounded parsing and resource exhaustion controls.
- Multipart membership, completeness and reconstruction rules.

These are endpoint protocol responsibilities, not properties supplied by a carrier, route adapter or external service. The [protocol boundary analysis](protocol-boundary-analysis.md) records the current obligations and the limits of relevant references. RFC 5869 distinguishes non-secret HKDF salt from context-specific `info` (SRC-041). RFC 9180 provides a compositional KEM/KDF/AEAD reference and stateful nonce handling, but leaves ordering, loss detection and broader replay protection to the application and does not provide recipient-compromise forward secrecy (SRC-042). Neither RFC is a selected project protocol.

Expiry and revocation cannot remotely erase knowledge or copies already obtained by a recipient or attacker. A message no longer accepted for a new decryption attempt, a key no longer trusted for future communication, a retired session key and plaintext already copied are different lifecycle states.

## 8. Logical message lifecycle

This is a logical endpoint lifecycle, not an implementation sequence:

1. Participants establish and verify the relevant cryptographic identity/key trust.
2. Endpoints establish authenticated shared cryptographic context.
3. The sender creates the logical message and context.
4. The sender endpoint protects the message and authenticates the required context.
5. The sender selects whole-object or justified segmented representation; any required set context is carried within the protected representation.
6. The sender endpoint applies bounded, route-specific encapsulation.
7. The sender uses an available external route to convey the object or its independently carried parts.
8. The recipient obtains the bytes through an available route and performs endpoint-side decapsulation.
9. The recipient validates authenticated membership and completeness, reconstructing valid parts independently of arrival order.
10. The recipient verifies authenticity, integrity, peer/session context and freshness.
11. The recipient decrypts and accepts only a complete, unambiguous, valid object.
12. Endpoints apply local replay, expiry, key rotation and relevant lifecycle rules.

No external entity coordinates multipart delivery, resolves a recipient, supplies a decryption key, establishes set membership or decides acceptance.

## 9. Trust and data boundaries

| Boundary | Trusted responsibility | Not assumed |
|---|---|---|
| Sender endpoint | Plaintext creation, key custody and message protection | Endpoint is invulnerable |
| Recipient endpoint | Verification, reconstruction, decryption and acceptance | Recipient cannot copy plaintext |
| Identity boundary | Verified key-to-identity binding under a stated trust process | Platform ID or network address proves identity |
| Message protection | Confidentiality and integrity under stated assumptions | Encryption hides metadata |
| Multipart context | Authenticated set formation, membership and reconstruction rules | Fragmentation provides recovery or arrival order defines logical order |
| Endpoint encapsulation/decapsulation | Bounded framing, extraction and structural completeness checks | Framing proves origin, authenticity or cryptographic integrity |
| External carrier/host/platform | Conveys, stores, transforms or withholds bytes under route-native semantics | It is a required architectural authority or trusted source of message relationships |
| Optional recovery boundary | Only explicitly authorised recovery if later justified | Threshold design is automatically safe |

## 10. Security responsibilities and threat mapping

| W2 threat | Architectural response | Remaining work |
|---|---|---|
| First-contact key substitution | Identity verification boundary | Define verification ceremony |
| Platform ID treated as identity | Cryptographic identity binding | Define identity lifecycle |
| Ciphertext or metadata alteration | Authenticated message protection | Specify complete envelope |
| Replay | Message IDs and freshness state | Define replay policy and storage |
| Fragment mixing, conflicting indices or invalid set construction | In-object authenticated set context and capsule bindings; safe reconstruction independent of arrival order | Define manifest, duplicate and rejection rules |
| Missing or duplicate capsules | Strict completeness and uniqueness checks | Define failure and retry behaviour |
| Image transformation | Separate carrier boundary and fail-safe extraction | Test realistic platform transformations |
| Metadata correlation | Minimise unnecessary endpoint-generated carrier metadata; document platform, host, network and access observations | Define metadata allowlist and route-specific retention evidence |
| Behavioural correlation | Treat timing, routines and social-engineering probes as cross-cutting side channels | Define observer scenarios and proportionate mitigations |
| External route compromise | Endpoint-held keys and self-contained authenticated message structure | Assess observation, transformation, substitution and withholding; no external decryption authority |
| Secret leakage in logs | Endpoint secret-handling boundary | Define and inspect logging policy |
| Recovery collusion or theft | Optional isolated recovery boundary | Do not adopt before threat and protocol specification |
| Endpoint compromise | Explicit residual-risk boundary | Define device and key-compromise response |
| Expiry or revocation overclaim | Local lifecycle semantics | Define precise acceptance and retirement rules |

These responses are architectural intentions, not demonstrated mitigations.

## 11. Minimum logical architecture

The minimum architecture consists of the sender endpoint, a self-contained protected message, optional endpoint-side carrier encapsulation, one or more independent external carriage routes, and the recipient endpoint. The recipient reconstructs and validates the object using only the received protected representation and endpoint-held state.

The architecture does not currently require:

- A central key server with decryption authority.
- A trusted message relay or coordinator.
- A directory, database, index or rendezvous service.
- A persistent recipient-to-address or recipient-to-storage relationship.
- A separate microservice for each logical function.
- Distributed threshold recovery.
- A blockchain or public ledger.
- An anonymity network.

Any additional mechanism would require a specific research justification and threat analysis before inclusion. A route may itself be a service, but that does not make it a required part of the message architecture.

## 12. Architectural decisions and status

| Decision | Current position | Status |
|---|---|---|
| Plaintext and private-key custody | Participant endpoints | Proposed |
| Cryptographic identity | Explicit key-to-identity verification, distinct from address/location | Required capability; method open |
| Session establishment | Authenticated key establishment | Required capability; protocol open |
| Message protection | Authenticated encryption with bound context | Candidate construction |
| Sender authentication | Separate, explicit cryptographic responsibility | Required capability; construction open |
| Protected object | Self-contained endpoint message | Governing design invariant |
| Carrier | External route conveys bytes | Replaceable |
| Concealment | Optional and separately evaluated | Deferred |
| Multipart | Authenticated self-contained membership and reconstruction context | Required capability; format open |
| Encapsulation/decapsulation | Bounded endpoint-side framing and structural extraction only | Required boundary; format open |
| External carriage | Untrusted, replaceable and non-authoritative | Required boundary |
| Carrier acquisition | Route-native or independently arranged means of obtaining bytes | Comparative analysis only |
| Expiry and revocation | Honest local/future-access semantics | Required capability; policy open |
| Recovery | Separate optional mechanism | Deferred |
| Deployment topology | Minimal logical endpoint architecture first | Proposed |

## 13. Evaluation implications for W4

W4 must evaluate the architecture against the W2 threat model, not merely confirm that its components exist.

At minimum, evaluation should address:

- Whether an external route can obtain plaintext or sole decryption capability under the stated assumptions.
- Whether first-contact identity substitution is detectable.
- Whether sender, recipient, session and message context are cryptographically bound.
- Whether valid out-of-order parts are reconstructed from authenticated logical context, while altered, replayed, incomplete, conflicting, substituted and mixed sets fail safely.
- Whether encapsulation/decapsulation enforces bounded framing and safe extraction without being mistaken for cryptographic authentication.
- Whether route-native acquisition and metadata exposure meet the stated observer assumptions.
- Whether realistic image transformations cause safe failure.
- Whether logs, diagnostics and operational metadata expose secrets or sensitive content.
- Whether key rotation, expiry and revocation behave according to their stated limits.
- Whether optional recovery, if retained, withstands its stated theft and collusion scenarios.

No architecture diagram should be finalised until these boundaries and the underlying argument are stable.
