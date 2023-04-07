# Git shorthands
alias gs='git status'
alias ga='git add'
alias gus='git reset HEAD'
alias gc='git commit'
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
alias gwip='git add -A && git commit -m wip --no-verify'
alias gdiff='git diff --no-index'
alias gundo='git undo'
alias gbb='gco $(gbr|fzf --reverse)'
alias gbbr='gco $(gbr --remote |fzf --reverse)'
alias gbrc='git branch --show-current | pbcopy'

glol() {
  git log --color=always --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%aN|%Cgreen%d %Creset%s' $* | column -ts"|" | less -rS
}

g_clean_prs() {
  git branch | grep -P '^\s+pr/\d+' | xargs git branch -D
}
