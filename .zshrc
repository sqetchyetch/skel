# ~/.zshrc: user .zshrc file for zsh(1).
# INFO ------------------------------------------------------------------- {{{
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
# ------------------------------------------------------------------------ }}}
# COMPLETIONS ZSH -------------------------------------------------------- {{{
# The following lines were added by compinstall
#
zstyle ':completion:*:sudo:*' completer _expand _complete _ignored
zstyle ':completion:*:sudo:*' insert-unambiguous true
zstyle ':completion:*:sudo:*' ''
zstyle ':completion:*:sudo:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*:sudo:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*:sudo:*' use-compctl true
zstyle ':completion:*:sudo:*' verbose true
zstyle :compinstall filename '/home/etch/.zshrc'

autoload -Uz compinit && compinit
#
# End of lines added by compinstall..
#
fpath=(~/.zsh/completion $fpath)

#autoload -Uz +X bashcompinit && bashcompinit
#[ -f ~/.zsh/completion/fastboot ] && source ~/.zsh/completion/fastboot
#source <(hugo completion zsh); compdef _hugo hugo
#
# Below are options from a random file, I found online. 
# I'm commenting out the ones that are redundant 
# or have been causing noticeable issues..
#
#autoload -U compinit
#compinit

# allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
# keep background processes at full speed
setopt NOBGNICE
# restart running processes on exit
#setopt HUP #causing problems in Debian and mac sessions kept returning..
# history
setopt APPEND_HISTORY
# for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# never ever beep ever
setopt NO_BEEP
# automatically decide when to page a list of completions
#LISTMAX=0
# disable mail checking
MAILCHECK=0
#autoload -Uz colors && colors
(( ${+aliases[run-help]} )) && unalias run-help
#autoload -Uz run-help

# If you don't want compinit called in /etc/zsh/zshrc uncomment
#skip_global_compinit=1
# ------------------------------------------------------------------------ }}}
# DEFAULTS --------------------------------------------------------------- {{{
# Use vi commands in the prompt
# Sets the terminal shell prompt to emulate vi
set -o vi
#
READNULLCMD=${PAGER:-/usr/bin/pager}
# An array to note missing features to ease diagnosis in case of problems.
typeset -ga debian_missing_features

if [[ -z "${DEBIAN_PREVENT_KEYBOARD_CHANGES-}" ]] &&
   [[ "$TERM" != 'emacs' ]]
then

    typeset -A key
    key=(
        BackSpace  "${terminfo[kbs]}"
        Home       "${terminfo[khome]}"
        End        "${terminfo[kend]}"
        Insert     "${terminfo[kich1]}"
        Delete     "${terminfo[kdch1]}"
        Up         "${terminfo[kcuu1]}"
        Down       "${terminfo[kcud1]}"
        Left       "${terminfo[kcub1]}"
        Right      "${terminfo[kcuf1]}"
        PageUp     "${terminfo[kpp]}"
        PageDown   "${terminfo[knp]}"
    )

    function bind2maps () {
        local i sequence widget
        local -a maps

        while [[ "$1" != "--" ]]; do
            maps+=( "$1" )
            shift
        done
        shift

        sequence="${key[$1]}"
        widget="$2"

        [[ -z "$sequence" ]] && return 1

        for i in "${maps[@]}"; do
            bindkey -M "$i" "$sequence" "$widget"
        done
    }

    bind2maps emacs             -- BackSpace   backward-delete-char
    bind2maps       viins       -- BackSpace   vi-backward-delete-char
    bind2maps             vicmd -- BackSpace   vi-backward-char
    bind2maps emacs             -- Home        beginning-of-line
    bind2maps       viins vicmd -- Home        vi-beginning-of-line
    bind2maps emacs             -- End         end-of-line
    bind2maps       viins vicmd -- End         vi-end-of-line
    bind2maps emacs viins       -- Insert      overwrite-mode
    bind2maps             vicmd -- Insert      vi-insert
    bind2maps emacs             -- Delete      delete-char
    bind2maps       viins vicmd -- Delete      vi-delete-char
    bind2maps emacs viins vicmd -- Up          up-line-or-history
    bind2maps emacs viins vicmd -- Down        down-line-or-history
    bind2maps emacs             -- Left        backward-char
    bind2maps       viins vicmd -- Left        vi-backward-char
    bind2maps emacs             -- Right       forward-char
    bind2maps       viins vicmd -- Right       vi-forward-char

    # Make sure the terminal is in application mode, when zle is
    # active. Only then are the values from $terminfo valid.
    if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
        function zle-line-init () {
            emulate -L zsh
            printf '%s' ${terminfo[smkx]}
        }
        function zle-line-finish () {
            emulate -L zsh
            printf '%s' ${terminfo[rmkx]}
        }
        zle -N zle-line-init
        zle -N zle-line-finish
    else
        for i in {s,r}mkx; do
            (( ${+terminfo[$i]} )) || debian_missing_features+=($i)
        done
        unset i
    fi

    unfunction bind2maps

fi # [[ -z "$DEBIAN_PREVENT_KEYBOARD_CHANGES" ]] && [[ "$TERM" != 'emacs' ]]
# ------------------------------------------------------------------------ }}}
# PERSONAL CONFIGURATIONS ------------------------------------------------ {{{
# Vi prompt commands already set above in Defaults Section..
#set -o vi <-(Don't Uncomment)
#
# Command Prompt Styling
#PS1="%n@%m %1~ %# "
PS1="%F{red}%*%f%F{cyan}]%n@%m[%f%F{magenta}%1~%f%F{cyan}]%f%F{normal}%f %# "
#
# Aliases..
if
	[ -f "/etc/aliases" ] ; then
	source /etc/aliases;
else
	print "no /etc/aliases file..";
fi
#
# Functions..
alias cd="godir"
godir() {
	ls -AFhls --color=always "$1"; chdir "$1";
}

# PATH flags..
export PATH="~/bin:$PATH"
export PATH="~/bin/test:$PATH"
export PATH="~/.local/bin:$PATH"

# Android Studio Install Location
export ANDROID_HOME="/home/etch/Android/Sdk"
export ANDROID_STUDIO="/home/etch/Android/android-studio"
export PATH="$ANDROID_STUDIO/bin:$PATH"

# Virtual Environment Installed for something..
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# ------------------------------------------------------------------------ }}}
