#!/usr/bin/env bash
# fable-to-opus uninstall — removes the adapt-first pointer block from CLAUDE.md.
# Usage: bash setup/uninstall.sh         (cleans both local ./CLAUDE.md and global ~/.claude/CLAUDE.md)
set -euo pipefail

BEGIN="<!-- fable-to-opus:begin -->"
END="<!-- fable-to-opus:end -->"

strip() {
  local f="$1"
  [ -f "$f" ] || return 0
  if grep -qF "$BEGIN" "$f" 2>/dev/null; then
    awk -v b="$BEGIN" -v e="$END" '
      $0 ~ b {skip=1} skip==0 {print} $0 ~ e {skip=0}
    ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
    echo "✓ removed fable-to-opus block from: $f"
  fi
}

strip "./CLAUDE.md"
strip "$HOME/.claude/CLAUDE.md"
echo "done."
