# start_time=$(gdate '+%s.%3N')
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Get useful stuff from oh-my-zsh libs
zplug "lib/completion", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/keybindings", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh

# Plugins (in alphabetical order)
# bgnotify <title> <message> to issue notification
zplug "plugins/bgnotify", from:oh-my-zsh

# Colors in man pages
zplug "plugins/colored-man-pages", from:oh-my-zsh

# Some common aliases (TODO: Learn these)
zplug "plugins/common-aliases", from:oh-my-zsh

# Copy current commandline entry to clipboard with ctrl-o
zplug "plugins/copybuffer", from:oh-my-zsh

# Copy pwd to cliboard
zplug "plugins/copydir", from:oh-my-zsh

# Some osx related stuff (like ofd, cdf, hidefiles, showfiles, man-preview)
zplug "plugins/osx", from:oh-my-zsh

# Extract any directory with extract
zplug "plugins/extract", from:oh-my-zsh

# Load fasd
zplug "plugins/fasd", from:oh-my-zsh

# Completions for git-extras
zplug "plugins/git-extras", from:oh-my-zsh

# Maven integration
zplug "plugins/mvn", from:oh-my-zsh

# pyclean, pygrep, pyfind
zplug "plugins/python", from:oh-my-zsh

# Completions for pip
zplug "plugins/pip", from:oh-my-zsh

# vagrant completions
zplug "plugins/vagrant", from:oh-my-zsh

# docker completions
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

# kubernetes & minikube completions
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/minikube", from:oh-my-zsh

# google, ddg (duckduckgo), github, youtube, maps ... (web search)
zplug "plugins/websearch", from:oh-my-zsh

zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/vscode", from:oh-my-zsh
zplug "plugins/urltools", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh

# Suggest command based on recent commands
zplug "zsh-users/zsh-autosuggestions"

# Get zsh completions for a bunch of programs
zplug "zsh-users/zsh-completions"

# Syntax highlighting on commands (green/red)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Pure theme - minimal, fast
zplug mafredri/zsh-async, from:github, defer:0
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
RPROMPT="[%h] [%D{%H:%M:%S %d-%m-%y}]"

# st=$(gdate '+%s.%3N')
zplug load
# et=$(gdate '+%s.%3N')
# echo "load time=" $(echo $et - $st | bc)

# end_time=$(gdate '+%s.%3N')
# time_taken=$(echo $end_time - $start_time | bc)
# echo "Zplug Loaded in $time_taken seconds"
# unset start_time end_time time_taken

# Super large history
HISTSIZE=100000
SAVEHIST=100000

# Set editor
export EDITOR=vi
export PATH="~/local/bin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/curl/bin:/usr/local/opt/openssl/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

# Source private stuff
if [[ -f ~/.dotfiles/private/misc.zsh ]]; then
  . ~/.dotfiles/private/misc.zsh
fi
set -o emacs

# Git shorthands
alias gs='git status'
alias ga='git add'
alias gus='git reset HEAD'
alias gc='git commit -v'
alias gbr='git branch'
alias gco='git checkout'
alias gf='git fetch'
alias gd='git diff'
alias gdns='git diff --name-status'
alias gds='git diff --staged'
alias gdsns='git diff --staged --name-status'
alias gl='git log'
alias glp='git log -p'
alias glns='git log --name-status'
alias glo="git log --oneline"
alias gg='git log --oneline --abbrev-commit --all --graph --decorate'
alias gwip='git add . && git commit -m wip'

glol() {
  git log --color=always --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%an|%Cgreen%d %Creset%s' $* | column -ts"|" | less -rS
}

export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
alias ls='ls --color'

# Test internet connectivity (GET google and check response status)
alias testnet='curl -k -s -o /dev/null -w "%{http_code}\n" https://www.google.com'

# Locale handling code
# TODO: Fix this properly
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

source ~/.dotfiles/lib/pushnotify.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

# Add kubectx to $PS1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

# pretty print json with color
alias -g JL=" | jq -C | less -R"
