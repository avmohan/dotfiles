# pretty print json with color
alias -g JL="jq -C | less -R"
# same for yaml
alias -g YL="yq -C - | less -R"
# same for k8s
alias -g KJL=" -o json | JL"
# yaml
alias -g KYL=" -o yaml | YL"

