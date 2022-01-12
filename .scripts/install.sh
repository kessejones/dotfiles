#!/bin/bash

DOTFILES=$HOME/.dotfiles
GIT="git --work-tree=$HOME --git-dir=$DOTFILES"
GITREPO=git@github.com:kessejones/dotfiles.git

if [ ! -d "$DOTFILES" ]; then
    mkdir -p $DOTFILES
fi

$GIT init
cd $DOTFILES && $GIT remote add origin $GITREPO && $GIT fetch && $GIT checkout --force new

echo "Instalation completed"
