#!/bin/bash
#
# Manual (non-Ansible) equivalent of `ansible-playbook local.yml --tags
# zsh,zshrc,tmux,gitconfig,scripts`, plus Node and Neovim.
#
# Sets up: zsh, tmux, gitconfig, the helper scripts under bin/, Node (if missing)
# and a clean Neovim install (see scripts/reinstall_nvim.sh).
#
# Safe to re-run. Existing dotfiles that would be overwritten are backed up
# with a timestamp suffix instead of being deleted outright. Neovim's config,
# plugins and caches are the exception: each run removes and reinstalls them.
#
# Usage: ./setup_workstation.sh

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_SUFFIX=".bak.$(date +%Y%m%d%H%M%S)"

log() { printf '\n\033[1;32m==>\033[0m %s\n' "$1"; }

if command -v apt-get >/dev/null 2>&1; then
	PKG_MGR=apt
elif command -v dnf >/dev/null 2>&1; then
	PKG_MGR=dnf
else
	echo "Unsupported distro: no apt-get or dnf found." >&2
	exit 1
fi

install_pkgs() {
	log "Installing: $*"
	if [ "$PKG_MGR" = apt ]; then
		sudo apt-get install -y "$@"
	else
		sudo dnf install -y "$@"
	fi
}

# Back up a real file/dir before we replace it with a symlink. No-op if the
# path doesn't exist or is already a symlink (i.e. already set up).
backup_if_present() {
	local path="$1"
	if [ -e "$path" ] && [ ! -L "$path" ]; then
		log "Backing up existing $path -> $path$BACKUP_SUFFIX"
		mv "$path" "$path$BACKUP_SUFFIX"
	elif [ -L "$path" ]; then
		rm -f "$path"
	fi
}

# ---------------------------------------------------------------------------
# Base packages
# ---------------------------------------------------------------------------

log "Updating package cache"
if [ "$PKG_MGR" = apt ]; then
	sudo apt-get update
else
	sudo dnf makecache
fi

install_pkgs git xclip wl-clipboard unzip curl wget tmux fzf stow procps

# ---------------------------------------------------------------------------
# zsh
# ---------------------------------------------------------------------------

log "Setting up zsh"
if [ "$PKG_MGR" = apt ]; then
	install_pkgs zsh passwd trash-cli
else
	install_pkgs zsh which trash-cli
fi

backup_if_present "$HOME/.zshrc"
(cd "$DOTFILES_DIR" && stow zsh)

# ---------------------------------------------------------------------------
# tmux
# ---------------------------------------------------------------------------

log "Setting up tmux config"
backup_if_present "$HOME/.tmux.conf"
(cd "$DOTFILES_DIR" && stow tmux)

# ---------------------------------------------------------------------------
# gitconfig
# ---------------------------------------------------------------------------

log "Setting up gitconfig"
backup_if_present "$HOME/.gitconfig"
(cd "$DOTFILES_DIR" && stow gitconfig)

# ---------------------------------------------------------------------------
# Helper scripts -> /usr/local/bin
# ---------------------------------------------------------------------------

log "Symlinking helper scripts into /usr/local/bin"
for name in sl tmux-windowizer tmux-sessionizer tmux-vimionizer tmux-cht.sh gclone; do
	sudo rm -f "/usr/local/bin/$name"
	sudo ln -s "$DOTFILES_DIR/bin/$name" "/usr/local/bin/$name"
done

# ---------------------------------------------------------------------------
# Node (Mason needs npm to install some language servers)
# ---------------------------------------------------------------------------

if [ ! -x "$HOME/.volta/bin/node" ]; then
	log "Installing Node"
	"$DOTFILES_DIR/scripts/install_node.sh"
fi

# ---------------------------------------------------------------------------
# Neovim (last: it exits non-zero on distros that don't ship a new enough version)
# ---------------------------------------------------------------------------

log "Installing Neovim"
"$DOTFILES_DIR/scripts/reinstall_nvim.sh"

log "Done. Restart your shell (or run 'exec zsh')."
