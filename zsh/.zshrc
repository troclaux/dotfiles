
if [ -z "$TMUX" ] && [ -z "$SSH_CONNECTION" ]; then
  tmux attach -d || tmux
fi

# oh-my-zsh (lib/history.zsh) sets the rest: share_history, extended_history,
# hist_verify, hist_ignore_dups, HISTSIZE=50000, SAVEHIST=10000
setopt hist_reduce_blanks

# PATH (~/.cargo/bin is added by ~/.cargo/env in ~/.zshenv)
typeset -U path
path=(
  $HOME/.opencode/bin
  $HOME/.local/bin
  $path
  $HOME/go/bin
  $HOME/.turso
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 15

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  # kubectl
)

source $ZSH/oh-my-zsh.sh

[ -f "$HOME/.env.zsh" ] && source "$HOME/.env.zsh"

# Load fzf key bindings and completion

# Ctrl+R => Fuzzy reverse search through shell history
# Ctrl+T => Fuzzy file/path insertion
# Alt+C => Fuzzy cd into a subdirectory
# **<Tab> => Fuzzy completion

source <(fzf --zsh)

# fd for fzf: faster than find, skips .git and gitignored files (node_modules...)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='/usr/bin/vi'
else
  export EDITOR='/usr/bin/nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

unset NVIM_LOG_LEVEL
export NVIM_LOG_FILE=/dev/null

export GIT_EDITOR="$EDITOR"
export DOTFILES="$HOME/dotfiles"
export NOTES="$HOME/Documents/notes"
export PERSONAL="$HOME/Documents/personal"
export DOCKER_BUILDKIT=1

# Zsh key-bindings

bindkey -s '^f' "tmux-sessionizer\n"
# open nvim and trigger its <C-p> mapping (snacks file picker)
nvim-picker() { nvim +'lua vim.api.nvim_feedkeys(vim.keycode("<C-p>"), "m", false)' }
bindkey -s '^P' 'nvim-picker\n'
bindkey '^H' backward-kill-word
bindkey -s '^b' "!!\n\n"

bindkey "^[y" forward-word
bindkey '^Y' autosuggest-accept
bindkey "^G" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vi='nvim'
alias vim='nvim'
alias ve='nvim .'
alias vv="nvim ~/.env.zsh"
alias vg="nvim -c 'Git | only'"
alias vb="nvim -c \"normal '0\""
alias vd="sudo nvim /etc/dnf/dnf.conf"
alias vo="nvim -c 'lua Snacks.picker.recent()'"
alias vl="nvim -c 'lua Snacks.picker.grep()'"
alias vh='fc $(history | fzf --tac | awk "{print \$1}")'
alias vf='file=$(fd --type f --hidden --exclude .git --max-depth 4 . ~ | fzf) && nvim "$file"'

alias dnf="dnf5"
alias lr="ls -R"
alias py="python3"
alias clipboard="wl-copy && echo '📋 Copied to clipboard!'"
alias im="kitty +kitten icat"
alias dgrep='grep -r --include=".*"'
alias ssh="TERM=xterm-256color ssh"
alias cps="fc -ln -1000 | sort | uniq | fzf | wl-copy"
alias ggraph="git --no-pager log --oneline --graph --all"
alias rmp='file=$(fd --extension lua . ~/.config/nvim/lua/config ~/.config/nvim/lua/plugins | fzf) && rm "$file" && echo "🗑️ Plugin removed"'

alias up="sudo dnf5 upgrade -y && flatpak update -y"

alias dot="cd $HOME/dotfiles"
alias soz="source $HOME/.zshrc"
alias trb="tree /usr/local/bin"
alias trn="tree $HOME/.config/nvim/lua"
alias pc='cat "$(fd --type f . ~/Documents/notes/prompts | fzf)" | wl-copy'
alias fln='ls ~/Documents/notes | fzf | xargs -I{} ln -s ~/Documents/notes/{} .'
alias ytp='yt-dlp -x --audio-format flac -o "~/Music/playlist/%(title)s.%(ext)s" --restrict-filenames $(wl-paste)'
alias yt='yt-dlp -x --audio-format flac -o "~/Music/%(title)s.%(ext)s" --restrict-filenames $(wl-paste) --no-playlist'

alias cds="cd ~/.ssh"
alias cdb="cd /usr/local/bin"
alias cdr='cd /etc/yum.repos.d'
alias cdn="cd $HOME/.config/nvim"
alias cdf='cd "$(fd --type d --hidden --exclude .git . "$HOME" | fzf)"'
alias cdp='cd "$(fd --type d --hidden --exclude .git | fzf)"'

## Set shell functions

rms() {
  local file="$1"
  if [ -f "$file" ]; then
    local new_name="$(echo "$file" | tr " ,'[]{}()<>" '_')"
    if [ -e "$new_name" ]; then
      echo "Skipped: $new_name already exists"
    else
      mv "$file" "$new_name"
      echo "Renamed: $file -> $new_name"
    fi
  fi
}

rmsa() {
  for file in *; do
    if [ -f "$file" ]; then
      new_name=$(echo "$file" | tr " ,'[]{}()<>" '_')
      if [ "$file" != "$new_name" ]; then
        if [ -e "$new_name" ]; then
          echo "Skipped: $new_name already exists"
        else
          mv "$file" "$new_name"
          echo "Renamed: $file -> $new_name"
        fi
      fi
    fi
  done
}

tsr() {
  if [ -z "$1" ]; then
    echo "Usage: tsr <filename.ts>"
    return 1
  fi

  tsc "$1" && node "${1%.ts}.js" && rm -f "${1%.ts}.js"
}

op() {
  local file
  if [ -n "$1" ]; then
    file="$1"
  else
    file=$(fd --type f --hidden --exclude .git --exclude '*.md' --exclude '*.txt' | fzf)
  fi

  if [ -n "$file" ]; then
    echo "📂✅ Opening file..."
    nohup xdg-open "$file" > /dev/null 2>&1 &!
  else
    echo "📂❌ No file selected"
  fi
}

# mise manages Node (see scripts/install_node.sh)
eval "$(mise activate zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform


# zoxide: z <dir>, zi to pick with fzf. Must come after compinit
eval "$(zoxide init zsh)"
