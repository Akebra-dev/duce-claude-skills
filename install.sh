#!/usr/bin/env bash
# Duce Atelier, Claude skills installer (Mac / Linux / Git Bash).
# Installs Duce's own skills, then pulls curated skill packs from their
# original sources into ~/.claude/skills. Re-run anytime to update.
set -e

DEST="$HOME/.claude/skills"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$DEST"

echo "==> Installing Duce Atelier skills into $DEST"
cp -r "$HERE/skills/"* "$DEST/" 2>/dev/null || true

# Curated, verified public packs. Each keeps its own upstream licence; we pull
# from source rather than copying, so authors keep their attribution.
UPSTREAMS=(
  "https://github.com/anthropics/skills"                 # Anthropic, official
  "https://github.com/nextlevelbuilder/ui-ux-pro-max-skill"  # UI/UX design intelligence
  "https://github.com/obra/superpowers"                  # engineering + workflow skills
)

TMP="$(mktemp -d)"
for repo in "${UPSTREAMS[@]}"; do
  name="$(basename "$repo")"
  echo "==> Fetching $name"
  git clone --depth 1 -q "$repo" "$TMP/$name" 2>/dev/null || { echo "    (skipped, could not clone)"; continue; }
  # Copy every folder that contains a SKILL.md.
  find "$TMP/$name" -name SKILL.md -not -path "*/node_modules/*" -print0 2>/dev/null | while IFS= read -r -d '' f; do
    d="$(dirname "$f")"
    cp -r "$d" "$DEST/" 2>/dev/null || true
  done
done
rm -rf "$TMP"

echo ""
echo "Done. Restart Claude Code so it loads the new skills."
echo "Tip: fewer skills you understand beat hundreds you do not. Prune what you will not use."
