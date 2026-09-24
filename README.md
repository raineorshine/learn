# learn

Two Claude Code skills that keep a repo's agent instructions honest, packaged as
a plugin so they run anywhere — including cloud sessions, which cannot see
skills installed on a laptop.

- **`/learn`** — records what a session learned in the repo's agent files
  (`CLAUDE.md`, `AGENTS.md`, `.claude/` rules) and docs, then ships it.
- **`/learn-organize`** — reconciles those files into a coherent whole: dedupes,
  regroups by where a rule applies, factors situational detail into `docs/`, and
  tests the result on a reader with no context.

Installed as a plugin, they are namespaced: `/learn:learn`,
`/learn:learn-organize`.

## Install

### Cloud sessions

A cloud session cannot see a laptop's user-level skills or plugins; it reads
the repo's checked-in `.claude/settings.json`. Add this to that file in each
repo whose cloud sessions should have the skills:

```json
{
  "extraKnownMarketplaces": {
    "learn": {
      "source": { "source": "github", "repo": "raineorshine/learn" }
    }
  },
  "enabledPlugins": {
    "learn@learn": true
  }
}
```

The same file loads locally too: trusting the repo offers to install the
marketplace, and on a machine that already has `learn` as a user skill, both
copies then appear — `/learn` and `/learn:learn`.

Locally:

```sh
claude plugin marketplace add raineorshine/learn
claude plugin install learn@learn
```

For a one-off session, skipping install:

```sh
claude --plugin-dir path/to/learn/plugins/learn
```

## License

MIT
