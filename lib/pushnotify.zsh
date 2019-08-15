# Send pushnotification to phone using pushbullet.
# Useful for long running tasks:

# eg:
# - cmd; report
# - wnreport cmd

# Need PUSHBULLET_TOKEN

# Send notification
pushnotify() {
    local title="$1"
    local body="${@:2}"
    curl -s --request POST \
        --url https://api.pushbullet.com/v2/pushes \
        --header "Access-Token: $PUSHBULLET_TOKEN" \
        --header 'Cache-Control: no-cache' \
        --header 'Content-Type: application/json' \
        --data "{\"body\":\"$body\", \"title\":\"$title\", \"type\":\"note\"}" >/dev/null
}

# Last command success/failure
status() {
    test $? -eq 0 && echo "SUCCESS" || echo "FAILURE"
}

# Notify with status of last command
report() {
    pushnotify "${1:-Task} completed" "$(status)"
}

# Keep watching command until it succeeds.
wnreport() {
    until $@; do sleep 2; done
    report "$@"
}
