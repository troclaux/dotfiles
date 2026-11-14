#!/bin/bash
#
# Sets up a fresh Fedora, Ubuntu/Debian or Arch-based workstation.
#
# Always sets up: base packages, zsh with Oh My Zsh, tmux, gitconfig, gtk, the
# JetBrainsMono Nerd Font, the helper scripts under bin/, Node (if missing) and
# Neovim (if not set up yet, see scripts/reinstall_nvim.sh).
#
# Safe to re-run. Existing dotfiles that would be overwritten are backed up
# with a timestamp suffix instead of being deleted outright.
#
# Usage: ./setup_workstation.sh [--kitty] [--sway] [--extras] [--flatpaks] [--dev] [--all] | [--nvim-only]
#   --kitty      install kitty and link its config
#   --sway       install sway and its tools, and link their configs
#   --extras     install optional CLI tools (go, bat, btop, gh, ffmpeg, ...)
#   --flatpaks   install Flatpak, Flathub and desktop apps (browsers, Discord, GIMP, ...)
#   --dev        install VS Code, Docker Engine and rustup
#   --all        all of the above
#   --nvim-only  only install Neovim and Node (Mason needs npm)

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_SUFFIX=".bak.$(date +%Y%m%d%H%M%S)"

usage() { sed -n '12,19s/^# \{0,1\}//p' "$0"; }

WITH_KITTY=false
WITH_SWAY=false
WITH_EXTRAS=false
WITH_FLATPAKS=false
WITH_DEV=false
NVIM_ONLY=false
for arg in "$@"; do
	case "$arg" in
	--kitty) WITH_KITTY=true ;;
	--sway) WITH_SWAY=true ;;
	--extras) WITH_EXTRAS=true ;;
	--flatpaks) WITH_FLATPAKS=true ;;
	--dev) WITH_DEV=true ;;
	--all) WITH_KITTY=true WITH_SWAY=true WITH_EXTRAS=true WITH_FLATPAKS=true WITH_DEV=true ;;
	--nvim-only) NVIM_ONLY=true ;;
	-h | --help) usage && exit 0 ;;
	*) echo "Unknown option: $arg" >&2 && usage >&2 && exit 1 ;;
	esac
done
if $NVIM_ONLY && { $WITH_KITTY || $WITH_SWAY || $WITH_EXTRAS || $WITH_FLATPAKS || $WITH_DEV; }; then
	echo "--nvim-only can't be combined with other options" >&2
	exit 1
fi

log() { printf '\n\033[1;32m==>\033[0m %s\n' "$1"; }

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

install_pkgs() {
	log "Installing: $*"
	case "$PKG_MGR" in
	apt) sudo apt-get install -y "$@" ;;
	dnf) sudo dnf install -y "$@" ;;
	pacman) sudo pacman -S --needed --noconfirm "$@" ;;
	esac
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

setup_node_and_nvim() {
	# Node first: Mason needs npm to install some language servers
	if [ ! -x "$HOME/.volta/bin/node" ]; then
		log "Installing Node"
		"$DOTFILES_DIR/scripts/install_node.sh"
	fi

	# Neovim last: it exits non-zero on distros that don't ship a new enough version.
	# reinstall_nvim.sh wipes and reinstalls everything, so only run it once.
	if [ -L "$HOME/.config/nvim" ] && command -v nvim >/dev/null 2>&1; then
		log "Neovim already set up, skipping (run scripts/reinstall_nvim.sh for a clean reinstall)"
		# exits 0 when the version is too old (has() returns 0)
		if nvim --clean --headless +'lua os.exit(vim.fn.has("nvim-0.12"))' +q; then
			printf '\033[1;33m[!] %s is older than 0.12: nvim-treesitter (main branch) needs 0.12, so plugins are not installed. Run scripts/reinstall_nvim.sh to install a newer version.\033[0m\n' \
				"$(nvim --version | head -n 1)" >&2
		fi
	else
		log "Installing Neovim"
		"$DOTFILES_DIR/scripts/reinstall_nvim.sh"
	fi
}

# without an existing ~/.config, stow would symlink the whole directory
mkdir -p "$HOME/.config"

# ---------------------------------------------------------------------------
# Base packages
# ---------------------------------------------------------------------------

log "Updating package cache"
case "$PKG_MGR" in
apt) sudo apt-get update ;;
dnf) sudo dnf makecache ;;
# a sync without an upgrade (-Sy) would risk a partial upgrade on Arch
pacman) sudo pacman -Syu --noconfirm ;;
esac

if $NVIM_ONLY; then
	install_pkgs curl # install_node.sh needs it
	setup_node_and_nvim
	log "Done."
	exit 0
fi

install_pkgs git xclip wl-clipboard unzip curl wget tmux fzf stow fontconfig
case "$PKG_MGR" in
pacman) install_pkgs procps-ng ;;
*) install_pkgs procps ;;
esac

# ---------------------------------------------------------------------------
# zsh
# ---------------------------------------------------------------------------

log "Setting up zsh"
case "$PKG_MGR" in
apt) install_pkgs zsh passwd trash-cli ;;
*) install_pkgs zsh which trash-cli ;;
esac

backup_if_present "$HOME/.zshrc"
(cd "$DOTFILES_DIR" && stow zsh)

# after stow: KEEP_ZSHRC stops the installer from replacing the linked .zshrc
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	log "Installing Oh My Zsh"
	RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
		"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
for plugin in zsh-syntax-highlighting zsh-autosuggestions; do
	if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/$plugin" ]; then
		git clone --depth 1 "https://github.com/zsh-users/$plugin" "$HOME/.oh-my-zsh/custom/plugins/$plugin"
	fi
done

# ---------------------------------------------------------------------------
# tmux, gitconfig, gtk
# ---------------------------------------------------------------------------

log "Setting up tmux config"
backup_if_present "$HOME/.tmux.conf"
(cd "$DOTFILES_DIR" && stow tmux)

log "Setting up gitconfig"
backup_if_present "$HOME/.gitconfig"
(cd "$DOTFILES_DIR" && stow gitconfig)

log "Setting up gtk.css"
backup_if_present "$HOME/.config/gtk-3.0/gtk.css"
# no folding: GTK writes other files to this folder, which must stay out of the repo
(cd "$DOTFILES_DIR" && stow --no-folding gtk)

# ---------------------------------------------------------------------------
# JetBrainsMono Nerd Font (kitty uses it)
# ---------------------------------------------------------------------------

# not grep -q: exiting early would make fc-list fail with SIGPIPE under pipefail
if ! fc-list | grep "JetBrainsMono Nerd Font" >/dev/null; then
	log "Installing JetBrainsMono Nerd Font"
	tmp="$(mktemp -d)"
	curl -fsSLo "$tmp/font.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
	sudo mkdir -p /usr/local/share/fonts/JetBrainsMono
	sudo unzip -oq "$tmp/font.zip" -d /usr/local/share/fonts/JetBrainsMono
	rm -rf "$tmp"
	sudo fc-cache -f
fi

# ---------------------------------------------------------------------------
# Helper scripts -> /usr/local/bin
# ---------------------------------------------------------------------------

log "Symlinking helper scripts into /usr/local/bin"
sudo mkdir -p /usr/local/bin
for name in sl tmux-windowizer tmux-sessionizer tmux-vimionizer tmux-cht.sh gclone; do
	sudo ln -sfn "$DOTFILES_DIR/bin/$name" "/usr/local/bin/$name"
done

# ---------------------------------------------------------------------------
# Optional: kitty
# ---------------------------------------------------------------------------

if $WITH_KITTY; then
	log "Setting up kitty"
	install_pkgs kitty
	backup_if_present "$HOME/.config/kitty"
	(cd "$DOTFILES_DIR" && stow kitty)
fi

# ---------------------------------------------------------------------------
# Optional: sway
# ---------------------------------------------------------------------------

if $WITH_SWAY; then
	log "Setting up sway"
	install_pkgs sway swaylock swayidle waybar wofi fuzzel wdisplays wlr-randr \
		pavucontrol playerctl copyq dunst wtype blueman network-manager-applet
	case "$PKG_MGR" in
	apt)
		install_pkgs light grimshot pulseaudio-utils fonts-font-awesome
		;;
	dnf)
		install_pkgs light grimshot pulseaudio-utils fontawesome-fonts-all wshowkeys
		;;
	pacman)
		# light and wshowkeys are only in the AUR; libpulse provides pactl
		install_pkgs brightnessctl sway-contrib libpulse ttf-font-awesome
		;;
	esac

	for pkg in sway waybar fuzzel wofi kanshi; do
		backup_if_present "$HOME/.config/$pkg"
	done
	(cd "$DOTFILES_DIR" && stow sway waybar fuzzel wofi kanshi)
fi

# ---------------------------------------------------------------------------
# Optional: extra CLI tools
# ---------------------------------------------------------------------------

if $WITH_EXTRAS; then
	log "Installing extra packages"
	install_pkgs bat htop btop gnome-tweaks ffmpeg yt-dlp rsync rclone openssl
	case "$PKG_MGR" in
	apt) install_pkgs golang gh tealdeer ;;
	dnf) install_pkgs go gh xkill tldr ;;
	pacman) install_pkgs go github-cli xorg-xkill tldr ;;
	esac
fi

# ---------------------------------------------------------------------------
# Optional: Flatpak apps
# ---------------------------------------------------------------------------

if $WITH_FLATPAKS; then
	log "Installing Flatpak apps"
	install_pkgs flatpak
	sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	sudo flatpak install -y --noninteractive flathub \
		org.telegram.desktop \
		org.videolan.VLC \
		com.brave.Browser \
		com.google.Chrome \
		com.bitwarden.desktop \
		com.discordapp.Discord \
		com.jgraph.drawio.desktop \
		com.mattjakeman.ExtensionManager \
		com.github.tchx84.Flatseal \
		com.obsproject.Studio \
		org.kde.okular \
		org.gnome.Extensions \
		org.qbittorrent.qBittorrent \
		com.getpostman.Postman \
		org.gimp.GIMP \
		it.mijorus.gearlever \
		it.mijorus.smile
	# not installed: md.obsidian.Obsidian org.audacityteam.Audacity io.github.nokse22.asciidraw
fi

# ---------------------------------------------------------------------------
# Optional: dev tools (VS Code, Docker Engine, rustup)
# ---------------------------------------------------------------------------

if $WITH_DEV; then
	log "Setting up VS Code"
	case "$PKG_MGR" in
	apt)
		install_pkgs gpg
		curl -fsSL https://packages.microsoft.com/keys/microsoft.asc |
			sudo gpg --dearmor --yes -o /usr/share/keyrings/microsoft.gpg
		printf '%s\n' "Types: deb" "URIs: https://packages.microsoft.com/repos/code" "Suites: stable" \
			"Components: main" "Architectures: amd64,arm64,armhf" "Signed-By: /usr/share/keyrings/microsoft.gpg" |
			sudo tee /etc/apt/sources.list.d/vscode.sources >/dev/null
		sudo apt-get update
		install_pkgs code
		;;
	dnf)
		sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
		printf '%s\n' "[code]" "name=Visual Studio Code" "baseurl=https://packages.microsoft.com/yumrepos/vscode" \
			"enabled=1" "gpgcheck=1" "gpgkey=https://packages.microsoft.com/keys/microsoft.asc" |
			sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
		install_pkgs code
		;;
	pacman)
		# Microsoft's build is only in the AUR; this is the open-source build
		install_pkgs code
		;;
	esac

	log "Setting up Docker Engine"
	case "$PKG_MGR" in
	apt)
		# Ubuntu derivatives (Mint, Pop!_OS) set UBUNTU_CODENAME
		. /etc/os-release
		if [ -n "${UBUNTU_CODENAME:-}" ]; then
			DOCKER_DISTRO=ubuntu DOCKER_SUITE="$UBUNTU_CODENAME"
		else
			DOCKER_DISTRO=debian DOCKER_SUITE="$VERSION_CODENAME"
		fi
		sudo install -m 0755 -d /etc/apt/keyrings
		sudo curl -fsSL "https://download.docker.com/linux/$DOCKER_DISTRO/gpg" -o /etc/apt/keyrings/docker.asc
		printf '%s\n' "Types: deb" "URIs: https://download.docker.com/linux/$DOCKER_DISTRO" "Suites: $DOCKER_SUITE" \
			"Components: stable" "Signed-By: /etc/apt/keyrings/docker.asc" |
			sudo tee /etc/apt/sources.list.d/docker.sources >/dev/null
		sudo apt-get update
		install_pkgs docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
		;;
	dnf)
		sudo curl -fsSL https://download.docker.com/linux/fedora/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo
		install_pkgs docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
		;;
	pacman)
		install_pkgs docker docker-compose docker-buildx
		;;
	esac
	# no systemd in containers, where this script gets tested
	if [ -d /run/systemd/system ]; then
		sudo systemctl enable --now docker
	fi
	# takes effect at next login
	sudo usermod -aG docker "$(id -un)"

	if [ ! -x "$HOME/.cargo/bin/rustup" ]; then
		log "Installing rustup"
		# .zshrc already adds ~/.cargo/bin to PATH
		curl --proto '=https' --tlsv1.2 -fsSL https://sh.rustup.rs | sh -s -- -y --no-modify-path
	fi
fi

# ---------------------------------------------------------------------------
# Node and Neovim
# ---------------------------------------------------------------------------

setup_node_and_nvim

log "Done. Restart your shell (or run 'exec zsh')."
