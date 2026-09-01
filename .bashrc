#!/bin/sh
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Wildcard "**"
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if 
	[ -f "/etc/aliases" ] ; then
    source /etc/aliases;
else
	print "no /etc/aliases file.."
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# PERSONAL CONFIGURATIONS ################## {{{

#PS1="%Fg{red}%*%fg%Fg{cyan}]%n[%fg%Fg{magenta}%1~%fg%Fg{cyan}]%fg%Fg{normal}%fg %# "
PS1="\e[33m\]\t\e[36m\]]\u[\e[034m\]\W\e[36m\]]\e[m\] \\$ "

#alias chl="cat >> /Users/etch/bin/notes\ commands\ etc\ sqtch << END"

alias cd="go"
go() {
	ls --color=always -AFhls "$1"; builtin cd "$1";
}

# sqtch() {
#	touch /Users/etch/bin/"$1"; cat >> /Users/etch/bin/"$1" << END;
#}

# Colors for less I think..
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export MANROFFOPT="-c"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export ANDROID_HOME="/home/etch/Android/Sdk"
export ANDROID_STUDIO="/home/etch/Android/android-studio"
export PATH="$ANDROID_STUDIO/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ############################################ }}}
