# Beyond Hiding in Plain Sight
## A Theory-Based Proposal for Authenticated, Image-Carried Cryptographic Messaging

*Architecture • Key Management • Steganography • Distributed Access Control*

**Version 1.0 • 25 October 2026**

> **Status:** Proposed theory and architecture. This is not an audited protocol, formal proof, or claim of a production implementation.

## Abstract
This thesis proposes an architecture for secure first-contact messaging in which encrypted messages may be carried by images and, where useful, concealed through steganography. It separates confidentiality, integrity, sender authentication, identity verification, concealment, fragmentation, threshold access, and lifecycle policy. The central design principle is to use established cryptographic mechanisms, keep the relay outside the plaintext trust boundary, and treat images as carriers rather than sources of secret key material.

## Central design decisions
- Build a reviewed authenticated messaging protocol first; add image concealment as an optional layer.
- Treat salts as public KDF inputs and nonces as per-encryption values, not secrets.
- Do not derive secret keys from public image URLs, hashes, or uniqueness claims.
- Replace vague double encryption with explicit recipient confidentiality and sender authentication.
- Distinguish ciphertext fragmentation from threshold secret sharing.
- Define expiry and revocation as limits on future access, not guarantees of erasing copies already obtained.
- Require a visible first-contact identity-verification step; a chat identifier does not prove a human identity.

## Architecture
Endpoints retain plaintext and key material. An untrusted relay routes opaque payloads and carrier references. A remote image service is optional and is not a key authority. The message envelope is versioned and authenticated; multi-part payloads use a manifest and strict reconstruction checks.

## Design evolution
| Exploratory idea | Reason for challenge | Revised decision |
|---|---|---|
| Image/hash as key material | Uniqueness is not secret entropy | Use reviewed key agreement/KDF; image is carrier |
| Remote image as indispensable secret | Availability and trust dependency | Keep carrier provider outside key schedule |
| Salt as secret ingredient | Salt is public and does not strengthen a weak password | Store salt and KDF parameters when password KDF is used |
| Double encryption for identity | Encryption alone does not establish sender identity | Specify confidentiality and authentication separately |
| Linked images as distributed secret | Links do not enforce threshold control | Use manifests for fragments; secret sharing only when needed |
| Kill switch deletes message | Recipient may retain plaintext or keys | Limit future access and state residual-copy risk |

## Evaluation programme
1. Freeze the protocol and envelope specification.
2. Select and verify maintained cryptographic libraries.
3. Test malformed payloads, replay, key substitution, nonce handling, and fragment mixing.
4. Evaluate image capacity, robustness, and detectability under stated conditions.
5. Review logging, recovery, privacy, and lifecycle semantics.
6. Obtain independent cryptographic and application-security review before sensitive deployment.

## Important limitation
This is a theory-based proposal. The exact authenticated key-agreement protocol, binary encodings, identity model, key lifecycle, steganographic method, and threshold scheme remain to be specified and reviewed.