#!/usr/bin/env bash
# Regenerate portable .md twins from Cursor .mdc rules (same content).
# Cursor continues to use .mdc; .md is for ChatGPT / Codex / Claude / Spaces 等只接受 .md 的環境。
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CHECK_ONLY=false

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

For each *.mdc under rules/ and .cursor/rules/, write a sibling *.md
with identical content (規則雙軌).

Options:
  -c, --check   Exit 1 if any .md is missing or differs from its .mdc
  -h, --help    Show this help
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -c|--check) CHECK_ONLY=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

exported=0
checked_ok=0
drift=0

export_dir() {
  local dir="$1"
  [[ -d "$dir" ]] || return 0

  local mdc md
  shopt -s nullglob
  for mdc in "$dir"/*.mdc; do
    md="${mdc%.mdc}.md"
    if [[ "$CHECK_ONLY" == true ]]; then
      if [[ ! -f "$md" ]]; then
        echo "MISSING $md"
        ((drift++)) || true
      elif ! cmp -s "$mdc" "$md"; then
        echo "DRIFT  $md (differs from $(basename "$mdc"))"
        ((drift++)) || true
      else
        echo "OK     $md"
        ((checked_ok++)) || true
      fi
      continue
    fi
    cp "$mdc" "$md"
    echo "EXPORT $(basename "$md") <- $(basename "$mdc")"
    ((exported++)) || true
  done
  shopt -u nullglob
}

export_dir "${REPO_ROOT}/rules"
export_dir "${REPO_ROOT}/.cursor/rules"

echo ""
if [[ "$CHECK_ONLY" == true ]]; then
  echo "Done. ok=$checked_ok drift=$drift"
  [[ "$drift" -eq 0 ]]
else
  echo "Done. exported=$exported"
  echo "Cursor: use *.mdc | Portable / Spaces: use *.md"
fi
