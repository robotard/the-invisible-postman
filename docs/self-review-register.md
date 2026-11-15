# The Invisible Postman: Initial Self-Review and Challenge Register

**Document role:** Author-led critical review and starting register for future peer discussion  
**Basis:** Current thesis.md and working documents W1–W4  
**Status:** Initial author-identified issues · Open to independent challenge  
**Project assurance:** Theory only · No implementation · Not audited.

## Governing ethos

> **Never confuse agreement with progress.**

The register values reasoned challenge and evidence over agreement. It must preserve dissent and allow the central proposition to be narrowed, redirected or rejected.

## Purpose and interpretation

This register records questions the authors have identified through an initial critical reading of the current proposition and its supporting documents. These are not external reviewer findings, peer endorsements or completed resolutions.

The purpose is to make the authors' own scrutiny visible before inviting others to contribute. Reviewers are encouraged to challenge these items, add competing interpretations and identify omissions. The list is a starting point, not a closed taxonomy.

An issue remains open until its evidence, response and disposition are recorded. A written response alone does not constitute resolution. Disagreement may remain documented where the evidence does not settle it.

## Initial author-identified challenges

### SELF-01 · Does image-carried messaging solve a sufficiently distinct problem?

- **Section/location:** Thesis §§1–3, 8, 10–11; W1 §§1–5; W4 E6
- **Claim or assumption challenged:** The project assumes that using images as carriers is a sufficiently meaningful research proposition to justify a distinct architecture and evaluation programme.
- **Reviewer question:** What concrete problem does image-carried messaging solve that ordinary encrypted attachments, encrypted files or existing secure messaging transports do not? Is concealment a genuine requirement, an optional experiment or merely an aesthetic property?
- **Evidence needed:** Comparative analysis of relevant alternatives; clearly stated use cases; user and operational constraints; evidence of a benefit that survives realistic platform transformations and adversarial scrutiny.
- **Proposed action:** Define the minimum use case and comparison baseline. Be prepared to narrow the scope, treat the image carrier as an optional transport experiment, or reject the premise if no defensible advantage is identified.
- **Priority:** Critical
- **Status:** Open · Author-identified; not externally reviewed
- **Author response (2026-11-15):** The challenge is valid and currently unresolved. The thesis explains how images might carry encrypted material, but it does not yet establish why image carriage is preferable to an ordinary encrypted attachment, encrypted file transfer, or a conventional end-to-end encrypted messaging channel. Platform compatibility, portability and the possibility of optional concealment are plausible motivations, not demonstrated advantages. Concealment may also increase fragility under resizing, recompression, transcoding, moderation and steganalysis. The architecture's strongest research contribution may therefore be endpoint-controlled trust across an untrusted intermediary, with image carriage treated as one candidate transport profile rather than a necessary security property.
- **Provisional author recommendation:** Reframe the research so that it tests whether image carriage offers a defensible advantage against explicit alternatives. Unless comparative evidence establishes a unique requirement, keep the core architecture carrier-agnostic and use image carriage as a case study or optional profile. Do not remove the image-carried concept from the historical record or silently decide this scope question before the comparison is completed.
- **Comparison required:** (1) encrypted file/attachment carriage; (2) conventional end-to-end encrypted messaging; (3) image-carried encrypted capsules without concealment; and (4) image-carried capsules with optional concealment. Compare confidentiality, sender authentication, identity assurance, intermediary visibility, metadata, transformation tolerance, usability, deployability, complexity and failure modes.
- **Evidence still needed:** A bounded use case and user/operational requirements; a literature and system comparison; explicit platform transformation constraints; and evidence that any claimed benefit is not already available through simpler alternatives.
- **Status:** Open · Author response drafted · Comparative evidence and scope decision pending · Not externally reviewed

### SELF-02 · Are the central security goals stated as conditional design objectives rather than achieved properties?

- **Section/location:** Thesis abstract and central research question; thesis §§2–5; W2 §§2, 6; W3 §§1–2
- **Claim or assumption challenged:** The phrasing that an intermediary should be unable to decrypt or impersonate participants may be read as a security guarantee, although no complete protocol or implementation exists.
- **Reviewer question:** Which exact assumptions, cryptographic mechanisms, identity bindings and endpoint conditions would make these goals meaningful? What can a malicious coordinator still observe, alter, suppress or correlate?
- **Evidence needed:** Explicit security definitions and adversary model; complete protocol specification; key-custody and identity-binding analysis; threat-to-property mapping; later independent protocol review.
- **Proposed action:** Audit every statement for the distinction between research question, design constraint, intended property and demonstrated result. Phrase unverified properties as objectives under stated assumptions.
- **Priority:** Critical
- **Status:** Open · Author-identified; not externally reviewed
- **Author response (2026-11-15):** The concern is partly mitigated by repeated and explicit statements that the work is a proposal, not a protocol, implementation, formal proof or audit. W1, W2, W3 and W4 consistently describe goals, responsibilities and proposed acceptance conditions. The central research question is framed as a question, and the threat model describes intended goals rather than measured outcomes. However, the title's adjective "Authenticated", the shorthand "authenticated messaging", and some imperative architectural language can still be read as describing a property already achieved. The present evidence does not justify that reading.
- **Provisional author recommendation:** Retain the title provisionally, but define "authenticated" as an intended property of the proposed architecture, not a demonstrated result. In the manuscript, prefer "aims to support", "is intended to", "proposed", "candidate" and "would require" where the protocol is incomplete. Reserve present-tense claims such as "provides", "prevents", "ensures" and "protects" for properties actually established by cited mechanisms under stated assumptions. Add a claim-status convention to the thesis and audit the abstract, headings, tables, diagrams and conclusion as well as body text.
- **Important distinction:** An architectural requirement can say that an intermediary is not intended to possess plaintext or sole decryption authority. It cannot claim that a future implementation will achieve this until key custody, data flows, protocol composition, operational access and failure modes have been specified and evaluated.
- **Evidence still needed:** A claim inventory mapped to W2 threats and W4 evaluation criteria; primary specifications for any established cryptographic-mechanism claims; and later independent review of a complete protocol. No current document establishes the proposed system's security.
- **Status:** Open · Author response drafted · Claim-language audit and source verification pending · Not externally reviewed

### SELF-03 · What does first-contact identity verification actually establish?

- **Section/location:** Thesis §§3–5, 7; W1 RQ1; W2 §§4, 6–7; W3 identity/key-management boundary; W4 E2
- **Claim or assumption challenged:** Explicit key verification is required, but the identity model and verification ceremony remain unresolved.
- **Reviewer question:** Is the system verifying control of a cryptographic key, binding that key to a person, or establishing a broader real-world identity? What does the verification channel protect against, and how are key changes, device replacement, loss and coercion handled?
- **Evidence needed:** Comparison of plausible trust and verification models; explicit out-of-band or assisted verification assumptions; key-change and recovery analysis; usability and human-factors evidence.
- **Proposed action:** Separate cryptographic key continuity from human identity assurance. Define the intended assurance level and candidate verification ceremonies before claiming authenticated peer identity.
- **Priority:** Critical
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** The current architecture correctly rejects platform IDs as identity proof but does not yet specify a complete identity model.

### SELF-04 · Are candidate cryptographic primitives being mistaken for a protocol?

- **Section/location:** Thesis §7; W3 §§3–4, 10; W4 E2–E4
- **Claim or assumption challenged:** Candidate names such as X25519, HKDF-SHA-256, Ed25519 and XChaCha20-Poly1305 may create an impression of completeness despite unresolved protocol composition.
- **Reviewer question:** What exact authenticated key-agreement construction, transcript binding, key confirmation, identity binding, role separation, forward-secrecy properties, nonce rules, replay policy, downgrade handling and error behaviour are required? Are signatures necessary, and what precisely do they sign?
- **Evidence needed:** Primary specifications and security analyses for candidate mechanisms; complete protocol state machine and message formats; composition rationale; independent cryptographic review.
- **Proposed action:** Keep all primitives explicitly labelled as candidates. Do not select a suite or imply security from an algorithm list. Specify the complete protocol and its security goals before evaluation.
- **Priority:** Critical
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** Current documents acknowledge these gaps. A protocol-level design decision remains deferred.

### SELF-05 · Does the carrier layer add value, and what is the separate value of concealment?

- **Section/location:** Thesis §§1, 3, 8, 10; W1 RQ3; W3 carrier encoder/decoder; W4 E6
- **Claim or assumption challenged:** Image carriage and optional steganography are prominent parts of the proposition, but their independent contribution has not been demonstrated.
- **Reviewer question:** Is the image needed for transport, user experience, plausible deniability, concealment or another specific purpose? Which of these objectives is technically and empirically defensible? Could ordinary encrypted files meet the same need with less complexity?
- **Evidence needed:** Use-case analysis; comparison with non-image carriers; supported format and transformation profiles; capacity, reliability, usability and operational constraints; clearly bounded concealment evaluation.
- **Proposed action:** Separate carrier utility from concealment utility. Define a baseline without steganography and justify each additional layer against a measurable objective.
- **Priority:** High
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** No comparative evaluation or measured carrier benefit is currently available.

### SELF-06 · Are steganalysis claims testable and appropriately bounded?

- **Section/location:** Thesis §§2, 8, 10; W1 §§3, 6; W2 §§5–7; W4 E6
- **Claim or assumption challenged:** The project recognises that concealment may be detected, but a specific adversary, detection model, dataset, metric and evaluation environment have not been defined.
- **Reviewer question:** What does “less apparent” mean in measurable terms? Which detector, analyst capability, carrier source, image format, payload rate, transformation chain and false-positive/false-negative trade-off matter? Is concealment worth its fragility?
- **Evidence needed:** Relevant steganography and steganalysis literature; documented threat model; reproducible datasets and test conditions; baseline comparisons; limitations and statistical interpretation.
- **Proposed action:** Avoid generic robustness or undetectability language. Define a narrow experimental question before proposing a method or performance threshold.
- **Priority:** High
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** No empirical steganalysis results are claimed. A bounded evaluation design remains outstanding.

### SELF-07 · Is the metadata threat model sufficiently concrete?

- **Section/location:** Thesis §§3–4, 8, 10; W2 §§3–5, 7; W3 coordinator boundary; W4 E9
- **Claim or assumption challenged:** The documents acknowledge metadata leakage but do not yet provide a complete inventory of what each intermediary or observer can see and retain.
- **Reviewer question:** Which identifiers, timestamps, image dimensions, file sizes, hashes, routing references, participant relationships, delivery events and access logs are visible to each actor? What correlation remains possible even when content is encrypted?
- **Evidence needed:** Actor-by-actor data-flow and metadata inventory; platform-specific documentation where relevant; retention and access assumptions; traffic-analysis literature.
- **Proposed action:** Create a metadata visibility matrix and distinguish content confidentiality from unlinkability, anonymity and traffic-analysis resistance.
- **Priority:** High
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** The threat model lists metadata categories but does not yet map each field to each actor and retention point.

### SELF-08 · Does multipart validation distinguish transport reordering from invalid message construction?

- **Section/location:** Thesis §§5–6; W1 RQ4; W2 §§5–7; W3 §§3.5, 4; W4 E5
- **Claim or assumption challenged:** Current wording sometimes groups reordering with conditions that should be rejected. A receiver may be able to safely reassemble legitimately reordered fragments if authenticated indices and a manifest are correctly specified.
- **Reviewer question:** Which conditions must be rejected, which can be normalised safely, and how are duplicates, conflicting indices, missing fragments, cross-message substitution, truncation, oversized inputs and resource exhaustion handled?
- **Evidence needed:** Proposed manifest and envelope format; authenticated field definitions; parser and reassembly threat analysis; adversarial test cases; resource and size limits.
- **Proposed action:** Specify the difference between transport arrival order and authenticated logical order. Require strict message-set binding and safe failure without assuming every out-of-order arrival is inherently invalid.
- **Priority:** Critical
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** The current documents require strict validation but do not yet define the manifest, reassembly algorithm or resource limits.

### SELF-09 · Are expiry, revocation and recovery proportionate to the actual use case?

- **Section/location:** Thesis §9; W1 RQ5–6; W2 §§6–7; W3 lifecycle and optional recovery; W4 E7–E8
- **Claim or assumption challenged:** Lifecycle and threshold recovery introduce substantial governance, identity, availability and collusion complexity. Their necessity for the minimum research proposition has not been demonstrated.
- **Reviewer question:** What specific problem requires threshold recovery? Who authorises it? What happens when a device is offline, a key is compromised, a trustee is unavailable or participants collude? Which lifecycle controls can endpoints actually enforce?
- **Evidence needed:** Use-case justification; comparison with simpler key backup and recovery models; threat and collusion analysis; operational and usability analysis; precise expiry and revocation semantics.
- **Proposed action:** Keep recovery outside the minimum architecture unless a concrete need is demonstrated. Separate future-access policy from any suggestion of recalling copied plaintext or keys.
- **Priority:** High
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** Recovery is currently deferred and no threshold topology is selected. The need for its continued inclusion should be challenged.

### SELF-10 · Can the evaluation programme falsify the proposition?

- **Section/location:** Thesis §§10–11; W1 RQ7; W4 §§2–9; traceability evidence model
- **Claim or assumption challenged:** The evaluation domains are broad, but measurable acceptance criteria, baselines, reproducible procedures and stopping rules remain incomplete.
- **Reviewer question:** Which observations would count as failure of the central proposition? How will the work compare with simpler alternatives? Which tests can support only narrow claims, and which questions require formal analysis or specialist review?
- **Evidence needed:** Research-method justification; testable hypotheses; baseline systems; defined adversary and test environment; measurable outcomes; reproducibility plan; independent review criteria.
- **Proposed action:** Build an evaluation matrix linking each research question and threat to a hypothesis, method, evidence type, limitation and falsification condition. Do not invent numerical thresholds before their rationale is established.
- **Priority:** Critical
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** W4 defines evaluation domains and proposed conditions, but does not yet provide a complete experimental or analytical protocol.

### SELF-11 · Is the research scope too broad for a defensible contribution?

- **Section/location:** Thesis §§1–2, 6–11; W1 scope and non-goals; W3 component boundaries; W4 evaluation domains
- **Claim or assumption challenged:** The proposal spans identity, key management, secure messaging, steganography, image transformation, multipart transport, metadata, lifecycle and threshold recovery. This may dilute the central research contribution.
- **Reviewer question:** Which concerns are essential to answer the central question, which are necessary supporting constraints, and which should be removed or treated as future work?
- **Evidence needed:** Clear contribution statement; dependency map; comparison of minimum and expanded scopes; justification for every component and evaluation domain.
- **Proposed action:** Define a minimum research core and explicit exclusions. Retain optional features only where they support a justified research question.
- **Priority:** Critical
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** The workplan already states that complexity must earn its place. A scope-pruning exercise remains necessary.

### SELF-12 · Are the claims and references sufficiently grounded?

- **Section/location:** Entire thesis; W1–W4; decision register; traceability
- **Claim or assumption challenged:** The manuscript contains substantial technical reasoning but still needs a disciplined source apparatus distinguishing primary specifications, peer-reviewed research, secondary commentary and project interpretation.
- **Reviewer question:** Which statements require primary-source citations? Are candidate mechanisms described accurately and in context? Are limitations and competing findings represented fairly?
- **Evidence needed:** Primary protocol specifications, standards, peer-reviewed research, relevant platform documentation and source notes for empirical claims.
- **Proposed action:** Build a claim-to-source register. Verify each citation at source, record publication/version details and avoid citing a source for a stronger claim than it supports.
- **Priority:** High
- **Status:** Open · Author-identified; not externally reviewed
- **Response/resolution:** The active thesis requires a source and reference integration pass. No claim of completed literature review is made.

## Register operation and review workflow

For every new item, retain these fields:

| Field | Required content |
|---|---|
| Issue ID | Stable identifier |
| Section/location | Exact thesis, W1–W4 or repository location |
| Claim or assumption challenged | The statement under examination |
| Reviewer question | A concise, answerable challenge |
| Evidence needed | Sources, analysis, data or test |
| Proposed action | Investigate, revise, narrow, remove, test or defer |
| Priority | Critical, high, medium or low |
| Status | Open, investigating, response drafted, disputed, resolved or superseded |
| Response/resolution | Evidence considered, author reasoning and disposition |
| Dissent | Material disagreement that remains |

### Status and attribution rules

- The SELF- identifiers above are author-identified challenges, not external peer-review findings.
- Do not add a reviewer's name or affiliation without permission.
- Do not describe a contribution as consensus or endorsement unless the evidence and contributors support that description.
- A closed item must retain its reasoning and any dissent; closure does not mean universal agreement.
- Future GitHub Issues may host asynchronous discussion and pull requests may propose changes. This register is the repository record; it does not imply a live forum currently exists.
- Never put secrets, credentials, personal data or confidential correspondence in public discussion.

## Next self-review pass

The next pass should test the current manuscript claim by claim against these issues, then add any omitted challenges. Priority does not determine truth; it indicates the importance of resolving the question before stronger conclusions or publication.

**Project status:** Theory only · No implementation · Not audited.
