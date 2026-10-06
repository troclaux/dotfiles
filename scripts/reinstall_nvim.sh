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
	sudo apt install -y ripgrep fd-find luarocks build-essential libssl-dev ninja-build gettext cmake unzip curl lua5.4 git make

	echo "[*] Building Neovim from source..."
	git clone --depth 1 --branch stable https://github.com/neovim/neovim "$HOME_DIR/neovim"
	(cd "$HOME_DIR/neovim" && make -j"$(nproc)")
	sudo make -C "$HOME_DIR/neovim" install

elif [[ "$PKG_MGR" == "dnf" ]]; then
	sudo dnf install -y ripgrep fd-find luarocks gcc gcc-c++ lua neovim git make
fi

echo "[*] Setting up LazyVim starter config..."
rm -rf "$NVIM_CONFIG"
mkdir -p "$NVIM_CONFIG"

git clone https://github.com/LazyVim/starter "$NVIM_CONFIG"
rm -rf "$NVIM_CONFIG/.git"

echo "[*] Linking dotfiles into Neovim config..."
ln -sf "$HOME_DIR/dotfiles/lua/config/keymaps.lua" "$NVIM_CONFIG/lua/config/keymaps.lua"
ln -sf "$HOME_DIR/dotfiles/lua/config/options.lua" "$NVIM_CONFIG/lua/config/options.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/disabled.lua" "$NVIM_CONFIG/lua/plugins/disabled.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/extras.lua" "$NVIM_CONFIG/lua/plugins/extras.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/lualine.lua" "$NVIM_CONFIG/lua/plugins/lualine.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/telescope.lua" "$NVIM_CONFIG/lua/plugins/telescope.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/copilot.lua" "$NVIM_CONFIG/lua/plugins/copilot.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/cmp.lua" "$NVIM_CONFIG/lua/plugins/cmp.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/blink.lua" "$NVIM_CONFIG/lua/plugins/blink.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/oil.lua" "$NVIM_CONFIG/lua/plugins/oil.lua"
ln -sf "$HOME_DIR/dotfiles/lua/plugins/avante.lua" "$NVIM_CONFIG/lua/plugins/avante.lua"

echo "[*] Done! Launch Neovim with:"
echo "    nvim"
