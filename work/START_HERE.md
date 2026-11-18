# START HERE — The Invisible Postman

bootstrap_version: 1
purpose: "Single entry point for any ChatGPT assistant resuming work in this Project."
repository: "https://github.com/robotard/the-invisible-postman"
branch: "main"
authority: "Live repository contents on main; this file is an index, not a substitute for source documents."

## Automatic re-entry protocol

When a conversation starts in The Invisible Postman Project, or the user says continue/resume:
1. Read this file first.
2. Read `work/CHATGPT_PROJECT_INSTRUCTIONS.md`.
3. Read `work/SESSION_DIGEST.md` and `work/SESSION_DIGEST.json`.
4. Read `work/PROJECT_STATE.md`, `work/WORKPLAN.md` and `work/WORK_LOG.md`.
5. Read the task registry at `work/lookup/TASKS.json` and its human-readable companion only when selecting or updating a task.
6. Inspect the thesis and only those research documents required for the next substantive action.
7. Identify the next unblocked piece of actual work and execute it. Do not ask the user to restate project context already in GitHub.

## Execution priorities

- Draft and integrate the thesis.
- Resolve research gaps and evidential weaknesses.
- Maintain coherent terminology, argument structure and citations.
- Integrate multi-message steganographic encapsulation and linkage into the wider architecture.
- Keep operational bookkeeping subordinate to substantive work.
- Verify repository changes by fetching saved files.

## Context-limit recovery

A full conversation is historical project context, not disposable scratch work. If it reaches its context limit:
- preserve the old conversation;
- start a new chat inside this same ChatGPT Project;
- use the automatic summary as an additional clue, never as the authority;
- rerun this re-entry protocol from live GitHub;
- resume at the next unblocked action, without re-planning the project from scratch.

## Boundaries

- Thesis and enduring `docs/` files hold research reasoning and evidence.
- `work/` holds coordination, task state and continuity.
- "Theory only · No implementation · Not audited." is project-maturity metadata for GitHub records, not a conversational refrain. Never append it as a routine chat footer; preserve accurate maturity/assurance metadata in the relevant project and research documents.
- Never claim work, testing, implementation, audit or review that has not happened.
- Do not create diagrams until the argument and evidence are stable; never use ASCII art for diagrams.

## External Project settings limitation

This file and the copy-ready instruction file are stored in GitHub. The GitHub integration cannot automatically attach files to ChatGPT Project sources or edit ChatGPT Project Instructions. Those two external settings require a one-time manual installation by the user. Once the Project Instructions contain the re-entry rule, future chats in that Project should follow this protocol automatically by reading the live repository.
