# Critical Review Questions

**Project:** The Invisible Postman  
**Review stage:** Architecture and research review  
**Assurance:** Theory only · No implementation · Not audited.

These questions are intended to challenge the proposal, not validate it by default. Record evidence, counterarguments, unresolved assumptions and resulting document changes.

## 1. Research coherence

1. Is image-carried messaging solving a real problem that ordinary end-to-end encrypted messaging does not solve?
2. Is concealment a core research contribution, an optional transport property or unnecessary complexity?
3. Are the central research question and claimed contribution narrow enough to evaluate?
4. Does each proposed component map to a research question or identified threat?

## 2. Identity and session establishment

5. How is a cryptographic key bound to the intended person or entity?
6. What first-contact verification ceremony is usable and resistant to key substitution?
7. How are key changes, device replacement and suspected compromise authenticated?
8. What prevents an unauthenticated key agreement from becoming a man-in-the-middle vulnerability?
9. What key confirmation is required before either endpoint treats a session as established?

## 3. Message protection and encoding

10. What exact fields are authenticated as associated data or otherwise cryptographically bound?
11. How are sender, recipient, session, message-set identity, version and expiry bound together?
12. What canonical encoding prevents ambiguous parsing and cross-protocol interpretation?
13. How are nonces generated, uniqueness enforced and key-use limits defined?
14. Are encryption and signing keys separated by purpose and derived through a specified construction?
15. Is sender authentication required for every message, and what exact construction provides it?

## 4. Multipart and carrier handling

16. What does the authenticated manifest contain?
17. How are duplicate, missing, reordered, conflicting and cross-message capsules rejected?
18. Is reconstruction deterministic and unambiguous?
19. Which image transformations are in scope, and what evidence supports payload-survival claims?
20. Does the carrier layer provide any benefit beyond packaging, and is that benefit worth its fragility?

## 5. Intermediary, metadata and endpoint risk

21. What can the coordinator observe, correlate, retain, alter, suppress or replay?
22. Which permissions and data are strictly necessary for coordination?
23. What metadata remains visible even when message contents are encrypted?
24. How are plaintext, keys and sensitive context kept out of logs, backups, notifications and crash reports?
25. Which endpoint-compromise risks are explicitly outside the protection boundary?

## 6. Lifecycle and recovery

26. What precisely do expiry and revocation prevent, and what can they never undo?
27. How is replay state retained and what happens if it is lost or rolled back?
28. Is recovery genuinely required by the research problem?
29. If recovery is retained, what threshold, authentication, collusion and share-protection model is justified?
30. Does recovery create a new authority that undermines endpoint control?

## 7. Evaluation and falsifiability

31. Which adversarial test could demonstrate that a central design claim is false?
32. What observable evidence would count as pass, fail or inconclusive?
33. Which acceptance thresholds are justified by a threat model rather than chosen for convenience?
34. What tests cover key substitution, tampering, replay, fragment mixing, media transformation and secret leakage?
35. What independent expertise is needed before any implementation or security claim?

## 8. Protocol specification and asynchronous delivery

36. Is sending to an offline recipient a mandatory requirement, or can the first protocol profile require both endpoints online?
37. If asynchronous delivery is required, which reviewed protocol supports it, and how are prekeys or equivalent one-time material published, consumed, replenished and protected against replay?
38. What exact event establishes key confirmation and permits a session or message to be accepted?
39. Is sender authentication intended only for the recipient, or must a third party be able to verify a signature?
40. If symmetric message-authentication keys are used, how is the fact that the recipient also knows the key reflected in claims about authorship?
41. How are long-term identity keys, key-agreement credentials and message/session keys bound and separated?
42. Does the multipart manifest avoid circular dependence between ciphertext and associated data, and are any post-encryption checksums incorrectly treated as authentication?
43. What happens to replay protection and one-time key state after backup restoration, rollback, concurrent initiation or device replacement?

## Review outcome

For each question, record:
- Finding and supporting evidence.
- Severity and affected research question/threat.
- Required change, if any.
- Documents and traceability entries affected.
- Whether the issue remains open.

Do not describe an unanswered question as a resolved design decision.

**Theory only · No implementation · Not audited.**
