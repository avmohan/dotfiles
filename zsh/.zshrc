# /*=====================================
# =            ZPLUG Imports            =
# =====================================*/

  # start_time=$(gdate '+%s.%3N')
  export ZPLUG_HOME=/usr/local/opt/zplug
  source $ZPLUG_HOME/init.zsh

  # Get useful stuff from oh-my-zsh libs
  zplug "lib/completion", from:oh-my-zsh
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

  # google, ddg (duckduckgo), github, youtube, maps ... (web search)
  zplug "plugins/websearch", from:oh-my-zsh

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

# /*=====  End of ZPLUG Imports  ======*/

# /*=========================================================
# =            Proxy & Network switching related            =
# =========================================================*/

    # To ease switching proxies for work and home.
    # TODO: Fix cntlm configs

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

    # Test internet connectivity (GET google and check response status)
    alias testnet='curl -k -s -o /dev/null -w "%{http_code}\n" https://www.google.com'

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

# /*=====  End of Proxy & Network switching related  ======*/

# /*================================================
# =            Java development related            =
# ================================================*/
  # Open current repo's workspace in sts
  # This function expects a symlink '._workspace' in repo's root directory pointing
  # to the STS workspace directory
  sts-here() {
        # Get repo_base if this is a git repo, else error out
        local repo_base=$(git rev-parse --show-toplevel)
        if [[ ! $repo_base ]]; then
            echo "Not a git repo" && return 1
        fi
        # If no symlink ._workspace in repo_base, error out
        if [[ ! -h $repo_base/._workspace ]]; then
            echo "No symlink ._workspace in $repo_base" && return 1
        fi
        # Open the directory pointed to by ._workspace in repo root in sts
        open -n /Applications/STS.app/ --args -data $(realpath "$repo_base/._workspace")
    }

  alias sts='open -n /Applications/STS.app'

  alias mvn='mvn --threads 1C'

# /*=====  End of Java development related  ======*/

# Todolist - Always use the same todo-file. The one in $HOME
todo() {
  pushd $HOME >/dev/null && todolist "$@" && popd >/dev/null;
}

# Helper for tmux-cssh
# => To open tmux session with synchronized panes sshing to the specified
#    server group (defined in ~/.tmux-cssh)
cssh() {
  tmux-cssh -tl even-vertical -sa "-o LogLevel=error" -cs $1
}


# Super large history
HISTSIZE=100000
SAVEHIST=100000

# Set editor
export EDITOR=vi
export PATH="~/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman$MANPATH"

# Silence the banners on ssh
alias ssh='ssh -o LogLevel=error'
alias scp='scp -o LogLevel=error'
alias sftp='sftp -o LogLevel=error'

# For python, virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Source private stuff
if [[ -f ~/.dotfiles/private/misc.zsh ]]; then
  . ~/.dotfiles/private/misc.zsh
fi
set -o emacs
