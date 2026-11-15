# Collaborative Research Governance Framework

**Short name:** CRGF  
**Role:** Project-wide method for review, attribution, decision ratification and adoption of shared practices  
**Status:** Proposed governance model · Not yet externally ratified  
**Project assurance:** Theory only · No implementation · Not audited.

## 1. Purpose

The Invisible Postman is intended to be useful beyond its immediate thesis. This framework defines how contributors can challenge the research, propose better practices, review evidence, receive accurate attribution and help maintain a shared project baseline.

The aim is consortium-like collaboration without pretending that a consortium already exists. A repository can host an auditable process; it cannot manufacture a community, expertise, independence or consensus by declaring them.

> **Never confuse agreement with progress.**

Agreement may authorise adoption of a practice under this project's governance. It does not make the practice universally true, prove its security or remove the need for future review.

## 2. Scope and vocabulary

Use the following terms precisely:

- **Contribution:** A specific piece of work or review supplied by an identifiable person or group.
- **Review:** Examination of a defined claim, change or artifact. Review does not automatically imply endorsement.
- **Decision:** A recorded choice among alternatives, including its rationale, evidence, assumptions and dissent.
- **Practice proposal:** A proposed reusable recommendation, method, criterion or working rule.
- **Ratification:** A recorded governance decision that a practice meets the project's adoption criteria.
- **Adopted baseline:** The versioned set of practices currently used as the project's shared working standard.
- **Global commit:** Informal name for the auditable, project-wide merge that updates the adopted baseline. "Global" means across this repository and its declared workstreams, not universal adoption by the research community or automatic authority over other projects.
- **Consortium:** A future possibility requiring willing participants, defined representation and governance. This project is not currently an established consortium.

A practice may be adopted for this project without being presented as a universal best practice. Prefer the label **project-adopted practice** unless broader evidence and independent community acceptance justify stronger wording.

## 3. Governance principles

1. **Evidence before agreement.** Reviewers examine reasoning, sources, limitations and counterexamples, not popularity.
2. **Author responsibility remains.** Maintainers cannot outsource responsibility for claims or decisions to reviewers.
3. **Independent review matters.** A proposer cannot be the sole reviewer or ratifier of their own proposal.
4. **Attribution is explicit and consent-based.** No one is credited with work, endorsement or authorship they did not perform or agree to.
5. **Review scope is bounded.** A reviewer approves only the exact artifact, version and claims they reviewed.
6. **Dissent is retained.** Minority views, unresolved objections and rejected alternatives remain discoverable.
7. **Adoption is reversible.** New evidence can revise, suspend or supersede an adopted practice.
8. **Automation checks process, not truth.** Software may validate required records and merge gates; it must not infer scientific validity from votes, reactions or wording.
9. **No false authority.** The framework does not claim standards-body status, formal certification or universal consensus.
10. **Complexity earns its place.** Each practice must solve a documented problem and state its costs and limits.

## 4. Practice lifecycle

Every proposed practice moves through explicit states:

| State | Meaning | May be used as an adopted baseline? |
|---|---|---|
| Draft | Proposal is being prepared | No |
| Open for review | Exact version and review questions are published | No |
| Under revision | Material feedback is being addressed | No |
| Evidence pending | A claim depends on missing evidence or testing | No |
| Ratified | Required independent review and decision criteria are met | Not until merged |
| Adopted | Ratified proposal is merged into the baseline with attribution and version record | Yes, within stated scope |
| Contested | A material challenge is open; practice is flagged for reassessment | Only with an explicit caution or suspension decision |
| Superseded | Replaced by a later adopted version | No, historical record only |
| Rejected | Not adopted, with reasons retained | No |
| Withdrawn | Proposer or maintainers withdraw it before adoption | No |

A proposal must not be labelled "best practice" merely because it has been discussed, approved by one maintainer or merged. The status and scope must be visible.

## 5. Minimum practice-proposal record

Every proposal must include:

- stable practice ID and version;
- title and concise recommendation;
- problem or risk it addresses;
- intended scope and contexts where it does not apply;
- evidence, standards and primary sources;
- alternatives considered, including no change;
- assumptions, trade-offs and known failure modes;
- security, privacy, accessibility and operational implications where relevant;
- proposed adoption criteria and how they can be checked;
- review questions and requested expertise;
- proposer identity and contribution statement;
- reviewer identities and exact review scope, subject to consent;
- responses to material feedback;
- decision, date, ratifiers and rationale;
- dissent, abstentions and unresolved limitations;
- affected repository documents and baseline version.

A practice that cannot state its scope, evidence and failure conditions is not ready for ratification.

## 6. Review and ratification rules

### 6.1 Ordinary project practice

For a low-risk editorial or process practice:

- at least one independent reviewer other than the proposer;
- review of the exact proposed text and evidence;
- explicit maintainer disposition;
- no unresolved material factual or attribution issue;
- a recorded rationale and version.

### 6.2 Security-, privacy- or safety-significant practice

For a practice affecting security claims, cryptographic protocol choices, identity, key handling, privacy, safety or sensitive data:

- at least two independent reviewers other than the proposer;
- at least one reviewer with relevant demonstrated domain competence;
- reviewers must examine the exact version proposed for adoption;
- material objections must be answered with evidence or retained as unresolved;
- the maintainer must record the decision and explain why adoption is justified despite any remaining dissent;
- where evidence is insufficient, the practice remains provisional or is not adopted.

The project may raise these thresholds for high-impact decisions. It must not lower them merely because reviewers are unavailable.

### 6.3 What counts as independent

Independence is contextual, not a badge. Record relevant relationships that could materially affect review, such as co-authorship of the proposal, direct responsibility for the design, financial or organisational interests, or dependence on the outcome. Do not demand intrusive personal disclosures. Where independence is uncertain, state the limitation.

### 6.4 No false consensus

- A reaction, poll, number of comments or absence of objections is not approval.
- Silence is not consent.
- A review approval applies only to the reviewed diff and stated scope.
- A reviewer may approve a process change while dissenting from the thesis proposition.
- A material unresolved objection may prevent ratification where it concerns a necessary assumption or evidence gap.
- If a proposal is adopted despite a non-blocking dissent, the dissent and maintainer's rationale must be linked from the decision record.

## 7. The project-wide baseline commit

The "global commit" is the final, auditable adoption event for a ratified practice.

Recommended sequence:

1. Open a practice proposal as a GitHub Issue or pull request.
2. Assign a stable practice ID and create the decision record.
3. Publish the exact text, scope, evidence and review questions.
4. Invite relevant reviewers; record who actually participates.
5. Receive review comments and formal review dispositions.
6. Revise the proposal; any material change resets approval of the changed content.
7. Complete the ratification checklist and record dissent.
8. Merge a pull request that updates the adopted-practices index and relevant working documents.
9. Record the merge commit SHA, adopted version, contributors, reviewers, ratifiers and exact files changed.
10. Run repository checks for required metadata, valid links, unique IDs and consistent status labels.
11. If a later challenge succeeds, create a superseding decision rather than silently rewriting history.

The baseline should be a versioned document, not an invisible convention. Each adopted entry links to its originating proposal, review record, decision and merge commit.

## 8. Attribution and contributor recognition

### 8.1 Attribute the work actually performed

Use the CRediT Contributor Role Taxonomy as a vocabulary where it fits. It provides 14 contributor roles and supports multiple roles per person. It is a contributor-description framework, not an automatic authorship test. Contributors should be given the opportunity to review and confirm their assigned roles.

Potential roles relevant to this project include:

- Conceptualization
- Investigation
- Methodology
- Formal analysis
- Validation
- Resources
- Writing – original draft
- Writing – review & editing
- Visualization
- Project administration

Use only roles supported by the actual contribution. Add a plain-language description and identify the artifact or decision affected.

### 8.2 Separate contribution, review, approval and endorsement

These are different actions:

| Action | What it means | What it does not mean |
|---|---|---|
| Proposed | Originated or submitted a suggestion | That it was accepted |
| Contributed | Supplied substantive analysis, text, evidence or design | That the whole thesis is endorsed |
| Reviewed | Examined a specified artifact and supplied feedback | That every claim or later edit is approved |
| Approved | Formally approved a specific version under the review process | Universal endorsement |
| Ratified | Participated in the recorded governance decision | That the practice is universally true |
| Maintained | Integrated and maintained the adopted record | Sole intellectual authorship of all contributions |

### 8.3 Git attribution rules

- Preserve GitHub's actual commit author and committer metadata.
- Use co-author commit trailers only for people who made a substantive contribution to that commit and have agreed to be credited that way.
- Do not add reviewers as commit co-authors merely because they reviewed or approved a pull request.
- Record review and ratification separately in the decision record.
- Ask contributors to confirm their preferred public name, GitHub handle, affiliation (optional), contribution description and attribution preference.
- Do not infer a person's legal identity or affiliation from a username.
- Correct attribution errors transparently and retain the correction history.
- Allow anonymous or pseudonymous review where feasible; do not make public naming a condition of useful criticism.

### 8.4 Accepted contribution mapping

For each adopted decision, record a mapping:

| Contributor | Contribution | CRediT role(s) or equivalent | Artifact/section | Accepted portion | Attribution confirmed? |
|---|---|---|---|---|---|
| Person or pseudonym | Exact work supplied | Role(s) | File, section, issue or commit | What was actually incorporated | Yes / No / Pending |

A person's suggestion may be partly accepted, adapted or rejected. Record that accurately. Do not imply that the contributor endorses the final form unless they explicitly confirm it.

## 9. Asynchronous collaboration through GitHub

Proposed channels:

- **Issues:** questions, critiques, evidence submissions and discussion.
- **Pull requests:** proposed changes to research documents and adopted practices.
- **Review records:** formal, version-specific review and disposition.
- **Decision register:** durable record of accepted, rejected, contested and superseded decisions.
- **Adopted-practices index:** the current project baseline.

GitHub's formal approving-review controls have permission requirements. External reviewers who do not have write access may still provide valuable review through public comments, issues or a fork, but those comments should not be misrepresented as GitHub's formal approving review. The governance record must distinguish the two.

The current repository is user-owned. Do not assume that organisation teams, team-based CODEOWNERS or a multi-institution consortium are available.

## 10. Automation boundary

Automation may eventually:

- require a proposal template and stable ID;
- check that evidence, scope, limitations and attribution fields are present;
- check that required reviewer records exist;
- check that a changed diff has been reviewed again;
- verify internal links, unique IDs and baseline references;
- prevent a proposal marked Draft, Contested or Evidence pending from entering the adopted index;
- generate a contribution summary from confirmed records;
- add an adopted entry only after the ratification state and required approvals are present.

Automation must not:

- decide whether evidence is scientifically adequate;
- infer expertise or reviewer independence from profile data;
- count emoji reactions as votes;
- turn silence into consent;
- infer that an approved PR validates every security claim;
- automatically adopt a practice merely because a numerical threshold is met;
- erase dissent, minority reports or attribution uncertainty.

A human ratifier remains accountable for the final decision. Automated merging may be considered only after the governance process has been exercised, the repository's access model is understood and safeguards are tested. It is not enabled by this document.

## 11. Current repository status and implementation boundary

At the time this framework was added:

- the repository has an established public GitHub home and a documented review register;
- no GitHub rulesets were returned by the repository rulesets endpoint;
- the branch-protection endpoint could not be inspected through the available connection, so branch-protection state is unverified;
- no automated ratification or adoption workflow has been created;
- no external reviewers, consortium members or ratified practices are claimed.

The framework is therefore a proposed governance design, not an operating peer-review consortium.

## 12. Adoption checklist

A practice may be proposed for adoption only when all applicable items are evidenced:

- [ ] Stable ID, version, scope and problem statement.
- [ ] Evidence and primary sources checked.
- [ ] Alternatives and trade-offs recorded.
- [ ] Failure modes and limitations stated.
- [ ] Independent review completed at the required level.
- [ ] Exact version reviewed and material changes re-reviewed.
- [ ] Reviewer and contributor attribution confirmed or explicitly withheld.
- [ ] Material objections answered or retained as dissent.
- [ ] Ratification decision and accountable ratifier recorded.
- [ ] Adopted-practices index and affected documents updated.
- [ ] Merge commit SHA and baseline version recorded.
- [ ] Automated repository checks passed, where configured.

## 13. Existing frameworks: borrow, adapt and refuse carefully

This framework should not reinvent mature open-source and research-governance practice. The following models provide useful components, but each has a different purpose and must not be treated as interchangeable.

### 13.1 OpenSSF Best Practices Badge

**Borrow:** its public, criteria-based self-assessment; explicit contribution instructions; documented governance and roles; traceable version-controlled changes; and progressively stronger maturity expectations.

**Adapt:** maintain a local evidence-backed checklist for the research repository. Mark each criterion as applicable, not applicable with rationale, met with evidence, partially met or not yet assessed. Do not award ourselves a badge or imply certification.

**Do not copy blindly:** the OpenSSF criteria are designed for FLOSS software projects. This repository is currently a theory-only research project with no implementation. Software-specific requirements must be marked not applicable or deferred, not claimed as satisfied. The badge is voluntary project self-certification, not independent peer review and not proof that a research claim is correct.

Source: https://openssf.org/projects/best-practices-badge/ and https://www.bestpractices.dev/en/criteria

### 13.2 OpenSSF Scorecard

**Borrow:** the principle that repeatable, automated checks can expose specific repository security and maintenance risks.

**Adapt:** later, use narrowly scoped checks for repository hygiene and supply-chain posture if software is introduced: branch protection, dependency update practices, token permissions, signed releases and workflow hardening, where applicable.

**Do not misuse:** Scorecard assesses software-project security practices. Its scores must not become a score for thesis quality, cryptographic correctness, reviewer competence or scientific validity. It is not a substitute for threat analysis or independent protocol review.

Source: https://openssf.org/projects/scorecard/

### 13.3 Apache project governance

**Borrow:** transparent asynchronous discussion, documented roles, public decision records, and the expectation that objections explain their technical concern and, where possible, suggest an alternative.

**Adapt:** invite reviewers to state the technical basis of objections and possible remedies, while preserving a right to raise a valid concern without being forced to design the replacement themselves.

**Do not copy blindly:** Apache's "lazy consensus", committer/PMC roles and voting rules belong to its established project communities and institutional governance. This single-owner research repository does not yet have that community, representation or authority. Silence must not be interpreted as consent here.

Source: https://www.apache.org/foundation/how-it-works/

### 13.4 IETF rough consensus

**Borrow:** evaluate whether objections have been understood and substantively addressed rather than counting votes or requiring unanimity. Preserve dissent where the group decides an objection does not block progress.

**Adapt:** require a written disposition for each material objection: accepted, partly accepted, rejected with reasons, unresolved, or deferred pending evidence.

**Do not import "running code" as a gate:** IETF's engineering context includes running implementations. This project is explicitly theory-only. Practical implementation evidence may be proposed as future research, but its absence must not be hidden or replaced with a false claim of validation.

Source: RFC 7282, https://www.rfc-editor.org/rfc/rfc7282

### 13.5 CRediT contributor roles

**Borrow:** the standardised vocabulary for describing multiple kinds of research contribution and the recommendation that contributors can review and confirm their assigned roles.

**Adapt:** map each accepted contribution to the precise text, analysis, decision or artifact affected. Use the taxonomy as a description of contribution, not as an automatic authorship test or a proxy for endorsement.

Source: https://credit.niso.org/ and https://credit.niso.org/contributor-roles/

### 13.6 GitHub-native collaboration controls

**Borrow:** issues for discussion, pull requests for proposed changes, version-specific review records, protected branches and required reviews where available.

**Adapt:** begin with transparent manual review and durable records. Enable repository controls only after the actual permission model and reviewer participation are understood.

**Do not assume:** a comment from an external participant is the same as a formal approving review under GitHub's permission model. Record the actual form of review. Repository protection status remains unverified until the relevant settings can be inspected.

Source: https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches

### 13.7 Synthesis for this project

The proposed governance model is a deliberate combination, not a claim of novelty:

- OpenSSF contributes the evidence-backed checklist and repository-practice maturity idea.
- Apache and IETF contribute transparent asynchronous deliberation and reasoned objection handling, adapted without importing their institutional authority or silence-based consensus.
- CRediT contributes a common vocabulary for contribution attribution.
- GitHub contributes versioned discussion, review and merge mechanisms.
- Human maintainers remain accountable for research judgement, scope, adoption and dissent.

The resulting method should be tested as a manual process before any automation is enabled. No framework, badge, score or workflow can certify the thesis as true.

## 14. External foundations and source notes

- OpenSSF Best Practices Badge: https://openssf.org/projects/best-practices-badge/
- OpenSSF Best Practices criteria: https://www.bestpractices.dev/en/criteria
- OpenSSF Scorecard: https://openssf.org/projects/scorecard/
- Apache Software Foundation, How it works: https://www.apache.org/foundation/how-it-works/
- IETF RFC 7282, On Consensus and Humming in the IETF: https://www.rfc-editor.org/rfc/rfc7282
- CRediT Contributor Role Taxonomy: https://credit.niso.org/
- CRediT role descriptions: https://credit.niso.org/contributor-roles/
- GitHub protected branches and required reviews: https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches

These sources inform the adapted governance design. They do not validate this project's governance model, its security architecture or any thesis claim.

## 15. Assurance

**Theory only · No implementation · Not audited.**
