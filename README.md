
# Dotfiles

> Automatically configure a fresh Linux workstation by installing all required packages and configuration files

Works on Fedora, Ubuntu/Debian and Arch-based distros.

## Installation

Clone Github repository:

```bash
git clone https://github.com/troclaux/dotfiles ~/dotfiles
```

Run the setup script. It's safe to re-run, and it backs up existing dotfiles instead of overwriting them:

```bash
~/dotfiles/setup_workstation.sh --all          # everything: a complete new machine
~/dotfiles/setup_workstation.sh                # base setup only
~/dotfiles/setup_workstation.sh --sway --kitty # base setup plus sway and kitty
~/dotfiles/setup_workstation.sh --nvim-only    # only Neovim and Node
```

The base setup installs common CLI packages, links the zsh, tmux, gitconfig and gtk configs, installs Oh My Zsh (with the zsh-autosuggestions and zsh-syntax-highlighting plugins) and the JetBrainsMono Nerd Font, symlinks the `bin/` scripts into `/usr/local/bin`, and installs Node and Neovim. Options:

| Option | Adds |
| --- | --- |
| `--kitty` | kitty and its config |
| `--sway` | sway, waybar, wofi, fuzzel and other desktop tools, with their configs |
| `--extras` | optional CLI tools: go, bat, htop, btop, tldr, gh, ffmpeg, yt-dlp, rsync, rclone and more |
| `--flatpaks` | Flatpak and Flathub, and desktop apps: Brave, Chrome, Discord, Telegram, Bitwarden, VLC, OBS, GIMP, Postman, Gear Lever and more |
| `--dev` | VS Code, Docker Engine and rustup. Log out and back in to use Docker without `sudo`. On Arch, VS Code is the open-source build, since Microsoft's is only in the AUR |
| `--all` | all of the above |
| `--nvim-only` | skips everything else and only installs Neovim and Node (Mason needs npm). Can't be combined with other options |

## Testing the setup script

`./test_setup.sh` runs `setup_workstation.sh` twice in a fresh `fedora`, `ubuntu`, `debian` or `arch` container, to check that it works and that a re-run also succeeds. It needs podman or docker, and passes any extra options on to the setup script:

```bash
./test_setup.sh arch --all
./test_setup.sh fedora --nvim-only
```

## Repository layout

Each top-level config folder is a [GNU Stow](https://www.gnu.org/software/stow/) package that mirrors the path under `$HOME`:

| Package | Linked to |
| --- | --- |
| `zsh`, `tmux`, `gitconfig` | `~/.zshrc`, `~/.tmux.conf`, `~/.gitconfig` |
| `nvim`, `kitty`, `sway`, `waybar`, `fuzzel`, `wofi`, `kanshi` | `~/.config/<package>` |
| `gtk` | `~/.config/gtk-3.0/gtk.css` (use `stow --no-folding gtk`) |
| `opencode` | `~/.config/opencode/opencode.jsonc` (use `stow --no-folding opencode`) |

To link a package by hand, run `stow <package>` from this directory.

Secrets don't belong in this public repository. Keep them in `~/.env.zsh`, which `.zshrc` sources and which isn't tracked.

### Neovim

`./scripts/reinstall_nvim.sh` does a clean install. `setup_workstation.sh` runs it only when Neovim isn't set up yet; run it yourself for a clean reinstall, or to update Neovim on Debian and Ubuntu. It removes Neovim, the config, plugins and caches, and keeps undo history, swap files and shada. Each run also reinstalls plugins at the versions in `lazy-lock.json`.

This config needs Neovim 0.12 or later, because it uses the `main` branch of `nvim-treesitter`. Fedora and Arch ship it, so the script installs their package. Debian and Ubuntu repos ship older versions (as of November 2026: 0.11.6 on Ubuntu 26.04, 0.10.4 on Debian 13), so on those the script installs the latest official release from GitHub into `/opt/nvim`, linked from `/usr/local/bin/nvim`. apt doesn't update that copy.

The script also installs the OpenCode CLI if it's missing and links its config for `opencode.nvim`. OpenCode reads `ANTHROPIC_API_KEY` from the environment, so keep the key in `~/.env.zsh`.

`nvim/.config/nvim/lua/` is organized by topic:

- `config/`: `options.lua`, `keymaps.lua` (non-plugin keymaps) and `lazy.lua` (lazy.nvim setup)
- `plugins/`: one file per topic, with each plugin's keymaps in its spec
  - `colorscheme`, `ui`, `navigation`, `editing`, `git`, `completion`, `treesitter`, `lsp`, `formatting`, `linting`, `tools`
