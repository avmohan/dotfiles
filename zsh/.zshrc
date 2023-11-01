# Exec into tmux session named "main" if running inside iTerm
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [ -z "$TMUX" ] && [ ! -z "$ITERM_PROFILE" ]; then
  exec tmux new-session -A -s main
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initialize zinit, downloading it if necessary
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::grep.zsh

HIST_STAMPS="yyyy-mm-dd"
zinit snippet OMZL::history.zsh

zinit snippet OMZP::bgnotify
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::fasd
zinit snippet OMZP::fzf
zinit snippet OMZP::mvn
zinit snippet OMZP::kubectl
# zinit snippet OMZP::jira
zinit snippet OMZP::gnu-utils
zinit snippet OMZP::docker
zinit snippet OMZP::common-aliases
zinit snippet OMZP::copybuffer
zinit snippet OMZP::copyfile
zinit snippet OMZP::copypath
zinit snippet OMZP::extract
zinit ice as"completion"
zinit snippet OMZP::git-extras
zinit snippet OMZP::vscode
zinit snippet OMZP::urltools

#eval "$(jira --completion-script-zsh)"


#zinit ice pick"_ripgrep"
# zinit snippet OMZP::ripgrep/_ripgrep

#zi ice svn
#zi snippet OMZP::macos


zinit ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"
zinit light b4b4r07/httpstat

# forgit_log=fglo
# forgit_diff=fgd
# forgit_add=fga
# forgit_reset_head=fgrh
# forgit_ignore=fgi
# forgit_restore=fgcf
# forgit_clean=fgclean
# forgit_stash_show=fgss
# zinit load wfxr/forgit

if [[ -f ~/.dotfiles/work/init.zsh ]]; then
  . ~/.dotfiles/work/init.zsh
fi

if [[ -f ~/.dotfiles/private/init.zsh ]]; then
  . ~/.dotfiles/private/init.zsh
fi

source ~/.dotfiles/lib/git.zsh
source ~/.dotfiles/lib/pushnotify.zsh
source ~/.dotfiles/lib/misc.zsh

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
zinit ice as"completion"
zinit snippet OMZP::sdk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/local/bin:$PATH"
