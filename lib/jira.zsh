# Dependencies - go-jira, fzf, hub

if [[ -z $BRANCH_PREFIX ]]; then
  BRANCH_PREFIX=$(whoami)
fi

if [[ -z $JQL ]]; then
  JQL='assignee = currentUser() AND sprint in openSprints() AND statusCategory != done ORDER BY updated DESC'
  #JQL='assignee = currentUser() AND statusCategory != done ORDER BY updated DESC'
fi

jls() {
  jira list --query "$JQL" | fzf
}

jdesc() {
  jira view $1 --gjq 'fields.summary'
}

jid() {
  jls | sed -r 's/^([A-Z]+-[0-9]+):.*/\1/'
}

jmsg() {
  jls | sed -r 's/^([A-Z]+-[0-9]+):\s+(.*)/[\1]: \2/'
}

jbr() {
  echo $BRANCH_PREFIX/$(jls | sed -r -e 's/^([A-Z]+-[0-9]+):\s+(.*)/\1-\L\2/' -e 's/\s+/-/g' -e 's/-$//' -e 's/[^A-Za-z0-9-]+//g' -e 's/-+/-/g')
}

mkbr() {
  src=${1:-origin/master}
  br_name=$(jbr)
  git checkout -b $br_name $src
}

# Make a PR from current branch to master
mkpr() {
  local branch="$(git rev-parse --abbrev-ref HEAD)"
  branch="$(echo $branch | sed -r 's/^[a-zA-Z]+\/(.*)/\1/')"
  local jid="$(echo $branch | grep -Eo "^[A-Z]+-[0-9]+")"
  local msg="$(jdesc $jid)"
  debug "[$jid]: $msg" "$@"
  hub pull-request -m "[$jid]: $msg" "$@"
}
