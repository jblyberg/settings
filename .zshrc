#!/bin/zsh
##
# cloudhead - .zshrc
#

source ~/.profile

#
# Includes
#
autoload colors && colors
#autoload -Uz vcs_info
autoload -U compinit && compinit
autoload -U complist


# Set input mode to vi
set -o vi

# Bind <C-r> to history search
bindkey "^r" history-incremental-search-backward

#
# Aliases
#

# git
alias gush='git push'
alias github='gush origin master'
alias origin='gush origin master'
alias gist='git status'
alias gull='git pull'
alias gadd='git add'
alias gim='git commit -m'
alias c='git commit'

if [[ $(uname) = 'Darwin' ]]; then
  alias l='ls -alAghp'
  alias ls='ls -p'
else
  alias ls='ls -f --color'
fi
alias ..='cd ..'

# other
alias nginxre='sudo kill `cat /usr/local/logs/nginx.pid`;sudo nginx'
alias ts='thin start'
alias src="cd $SRCPATH"
alias vi='vim'
alias e='vim'
alias wic='wicd-curses'
alias rcconf='sudo vim /etc/rc.conf'
alias chrome='chromium'
alias pdf='mupdf'

#
# History
#
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
REPORTTIME=10

setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt AUTO_CD
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

#
# ANSI Color Codes
#
CLEAR=$reset_color
RED=$fg[red]
GREEN=$fg[green]
YELLOW=$fg[yellow]
BLUE=$fg[blue]
PURPLE=$fg[magenta]
CYAN=$fg[cyan]
GREY=$'\e[0;94m'

#
# Set prompt style
#
ACTION="%{$PURPLE%}:%a%{$CLEAR%}"

zstyle ':vcs_info:*:prompt:*'                enable git
zstyle ':vcs_info:*:prompt:*'                check-for-changes true
zstyle ':vcs_info:*:prompt:*'  stagedstr     "%{$YELLOW%}"
zstyle ':vcs_info:*:prompt:*'  unstagedstr   "%{$GREEN%}"
zstyle ':vcs_info:*:prompt:*'  actionformats "(%{$BLUE%}%u%c%b${ACTION})%{$CLEAR%} "
zstyle ':vcs_info:*:prompt:*'  formats       "[ %{$GREY%}git%{$CLEAR%}::%{$BLUE%}%c%u%c%b%c%u%{$CLEAR%} ] "
zstyle ':vcs_info:*:prompt:*'  nvcsformats   ""

function precmd {
  local last=$?
  local prompt=""

  # Status
  if [[ $last -eq 0 ]]; then
    prompt=$GREEN
  elif [[ $last  -eq 1 ]]; then
    prompt=$YELLOW
  else
    prompt=$RED
  fi

  cursor="%{$prompt%}%#%{$CLEAR%}"
#  vcs_info 'prompt'
}

#
# Set Prompts
#
PROMPT="%{$BLUE%}%n%{$CLEAR%}@%{$GREY%}%m%{$CLEAR%} %~ "'${cursor}'" %{$CLEAR%}"
#RPROMPT='%{$BLUE%}%w %T %M%{$CLEAR%}'
#RPROMPT='${vcs_info_msg_0_}'

