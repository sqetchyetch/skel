# INFO ------------------------------------------------------------------- {{{
# ~/.zshrc: user .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
# ------------------------------------------------------------------------ }}}
# OPTIONS / KEYBINDINGS -------------------------------------------------- {{{
#setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
#setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS='_-' # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^?' backward-kill-line                   # ctrl + Backspace
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^U' undo                               # ctrl + U undo last action
# ------------------------------------------------------------------------ }}}
# COMPLETIONS ZSH -------------------------------------------------------- {{{
# add custom completion scripts made for bash to zsh..
#fpath=(~/.zsh/completion $fpath)       #sets fpath to ~/.zsh/completion..
#autoload -U +X bashcompinit && bashcompinit         #loads bashcompinit..
#[ -f ~/.zsh/completion/fastboot ] && source ~/.zsh/completion/fastboot

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# ------------------------------------------------------------------------ }}}
# HISTORY CONFIGURATIONS ------------------------------------------------- {{{
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt append_history        # for sharing history between processes
setopt inc_append_history    #
setopt share_history         # share command history data
setopt no_beep               # never ever beep ever
#setopt nobgnice              # keep background processes at full speed
setopt complete_in_word      # allow tab completion in the middle of a word

# automatically decide when to page a list of completions
LISTMAX=0
# disable mail checking
MAILCHECK=0

# force zsh to show the complete history
alias history="history 0"

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'
# ------------------------------------------------------------------------ }}}
# COLOR PROMPT / PROMPT STYLING ------------------------------------------ {{{
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi
configure_prompt() {
			PROMPT=$':%B%F{red}%*%f%F{cyan}]%n@%m[%f%F{magenta}%1~%f%F{cyan}]%f%F{normal}%f %B%(#.#.$) '
}
# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
PROMPT_ALTERNATIVE=personal
NEWLINE_BEFORE_PROMPT=no
# STOP KALI CONFIG VARIABLES
if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1
    configure_prompt
    # enable syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=bold
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
fi
unset color_prompt force_color_prompt
# ------------------------------------------------------------------------ }}}
# COLOR SUPPORT ---------------------------------------------------------- {{{
# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.7z=46;31;01:*.ace=46;31;01:*.alz=46;31;01:*.apk=46;31;01:*.arc=46;31;01:*.arj=46;31;01:*.bz=46;31;01:*.bz2=46;31;01:*.cab=46;31;01:*.cpio=46;31;01:*.crate=46;31;01:*.deb=46;31;01:*.drpm=46;31;01:*.dwm=46;31;01:*.dz=46;31;01:*.ear=46;31;01:*.egg=46;31;01:*.esd=46;31;01:*.gz=46;31;01:*.jar=46;31;01:*.lha=46;31;01:*.lrz=46;31;01:*.lz=46;31;01:*.lz4=46;31;01:*.lzh=46;31;01:*.lzma=46;31;01:*.lzo=46;31;01:*.pyz=46;31;01:*.rar=46;31;01:*.rpm=46;31;01:*.rz=46;31;01:*.sar=46;31;01:*.swm=46;31;01:*.t7z=46;31;01:*.tar=46;31;01:*.taz=46;31;01:*.tbz=46;31;01:*.tbz2=46;31;01:*.tgz=46;31;01:*.tlz=46;31;01:*.txz=46;31;01:*.tz=46;31;01:*.tzo=46;31;01:*.tzst=46;31;01:*.udeb=46;31;01:*.war=46;31;01:*.whl=46;31;01:*.wim=46;31;01:*.xz=46;31;01:*.z=46;31;01:*.zip=46;31;01:*.zoo=46;31;01:*.zst=46;31;01:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.jxl=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:';
	export LS_COLORS
    #export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions
    #export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    #export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    #export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    #export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    #export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    #export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    #export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
    #export MANROFFOPT="-c"
    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi
# load personal aliases file
if [ -f "$HOME/.aliases" ]; then
	. "$HOME/.aliases"
else
	. /etc/skel/.aliases && echo "skeleton alias file loaded.."
fi
# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
fi
# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi
# ------------------------------------------------------------------------ }}}
# DEFAULTS --------------------------------------------------------------- {{{
# Use vi commands in the prompt
# Sets the terminal shell prompt to emulate vi
set -o vi
# ------------------------------------------------------------------------ }}}
# PERSONAL CONFIGURATIONS ------------------------------------------------ {{{
# Vi prompt commands already set above in Defaults Section..
#set -o vi <-(Don't Uncomment)
#
# Change cd command to automatically list contents..
alias cd="godir"
godir() {
	ls -Ahls "$1"; chdir "$1";
}
#vimnav() {
#	curl -s http://"$1"/ | pandoc -f html -t markdown | vim -R -
#}
# for google in the command line..
#Gemini API Key needs to be stored locally, NOT on GitHub!
source ~/.ssh/.geminiapikey
# Virtual Environment Installed for Python Environments..
export PYENV_ROOT="/home/etch/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# ------------------------------------------------------------------------ }}}
