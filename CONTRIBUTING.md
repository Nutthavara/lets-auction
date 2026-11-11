# Contributing

This repo is **public** — never commit secrets, tokens, `.env` files or personal data.

## Flow

1. Pick or open an issue.
2. Branch from latest `main`: `feat/<name>`, `fix/<name>` or `docs/<name>`.
3. Make small, focused commits (imperative subject, e.g. `Add bid validation`).
4. Check `docs/decision/README.md`. If your change touches a Decided topic, update or
   supersede the decision doc in the same PR.
5. Run the checks locally: `bin/rails db:test:prepare test`, `bin/rubocop`, `bin/brakeman`.
6. Open a PR using the template. CI must pass and at least one approval is required;
   squash-merge. **Merging to `main` auto-deploys to Railway.**

## Local setup

Ruby version is in `.ruby-version`. On Windows use WSL and keep the checkout in the WSL
filesystem (`~/`), not `/mnt/c` — see `ai/knowledge/rails-wsl-gotchas.md`.

```bash
bin/setup
bin/dev
```

## Working with AI agents

- Agents start at [`AGENTS.md`](AGENTS.md). Do not create per-tool rule files with duplicate
  content — add rules to `AGENTS.md`.
- Shared skills are already in the repo (`.claude/skills/`, index in `AGENTS.md`); nothing to
  install. Changes to a copied third-party skill need a PR that follows `THIRD_PARTY.md`.
- Review agent-written changes as carefully as human ones. You are the author of record.
- Put new shared knowledge in `ai/` (see `ai/README.md`), not only in chat or a PR comment.

## Commit email

Use your GitHub `noreply` address (GitHub → Settings → Emails → Keep my email private), since
history is public.
