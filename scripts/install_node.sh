#!/bin/bash
#
# Installs mise into ~/.local/bin and, with it, the latest LTS release of Node.
# `mise use --global` saves the choice in ~/.config/mise/config.toml.

set -euo pipefail

if [ ! -x "$HOME/.local/bin/mise" ]; then
	curl -fsSL https://mise.run | sh
fi
"$HOME/.local/bin/mise" use --global node@lts
echo "Finished installing node"
