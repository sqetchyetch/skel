#!/bin/bash

#export HOMECFGDIR="$HOME/.skel"

# Check to make sure git is installed and other tools necessary for installation
# import -> git
# import -> binutils
# import -> net-tools
#sudo apt update && sudo apt install git binutils net-tools -y

# Move binary files to proper locations for use..
placebinaries() {
	[ -d "$HOME/bin" ] || mkdir $HOME/bin;
	cp ./bin/* $HOME/bin;
	chown $USER:$GID $HOME/bin/defaulthomecfgs;
	chown $USER:$GID $HOME/bin/ghauth;
	chown $USER:$GID $HOME/bin/homepull;
	chown $USER:$GID $HOME/bin/homeundo;
	chown $USER:$GID $HOME/bin/savenquit;
	chown $USER:$GID $HOME/bin/savehomeconfigs
}
placebinaries

# Manage home configuration files from skel folder in a way that allows permanency..
#for f in file1.txt file2.txt file3.txt file4.txt file5.txt; do [ -f "$f" ] && mv "$f" "backup_$f" && mv "source_$f" "$f"; done
# linkhomefiles() {
#	[ -f "$HOME/.aliases" ] && mv $HOME/.aliases $HOME/.aliases.bak || ln -sT src/.aliases $HOME/.aliases;
#	[ -f "$HOME/.bashrc" ] && mv $HOME/.bashrc $HOME/.bashrc.bak || ln -sT src/.bashrc $HOME/.bashrc;
#	[ -f "$HOME/.profile" ] && mv $HOME/.profile $HOME/.profile.bak || ln -sT src/.profile $HOME/.profile;
#	[ -f "$HOME/.vimrc" ] && mv $HOME/.vimrc $HOME/.vimrc.bak || ln -sT src/.vimrc $HOME/.vimrc;
#	[ -f "$HOME/.zprofile" ] && mv $HOME/.zprofile $HOME/.zprofile.bak || ln -sT src/.zprofile $HOME/.zprofile;
#	[ -f "$HOME/.zshrc" ] && mv $HOME/.zshrc $HOME/.zshrc.bak || ln -sT src/.zshrc $HOME/.zshrc
#}
# linkhomefiles
# linkhomefiles() {
#	for f in .aliases .bashrc .profile .vimrc .zprofile .zshrc; do [ -f "$HOME/$f" ] mv "$HOME/$f" "$HOME/$f.bak" && cp -fv "src/$f" "$HOME/$f"; done
#}
#linkhomefiles

sudo apt update
sudo apt install zsh vim binutils net-tools -y
chsh -s /bin/zsh
exit
