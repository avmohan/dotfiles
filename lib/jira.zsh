if [[ -z $BRANCH_PREFIX ]]; then
  BRANCH_PREFIX=$(whoami)
fi

if [[ -z $JQL ]]; then
  #JQL='assignee = currentUser() AND sprint in openSprints() AND statusCategory != done ORDER BY updated DESC'
  JQL='assignee = currentUser() AND statusCategory != done ORDER BY updated DESC'
fi

jdesc() {
  jira view $1 --gjq 'fields.summary'
}

jid() {
  jira list --query "$JQL" | fzf | sed -r 's/^([A-Z]+-[0-9]+):.*/\1/'
}

mkbr() {
  src=${1:-origin/master}
  jid=$(jid)
  git checkout -b $BRANCH_PREFIX/$jid-$(jdesc "$jid" | sed -r 's/\s+/-/g' | tr 'A-Z' 'a-z' | sed -r 's/[^a-z0-9-]+//g') $src
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
