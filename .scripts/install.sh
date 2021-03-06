#!/bin/bash

DOTFILES=$HOME/.dotfiles
GIT="git --work-tree=$HOME --git-dir=$DOTFILES"
GITREPO="https://github.com/kessejones/dotfiles.git"

if [ ! -d "$DOTFILES" ]; then
    mkdir -p $DOTFILES
fi

$GIT init
cd $DOTFILES && $GIT remote add origin $GITREPO && $GIT fetch && $GIT checkout -b main origin/main --force

echo "Instalation completed"
