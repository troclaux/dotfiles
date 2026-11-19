#!/bin/bash
#
# Tests setup_workstation.sh in a fresh container. Uses podman, or docker if
# podman is missing. The repo is mounted read-only and copied inside, so
# nothing here changes.
#
# Checks that:
#   - existing real dotfiles get backed up and replaced by links
#   - every plugin in lazy-lock.json is installed
#   - Node (installed with mise) runs, and so do fd, zoxide and delta, which
#     .zshrc, .gitconfig and the bin/ scripts call (only Node with --nvim-only)
#   - a second run succeeds and changes nothing: files and symlinks in the
#     home folder, /opt and /usr/local, package repo files and keys,
#     installed packages, Flatpak apps and remotes, and the docker group
#     must all stay the same
#
# Usage: ./test_setup.sh <fedora|ubuntu|debian|arch> [setup_workstation.sh options]
# Example: ./test_setup.sh arch --all

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "${1:-}" in
fedora) IMAGE=fedora:latest PREPARE="dnf install -y sudo findutils diffutils" ;;
ubuntu) IMAGE=ubuntu:latest PREPARE="apt-get update && apt-get install -y sudo" ;;
debian) IMAGE=debian:stable PREPARE="apt-get update && apt-get install -y sudo" ;;
arch) IMAGE=archlinux:latest PREPARE="pacman -Syu --noconfirm --needed sudo" ;;
*) sed -n '17,18s/^# //p' "$0" >&2 && exit 1 ;;
esac
shift

RUNTIME="$(command -v podman || command -v docker)"

# some Flatpak installers (Chrome's) run in bubblewrap, which needs namespaces
PRIVILEGED=()
case " $* " in
*" --flatpaks "* | *" --all "*) PRIVILEGED=(--privileged) ;;
esac

# label=disable: on SELinux, avoids relabeling the repo just to mount it
"$RUNTIME" run --rm -i "${PRIVILEGED[@]}" --security-opt label=disable \
	-e DEBIAN_FRONTEND=noninteractive -e TZ=UTC \
	-v "$DOTFILES_DIR":/src:ro "$IMAGE" bash -c "$PREPARE && bash -s -- $*" <<'EOF'
set -euo pipefail
cp -r /src /root/dotfiles

DOTFILES=(.zshrc .tmux.conf .gitconfig)
for f in "${DOTFILES[@]}"; do
	# a comment is valid in all three, and git reads .gitconfig before it gets linked
	echo "# pre-existing $f" >"$HOME/$f"
done

# each source may not exist on every distro, hence || true
snapshot() {
	{
		find /root /opt /usr/local /etc/apt /etc/yum.repos.d /etc/pacman.d \
			-path /root/dotfiles -prune -o -printf '%p %y %l\n' 2>/dev/null || true
		find /etc/apt /etc/yum.repos.d /etc/pacman.d /usr/share/keyrings \
			-type f -exec md5sum {} + 2>/dev/null || true
		rpm -qa 2>/dev/null || true
		dpkg-query -W 2>/dev/null || true
		pacman -Q 2>/dev/null || true
		getent group docker || true
		flatpak list --columns=application,branch,origin 2>/dev/null || true
		flatpak remotes --columns=name,url 2>/dev/null || true
	} | sort
}

echo '### First run'
/root/dotfiles/setup_workstation.sh "$@"
snapshot >/tmp/run1

# reinstall_nvim.sh checks the Mason packages itself
missing=$(sed -n 's/^ *"\([^"]*\)": {.*/\1/p' /root/dotfiles/nvim/.config/nvim/lazy-lock.json |
	while read -r plugin; do [ -d "$HOME/.local/share/nvim/lazy/$plugin" ] || echo "$plugin"; done)
if [ -n "$missing" ]; then
	echo "### FAIL: plugins missing:" $missing && exit 1
fi
echo '### All plugins in lazy-lock.json are installed'

# a new shell would get node from mise activate, which needs zsh
export PATH="$HOME/.local/share/mise/shims:$PATH"
tools=(node)
if [ "$*" != "--nvim-only" ]; then
	tools+=(fd zoxide delta)
fi
for tool in "${tools[@]}"; do
	if ! "$tool" --version >/dev/null; then
		echo "### FAIL: $tool doesn't run" && exit 1
	fi
done
echo "### These tools run: ${tools[*]}"

# --nvim-only doesn't touch dotfiles
if [ "$*" != "--nvim-only" ]; then
	for f in "${DOTFILES[@]}"; do
		if [ ! -L "$HOME/$f" ] || ! grep -qx "# pre-existing $f" "$HOME/$f".bak.*; then
			echo "### FAIL: $f wasn't backed up and linked" && exit 1
		fi
	done
	echo '### Existing dotfiles were backed up and linked'
fi

echo '### Second run'
/root/dotfiles/setup_workstation.sh "$@"
snapshot >/tmp/run2

if diff /tmp/run1 /tmp/run2; then
	echo '### PASS: second run succeeded and changed nothing'
else
	echo '### FAIL: second run changed the state above (< first run, > second run)' && exit 1
fi
EOF
