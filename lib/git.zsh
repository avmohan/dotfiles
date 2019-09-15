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
  git log --color=always --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%aN|%Cgreen%d %Creset%s' $* | column -ts"|" | less -rS
}

# Make a PR from current branch to master
# Assumes branch name ~ [A-Z]+-[0-9]+-([a-z]+-)+-[a-z]+
make-pr() {
   local branch="$(git rev-parse --abbrev-ref HEAD)"
   local jira="$(echo $branch | grep -Eo "^[A-Z]+-[0-9]+")" 
   local msg="$(echo $branch | sed -r 's/^[A-Z]+-[0-9]+-(.*)$/\u\1/' | tr '-' ' ')"
   hub pull-request -m "[$jira]: $msg" 
}

