#!/bin/bash

set -euo pipefail

HOME_DIR="$HOME"
NVIM_CONFIG="$HOME_DIR/.config/nvim"

echo "[*] Removing old Neovim config and cache..."
rm -rf "$NVIM_CONFIG"
rm -rf "$HOME_DIR/.local/share/nvim"
rm -rf "$HOME_DIR/.local/state/nvim/lazy"
rm -rf "$HOME_DIR/.cache/nvim"

echo "[*] Detecting package manager..."
if command -v apt >/dev/null 2>&1; then
	PKG_MGR="apt"
elif command -v dnf >/dev/null 2>&1; then
	PKG_MGR="dnf"
else
	echo "Unsupported package manager. Exiting."
	exit 1
fi

echo "[*] Installing Neovim dependencies..."
if [[ "$PKG_MGR" == "apt" ]]; then
	sudo apt update
	sudo apt install -y ripgrep fd-find luarocks build-essential libssl-dev ninja-build gettext cmake unzip curl lua5.4 git make stow

	echo "[*] Building Neovim from source..."
	git clone --depth 1 --branch stable https://github.com/neovim/neovim "$HOME_DIR/neovim"
	(cd "$HOME_DIR/neovim" && make -j"$(nproc)")
	sudo make -C "$HOME_DIR/neovim" install

elif [[ "$PKG_MGR" == "dnf" ]]; then
	sudo dnf install -y ripgrep fd-find luarocks gcc gcc-c++ lua neovim git make stow tree-sitter-cli
fi

echo "[*] Linking dotfiles Neovim config..."
mkdir -p "$HOME_DIR/.config"
(cd "$HOME_DIR/dotfiles" && stow nvim)

echo "[*] Done! Launch Neovim with:"
echo "    nvim"
