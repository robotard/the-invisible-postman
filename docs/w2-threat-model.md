# W2 · Threat Model

**Project:** The Invisible Postman  
**Research basis:** W1 research framing  
**Status:** Working threat model · Theory only · No implementation · Not audited

## 1. Purpose and status

This document defines a provisional threat model for the proposed architecture. It identifies assets, actors, trust boundaries, attacker capabilities, security goals, assumptions, and unresolved questions.

It is a design artifact, not evidence that the architecture currently meets the goals. The model must be reconciled with the complete thesis and revised when protocol details are specified.

## 2. System boundary

The system under consideration has two or more user-controlled endpoints that create, send, receive, and decrypt messages. A message may be represented by one or more image-carried capsules. Optional steganographic concealment may be applied to a carrier. A bot or other intermediary may coordinate delivery, while messaging platforms, image hosts, and storage services may transport or retain carrier objects and associated metadata.

The intended trust boundary is at the endpoints. Intermediaries may be used for transport and coordination, but must not be trusted with plaintext confidentiality or sole control of decryption keys.

This model does not assume that the transport reliably delivers messages, preserves image bytes, conceals metadata, or authenticates a human identity.

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
5. **Safe multipart handling:** Missing, duplicated, reordered, or mixed capsule sets must not be silently accepted as a different valid message.
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
| Fragment mixing or reordering | Parts from different messages are combined | Versioned manifest, message-set identifier, index/count, digest or equivalent integrity binding, and strict validation |
| Missing or duplicate fragments | Incomplete or ambiguous message reconstruction | Explicit completeness rules and rejection behavior |
| Image transformation | Carrier payload is damaged or removed | Test platform transformations; fail safely rather than claim robust concealment |
| Metadata correlation | Participants or communication patterns are inferred | Document visible metadata and avoid unsupported anonymity claims |
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
- handling of corrupted images and platform transformations;
- threshold value, share distribution, participant authentication, collusion threshold, and recovery authorization; and
- test cases, acceptance thresholds, and independent review criteria.

## 10. Evaluation and acceptance criteria

Before claiming that the design meets its goals, an implementation and review plan should demonstrate at minimum:

- a documented threat model mapped to each protocol component;
- no intermediary access to plaintext or sole decryption authority under the stated assumptions;
- rejection of altered, replayed, incomplete, duplicated, reordered, or cross-message capsule sets;
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
