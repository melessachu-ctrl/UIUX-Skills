#!/usr/bin/env bash
# Symlink UIUX-Skills/skills/* to ~/.cursor/skills/
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILLS_SRC="${REPO_ROOT}/skills"
SKILLS_DST="${HOME}/.cursor/skills"
FORCE=false
CHECK_ONLY=false

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Symlink all skills in UIUX-Skills/skills/ to ~/.cursor/skills/

Options:
  -f, --force   Replace existing non-symlink targets
  -c, --check   Only report status, do not create links
  -h, --help    Show this help
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--force) FORCE=true; shift ;;
    -c|--check) CHECK_ONLY=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

if [[ ! -d "$SKILLS_SRC" ]]; then
  echo "Skills directory not found: $SKILLS_SRC" >&2
  echo "Run git pull or wait for Melessa sync." >&2
  exit 1
fi

mkdir -p "$SKILLS_DST"

linked=0
skipped=0
warned=0

for skill_path in "${SKILLS_SRC}"/*/; do
  [[ -d "$skill_path" ]] || continue
  name="$(basename "$skill_path")"
  target="${SKILLS_DST}/${name}"

  if [[ -L "$target" ]]; then
    current="$(readlink "$target")"
    if [[ "$current" == "$skill_path" || "$current" == "${skill_path%/}" ]]; then
      echo "OK  $name (already linked)"
      ((skipped++)) || true
      continue
    fi
    if [[ "$CHECK_ONLY" == true ]]; then
      echo "STALE $name -> $current"
      ((warned++)) || true
      continue
    fi
    ln -sfn "$skill_path" "$target"
    echo "UPD $name"
    ((linked++)) || true
    continue
  fi

  if [[ -e "$target" ]]; then
    if [[ "$FORCE" == true && "$CHECK_ONLY" == false ]]; then
      echo "WARN $name exists (not a symlink); replacing with --force"
      ln -sfn "$skill_path" "$target"
      ((linked++)) || true
    else
      echo "SKIP $name (exists and is not a symlink; use --force to replace)"
      ((warned++)) || true
    fi
    continue
  fi

  if [[ "$CHECK_ONLY" == true ]]; then
    echo "MISSING $name"
    ((warned++)) || true
    continue
  fi

  ln -sfn "$skill_path" "$target"
  echo "LINK $name"
  ((linked++)) || true
done

echo ""
echo "Done. linked=$linked skipped=$skipped warned=$warned"
echo "Skills source: $SKILLS_SRC"
echo "Skills target: $SKILLS_DST"

if [[ "$CHECK_ONLY" == true && $warned -gt 0 ]]; then
  exit 1
fi
