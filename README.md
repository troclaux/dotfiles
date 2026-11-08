
# Dotfiles

> Automatically configure a fresh Linux workstation by installing all required packages and configuration files

## Prerequisites

- Git
- Ansible

## Installation

Clone Github repository:

```bash
git clone https://github.com/troclaux/dotfiles ~/dotfiles
```

Run Ansible playbook to setup a new linux machine:

```bash
ansible-playbook -K ~/dotfiles/local.yml
```

## Testing Ansible playbook

Make the script `setup_test_container.sh` executable:

```bash
chmod +x ~/dotfiles/setup_test_container.sh
```

Run the script to setup a Docker container where you can test the Ansible playbook:

```bash
./setup_test_container.sh
```

## Scripts to run after using Ansible playbook

- `./scripts/fix_nvim_permissions.sh`
- `./scripts/install_flatpaks.sh`
- `./scripts/install_nerd_font.sh`
- `./scripts/install_node.sh`
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

To link a package by hand, run `stow <package>` from this directory.

Secrets don't belong in this public repository. Keep them in `~/.env.zsh`, which `.zshrc` sources and which isn't tracked.

### Neovim

`nvim/.config/nvim/lua/` is organized by topic:

- `config/`: `options.lua`, `keymaps.lua` (non-plugin keymaps) and `lazy.lua` (lazy.nvim setup)
- `plugins/`: one file per topic, with each plugin's keymaps in its spec
  - `colorscheme`, `ui`, `navigation`, `editing`, `git`, `completion`, `treesitter`, `lsp`, `formatting`, `linting`, `tools`
