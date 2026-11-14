
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
~/dotfiles/setup_workstation.sh               # base setup
~/dotfiles/setup_workstation.sh --sway --kitty  # base setup plus sway and kitty
~/dotfiles/setup_workstation.sh --nvim-only   # only Neovim and Node
```

The base setup installs common CLI packages, links the zsh, tmux, gitconfig and gtk configs, symlinks the `bin/` scripts into `/usr/local/bin`, and installs Node and Neovim. Options:

| Option | Adds |
| --- | --- |
| `--kitty` | kitty and its config |
| `--sway` | sway, waybar, wofi, fuzzel and other desktop tools, with their configs |
| `--extras` | optional CLI tools: go, bat, htop, btop, tldr, gh, ffmpeg, yt-dlp, rsync, rclone and more |
| `--all` | all three of the above |
| `--nvim-only` | skips everything else and only installs Neovim and Node (Mason needs npm). Can't be combined with other options |

## Testing the setup script

`./test_setup.sh` runs `setup_workstation.sh` twice in a fresh `fedora`, `ubuntu` or `arch` container, to check that it works and that a re-run also succeeds. It needs podman or docker, and passes any extra options on to the setup script:

```bash
./test_setup.sh arch --all
./test_setup.sh fedora --nvim-only
```

## Optional scripts

- `./scripts/fix_nvim_permissions.sh`
- `./scripts/install_flatpaks.sh`
- `./scripts/install_nerd_font.sh`
- `./scripts/go_install.sh`
- `./scripts/ohmyzsh.sh`

## Software without automated installation

- VS Code
- Docker Desktop
- rustup

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

`./scripts/reinstall_nvim.sh` does a clean install from `dnf`, `apt` or `pacman`. `setup_workstation.sh` runs it only when Neovim isn't set up yet; run it yourself for a clean reinstall. It removes the package, the config, plugins and caches, and keeps undo history, swap files and shada. Each run also reinstalls plugins at the versions in `lazy-lock.json`.

The script also installs the OpenCode CLI if it's missing and links its config for `opencode.nvim`. OpenCode reads `ANTHROPIC_API_KEY` from the environment, so keep the key in `~/.env.zsh`.

> [!NOTE]
> **Decision pending: Debian and Ubuntu.** This config needs Neovim 0.12 or later because of `nvim-treesitter`'s `main` branch, and of the distros this repo supports, only Fedora ships it so far. As of November 2026, the repos have 0.11.6 (Ubuntu 26.04), 0.10.4 (Debian 13) and 0.9.5 (Ubuntu 24.04). On these distros the script installs the older version, skips plugins and exits 1. Later runs of `setup_workstation.sh` print a warning. Options to decide between:
>
> - Wait until their repos ship 0.12
> - Use the Neovim PPA on Ubuntu (this doesn't help Debian)
> - Make the config work on older versions: nothing else in the config needs 0.12, so it's enough to use the `master` branch of `nvim-treesitter` and `nvim-treesitter-textobjects` on older Neovim versions. That branch is frozen but supports 0.11. It has a different setup API, so `treesitter.lua` and `editing.lua` would need two code paths.

`nvim/.config/nvim/lua/` is organized by topic:

- `config/`: `options.lua`, `keymaps.lua` (non-plugin keymaps) and `lazy.lua` (lazy.nvim setup)
- `plugins/`: one file per topic, with each plugin's keymaps in its spec
  - `colorscheme`, `ui`, `navigation`, `editing`, `git`, `completion`, `treesitter`, `lsp`, `formatting`, `linting`, `tools`
