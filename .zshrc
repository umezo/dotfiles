echo "initializing environment vars"
##############################################
# export
#---------------------------------------------
#export LANG=ja_JP.UTF-8
export LD_LIBRARY_PATH="$HOME/local/lib"
export EDITOR=vim
#export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home'

export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export HOMEBREW_GITHUB_API_TOKEN="e85fa3e0a0e281eb1fadf4f1d4286d44393e1f88"


export MANPATH=/opt/local/man:$MANPATH

#export MANPAGER="col -b -x|vim -R -c 'set ft=man nolist nomod noma' -"

echo "set aliasies"
##############################################
# alias
#---------------------------------------------

#alias ls='ls -F --color'
alias ls='ls -F --color'
alias lsa="ls -la"
alias lf="ls -F"
alias ll="ls -la"
alias su="su -l"
alias gh="history 0 | grep" 
alias where="command -v"
alias ,q='exit'
alias vi='vim'
alias grep="egrep -i --color"
#alias j="jobs -l"
#alias gd='dirs -v;echo -n "select number: "; read newdir; cd -"$newdir"'
#alias du="du -h"
#alias df="df -h"
alias smb='convert_smb_url'
alias cpip='/sbin/ifconfig en1 | egrep "inet [0-9.]+" -o | sed -e "s/inet //" | pbcopy && pbpaste'
alias tail_trace='tail -f "${HOME}/Library/Preferences/Macromedia/Flash Player/Logs/flashlog.txt"'
#alias vim='nvim'
alias cdr='cd ${HOME}/Work'

echo "set prompt styles"
##############################################
# prompt 
#---------------------------------------------
autoload colors
colors

## zsh integration: any command that takes longer than 3 seconds
## https://gist.github.com/syui/7112389/raw/growl.zsh
## http://qiita.com/kazuph/items/3bfdfce6b7d02b43bf4d

alias pong='perl -nle '\''print "display notification \"$_\" with title \"Terminal\""'\'' | osascript'

local CURRENT_BRANCH=""
precmd() { 
  if (( $? == 0 )); then
    # message
    zsh_notify_status=done\!\!
  else
    zsh_notify_status=fail
  fi
  if [[ "${zsh_notify_cmd}" != "" ]]; then
    # time
    if (( `date +%s` - ${zsh_notify_time} > 3 )); then
      echo ${zsh_notify_cmd} ${zsh_notify_status}  | pong
    fi
  fi
  zsh_notify_cmd=

  CURRENT_BRANCH=`git symbolic-ref HEAD 2>/dev/null | sed -e "s/refs\/heads\///"`
  if [ -z "${CURRENT_BRANCH}" ] ; then
    CURRENT_BRANCH=
  else
    CURRENT_BRANCH="[${CURRENT_BRANCH}]"
  fi
}
preexec () {
  zsh_notify_cmd=$1
  zsh_notify_time=`date +%s`
}

AGENT_MARK="A"
if [ -z "$SSH_AGENT_PID" ] ; then
  AGENT_MARK=":"
fi

local GRAY=$'%{\e[1;30m%}'
local LIGHT_GRAY=$'%{\e[0;37m%}'
local DEFAULT=$'%{\e[1;37m%}'

local CYAN=$'%{\e[1;36m%}'
local YELLOW=$'%{\e[1;33m%}'
local PURPLE=$'%{\e[1;35m%}'
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'



HOSTNAME=`hostname`
PROMPT=$DEFAULT'[$CYAN${USER}$DEFAULT@$CYAN${HOSTNAME}$DEFAULT]$CYAN$AGENT_MARK''$YELLOW$TITLE$DEFAULT%(!.#.$) '
RPROMPT=$PURPLE'[%~]${CYAN}${CURRENT_BRANCH}'${DEFAULT}
if [ -z "$SSH_CLIENT" ] ; then
    HOSTNAME=""
    PROMPT=$DEFAULT'[$GREEN${USER}$DEFAULT@$GREEN${HOSTNAME}${DEFAULT}]${AGENT_MARK}''%(!.#.$) '
    RPROMPT=$CYAN'[%~]${PURPLE}${CURRENT_BRANCH}'${DEFAULT}
fi


setopt PROMPT_SUBST


echo "set options"
##############################################
# set options
#---------------------------------------------
setopt auto_pushd
setopt correct
setopt list_packed
#setopt auto_cd
#setopt noautoremoveslash # no remove postfix slash of command line
#setopt nolistbeep # no beep sound when complete list displayed

echo "set history options"
##############################################
# history
#---------------------------------------------
bindkey -e

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups hist_save_no_dups
setopt share_history # share command history data
setopt auto_list

echo "configure complete"
##############################################
# Completion configuration
#---------------------------------------------
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

compinit




echo "define custome commands"
function convert_smb_url() {
  local file_path=''
  if [ -n "$1" ] ; then
    file_path=$1
  else
    file_path=`print -R $(pbpaste)`
  fi

  if [ -n $file_path ] ; then
    local prefix=`echo $1|egrep "^smb://" -o`
    local direction=''
    local sed1=''
    local sed2=''

    print -R convert $file_path
    # case samba to win
    if [ -n "$prefix" ] ; then
      direction="mac–>win"
      sed1='s/\//\\/g'
      sed2='s/smb://'
    # case win to samba 
    else
      direction="win->mac"
      sed1='s/\\/\//g'
      sed2='s/^/smb:/' 
    fi

    #echo $direction
    #print -R "$file_path" | sed -e "$sed1" -e "$sed2"
    print -R "$file_path" | sed -e "$sed1" -e "$sed2" | pbcopy

    #print convert result will be copied into clipboard

    open `pbpaste`
  fi
}

function up() {
  to=$(perl -le '$p=$ENV{PWD}."/";$d="/".$ARGV[0]."/";$r=rindex($p,$d);$r>=0 && print substr($p, 0, $r+length($d))' $1)
  if [ "$to" = "" ]; then
    echo "no such file or directory: $1" 1>&2
    return 1
  fi
  cd $to
}



function man {
  local p
  local m
  if [ "$PAGER" != "" ];then
    p="$PAGER"
  fi
  if [ "$MANPAGER" != "" ];then
    m="$MNNPAGER"
  fi
  unset PAGER
  unset MANPAGER
  val=$(command man $* 2>&1)
  ret=$?
  if [ $ret -eq 0 ];then
    echo "$val"|col -bx|vim -R -c 'set ft=man' -
  else
    echo "$val"
  fi
  if [ "$p" != "" ];then
    export PAGER="$p"
  fi
  if [ "$m" != "" ];then
    export MANPAGER="$m"
  fi
  return $ret
}


echo "apply language virtual environments"

fpath=(~/.functions ${fpath})
ls ~/.nvm     >& /dev/null && source ~/.nvm/nvm.sh
ls ~/.phpbrew >& /dev/null && source ~/.phpbrew/bashrc
which rbenv   >& /dev/null && eval "$(rbenv init -)"
which pyenv   >& /dev/null && eval "$(pyenv init -)"
which direnv  >& /dev/null && eval "$(direnv hook zsh)"
export PATH="$HOME/.pyenv/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
