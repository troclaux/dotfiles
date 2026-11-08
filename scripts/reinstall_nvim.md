# reinstall_nvim.sh

Removes Neovim and sets it up again from zero, including its symlinks. Run it when Neovim is broken, when a symlink is broken or stale, or to set up a new machine.

The script is idempotent, so you can run it as many times as you like and end up with the same setup. It also works if a previous run stopped partway.

```sh
./scripts/reinstall_nvim.sh
```

It needs `sudo`, and works on distros with `apt-get` or `dnf`.

## What it does

1. Removes the Neovim package and any source-built copy in `/usr/local`.
2. Removes the Neovim config link, plugins and caches, and the link to the OpenCode config.
3. Installs Neovim and its dependencies from the package manager.
4. Links the configs again with stow, which replaces any broken or stale link.
5. Installs the OpenCode CLI if it's missing.
6. Installs plugins at the versions in `lazy-lock.json`.

## What it keeps

- **Neovim data:** undo history, swap files and shada.
- **OpenCode data:** the CLI, sessions and credentials.
- **The dotfiles repo:** only links in `~/.config` are removed, so the config in this repo isn't touched.

## What it replaces

If `~/.config/nvim` or `~/.config/opencode/opencode.jsonc` is a regular file or folder instead of a link, the script deletes it and links the version in this repo. Move any local edits into the repo before you run it.

## After it runs

- **API key:** set `ANTHROPIC_API_KEY` in `~/.env.zsh`, or `opencode.nvim` can't reach Claude.
- **Open shells:** run `exec zsh` in shells opened before OpenCode was installed. Otherwise, Neovim started from them can't find `opencode`.

## If it fails

The script exits with an error if the distro's Neovim is older than 0.12, which this config needs. Neovim and the configs are installed by then, but the plugins aren't. See the [Neovim section of the README](../README.md#neovim) for the affected distros.
