#!/bin/bash
#
# Installs mise into ~/.local/bin and, with it, the tools in
# ~/.config/mise/config.toml: Node and the global npm packages.
# setup_workstation.sh links that config from mise/ before running this.

set -euo pipefail

if [ ! -x "$HOME/.local/bin/mise" ]; then
	curl -fsSL https://mise.run | sh
fi
"$HOME/.local/bin/mise" install
echo "Finished installing node"
