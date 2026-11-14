# Security Notes

**Project:** The Invisible Postman  
**Status:** Research documentation only  
**Assurance:** Theory only · No implementation · Not audited.

## Purpose

This document records the security scope and disclosure discipline for this research repository. It is not a vulnerability-disclosure service, security support channel, bug bounty programme or statement that a deployed system exists.

## Objectives under study

- Confidentiality of message contents from intermediaries.
- Cryptographic sender authentication and explicit peer identity verification.
- Integrity and context binding of protected messages.
- Safe handling of multipart message sets.
- Endpoint control of plaintext and private keys.
- Honest lifecycle, expiry and revocation semantics.
- Minimisation and documentation of intermediary privileges.
- Optional image-carrier concealment as a separate research concern.

These are research objectives, not verified properties.

## Trust boundaries and limitations

The intended trust boundary is at participant-controlled endpoints. Intermediaries, messaging platforms, bots, image hosts and storage providers are untrusted for plaintext confidentiality unless a future, explicitly justified design establishes otherwise.

A compromised endpoint may expose plaintext or private keys. Encryption cannot protect information displayed or stored on a compromised device.

The project does not currently establish a complete cryptographic protocol, final authenticated key-establishment procedure, complete identity-verification ceremony, production-ready message encoding, tested nonce/replay/key lifecycle handling, robustness against media transformation, resistance to steganalysis, anonymity, reliable delivery, remote deletion or a safe threshold-recovery protocol.

## Candidate mechanisms

Algorithms and protocols mentioned in research are candidates unless explicitly adopted in a future reviewed specification. Naming a primitive does not establish that the surrounding protocol is correct. Security depends on the complete construction, parameters, identity binding, key management, implementation and operational environment.

## Repository hygiene

Do not commit:
- Private keys, seed material or recovery shares.
- Passwords, access tokens or API credentials.
- Real private correspondence or message plaintext.
- Personal information unrelated to the research.
- Unredacted reports containing sensitive information.

Use synthetic examples and test data.

## Reporting concerns

For this theory-only project, technical concerns should be raised as research issues or review questions. Do not place secrets, credentials, private keys or sensitive personal data in public issues.

A future implementation must establish a dedicated security contact and responsible disclosure process before inviting vulnerability reports.

## Evidence discipline

| Level | Meaning |
|---|---|
| Proposed | An idea or design intention has been stated |
| Specified | A mechanism has been defined sufficiently for review |
| Analysed | Reasoning or threat analysis has been documented |
| Tested | A defined test has been executed and recorded |
| Independently reviewed | External specialist review has taken place |
| Audited | A suitably scoped independent security audit has been completed |

A higher evidence level must never be implied by a lower one.

**Theory only · No implementation · Not audited.**
