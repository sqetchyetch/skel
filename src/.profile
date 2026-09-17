#!/usr/bin/sh
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
# set PATH so it includes user's private bin folders if they exist..
[ -d "$HOME/bin" ] || mkdir ~/bin && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] || mkdir -p ~/.local/bin && export PATH="$HOME/.local/bin:$PATH"
# Paths for python and pip3 to work with pyenv
export PYENV_ROOT="/home/etch/.pyenv"
[ -d $PYENV_ROOT/bin ] || mkdir -p ~/.pyenv/bin && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# Paths for Android Studio installation
export ANDROID_HOME="/home/etch/Android/Sdk"
export ANDROID_STUDIO="/home/etch/Android/android-studio"
export PATH="$ANDROID_STUDIO/bin:$PATH"
#export NDK_ROOT="/home/etch/Android/Sdk/ndk"
#export SDK_ROOT="/home/etch/Android/Sdk"
# Load Personal Configuration Files..
if [ -n "$ZSH_VERSION" ]; then
    # include .zshrc if it exists
	. "$HOME/.zshrc" && echo "zshrc"
fi
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
	. "$HOME/.bashrc" && echo "bashrc"
fi
