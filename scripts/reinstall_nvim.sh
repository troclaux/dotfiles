#!/bin/bash
#
# Clean Neovim install from the distro's package manager (apt, dnf or pacman). Safe to re-run.
#
# Removes the Neovim package, any source-built copy in /usr/local, and all
# config, plugins and caches, then reinstalls and links the config with stow.
# Keeps undo history, swap files and shada, since those are your data.
# Also installs the OpenCode CLI if it's missing, and links its config.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STATE_DIR="$HOME/.local/state/nvim"

if command -v apt-get >/dev/null 2>&1; then
	PKG_MGR=apt
elif command -v dnf >/dev/null 2>&1; then
	PKG_MGR=dnf
elif command -v pacman >/dev/null 2>&1; then
	PKG_MGR=pacman
else
	echo "Unsupported distro: no apt-get, dnf or pacman found." >&2
	exit 1
fi

echo "[*] Removing old Neovim install..."
sudo rm -rf /usr/local/bin/nvim /usr/local/share/nvim /usr/local/lib/nvim
if [[ "$PKG_MGR" == "apt" ]]; then
	sudo apt-get purge -y neovim neovim-runtime
elif [[ "$PKG_MGR" == "dnf" ]]; then
	sudo dnf remove -y neovim
elif pacman -Q neovim >/dev/null 2>&1; then
	sudo pacman -Rns --noconfirm neovim
fi

echo "[*] Removing old Neovim config, plugins and caches..."
rm -rf "$HOME/.config/nvim" "$HOME/.local/share/nvim" "$HOME/.cache/nvim"
if [[ -d "$STATE_DIR" ]]; then
	find "$STATE_DIR" -mindepth 1 -maxdepth 1 \
		! -name undo ! -name swap ! -name shada -exec rm -rf {} +
fi
# a broken or stale link would make stow fail; OpenCode's own files stay
if [[ -L "$HOME/.config/opencode" ]]; then
	rm "$HOME/.config/opencode"
fi
rm -f "$HOME/.config/opencode/opencode.jsonc"

echo "[*] Installing Neovim and its dependencies..."
if [[ "$PKG_MGR" == "apt" ]]; then
	sudo apt-get update
	sudo apt-get install -y neovim ripgrep fd-find luarocks lua5.4 tree-sitter-cli \
		build-essential git curl unzip stow
elif [[ "$PKG_MGR" == "dnf" ]]; then
	sudo dnf install -y neovim ripgrep fd-find luarocks lua tree-sitter-cli \
		gcc gcc-c++ make git curl unzip stow
else
	sudo pacman -S --needed --noconfirm neovim ripgrep fd luarocks lua tree-sitter-cli \
		base-devel git curl unzip stow
fi

echo "[*] Linking Neovim config..."
# without an existing ~/.config, stow would symlink the whole directory
mkdir -p "$HOME/.config"
stow --dir="$DOTFILES_DIR" --target="$HOME" nvim

echo "[*] Setting up the OpenCode CLI for opencode.nvim..."
export PATH="$HOME/.opencode/bin:$PATH"
if ! command -v opencode >/dev/null 2>&1; then
	# zsh/.zshrc already adds it to PATH
	curl -fsSL https://opencode.ai/install | bash -s -- --no-modify-path
fi
# without --no-folding, OpenCode's service.json would end up inside this repo
stow --dir="$DOTFILES_DIR" --target="$HOME" --no-folding opencode

# nvim-treesitter's main branch needs Neovim 0.12, which some distros don't ship yet
if ! nvim --clean --headless +'lua os.exit(vim.fn.has("nvim-0.12"))' +q; then
	echo "[*] Installing plugins at the versions in lazy-lock.json..."
	# restore can't pin lazy.nvim itself and would rewrite its entry in the lock
	LAZY_DIR="$HOME/.local/share/nvim/lazy/lazy.nvim"
	LAZY_COMMIT="$(sed -n 's/.*"lazy.nvim".*"commit": "\([0-9a-f]*\)".*/\1/p' "$DOTFILES_DIR/nvim/.config/nvim/lazy-lock.json")"
	git clone --quiet --filter=blob:none --branch=main https://github.com/folke/lazy.nvim.git "$LAZY_DIR"
	git -C "$LAZY_DIR" checkout --quiet "$LAZY_COMMIT"
	nvim --headless '+Lazy! restore' +qa
	echo "[*] Done! Launch Neovim with: nvim"
else
	echo "[!] $(nvim --version | head -n 1) is older than the 0.12 this config needs." >&2
	echo "[!] Skipped installing plugins. Your distro's repos don't ship a new enough version." >&2
	exit 1
fi
