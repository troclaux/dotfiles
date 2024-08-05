
if [ -z "$TMUX" ]; then
    tmux attach -d || tmux
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

source /usr/share/fzf/shell/key-bindings.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:$HOME/go/bin"

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

VIM="nvim"

export GIT_EDITOR=$VIM
export DOTFILES=$HOME/.dotfiles

# Zsh key-bindings
bindkey -s '^f' "tmux-sessionizer\n"
bindkey -s '^p' "nvim . -c 'Telescope git_files'\n"
bindkey -s '^h' "nvim . -c 'Telescope find_files'\n"
bindkey -s '^b' "!!\n\n"
bindkey '^Y' autosuggest-accept

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vi="nvim"
alias vim="nvim"
alias ve="nvim ."
alias vg="nvim -c 'Git | only'"
alias vb="nvim -c \"normal '0\""
alias vl="nvim . -c 'Telescope live_grep'"

alias vif='nvim "$(find "$HOME" -type d | fzf)"'
alias vid="sudo nvim /etc/dnf/dnf.conf"

alias lr="ls -R"
alias py="python3"
alias open="xdg-open"
alias du="du -h --max-depth=1"
alias dgrep='grep -r --include=".*"'
alias clipboard="xclip -selection clipboard"
alias fin='find "$(pwd -P)" | grep -v ".git"'
alias fgl='glow -p $(find . -type f | grep ".md" | fzf )'
alias ggraph="git --no-pager log --oneline --graph --all"
alias cps="fc -ln -1000 | sort | uniq | fzf | xclip -selection clipboard"

alias up="sudo dnf upgrade -y && flatpak update -y"

alias dot="cd $HOME/dotfiles"
alias trn="tree $HOME/.config/nvim/lua"
alias soz="source $HOME/.zshrc"
alias trb="tree /usr/local/bin"

alias pc="cat \$(find ~/Documents/notes/prompts -type f | fzf ) | xclip -selection clipboard"
alias off='file=$(find . -path "./.git" -prune -o -type f | grep -vE "\.(md|txt)$" | fzf) && xdg-open "$file" 2>/dev/null'
alias ytp='yt-dlp -x --audio-format flac -o "~/Music/playlist/%(title)s.%(ext)s" --restrict-filenames $(xclip -selection clipboard -o)'
alias yt='yt-dlp -x --audio-format flac -o "~/Music/%(title)s.%(ext)s" --restrict-filenames $(xclip -selection clipboard -o) --no-playlist'
alias sk="curl -sL https://gist.githubusercontent.com/2KAbhishek/9c6d607e160b0439a186d4fbd1bd81df/raw/244284c0b3e40b2b67697665d2d61e537e0890fc/Shell_Keybindings.md | glow -p"

alias cdb="cd /usr/local/bin"
alias cdr='cd /etc/yum.repos.d'
alias cdn="cd $HOME/.config/nvim"
alias cdf='cd "$(find "$HOME" -type d | fzf)"'
alias cdp='cd "$(find . -path "./.git" -prune -o -type d | fzf)"'

## Set shell functions

touchd() {
    dir_path=$(dirname "$1")
    mkdir -p "$dir_path" && touch "$1"
}

rmvs() {
    local file="$1"
    if [ -f "$file" ]; then
        local new_name="$(echo "$file" | tr " ,'[]{}()<>" '_')"
        mv "$file" "$new_name"
        echo "Renamed: $file -> $new_name"
    fi
}

rmvsa() {
    for file in *; do
        if [ -f "$file" ]; then
            new_name=$(echo "$file" | tr " ,'[]{}()<>" '_')
            if [ "$file" != "$new_name" ]; then
                mv "$file" "$new_name"
                echo "Renamed: $file -> $new_name"
            fi
        fi
    done
}

# Set environment variables

export PATH="$PATH:$HOME/.cargo/bin"

export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"

eval "$(gh copilot alias -- zsh)"
