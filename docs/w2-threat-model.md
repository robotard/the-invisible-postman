# W2 · Threat Model

**Project:** The Invisible Postman  
**Research basis:** W1 research framing  
**Status:** Working threat model · Theory only · No implementation · Not audited

## 1. Purpose and status

This document defines a provisional threat model for the proposed architecture. It identifies assets, actors, trust boundaries, attacker capabilities, security goals, assumptions, and unresolved questions.

It is a design artifact, not evidence that the architecture currently meets the goals. The model must be reconciled with the complete thesis and revised when protocol details are specified.

## 2. System boundary

The system under consideration has two or more user-controlled endpoints that create, send, receive and decrypt messages. Image carriage is a required research route; file/attachment carriage and conventional end-to-end messaging are comparison profiles, not assumed deployment dependencies. A message may be represented by one or more image-carried capsules on the required image route. Optional steganographic concealment may be applied to an image carrier. A bot or other intermediary may coordinate delivery, while messaging platforms, image hosts and storage services may transport or retain carrier objects and associated metadata.

The intended trust boundary is at the endpoints. Intermediaries may be used for transport and coordination, but must not be trusted with plaintext confidentiality or sole control of decryption keys.

This model does not assume that the transport reliably delivers messages, preserves image bytes, conceals metadata, or authenticates a human identity.

The image threat model is informed by direct multi-image fragmentation and redundant-carriage prior art (SRC-043), pooled batch steganalysis (SRC-044), and a bounded asymptotic capacity theorem with explicit detector and independence assumptions (SRC-045). These sources require separate treatment of fragment-set integrity, carrier collection, detection and observer linkage; none validates this proposal.

A source-code boundary is relevant to the threat model: the inspected public MRAS/DRAS embedding and extraction APIs are per-image and do not expose authenticated cross-image fragment-set context, conversation continuity or endpoint identity binding. Their local demo loops are not a message-delivery protocol. The threat model must not infer endpoint authenticity, sender identity or observer unlinkability from successful carrier extraction in these implementations. The model separates the participant-side cryptographic topology ("passengers") from a standalone, low-fidelity transport element ("train"). The train carries an already protected object and is treated as untrusted and replaceable. It must not be relied upon for key agreement, identity, encryption, sender authentication or decryption authority. A carrier-facing encapsulation layer may provide framing and route context, but any security-relevant binding must be authenticated by the endpoint protocol; encapsulation alone is not a security guarantee. Attacker capabilities therefore include inspection, copying, delay, loss, transformation, substitution and unavailability of the train or its carrier.

The train's proposed transport-unlinkability measures introduce further observable surfaces. The threat model includes carrier reuse or recognisable near-duplicates; embedded or file-level metadata; hosting records and access logs; stable retrieval locators; publication and retrieval timing; network identifiers; image fingerprints; and correlation of repeated route choices. Metadata removal is required for unnecessary carrier-embedded fields, but cannot erase metadata generated or retained by platforms, networks or observers.

The adversary may also exploit human behavioural regularities. Repeated online schedules, response latency, platform/device habits, linguistic or formatting style, image-selection patterns and predictable reactions can link otherwise distinct carriage instances. Social-engineering probes may use urgency, false delivery failures, impersonated notifications or timed prompts to elicit recognisable behaviour. Assess these as behavioural side channels, not as cryptographic failures, while recognising that they can undermine practical anonymity.

## 3. Assets to protect
### Role separation and optional services

The threat model distinguishes endpoint message protection, carrier encapsulation, each transport hop, optional orchestration and external carrier-generation dependencies. One provider may occupy multiple roles. Analyse its permissions and observations for each role rather than treating a label such as “bot” or “coordinator” as a single trust boundary. Orchestration may be absent; if present, it may also act as a transit hop. Every hop can add timing, account, access, storage, transformation and correlation observations. A second hop is not presumed to improve anonymity. External image-generation services are not trusted for keys, salts, nonces, entropy or identity. Telegram is an optional example of a service that could coordinate, carry, or do both; each configuration has a different exposure profile.



| Asset | Security concern |
|---|---|
| Message plaintext | Disclosure to an unauthorized party |
| Private encryption and signing keys | Theft, substitution, misuse, or unauthorized recovery |
| Key-to-identity bindings | Impersonation caused by an attacker substituting their own key |
| Ciphertext and capsule integrity | Undetected modification, substitution, or mixing of message parts |
| Message-set metadata | Forgery of message ID, sender/recipient binding, fragment index/count, version, or expiry |
| Cross-message linkage | Unintended grouping of independent messages, fragment sets, retries or sessions through shared identifiers, timing, carrier style or retrieval patterns |
| Collection-level steganalysis | Pooling of weak per-image signals across multiple carriers, accounts or time windows to infer hidden communication |
| Recovery shares or recovery secrets | Unauthorized reconstruction, collusion, loss, or misuse |
| Local plaintext and key material | Exposure through logs, crash reports, backups, notifications, or compromised endpoints |
| Communication metadata | Disclosure of participants, timing, frequency, size, routing, or social relationships |
| Concealment status | Detection of the presence of hidden data, where concealment is used |

Availability and delivery state matter operationally, but an untrusted intermediary may still suppress, delay, reorder, or refuse delivery. The design must not confuse confidentiality with availability.

## 4. Actors and trust assumptions

### 4.1 Intended participants

The sender and recipient control their own endpoints. Each endpoint is responsible for protecting plaintext and private keys, verifying the other participant's key identity, and applying the protocol correctly.

### 4.2 Intermediary bot or coordinator

The bot may route identifiers, coordinate capsule delivery, or provide workflow assistance. It is not trusted to receive plaintext, hold the only decryption capability, or authenticate a person merely from a platform account identifier.

### 4.3 Messaging platform, image host, and storage provider

These services may inspect, retain, transform, reorder, suppress, or remove media and metadata. Their exact capabilities depend on the deployment and must be documented rather than assumed.

### 4.4 Network observer

A network observer may learn traffic timing, volume, endpoints, and other metadata, depending on transport protections and platform visibility. This model does not claim to eliminate traffic analysis.

The [observer/property matrix](observer-property-matrix.md) provides a comparative baseline for recipient-retrieval and anonymous-access systems. It must not be treated as proof that their assumptions transfer to an image-hosting or social-platform route. In particular, two-server DORAM privacy depends on server non-collusion, while OMR/GOMR, oblivious signaling and dead-drop systems define different observer views and external setup assumptions.

### 4.5 Active attacker

An active attacker may attempt to inject, alter, replay, delay, suppress, reorder, duplicate, or mix messages and capsules. They may attempt key substitution, impersonation, or abuse of recovery processes.

### 4.6 Compromised endpoint

A compromised sender or recipient device may expose plaintext and keys before encryption or after decryption. Endpoint compromise is outside the protection offered by message encryption alone and must be stated as a limitation.

The observer model must include the stronger integrated-messaging baseline documented in SRC-032. Distinguish: (a) a global passive observer of network connections and traffic patterns; (b) an active adversary able to disrupt or compromise network elements; (c) compromised contacts/readers; (d) individual gateways, mixes, services, couriers and storage replicas; (e) colluding pairs or combinations of those roles; and (f) image-host/social-platform operators with access to account, publication, transformation, moderation and hosting records. These are different observation and control capabilities, not one interchangeable "platform adversary".

The project must compare its assumptions with [Echomix's explicit residual leakage](echomix-katzenpost-comparator.md) and the actor/event mapping in the [route comparison framework](route-comparison-framework.md): contacts may infer that a writer was online within a latency window; storage replicas may see box identifiers and read/write times; couriers may observe retry rates; and particular colluding roles may combine observations. The paper also notes that correlated human online routines remain relevant. Do not assume that endpoint encryption, variable image placement or carrier uniqueness removes these observations.

## 5. Attacker capabilities

Unless a later, narrower deployment model says otherwise, assume an attacker may:

- read and retain carrier images and publicly available protocol documentation;
- observe some routing and timing metadata;
- modify, replace, replay, duplicate, suppress, delay, reorder, resize, recompress, or transcode carrier images;
- apply or control active image-sanitization models intended to remove hidden payloads, or adapt a hiding method to a known sanitizer under stated model/seed assumptions;
- submit malformed or incomplete capsule sets;
- mix fragments from different messages or participants;
- attempt to substitute public keys or exploit weak identity verification;
- compromise or misuse an intermediary account or service;
- control or substitute an unauthenticated bootstrap channel, locator, capability or rendezvous instruction;
- publish false, stale, duplicated or selectively transformed carriers, or manipulate publication timing and provenance;
- make an index or board equivocate between recipients, omit or reorder candidates, or return stale/injected results;
- selectively withhold, replay, delay or substitute retrieval responses, and retain capability-use or access records;
- collude across publisher, index, retrieval, platform, network or storage roles and combine their event records;
- retain or later disclose upload/download logs, account links, object identifiers, access records, backups or telemetry;
- inspect public repository contents and design rationale; and
- exploit implementation mistakes, parser bugs, logging leaks, or unsafe recovery procedures if those exist.

Do not assume the attacker can break correctly used, appropriately selected cryptographic primitives. That assumption is not a substitute for specifying the protocol or evaluating its implementation.

## 6. Security goals

The proposed design should be evaluated against the following goals:

1. **Message confidentiality:** Intermediaries and transport observers should not learn plaintext solely by possessing carrier images or routing access.
2. **Authenticated peer binding:** Messages should be associated with the intended cryptographic identities, with an explicit first-contact verification process.
3. **Integrity and context binding:** Altered, replayed, cross-message, cross-recipient, or mixed capsules should be detected or rejected according to a specified policy.
4. **No intermediary-only decryption:** The intermediary must not possess plaintext or the sole capability needed to decrypt messages.
5. **Safe multipart handling:** Missing, conflicting, substituted, mixed or ambiguous capsule sets must not be silently accepted as a different valid message. Valid capsules may arrive out of order when authenticated indices and manifest context make their logical order unambiguous.
6. **Key separation:** Encryption, authentication, and any recovery roles must have explicit key purposes and lifecycle rules.
7. **Honest lifecycle semantics:** Expiry and revocation may govern future access or sessions but must not be represented as remote deletion of already obtained plaintext.
8. **Secret hygiene:** Plaintext, private keys, recovery secrets, and authentication material must not be exposed through logs or routine diagnostics.
9. **Explicit residual risk:** Metadata exposure, availability failures, endpoint compromise, and possible concealment detection must be documented.

10. **Evidence-bounded claims:** The system and its evaluators must distinguish what each verifier can establish from what remains unknown, inferred or outside its vantage. Missing, stale, unavailable, contradictory and failed evidence must not be represented as success.
11. **No confidence inflation:** Status labels must not collapse authenticity, identity assurance, integrity, completeness, delivery, reading or truth into one generic "verified" state. Any claim must identify its scope, evidence provenance, assumptions and freshness.

These are target properties, not claims that the current proposal satisfies them. The [confidence and evidence model](confidence-and-evidence-model.md) defines the claim-centred approach and the limits of transport acknowledgements, fragment evidence and observer inference.

> **DEFINITION · Observer-visible linkage**  
> Linkage is an observer's ability to associate two or more carriers, fragments, publication/retrieval events, logical messages or participants. It may arise from explicit identifiers, timing, size, account/device provenance, image similarity, embedding artefacts, discovery requests or access patterns. Payload encryption does not conceal these relationships by itself.
>
> **COMPARISON · Endpoint linkage versus observer linkage**  
> Endpoints may require authenticated links to reconstruct a fragment set or maintain a conversation. Those links need not be exposed in the same form to a carrier, host, platform or network observer. The threat model must state which party sees each value and event, rather than treating "linked" as a single property.
>
> **DEFINITION · Package encapsulation boundary**  
> Package encapsulation is bounded route-facing framing of an already endpoint-protected object or fragment capsule. It may add lengths, versioning and route-local fields for safe carriage and parsing. It does not authenticate those fields, prove sender identity or replace endpoint validation; security-relevant values require explicit cryptographic binding.
>
> **DEFINITION · Collection-level steganalysis**  
> Detection or clustering based on a set of carriers or events, rather than one image considered in isolation. Evidence from multiple images may be pooled; independence between images must not be assumed without justification.
>
> **Illustrated diagram placeholder · W2-F01 — Observer projections of a linked-message graph**  
> **Placement:** Beside §7 Threats and required mitigations to evaluate.  
> **Prompt for later illustration:** Draw one endpoint-side graph containing logical messages, a fragment set, redundant carriers, a separate conversation edge, retries and cross-route copies. Around it show distinct observer projections for recipient endpoint, image platform, host, coordinator, network observer and human observer. For each observer, show only the identifiers, timing, sizes, provenance and events they can actually observe under the stated assumptions. Distinguish endpoint-authenticated relationships from observer-inferred correlations.  
> **Must not imply:** That an observer sees the complete graph, that encryption hides timing/access patterns, or that multiple hops automatically improve anonymity.
>
> **COMPARISON · Passive media processing versus active sanitization**  
> Routine resizing/recompression may be incidental to platform operation. Active sanitization deliberately transforms uploaded media to remove hidden payloads while constraining visible image degradation (SRC-036, SRC-046–SRC-047). A sender's keyed adaptation to a known sanitiser (SRC-048) is a different adversarial game and depends on model/processing knowledge. Do not treat these as one generic "platform transformation".
>
> **DEFINITION · Frame, carrier and message collection**  
> A GIF frame is a component of one carrier object; separate images are separate carrier objects; a conversation is a relation between distinct protected messages. Cross-frame redundancy (SRC-049) does not itself create cross-post fragment-set semantics or conversation linkage. Per-frame keys or decoder seeds are side information: the observer model must include who stores, distributes and can correlate them. The inspected demo stores keys locally and does not specify an authenticated recipient-facing manifest.
>
> **Illustrated diagram placeholder · W2-F02 — Sanitizer and adaptive-sender threat boundary**  
> **Placement:** Beside §5 Attacker capabilities and §7 Threats.  
> **Prompt for later illustration:** Show an uploader, image platform with routine processing, an optional active sanitization network, an adaptive sender who knows or models that sanitizer, and an authorised receiver with a secret-seed-derived decoder. Mark which model/parameters each actor knows and where payload extraction can fail. Keep endpoint cryptographic validation separate from carrier recovery.  
> **Must not imply:** That the platform uses a cited sanitizer, that the sender can know an unknown model, or that recovered hidden data is authenticated without endpoint verification.
>
## 7. Threats and required mitigations to evaluate

| Threat | Potential consequence | Design requirement to examine |
|---|---|---|
| First-contact key substitution | Attacker impersonates the intended peer | Authenticated key establishment plus explicit key fingerprint, safety-code, QR, or equivalent verification |
| Platform ID treated as identity | Account or identifier is mistaken for a verified person | Bind cryptographic keys to verified identities; document what verification means |
| Ciphertext or capsule tampering | Corruption or attacker-controlled changes | Authenticated encryption and authenticated binding of relevant metadata |
| Replay of a valid capsule | Old content is accepted again | Message identifiers, freshness policy, and replay state where required |
| Fragment mixing, conflicting indices or invalid set construction | Parts from different messages are combined or a capsule is assigned to the wrong logical position | Versioned authenticated manifest, message-set identifier, index/count, content binding and strict reconstruction validation; transport arrival order may differ from logical order |
| Missing or duplicate fragments | Incomplete or ambiguous message reconstruction | Explicit completeness rules and rejection behavior |
| Resource-exhaustion through hostile capsule sets | Excessive CPU, memory, disk, decompression or parser work can deny service even when inputs are structurally valid | Define aggregate and per-item size/count limits, header/manifest bounds, decompression limits, timeouts, concurrency and incomplete-set expiry; validate bounds before expensive work |
| Image transformation or active sanitization | Carrier payload is damaged or deliberately removed while the visible image remains usable | Distinguish routine recompression from learned sanitization (SRC-036, SRC-046–SRC-047) and sanitizer-aware counter-adaptation (SRC-048); test only under a declared model and never infer platform deployment |
| Metadata and message-linkage correlation | Participants, fragment sets, conversations, retries or communication patterns are inferred | Document visible identifiers, manifests, sequence values, timing, sizes, carrier provenance and access patterns; separate required endpoint linkage from observer-visible linkage |
| Collection-level steganalysis | Weak per-image signals accumulate across a batch | Evaluate per-image and pooled/set-level detection on realistic collections; do not assume independent images or that lower per-image payload reduces overall detectability |
| Traffic analysis and flow correlation | Encrypted contents remain confidential while timing, size, volume, endpoint or access patterns reveal communication relationships or activity | Define observer vantage and retained records; examine timing/size correlation and the cost of any padding, delay, batching or cover-traffic countermeasure; see source leads SRC-016 and SRC-018–SRC-019 |
| Discovery and rendezvous correlation | A stable locator, publication schedule or retrieval pattern links a recipient to a carrier | Treat discovery as an explicit protocol function; authenticate bootstrap and retrieval instructions; evaluate locator lifetime, publication timing, access patterns and channel substitution |
| Malicious publication, index equivocation and retrieval manipulation | False or stale candidates, inconsistent recipient views, selective withholding, replay or substituted results can undermine completeness and availability while exposing event metadata | Test publisher/index/retrieval roles separately and in collusion; distinguish endpoint-authenticated objects from service-reported events and inferred correlations; do not treat one index response as proof of complete publication |
| Retention and later disclosure | Upload, index, retrieval, account, backup or telemetry records may preserve links after visible carriers or locators expire | Record data classes, operator, retention window, access assumptions and deletion evidence; unknown retention remains unknown |
| Suppression and ambiguous silence | A missing response may reflect non-publication, index omission, selective suppression, ordinary delay or route failure | Define event-specific timeouts and failure states; do not infer suppression or non-publication from silence alone; assess retry and alternate-route leakage |
| Behavioural probing | Repeated routines or social-engineering prompts elicit linkable responses | Model behavioural side channels and realistic probes; avoid relying on constant user vigilance or deceptive camouflage |
| Intermediary compromise | Routing, availability, or metadata abuse | Minimize intermediary privileges and retained data; keep plaintext and decryption authority at endpoints |
| Logging or diagnostics leak | Plaintext, keys, or tokens escape the protocol boundary | Secret-safe logging policy and adversarial inspection of logs and crash paths |
| Recovery collusion or theft | Unauthorized key reconstruction | Specify threshold, participant authentication, share protection, collusion assumptions, and recovery auditing |
| Endpoint compromise | Plaintext or keys are stolen | State as a residual risk; define device security and key revocation/rotation procedures |
| Expiry/revocation overclaim | Users believe copied plaintext can be recalled | State that already obtained data cannot reliably be revoked remotely |
| Evidence substitution or confidence inflation | A service acknowledgement, valid signature, search result or partial fragment is presented as proof of a stronger event or proposition | Bind every claim to the precise evidence and verifier; distinguish key attribution, identity, set completeness, endpoint receipt, decryption and human reading |
| Stale or revoked evidence | A previously valid key or receipt is treated as current after compromise, revocation or context change | Include freshness, key epoch, revocation and scope; expire or qualify prior judgements |
| Evidence-ledger privacy leakage | Verification records or stable receipts expose participants, message relationships or access patterns | Prefer endpoint-local evidence and minimal disclosure; justify any shared record's recipient, retention and linkability |

The table identifies work to be done. It does not imply that a mitigation has already been implemented or validated.

## 8. Out of scope or not guaranteed

This threat model does not guarantee:

- availability against a malicious or failing intermediary;
- anonymity, unlinkability, or resistance to traffic analysis;
- concealment against all steganalysis or media processing;
- protection of plaintext on a compromised endpoint;
- secure deletion of copies already obtained by a recipient or platform;
- human identity from a username, chat ID, or public key without a verification process; or
- secure threshold recovery before its protocol and trust assumptions are specified.

## 9. Key unresolved decisions

The following remain open and must be resolved before protocol-level security claims:

- exact authenticated key agreement and key confirmation;
- key fingerprint verification and recovery after identity-key changes;
- message envelope format, canonical encoding, and version negotiation;
- sender, recipient, session, message-set, fragment, and expiry binding;
- nonce generation and uniqueness enforcement for the selected AEAD;
- key-schedule input semantics, including the distinction between KDF salt and context-specific information, and the authenticated provenance of identity/session context;
- replay state, message expiry semantics, and clock assumptions;
- permitted metadata exposure and retention;
- recipient discovery, rendezvous and locator lifetime;
- discovery alternatives and their privacy/cost trade-offs, including recipient-side scanning, stable locators, short-lived capabilities and oblivious retrieval;
- explicit parser and reassembly resource budgets for bytes, fragments, headers, decompression, CPU, memory, disk, concurrency and incomplete-set retention;
- the observer model for timing, size, volume, flow correlation and access patterns;
- the distinction between one fragmented message, redundant fragments, independent messages, conversation continuity, retries and cross-route copies;
- which linkage values are endpoint-only, encrypted, visible-but-authenticated or public; and how an observer could reconstruct relationships without decoding payloads;
- collection sizes, time windows, account/platform scopes and pooled steganalysis assumptions; distinguish one animated carrier's frames from separate image objects and message collections (SRC-049);
- whether any traffic obfuscation, padding, delay, batching or cover traffic is in scope, and what costs it introduces;
- handling of corrupted images and platform transformations;
- threshold value, share distribution, participant authentication, collusion threshold, and recovery authorization; and
- test cases, acceptance thresholds, and independent review criteria.

The [protocol boundary analysis](protocol-boundary-analysis.md) expands these cryptographic questions into key hierarchy, KDF salt versus context input, identity/transcript binding, AEAD nonce uniqueness, authenticated associated data, replay/order state and downgrade-resistant route fallback. It is a design-obligation record, not a selected protocol or implementation. W2 retains the threats and acceptance boundary; W3 carries the responsibility decomposition; W4 carries the proposed evaluation conditions.

## 10. Evaluation and acceptance criteria

Before claiming that the design meets its goals, an implementation and review plan should demonstrate at minimum:

- a documented threat model mapped to each protocol component;
- no intermediary access to plaintext or sole decryption authority under the stated assumptions;
- rejection of altered, replayed, incomplete, conflicting, substituted, or cross-message capsule sets; safe reassembly of valid out-of-order arrivals where authenticated manifest and index data permit it;
- bounded parser and reassembly behaviour under oversized declarations, excessive part counts, malformed headers, decompression expansion and resource-exhaustion inputs;
- authenticated binding of peer identity and message context;
- inspection of logs and diagnostics for secret leakage;
- tests against realistic image transformations if concealment or payload survival is claimed;
- explicit tests of key rotation, expiry, revocation, and recovery semantics; and
- independent cryptographic and implementation review before any strong security claim.

Specific test harnesses and numerical acceptance thresholds remain to be selected.

## 11. Status

W2 is a provisional threat model for review. It should be compared against the source thesis, architecture diagrams, and eventual message format. Differences and unresolved assumptions must be recorded, not silently reconciled.

**Implementation:** None claimed.  
**Independent security audit:** None claimed.  
**Security status:** Proposed goals and mitigations only.

**Project status:** Theory only · No implementation · Not audited.
