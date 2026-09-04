#!/usr/bin/env bash
# Pull latest UIUX-Skills and refresh ~/.cursor/skills/ symlinks.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
INSTALL_ARGS=()

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Pull latest changes from origin and run install-skills.sh.

Options:
  -f, --force   Pass --force to install-skills.sh
  -h, --help    Show this help

Example:
  cd UIUX-Skills && ./scripts/update-skills.sh
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--force) INSTALL_ARGS+=(--force); shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

cd "$REPO_ROOT"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not a git repository: $REPO_ROOT" >&2
  exit 1
fi

echo "==> git pull (in $REPO_ROOT)"
git pull --ff-only

echo ""
echo "==> install-skills.sh"
bash "${SCRIPT_DIR}/install-skills.sh" "${INSTALL_ARGS[@]}"

echo ""
echo "==> export-rules-md.sh (keep .md twins in sync with .mdc)"
bash "${SCRIPT_DIR}/export-rules-md.sh"

if [[ -f "${REPO_ROOT}/CHANGELOG.md" ]]; then
  latest="$(awk 'NR>2 && /^- / { print; exit }' "${REPO_ROOT}/CHANGELOG.md")"
  if [[ -n "$latest" ]]; then
    echo ""
    echo "Latest sync: $latest"
  fi
fi
