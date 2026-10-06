#!/bin/bash
#
# Manual (non-Ansible) equivalent of `ansible-playbook local.yml --tags
# nvim,zsh,zshrc,tmux,gitconfig,scripts`.
#
# Sets up: zsh, tmux, gitconfig (via GNU stow), Neovim (LazyVim, built from
# source on Debian/Ubuntu), ripgrep/fd, and the helper scripts under bin/.
#
# Safe to re-run. Existing dotfiles that would be overwritten are backed up
# with a timestamp suffix instead of being deleted outright.
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
# Neovim
# ---------------------------------------------------------------------------

log "Installing Neovim requirements (ripgrep, fd, luarocks)"
if [ "$PKG_MGR" = apt ]; then
	install_pkgs ripgrep fd-find luarocks
	install_pkgs build-essential libssl-dev ninja-build gettext cmake lua5.4
else
	install_pkgs ripgrep fd-find luarocks gcc gcc-c++ lua
fi

log "Cleaning old Neovim state"
rm -rf "$HOME/.config/nvim" "$HOME/.local/share/nvim/lazy" \
	"$HOME/.local/state/nvim/lazy" "$HOME/.cache/nvim"

if [ "$PKG_MGR" = apt ]; then
	log "Building Neovim from source (this can take a few minutes)"
	if [ -d "$HOME/neovim" ]; then
		git -C "$HOME/neovim" fetch --depth 1 origin stable
		git -C "$HOME/neovim" checkout stable
		git -C "$HOME/neovim" reset --hard origin/stable
	else
		git clone --branch stable https://github.com/neovim/neovim "$HOME/neovim"
	fi
	make -C "$HOME/neovim" -j"$(nproc)" CMAKE_BUILD_TYPE=Release
	sudo make -C "$HOME/neovim" install
else
	install_pkgs neovim
fi

log "Cloning LazyVim starter"
mkdir -p "$HOME/.config/nvim"
git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim/.git"

log "Linking dotfiles Neovim lua config over the LazyVim starter"
for f in "$DOTFILES_DIR"/lua/config/*.lua; do
	name="$(basename "$f")"
	backup_if_present "$HOME/.config/nvim/lua/config/$name"
	ln -s "$f" "$HOME/.config/nvim/lua/config/$name"
done
for f in "$DOTFILES_DIR"/lua/plugins/*.lua; do
	name="$(basename "$f")"
	backup_if_present "$HOME/.config/nvim/lua/plugins/$name"
	ln -s "$f" "$HOME/.config/nvim/lua/plugins/$name"
done

# ---------------------------------------------------------------------------
# Helper scripts -> /usr/local/bin
# ---------------------------------------------------------------------------

log "Symlinking helper scripts into /usr/local/bin"
for name in sl tmux-windowizer tmux-sessionizer tmux-vimionizer tmux-cht.sh gclone; do
	sudo rm -f "/usr/local/bin/$name"
	sudo ln -s "$DOTFILES_DIR/bin/$name" "/usr/local/bin/$name"
done

log "Done. Restart your shell (or run 'exec zsh') and open nvim to let LazyVim install plugins."
