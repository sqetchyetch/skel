#!/bin/bash

# Check to make sure git is installed and other tools necessary for installation
# import -> git
# import -> binutils
# import -> net-tools
sudo apt update && sudo apt install git binutils net-tools -y

# Move files to proper locations for use..
placebinaries() {
	if [ -d "~/bin" ]; then
	cp ./bin/* ~/bin;
	chown $USER:$GID ~/bin/defaulthomecfgs;
	chown $USER:$GID ~/bin/ghauth;
	chown $USER:$GID ~/bin/homepull;
	chown $USER:$GID ~/bin/homeundo;
	chown $USER:$GID ~/bin/savenquit;
	chown $USER:$GID ~/bin/savehomeconfigs
else
	mkdir ~/bin;
	placebinaries
fi
}
placebinaries

# Move src files to home location and symlink
#for f in file1.txt file2.txt file3.txt file4.txt file5.txt; do [ -f "$f" ] && mv "$f" "backup_$f" && mv "source_$f" "$f"; done
linkhomefiles() {
	[ -f ~/.aliases ] && mv ~/.aliases ~/.aliases.bak || ln -sT src/.aliases ~/.aliases;
	[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak || ln -sT src/.bashrc ~/.bashrc;
	[ -f ~/.profile ] && mv ~/.profile ~/.profile.bak || ln -sT src/.profile ~/.profile;
	[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.bak || ln -sT src/.vimrc ~/.vimrc;
	[ -f ~/.zprofile ] && mv ~/.zprofile ~/.zprofile.bak || ln -sT src/.zprofile ~/.zprofile;
	[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak || ln -sT src/.zshrc ~/.zshrc
}
linkhomefiles

