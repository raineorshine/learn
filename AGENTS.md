# AGENTS.md

Packages the `learn` and `learn-organize` skills as a Claude Code plugin named
`learn`, so sessions that cannot see `~/.agents/skills` — cloud sessions above
all — can run them.

## Layout

| path | what |
|---|---|
| `plugins/learn/skills/*/SKILL.md` | copies of the skills — never edit here |
| `plugins/learn/.claude-plugin/plugin.json` | version; gates `claude plugin update` |
| `.claude-plugin/marketplace.json` | the marketplace listing that serves the plugin |
| `sync.sh` | copies the skills in from `~/.agents/skills` |

## Editing a skill

`~/.agents/skills/<skill>/SKILL.md` is canonical: it is shared with Codex and
loaded locally through the `~/.claude/skills` symlinks. Edit it there, run
`./sync.sh`, and commit the copy here. An edit made only here is overwritten by
the next sync.

## Shipping

Bump the minor version in `plugins/learn/.claude-plugin/plugin.json` for any
change under `plugins/learn/` — without one, `claude plugin update` reports
"already at the latest version" even when `main` has new commits. The
marketplace serves `main`, so nothing is shipped until it lands there.

Do not install the plugin on this machine: the user-level skills already load,
and the plugin would add `learn:learn` and `learn:learn-organize` beside them.
`claude --plugin-dir plugins/learn` loads the working tree for one session.

## Git

Conventional-commit subjects (`feat:`, `fix:`, `docs:`).
