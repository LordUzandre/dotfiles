#!/bin/bash

# Abort if anything goes wrong
set -e

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Make sure that we don''t show all files in 'dotfiles status'
dotfiles config --local status.showUntrackedFiles no

# Install vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# remove script after succesful install
if [-f $0]; then
	rm "$0"
fi
