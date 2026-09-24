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

A cloud session sees neither a laptop's skills nor a repo's
`extraKnownMarketplaces`: plugins reach it only through the cloud
environment's setup script, which runs before Claude starts. Add this line to
the setup script of each environment at claude.ai/code:

```sh
claude plugin marketplace add raineorshine/learn && claude plugin install learn@learn
```

### Locally

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
