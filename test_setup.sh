#!/bin/bash
#
# Tests setup_workstation.sh in a fresh container: runs it twice to check
# that a re-run also succeeds. Uses podman, or docker if podman is missing.
# The repo is mounted read-only and copied inside, so nothing here changes.
#
# Usage: ./test_setup.sh <fedora|ubuntu|arch> [setup_workstation.sh options]
# Example: ./test_setup.sh arch --all

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "${1:-}" in
fedora) IMAGE=fedora:latest PREPARE="dnf install -y sudo findutils" ;;
ubuntu) IMAGE=ubuntu:latest PREPARE="apt-get update && apt-get install -y sudo" ;;
arch) IMAGE=archlinux:latest PREPARE="pacman -Syu --noconfirm --needed sudo" ;;
*) sed -n '7,8s/^# //p' "$0" >&2 && exit 1 ;;
esac
shift

RUNTIME="$(command -v podman || command -v docker)"

# label=disable: on SELinux, avoids relabeling the repo just to mount it
"$RUNTIME" run --rm --security-opt label=disable \
	-e DEBIAN_FRONTEND=noninteractive -e TZ=UTC \
	-v "$DOTFILES_DIR":/src:ro "$IMAGE" bash -c "
	set -e
	$PREPARE
	cp -r /src /root/dotfiles
	echo '### First run'
	/root/dotfiles/setup_workstation.sh $*
	echo '### Second run'
	/root/dotfiles/setup_workstation.sh $*
	echo '### Both runs succeeded'
"
