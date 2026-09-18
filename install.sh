#!/bin/bash
if [ -d "~/bin" ]; then
	cp ./bin/* ~/bin
	mv ~/bin/savenquit.sh ~/bin/savenquit
	chown $USER:$GID ~/bin/savenquit
	chown $USER:$GID ~/bin/savehomeconfigs
	chown $USER:$GID ~/bin/homebak
	chown $USER:$GID ~/bin/homepull
	chown $USER:$GID ~/bin/homeundo
fi

