# Managing cntlm proxy, switch b/w work & home proxies etc.

# Needs WORK_PROXY_HOST & WORK_PROXY_PORT in env.
# Need to setup cntlm separetely

# Switch cntlm to use home settings
cntlm-home() {
  cp -f ~/.dotfiles/private/cntlm.conf-home /usr/local/etc/cntlm.conf
  brew services restart cntlm
}

# Switch cntlm to use work settings
cntlm-work() {
  cp -f ~/.dotfiles/private/cntlm.conf-work /usr/local/etc/cntlm.conf
  brew services restart cntlm
}

# Echo current proxy settings
proxy() {
  echo "http=[$http_proxy] https=[$https_proxy]"
}

# Switch to cntlm proxy
proxyc() {
  export http_proxy="http://127.0.0.1:3128" https_proxy="http://127.0.0.1:3128"
}

# Switch to work proxy
proxyw() {
  if [[ -z $WORK_PROXY_HOST ]] || [[ -z $WORK_PROXY_PORT ]]; then
    echo "Both WORK_PROXY_HOST & WORK_PROXY_PORT need to be set"
    return 1
  fi
  export http_proxy="http://$WORK_PROXY_HOST:$WORK_PROXY_PORT"
  export https_proxy="http://$WORK_PROXY_HOST:$WORK_PROXY_PORT"
}

# Unset proxy
proxyno() {
  unset http_proxy https_proxy
}
