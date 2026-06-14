#!/usr/bin/env bash
# fable-to-opus setup — injects a short adapt-first pointer block into CLAUDE.md.
# Usage: bash setup/setup.sh <local|global>
#   local  -> ./CLAUDE.md (this project only, recommended)
#   global -> ~/.claude/CLAUDE.md (all projects)
# Idempotent: re-running replaces the block in place. Remove with setup/uninstall.sh.
set -euo pipefail

SCOPE="${1:-}"
HERE="$(cd "$(dirname "$0")" && pwd)"
BLOCK_FILE="$HERE/fable-to-opus-block.md"
BEGIN="<!-- fable-to-opus:begin -->"
END="<!-- fable-to-opus:end -->"

case "$SCOPE" in
  local)  TARGET="./CLAUDE.md" ;;
  global) TARGET="$HOME/.claude/CLAUDE.md" ;;
  *) echo "usage: bash setup/setup.sh <local|global>" >&2; exit 1 ;;
esac

mkdir -p "$(dirname "$TARGET")"
touch "$TARGET"

# Strip any existing block (idempotent), then append the fresh one.
if grep -qF "$BEGIN" "$TARGET" 2>/dev/null; then
  awk -v b="$BEGIN" -v e="$END" '
    $0 ~ b {skip=1} skip==0 {print} $0 ~ e {skip=0}
  ' "$TARGET" > "$TARGET.tmp" && mv "$TARGET.tmp" "$TARGET"
fi

# Ensure a separating blank line, then append.
[ -s "$TARGET" ] && printf '\n' >> "$TARGET"
cat "$BLOCK_FILE" >> "$TARGET"

echo "✓ fable-to-opus pointer block written to: $TARGET"
echo "  (short pointer only — not the full rules. Run /fable-to-opus to audit your harness.)"
echo "  Remove any time:  bash setup/uninstall.sh"
