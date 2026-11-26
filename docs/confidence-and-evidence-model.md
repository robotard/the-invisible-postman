# Confidence and Evidence Model

**Purpose:** Define how The Invisible Postman makes bounded claims about what can be known, verified and inferred across endpoint protection, message relationships and delivery routes.

**Project assurance:** Theory only · No implementation · Not audited.

**Status:** Proposed research model for integration and challenge. It is not a protocol specification, implementation, calibrated probability model, assurance certification or demonstrated property.

## 1. Foundational proposition

> **The Invisible Postman does not promise certainty. It makes the basis, boundaries and limitations of confidence explicit.**

The project's candidate organising principle is that it should help participants and evaluators establish what can legitimately be concluded from available evidence, rather than merely make information discoverable or attach a generic security label to it. This is a research proposition, not a claim of originality or a proven system property.

Confidence is not a property that software can simply declare. It is a reasoned epistemic judgement about a particular claim, made by a particular verifier, from particular evidence, under stated assumptions and a defined threat model. A system can expose evidence and support verification; it cannot make a false claim true or remove uncertainty that the evidence does not resolve.

## 2. Terms that must not collapse into one another

| Term | Meaning in this research | Boundary |
|---|---|---|
| Confidence | A verifier's evidence-bounded degree of belief in a specific proposition | Not a universal score or property emitted by the system |
| Trust | A decision to rely on a person, key, device, service or process | May include social, institutional and operational judgement beyond cryptographic evidence |
| Assurance | A justified argument that specified requirements are met under a stated scope and evaluation regime | Requires evidence, competent scrutiny and declared limitations; not a badge |
| Security | A set of properties against defined adversaries and capabilities | No single undifferentiated state called "secure" |
| Authenticity | Evidence that an object or statement is attributable to a particular key or authenticated process | Does not prove the real-world identity or truthfulness of the key holder |
| Integrity | Evidence that protected data/context has not been altered undetectably under the mechanism | Does not prove completeness, delivery, freshness or semantic truth |
| Discoverability | Ability to locate or retrieve an object | Does not prove origin, completeness, recipient identity or successful receipt |
| Truth | Whether a proposition corresponds to reality | Cryptographic validity alone cannot establish it |

A valid signature can support a claim about possession or use of a signing key. It does not establish that the signer is honest, that a factual statement is true, or that a named human controlled the key unless a separate binding process supports that inference.

## 3. A claim-centred evidence record

Confidence should be represented as an inspectable relationship between a claim and its evidence, not collapsed into one numeric score. For each material claim, record as applicable:

1. **Claim:** the exact proposition being assessed.
2. **Scope:** object, message, set, conversation, event, route, time interval and population covered.
3. **Verifier:** endpoint, user, reviewer, service or observer making the judgement, including the relevant vantage.
4. **Evidence:** cryptographic verification result, authenticated context, receipt, log, source, measurement, review or user confirmation.
5. **Evidence provenance:** who or what produced it, how it was obtained, and whether it can be independently checked.
6. **Source dependence:** whether evidence items share an author/group, account, codebase, dataset, implementation, platform, measurement pipeline or underlying source. Separate artefacts must not be counted as independent corroboration merely because they have different titles or file locations.
7. **Mechanism:** the protocol, process or measurement supporting the inference, including version and configuration where relevant.
8. **Assumptions and threat model:** trusted components, adversary capabilities, collusion assumptions and verifier vantage.
9. **Freshness and lifecycle:** timestamp or epoch, expiry, revocation state, key changes and whether the evidence remains applicable.
10. **Counterevidence and dissent:** contrary observations, failed cases, negative results, plausible competing explanations and unresolved reviewer disagreement, with their provenance.
11. **Gaps and alternatives:** missing evidence, unavailable sources, untested assumptions and explanations not excluded.

Do not compress four different questions into one status label:

| Dimension | Example values | Question answered |
|---|---|---|
| Evidence availability | Not sought; unavailable; partial; available; not applicable | Is the relevant evidence present and accessible? |
| Verification outcome | Not checked; passed; failed; inconclusive; not applicable | What happened when the stated check was performed? |
| Claim disposition | Supported within scope; supported with limitations; indeterminate; contradicted | What conclusion is justified about the proposition? |
| Evidence lifecycle | Current; stale; expired; revoked; superseded | Does the evidence still apply at the relevant time? |

"Not checked" is not "passed"; "unavailable" is not "failed"; "contradicted" is not merely "unknown"; and "expired" describes lifecycle, not the truth value of the original observation. Omitted fields must not be silently interpreted as satisfied.

### 3.1 Minimum record and proportionality

A material claim normally needs a minimum record containing the claim, scope, verifier/vantage, evidence and provenance/dependence, assumptions, counterevidence or gaps, claim disposition and freshness/lifecycle. Mechanism versions, quantitative calibration, recipient/retention/linkability details and other extensions are conditional on the claim. Do not collect personal identifiers, behavioural traces or telemetry merely to fill a template. The record is sufficient only if it makes the inference and its limits inspectable.



## 4. Evidence classes and claim boundaries

| Evidence class | Can support | Cannot establish by itself |
|---|---|---|
| AEAD verification | Ciphertext and authenticated data validate under the supplied key and parameters | Human sender identity, semantic truth, delivery or completeness of a larger set |
| Signature verification | A signature validates under a public key | Real-world identity binding, intent, truth or uncompromised key custody |
| Peer key verification | A key matches the participant's selected verification process | Future control of the endpoint or honesty |
| Authenticated manifest and fragment checks | Received parts belong to a defined protected set and satisfy the manifest rules | That all parts were published, discovered or delivered unless completeness is actually checked |
| Transport acknowledgement | A named transport component accepted or acknowledged an event according to its semantics | Endpoint receipt, decryption, display or reading unless those are explicitly evidenced |
| Endpoint receipt | A receiving endpoint reports obtaining a defined object | Successful decryption, human attention or comprehension |
| Decryption success | The endpoint recovered plaintext under the applicable key | Truth, authorship beyond the authenticated protocol, or user reading |
| Read/open signal | A client or user action generated a signal under its implementation semantics | Human comprehension, attention or non-repudiable proof of reading |
| Platform/index/search result | An object was discoverable through that source at a time | Authenticity, completeness, freshness or successful recipient retrieval |
| Human confirmation | A person reports an event or interpretation | Independent corroboration or cryptographic proof unless separately supported |
| Research paper/code | A source reports or implements a method within its stated scope | Reproduction, generalisation, current platform deployment or independent audit |

The verbs used in the thesis must match the evidence: *created, signed, accepted, relayed, delivered, received, decrypted, displayed, opened, read* and *understood* are different events. A stronger verb must not be inferred from a weaker event.

## 5. Multi-message and package confidence

The project must distinguish confidence in an individual object from confidence in relationships among objects:

- **Object validity:** this protected object passes the relevant cryptographic and parsing checks.
- **Fragment membership:** this capsule is authenticated as belonging to a particular logical fragment set.
- **Set completeness:** all required fragments or a sufficient authenticated coding threshold are present and validated.
- **Reconstruction:** the reconstructed object matches the authenticated length/digest/context and passes endpoint validation.
- **Conversation continuity:** distinct logical messages are linked by authenticated session/conversation context.
- **Retry identity:** a later delivery event is a retry or duplicate of the same logical object, not a new message.
- **Cross-route equivalence:** two route copies represent the same protected object, established through authenticated identifiers or commitments rather than timing or visual similarity alone.
- **Observer-inferred linkage:** an observer's correlation hypothesis based on timing, size, provenance, media artefacts or access patterns; this is not equivalent to endpoint-authenticated linkage.

A valid fragment does not prove a complete set. A complete set does not prove a conversation relationship. A conversation identifier does not prove that all messages were delivered. GIF frames within one carrier remain distinct from separate carrier objects and logical messages. Package encapsulation provides framing, not authentication. These boundaries are central to the multi-message and steganographic carriage analysis.

## 6. Delivery as an evidence ladder

Delivery status should be represented as a sequence of separately evidenced events, not one binary "sent/delivered" state:

1. Prepared at sender endpoint.
2. Submitted to a transport or host.
3. Accepted by the named service.
4. Relayed or published according to service semantics.
5. Discovered or retrieved by the recipient endpoint.
6. Received and parsed.
7. Cryptographically validated.
8. Decrypted.
9. Displayed or opened by a client.
10. Explicitly acknowledged by a participant.

An event may be absent, delayed, duplicated, forged at an untrusted layer, or unavailable to the verifier. The system must state who generated the evidence and what the event means. It must not claim human reading or comprehension from transport-level acknowledgement.

## 7. Confidence is observer- and time-relative

The same event may support different conclusions for different observers. An endpoint with keys and authenticated state may verify fragment membership; a platform may see only uploads, timestamps and account identifiers; a network observer may see traffic metadata; a researcher may have only published methods and partial source access.

Confidence also decays or changes when keys are revoked, devices are compromised, evidence is superseded, logs are deleted, source versions change or assumptions cease to hold. Evidence should therefore carry provenance, scope and freshness. A stale verification must not be displayed as current without qualification.

## 8. Privacy and minimisation constraint

An evidence model can itself create a surveillance system if every verification event, recipient, message relationship and read signal is centralised. The default research direction is endpoint-local verification and minimal disclosure. A confidence/evidence record should not automatically become a globally visible receipt, stable message identifier, tracking token or mandatory telemetry stream.

Where evidence must be shared, the design must specify its recipient, purpose, retention, linkability and revocation limits. The value of additional evidence must be weighed against the metadata it creates.

## 9. Evaluation questions

The model is useful only if it can be challenged. Evaluation should ask:

- Can a user distinguish key verification from real-world identity assurance?
- Can the system distinguish valid ciphertext from a true statement?
- Can it detect an incomplete, mixed or replayed fragment set?
- Can it distinguish endpoint-authenticated linkage from observer correlation?
- Does it report the exact delivery event evidenced, without upgrading it to reading?
- Does it expose missing, stale, revoked or contradictory evidence?
- Can a verifier inspect provenance, source dependence, assumptions, scope, counterevidence and unresolved alternatives?
- Can separate artefacts be recognised as dependent when they share an author group, account, dataset, codebase or measurement pipeline?
- Are evidence availability, verification outcome, claim disposition and lifecycle state reported separately?
- Are failed cases, contradictory observations and reviewer dissent retained rather than omitted from the summary?
- Can a proportionate minimum record remain useful without a central ledger or additional behavioural telemetry?
- Does the evidence model leak more metadata than it protects?
- Can two independent reviewers reach compatible conclusions from the same evidence record?
- Does the model resist confidence inflation caused by polished interfaces, green ticks, numeric scores or unqualified words such as "verified"?

No numeric confidence score is proposed. If later research establishes a need for quantitative estimation, it must define the target proposition, calibration data, error costs, population, independence assumptions and uncertainty interval. A score without those elements would create false precision.

## 10. Illustrative application to a source claim

Consider the author-reported claim in SRC-034 that DRAS reduces message-extraction error by approximately 87% relative to a state-of-the-art comparator.

| Claim-record field | Bounded entry |
|---|---|
| Claim | The authors report an approximately 87% reduction in extraction error against their selected comparator. |
| Scope | The DRAS paper's reported JPEG downward-recompression experiments and named platform tests; not arbitrary image routes or messaging systems. |
| Evidence available here | Publisher-indexed abstract and method/evaluation snippets; source-register record and author-linked public MATLAB repository inspection. |
| Provenance | Publisher record and author-linked repository, as recorded in SRC-034. |
| Mechanism described | RoLoS coefficient selection and CARE predictive channel modelling with syndrome-trellis coding. |
| Missing evidence | Full methods, complete result tables, sample sizes, payload settings, platform acquisition procedure and full limitations. |
| Independent verification | None. The public demo was inspected but not executed; the paper's result was not reproduced. |
| Disposition | Author-reported result, partially reviewed; not independently verified. |

This record supports the statement that the authors report the result under their study conditions. It does not support a claim that the result was reproduced, generalises to all platforms, establishes endpoint authenticity, proves message-set completeness, or demonstrates delivery security. The publisher's indexed content and a code repository are distinct evidence items; neither should be silently upgraded into full-text review or independent reproduction.

The related SNP StegoLab repository (SRC-062) illustrates why source dependence must be recorded. It is hosted by the same GitHub account as the MRAS/DRAS repositories and is a companion code artifact, not an independent replication. Its batch runner skips failed embedding/transmission/extraction cases, truncates unequal bit vectors for BER, and measures PSNR/SSIM before channel transmission. Those limitations are counterevidence against treating its README summary as an independently verified platform result.

SRC-036 provides a complementary example. Its indexed description of an attack/filtering module and image-quality optimisation module, plus the stated BOSSbase/BOWS2 and JPEG QF75 context, supports a bounded description of the proposed sanitization approach. It does not establish that a named platform deploys that model or that the method defeats every current embedding scheme. The missing training configuration, complete results and generalisation limits remain material.

These examples are not independent validation of the confidence model. They are a practical check that its fields can preserve author attribution, study scope, evidence provenance and unresolved limitations without turning a reported result into a stronger claim.

## 11. Research status and falsifiability

The model is a proposed conceptual framework to integrate into W1–W4 and the thesis. The 2026-11-26 documentary challenge adds source-dependence, counterevidence/dissent and separate evidence-availability, verification, claim-disposition and lifecycle axes. Its usefulness, usability, reviewer agreement, completeness and privacy cost have not been empirically evaluated. It does not establish a novel contribution. It should be revised or removed if it adds terminology without improving claim precision, evidence traceability or evaluation.
