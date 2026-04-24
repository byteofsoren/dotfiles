#!/usr/bin/env bash
# =============================================================================
# run-dotfiles.sh — Smart wrapper for your Ansible dotfiles playbook
# =============================================================================

set -euo pipefail

PLAYBOOK="playbooks/main.yml"
INVENTORY="inventory.ini"
VAULT_PASS=".vault_pass"
ANSIBLE_CMD="ansible-playbook"

# Defaults
INSTALL_ML4W="no"
ML4W_RELEASE="stable"
RUN_DEV_ENV="true"
RUN_NEOVIM="true"
NEOVIM_STATE="present"
FORCE_REINSTALL="false"
ASK_BECOME_PASS="false" # ← NEW

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Options:
  -m, --ml4w                Install ML4W Hyprland
  -r, --ml4w-release <ver>  stable or rolling
  -f, --force-reinstall     Force ML4W reinstall
  -d, --no-dev              Skip development environment
  -n, --no-neovim           Skip Neovim
  -a, --neovim-absent       Remove Neovim
  -s, --sudo                Ask for sudo password (needed for dev-env packages)
  -h, --help                Show help
EOF
  exit 0
}

TEMP=$(getopt -o mr:fdnash --long ml4w,ml4w-release:,force-reinstall,no-dev,no-neovim,neovim-absent,sudo,help -n "$(basename "$0")" -- "$@")
eval set -- "$TEMP"
unset TEMP

while true; do
  case "$1" in
  -m | --ml4w)
    INSTALL_ML4W="yes"
    shift
    ;;
  -r | --ml4w-release)
    ML4W_RELEASE="$2"
    shift 2
    ;;
  -f | --force-reinstall)
    FORCE_REINSTALL="true"
    shift
    ;;
  -d | --no-dev)
    RUN_DEV_ENV="false"
    shift
    ;;
  -n | --no-neovim)
    RUN_NEOVIM="false"
    shift
    ;;
  -a | --neovim-absent)
    NEOVIM_STATE="absent"
    shift
    ;;
  -s | --sudo)
    ASK_BECOME_PASS="true"
    shift
    ;;
  -h | --help) usage ;;
  --)
    shift
    break
    ;;
  *)
    echo "Internal error!"
    exit 1
    ;;
  esac
done

# Vault check
if [[ ! -f "$VAULT_PASS" ]]; then
  echo "❌ Error: Vault password file '$VAULT_PASS' not found!"
  exit 1
fi
chmod 600 "$VAULT_PASS" 2>/dev/null || true

# Backup ~/.config before ML4W
if [[ "$INSTALL_ML4W" == "yes" ]]; then
  BACKUP_DIR="$HOME/dotfiles-backups"
  mkdir -p "$BACKUP_DIR"
  TIMESTAMP=$(date +%Y%m%d-%H%M%S)
  BACKUP_FILE="$BACKUP_DIR/config-backup-${TIMESTAMP}.tar.gz"
  echo "📦 Creating backup of ~/.config → ${BACKUP_FILE}"
  if [[ -d "$HOME/.config" ]]; then
    (cd "$HOME" && tar -czf "$BACKUP_FILE" .config)
    echo "✅ Backup created: ${BACKUP_FILE}"
  fi
fi

# Build extra-vars
EXTRA_VARS=(
  "install_ml4w=${INSTALL_ML4W}"
  "ml4w_release=${ML4W_RELEASE}"
  "run_dev_env=${RUN_DEV_ENV}"
  "run_neovim=${RUN_NEOVIM}"
  "neovim_state=${NEOVIM_STATE}"
)
[[ "$INSTALL_ML4W" == "yes" && "$FORCE_REINSTALL" == "true" ]] && EXTRA_VARS+=("force_ml4w_reinstall=true")
EXTRA_VARS_STR=$(
  IFS=" "
  echo "${EXTRA_VARS[*]}"
)

# Preview
echo "🚀 Running dotfiles playbook with:"
echo "   • ML4W Hyprland     : ${INSTALL_ML4W} (${ML4W_RELEASE})"
[[ "$FORCE_REINSTALL" == "true" ]] && echo "   • Force reinstall    : yes"
echo "   • Dev environment   : ${RUN_DEV_ENV}"
echo "   • Neovim            : ${RUN_NEOVIM} (${NEOVIM_STATE})"
[[ "$ASK_BECOME_PASS" == "true" ]] && echo "   • Sudo password      : will ask"
echo "───────────────────────────────────────────────────────────────"

# Build final command
CMD=("${ANSIBLE_CMD}"
  "--vault-password-file" "${VAULT_PASS}"
  "-i" "${INVENTORY}"
  "${PLAYBOOK}"
  "-e" "${EXTRA_VARS_STR}")

# Add sudo password prompt when requested
if [[ "$ASK_BECOME_PASS" == "true" ]]; then
  CMD+=("--ask-become-pass")
fi

# Run it
"${CMD[@]}"

echo "✅ Dotfiles setup completed!"
