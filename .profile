#!/bin/bash
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Load SHELL Personal Configuration
# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    # include .zshrc if it exists
	source ~/.zshrc;
fi
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
	source ~/.bashrc;
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
else
	mkdir ~/bin;
	PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
else
	mkdir -p ~/.local/bin;
	PATH="$HOME/.local/bin:$PATH"
fi

# Paths for python and pip3 to work with pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# Paths for Android Studio installation
export ANDROID_HOME="/home/etch/Android/Sdk"
export ANDROID_STUDIO="/home/etch/Android/android-studio"
export PATH="$ANDROID_STUDIO/bin:$PATH"
#export NDK_ROOT="/home/etch/Android/Sdk/ndk"
#export SDK_ROOT="/home/etch/Android/Sdk"

