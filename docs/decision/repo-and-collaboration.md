# Repo & collaboration

**Status:** Decided · **Effort:** S · **Deadline risk:** Low — foundation only

## Context

Several collaborators (humans and AI agents) work in one repo. They need a predictable flow so
work doesn't collide and nothing sensitive leaks. The project moved here from `we-auction`
(2026-11-11); this file carries over the decisions made there, updated.

## Decisions

- **GitHub repo is public, under the owner's personal account.** What:
  `yannawatsomon/lets-auction`, public. Why: user's choice. Trade-off: everything committed is
  world-readable forever — no secrets, personal data or private client info. Alternative
  rejected: private repo / organization (can migrate later). Source: user, 2026-11-10/11.
- **Collaborators are invited individually (Write role) by the owner.** What: Settings →
  Collaborators. Why: personal accounts have no teams. Trade-off: manual access management.
  Alternative rejected: organization with teams (overkill for now). Source: user, 2026-11-11
  (owner invites people themselves; the repo does not list them).
- **PR-based flow; `main` is protected and auto-deploys.** What: branch `feat/*`, `fix/*`,
  `docs/*`, `chore/*`; PR with review; squash merge. Branch protection on `main`: PR required,
  1 approval, stale approvals dismissed, status checks `scan_ruby`, `scan_js`, `lint`, `test`
  must pass, force pushes blocked. Why: `main` deploys to production (`deployment.md`).
  Trade-off: slower than pushing directly; admin can still override in an emergency.
  Alternative rejected: trunk-based direct pushes. Source: user chose "yes, with required CI",
  2026-11-11.
- **Commit email privacy.** Because the repo is public, each collaborator's commit email is
  visible; use the GitHub `noreply` address (Settings → Emails → "Keep my email private").
## Open questions

- Fork PRs vs branches in this repo: which do collaborators use? (Both exist today.)
- Who reviews? Add `CODEOWNERS` once reviewers are known.
- Dependabot PRs (workflow actions, gems) pile up: who merges them, and how often?
