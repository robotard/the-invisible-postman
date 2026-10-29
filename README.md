 # The Invisible Postman

**A Theory-Based Architecture for Authenticated, Image-Carried Cryptographic Messaging**  
Researcher: `@robotard`

> **Status: Theory only · No implementation · Not audited.**

This repository documents a research proposal for endpoint-controlled encrypted messaging that may use images as carriers and optional steganographic concealment. It separates encryption, sender authentication, identity verification, carrier handling, multipart integrity, lifecycle policy, and optional threshold recovery.

## What this repository is
- A theory-led architecture and design rationale.
- A provisional research framing and threat model.
- Styled diagrams and a decision register.
- Candidate cryptographic directions and open questions.
- Proposed evaluation and independent-review criteria.

## What it is not
- Not a working messaging application.
- Not a complete protocol specification.
- Not formally verified or independently audited.
- Not evidence of measured resistance to steganalysis.
- Not a guarantee of anonymity, delivery, remote erasure, or metadata protection.

## Start here
1. `WORKPLAN.md` — stable roadmap and waypoint definitions.
2. `PROJECT_STATE.md` — changing progress record.
3. `docs/thesis.md` — thesis text in Markdown.
4. `docs/the-invisible-postman-thesis.docx` — thesis copy with styled diagram assets embedded.
5. `docs/W1-research-framing.md` and `docs/W2-threat-model.md` — supporting research artifacts.
6. `review/REVIEW_QUESTIONS.md` — open questions for critical review.

## Core principles
- Endpoints retain plaintext and private keys.
- Treat relays, platforms, image hosts, and storage as untrusted for plaintext confidentiality.
- Images are carriers, not keys or guaranteed entropy sources.
- Authenticate keys and verify identity explicitly.
- Distinguish ciphertext fragmentation from threshold secret sharing.
- Expiry/revocation cannot recall plaintext or keys already obtained.
- Publish limitations as well as design rationale.

See `SECURITY.md` for disclosure boundaries and claim discipline.

