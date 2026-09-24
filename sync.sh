#!/usr/bin/env bash
# Copy the learn skills from ~/.agents/skills, their canonical home, into the
# plugin. ~/.agents is shared with Codex and loaded locally by symlink; this
# repo only packages a copy for sessions that cannot see it, like cloud ones.
set -euo pipefail
cd "$(dirname "$0")"
SRC="${AGENTS_SKILLS:-$HOME/.agents/skills}"
for skill in learn learn-organize; do
  rm -rf "plugins/learn/skills/$skill"
  mkdir -p "plugins/learn/skills/$skill"
  cp "$SRC/$skill/SKILL.md" "plugins/learn/skills/$skill/SKILL.md"
done
echo "sync.sh: copied learn, learn-organize from $SRC"
