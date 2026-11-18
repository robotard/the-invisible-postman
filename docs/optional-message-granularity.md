# Optional Message Granularity and Representation Flexibility

**Status:** Supporting design exploration; no protocol or publication format selected.  
**Scope:** Sender-controlled choice between whole-object and segmented representation, independent of carrier or transport.  
**Relationship to thesis:** A bounded elaboration of the representation-flexibility design principle in §1.1.  
**Assurance:** Theory only · No implementation · Not audited.

## 1. Purpose and boundary

A logical message need not have exactly one physical representation. The sender may publish its protected form as one object or, where a stated requirement justifies it, as multiple components. This is a question of message representation and publication policy, not a requirement to use multiple transport mechanisms, steganography, or any particular carrier.

The thesis architecture should preserve a stable endpoint-level meaning while allowing the sender to choose a suitable physical representation. This supporting note explores the optional granularity dimension without elevating it into a new core protocol or contribution claim.

The governing principle is:

> The sender may vary the physical granularity and distribution of a logical message without changing its logical identity, authenticated meaning, endpoint security authority or recipient acceptance obligations.

This is a design objective to examine, not a demonstrated guarantee.

## 2. Two representation profiles

### 2.1 Whole-object representation

The sender protects the logical message as one authenticated object and publishes or transfers that object as a unit.

This remains the baseline and should remain fully supported. It generally has fewer coordination states: there is no fragment-set membership to establish, no multi-component completeness condition and no reconstruction step beyond ordinary object decoding.

Whole-object carriage is not inherently more secure or reliable. Its suitability depends on object-size limits, route transformations, availability, access patterns and the relevant threat model.

### 2.2 Segmented representation

Where a defined constraint or objective warrants it, the sender may divide the protected object into multiple components for publication or carriage. The recipient collects the relevant components, validates their association and membership, establishes set completeness under the declared rule, and reconstructs the protected object before ordinary endpoint acceptance.

Segmentation may be useful where object-size limits, partial availability, independent placement, recovery requirements or other measured constraints make whole-object carriage unsuitable. These are conditional motivations, not assumed benefits.

The architecture need not prescribe whether components are placed in one repository, several repositories, one route or several routes. Those are separate carriage and transport choices. Segmentation and route multiplicity must not be treated as synonyms.

## 3. Invariants across representations

Changing granularity should not silently change the logical message or weaken endpoint acceptance. A candidate design should preserve or explicitly account for:

- **Logical identity:** all components resolve to one intended logical message, not several independent messages.
- **Cryptographic authority:** endpoints retain control of message protection, key use and acceptance.
- **Authenticated meaning:** reconstruction yields the protected object whose context and contents are authenticated by the endpoint protocol.
- **Membership and ordering:** components cannot be silently substituted, mixed across sets, reordered where order matters, or accepted under an ambiguous membership rule.
- **Completeness:** the recipient can distinguish a complete set from a partial, duplicated, conflicting or truncated collection.
- **Replay and lifecycle:** retransmission, expiry, revocation and key/session changes retain explicit semantics.
- **Failure clarity:** missing components, unavailable carriers, malformed inputs and failed reconstruction result in defined rejection or recovery behaviour, not implicit acceptance.

These invariants do not mandate a particular manifest, identifier, coding scheme, envelope or key hierarchy. Any concrete mechanism requires its own threat model and evidence.

## 4. Sender-side selection

Granularity is best treated as a sender-side publication policy selected before publication, based on declared constraints and recipient capability. It is not a security mode, a privacy switch or a promise that segmentation improves concealment.

Possible selection criteria include:

- Maximum object or attachment size on the intended route.
- Expected retention and availability of the carrier or storage service.
- Whether partial retrieval or recovery from missing components is a real requirement.
- Redundancy or erasure-coding overhead, if any.
- Retrieval interaction count, latency, bandwidth and storage cost.
- Recipient support for collection, validation and reconstruction.
- Metadata and correlation exposure at both individual-carrier and collection level.
- Whether the chosen representation creates unacceptable failure or denial-of-service states.

The sender should retain the whole-object option where segmentation has no evidenced advantage. A recipient must be able to determine the declared representation and its validation requirements from authenticated context; it should not infer them from carrier appearance, naming conventions or an unauthenticated hint.

## 5. Keep distinct concepts distinct

The following mechanisms may coexist but solve different problems:

| Concept | Meaning | Not equivalent to |
|---|---|---|
| Segmentation | One protected object is divided into components | Multiple independent messages |
| Redundancy / erasure coding | Additional or coded components support recovery | Confidentiality or concealment |
| Multi-carrier placement | Components are placed in more than one carrier object | Multiple transport protocols |
| Multi-route carriage | The same logical object or its components use different delivery routes | Segmentation itself |
| Conversation linkage | Distinct logical messages are associated as a dialogue | Fragment-set membership |
| Retrieval discovery | The recipient locates candidate carriers or components | Authentication or completeness |

A design may use one carrier for several components, several carriers on one route, or several routes. Each choice has distinct operational and observer consequences.

## 6. Optional linkage granularity

A segmented representation requires the recipient to establish which components belong together. A simple authenticated manifest or equivalent set-binding structure is an obvious baseline against which more elaborate linkage proposals should be compared.

A local-neighbour arrangement is one possible research hypothesis: each component carries or references authenticated information about an adjacent component, with explicit start and termination conditions. It may reduce the need for every component to expose a complete public map, but it does not automatically provide privacy, completeness, availability or resistance to collection-level correlation. An observer who obtains the whole set may reconstruct the chain; missing or conflicting links can also complicate recovery.

Neighbour-bound linkage should therefore remain an optional candidate, not a prescribed architecture. Compare it with a conventional authenticated manifest and simpler indexed multipart formats. Assess what each reveals to the recipient, carrier, storage provider and collection-level observer, and what each costs in retrieval, validation, recovery and failure handling.

Cryptographic terminology must remain exact. Salts support specified key-derivation purposes; nonces provide uniqueness or freshness where required by a construction. Neither independently authenticates a relationship. Authenticated linkage needs a defined cryptographic binding, appropriate key scope and context. Encryption alone does not prove that a reference is authentic.

## 7. Costs and threat considerations

Segmentation adds protocol and operational state. Depending on the design, it can increase:

- Component and manifest metadata, identifiers and correlation opportunities.
- Publication and retrieval events, timing observations and access-pattern leakage.
- Validation, ordering, deduplication, reconstruction and recovery complexity.
- Storage, bandwidth, computation and user effort.
- Denial-of-service opportunities through oversized sets, duplicate floods, malformed components or expensive reconstruction.
- Ambiguity around partial publication, stale components, conflicting manifests and expiry.

It may also improve availability or fit route constraints, but those benefits must be measured against a declared baseline. Splitting payload across carriers does not establish lower steganalysis risk; a collection may be easier to correlate or detect than an individual carrier. The same caution applies outside image carriage: distribution creates observable events even when the payload is encrypted.

No security or privacy benefit follows merely from using more components, more carriers, more routes, opaque identifiers or local neighbour references.

## 8. Evaluation questions and adoption gate

A concrete segmented profile should not be adopted merely because it is possible. It should answer:

1. Which specific constraint or threat makes whole-object representation inadequate?
2. What exact protected object is segmented, and at what stage?
3. What authenticates component identity, set membership, position and termination?
4. How does the recipient establish completeness and reject mixing, substitution, duplication, truncation and replay?
5. What happens when only a subset is available, and is partial recovery permitted?
6. What can each carrier and collection-level observer correlate?
7. What are the added retrieval, storage, bandwidth, computation, latency and failure costs?
8. Does the proposed mechanism add anything beyond established multipart, fragment-manifest, redundant-carriage and multi-image prior art?

Adoption requires a demonstrable advantage over the whole-object baseline, a defensible comparison with simpler established mechanisms, and a benefit that survives the relevant observer and failure analysis. If those conditions are not met, whole-object representation remains the appropriate default.

## 9. Relationship to existing research

Fragmentation, redundant multi-image carriage, set reconstruction and collection-level steganalysis are established research topics. In particular, the project's existing review of SRC-043–SRC-045 already constrains generic novelty claims about distributing fragments across images and reconstructing a message from multiple carriers. This note does not claim novelty for segmentation, manifests, neighbour links or reconstruction.

The purpose of this optional design dimension is narrower: keep physical representation flexible within the existing endpoint-controlled architecture, make the sender's choice explicit, and require any added granularity to justify its costs without changing the thesis's central research question.

## 10. Current disposition

- Whole-object representation remains the baseline.
- Sender-selectable segmentation is an optional publication-policy dimension.
- No carrier, transport, steganographic method, manifest format, linkage scheme, KDF, key hierarchy or reconstruction protocol is selected.
- Neighbour-bound linkage remains a research hypothesis to compare against simpler authenticated set-binding.
- No implementation, experiment, proof, benchmark or independent review is claimed.
