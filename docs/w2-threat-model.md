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

The model separates the participant-side cryptographic topology ("passengers") from a standalone, low-fidelity transport element ("train"). The train carries an already protected object and is treated as untrusted and replaceable. It must not be relied upon for key agreement, identity, encryption, sender authentication or decryption authority. A carrier-facing encapsulation layer may provide framing and route context, but any security-relevant binding must be authenticated by the endpoint protocol; encapsulation alone is not a security guarantee. Attacker capabilities therefore include inspection, copying, delay, loss, transformation, substitution and unavailability of the train or its carrier.

The train's proposed transport-unlinkability measures introduce further observable surfaces. The threat model includes carrier reuse or recognisable near-duplicates; embedded or file-level metadata; hosting records and access logs; stable retrieval locators; publication and retrieval timing; network identifiers; image fingerprints; and correlation of repeated route choices. Metadata removal is required for unnecessary carrier-embedded fields, but cannot erase metadata generated or retained by platforms, networks or observers.

The adversary may also exploit human behavioural regularities. Repeated online schedules, response latency, platform/device habits, linguistic or formatting style, image-selection patterns and predictable reactions can link otherwise distinct carriage instances. Social-engineering probes may use urgency, false delivery failures, impersonated notifications or timed prompts to elicit recognisable behaviour. Assess these as behavioural side channels, not as cryptographic failures, while recognising that they can undermine practical anonymity.

## 3. Assets to protect

| Asset | Security concern |
|---|---|
| Message plaintext | Disclosure to an unauthorized party |
| Private encryption and signing keys | Theft, substitution, misuse, or unauthorized recovery |
| Key-to-identity bindings | Impersonation caused by an attacker substituting their own key |
| Ciphertext and capsule integrity | Undetected modification, substitution, or mixing of message parts |
| Message-set metadata | Forgery of message ID, sender/recipient binding, fragment index/count, version, or expiry |
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

## 5. Attacker capabilities

Unless a later, narrower deployment model says otherwise, assume an attacker may:

- read and retain carrier images and publicly available protocol documentation;
- observe some routing and timing metadata;
- modify, replace, replay, duplicate, suppress, delay, reorder, resize, recompress, or transcode carrier images;
- submit malformed or incomplete capsule sets;
- mix fragments from different messages or participants;
- attempt to substitute public keys or exploit weak identity verification;
- compromise or misuse an intermediary account or service;
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

These are target properties, not claims that the current proposal satisfies them.

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
| Image transformation | Carrier payload is damaged or removed | Test platform transformations; fail safely rather than claim robust concealment |
| Metadata correlation | Participants or communication patterns are inferred | Document visible carrier, platform, host, network and access metadata; avoid unsupported anonymity claims |
| Traffic analysis and flow correlation | Encrypted contents remain confidential while timing, size, volume, endpoint or access patterns reveal communication relationships or activity | Define observer vantage and retained records; examine timing/size correlation and the cost of any padding, delay, batching or cover-traffic countermeasure; see source leads SRC-016 and SRC-018–SRC-019 |
| Discovery and rendezvous correlation | A stable locator, publication schedule or retrieval pattern links a recipient to a carrier | Treat discovery as an explicit protocol function; authenticate retrieval instructions and evaluate locator lifetime, publication timing and access patterns |
| Behavioural probing | Repeated routines or social-engineering prompts elicit linkable responses | Model behavioural side channels and realistic probes; avoid relying on constant user vigilance or deceptive camouflage |
| Intermediary compromise | Routing, availability, or metadata abuse | Minimize intermediary privileges and retained data; keep plaintext and decryption authority at endpoints |
| Logging or diagnostics leak | Plaintext, keys, or tokens escape the protocol boundary | Secret-safe logging policy and adversarial inspection of logs and crash paths |
| Recovery collusion or theft | Unauthorized key reconstruction | Specify threshold, participant authentication, share protection, collusion assumptions, and recovery auditing |
| Endpoint compromise | Plaintext or keys are stolen | State as a residual risk; define device security and key revocation/rotation procedures |
| Expiry/revocation overclaim | Users believe copied plaintext can be recalled | State that already obtained data cannot reliably be revoked remotely |

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
- replay state, message expiry semantics, and clock assumptions;
- permitted metadata exposure and retention;
- recipient discovery, rendezvous and locator lifetime;
- discovery alternatives and their privacy/cost trade-offs, including recipient-side scanning, stable locators, short-lived capabilities and oblivious retrieval;
- explicit parser and reassembly resource budgets for bytes, fragments, headers, decompression, CPU, memory, disk, concurrency and incomplete-set retention;
- the observer model for timing, size, volume, flow correlation and access patterns;
- whether any traffic obfuscation, padding, delay, batching or cover traffic is in scope, and what costs it introduces;
- handling of corrupted images and platform transformations;
- threshold value, share distribution, participant authentication, collusion threshold, and recovery authorization; and
- test cases, acceptance thresholds, and independent review criteria.

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
