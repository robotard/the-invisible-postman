# Research Practice: Critical Self-Examination and Collaborative Scrutiny

**Project:** The Invisible Postman  
**Document role:** Phase 1 research-practice work unit and standing methodological reference  
**Status:** Theory only · No implementation · Not audited.

## 1. Purpose

This document establishes how critical examination and peer discussion contribute to the research. It is not a substitute for the authors' own analysis, and it is not a request for reviewers to validate a predetermined conclusion.

The authors remain responsible for the claims, assumptions, scope, evidence and decisions in the thesis. The work must show that its own reasoning has been examined before external review is invited. Independent, well-informed criticism is then welcomed as a means of finding blind spots, testing assumptions, introducing alternative interpretations and improving or, where evidence requires it, changing the research.

The intended benefit extends beyond this particular proposition. A useful research record should help future readers understand not only what was concluded, but why, under which assumptions, what was challenged, what remains uncertain and what could be investigated differently.

## 2. Governing ethos

> **Never confuse agreement with progress.**

Agreement is not, by itself, evidence that a claim is sound. Disagreement is not, by itself, evidence that a claim is weak. Progress comes from disciplined examination: clear claims, relevant evidence, explicit assumptions, reasoned challenge and transparent responses.

This principle requires the project to:

- welcome criticism of the central proposition, not only its implementation details;
- distinguish a persuasive argument from a well-supported one;
- preserve reasoned dissent and minority interpretations;
- record rejected proposals and the reasons for rejecting them;
- change or withdraw claims when the evidence warrants it;
- avoid manufacturing consensus or presenting unresolved matters as settled; and
- recognise useful contributions even when they do not support the current architectural direction.

## 3. Authorial responsibility before external review

Before asking peers to examine the work, the authors should conduct and record a structured self-review. This is not a claim that every weakness has already been found. It is evidence that external reviewers are being invited into an active critical process rather than being asked to perform the authors' basic responsibility.

For each major claim or design choice, ask:

1. What exactly is being claimed, and at what level of confidence?
2. Is it an established mechanism, a proposed design, an assumption, a hypothesis or an open question?
3. What evidence supports it, and what evidence would count against it?
4. Which threat, research question or user need justifies the added complexity?
5. What alternatives were considered, including doing nothing or removing the feature?
6. What limitations, dependencies and failure cases remain?
7. Could the wording imply a stronger guarantee than the evidence supports?
8. What observation would cause the authors to revise or abandon the claim?

The thesis and working documents should distinguish these statement types consistently. Naming a recognised cryptographic primitive does not establish that the surrounding protocol is correct or secure.

## 4. The role of peer discussion

Peer discussion should test the work from perspectives that the authors may not share. Reviewers are invited to challenge the research question, scope, assumptions, architecture, terminology, evidence and proposed evaluation. They are not expected to endorse the proposition, and a reviewer's seniority or confidence does not replace evidence.

The project should seek complementary expertise where available, including:

- applied cryptography and protocol design;
- application, platform and infrastructure security;
- privacy engineering, metadata analysis and digital rights;
- steganography, image processing and steganalysis;
- distributed systems, identity and key management;
- usability, accessibility and human factors;
- digital forensics, operational security and incident response; and
- research methodology and evaluation design.

This is a guide to relevant perspectives, not a claim that reviewers in these disciplines have already participated.

## 5. Questions that discussion must be able to reach

Review should be capable of questioning whether the central proposition is useful or justified, not merely how to improve it.

Examples include:

- Is image-carried messaging solving a sufficiently distinct problem compared with ordinary encrypted attachments or other transport methods?
- Is the scope coherent, or does it combine unrelated objectives?
- Are the threat actors, capabilities, trust boundaries and exclusions realistic?
- What does first-contact identity verification actually establish, and what does it leave unresolved?
- Are key agreement, sender authentication, identity binding and key confirmation specified as distinct responsibilities?
- Are candidate protocol choices justified, or are algorithm names standing in for a complete protocol?
- Does image-carrier use add measurable value, and under what operating conditions?
- What can and cannot be inferred from steganalysis results? Are detectability claims bounded by a stated dataset, channel and adversary?
- What metadata remains visible to platforms, relays, hosts and network observers?
- Can multipart capsules be bound, validated and rejected safely under loss, duplication, reordering, substitution and mixing?
- Are expiry, revocation and recovery semantics operationally realistic?
- Does recovery add more trust, collusion and usability complexity than the use case justifies?
- Is the evaluation design capable of falsifying the important claims?
- Which statements are currently unsupported, ambiguous or too strong?

The review process must allow a reviewer to conclude that a feature should be removed, the scope narrowed, the research question changed or the central proposition reconsidered.

## 6. Handling criticism and dissent

Each substantive contribution should be recorded with enough context to understand and revisit it. A useful record includes:

- a stable issue or contribution identifier;
- the affected claim, section or decision;
- the challenge or alternative interpretation;
- the reasoning and evidence offered;
- the authors' response and any further evidence sought;
- the resulting action, if any;
- the reason for accepting, partially accepting or rejecting the proposal;
- the status of the matter; and
- any remaining disagreement or uncertainty.

Do not collapse distinct reviewer positions into a single consensus statement. Where a disagreement remains, record the competing reasoning fairly and state what evidence could help resolve it. Where it cannot presently be resolved, retain it as an open question.

A review item is not resolved merely because the authors have replied. Resolution requires a reasoned disposition, an appropriate change or a clearly documented explanation of why no change was made.

## 7. Asynchronous contribution model

The repository may use GitHub Issues for questions, challenges and discussion, and pull requests for proposed textual or research changes. These are proposed channels for asynchronous collaboration. Their presence in this document does not mean a live forum, reviewer group or active discussion already exists.

A future contribution guide should explain:

1. how to raise a new research issue or challenge;
2. how to identify the affected thesis section, claim or decision;
3. what evidence, references or reproducible reasoning to include;
4. how authors will acknowledge, investigate and respond;
5. how changes will be linked to the thesis and traceability register;
6. how unresolved dissent will remain visible; and
7. how privacy, attribution and confidential material will be handled.

Reviewers should not submit private keys, credentials, personal data, confidential correspondence or sensitive operational details to public issues. Public discussion should focus on claims and research material suitable for disclosure.

## 8. Evidence, attribution and research traceability

Criticism should be evaluated on its reasoning and evidence, not on whether it agrees with the current thesis. External references should be checked at source. Unverified recollections, informal suggestions and established findings should not be presented as equivalent evidence.

When a contribution changes the research:

1. record the original claim or decision;
2. record the challenge and its source, with attribution only as agreed;
3. identify the evidence considered;
4. document the authors' response and reasoning;
5. update affected thesis sections, decision records and traceability links;
6. preserve the prior rationale where it remains historically relevant; and
7. record any remaining dissent or uncertainty.

The project should be transparent about which feedback has been received, which has been evaluated, which has changed the work and which remains open. Do not imply peer endorsement where none has been given.

## 9. Phase 1 work-unit completion criteria

This research-practice work unit is complete when:

- the authors have conducted a documented critical self-review of the central proposition and current major claims;
- the purpose and limits of external peer discussion are explicit;
- relevant reviewer perspectives and disciplinary gaps have been identified;
- review questions cover scope, assumptions, identity and key verification, protocol choices, image-carrier value, steganalysis, metadata, multipart handling, lifecycle, recovery, evaluation and unsupported claims;
- a fair method for recording responses, dissent and unresolved questions has been agreed;
- the proposed asynchronous contribution channels and their current availability are described accurately; and
- the thesis, workplan, traceability and checkpoint use consistent language about author responsibility and collaborative scrutiny.

Completion of this work unit does not mean peer review has occurred, that the architecture is validated, or that any security claim has been proven.

## 10. Assurance

**Theory only · No implementation · Not audited.**
