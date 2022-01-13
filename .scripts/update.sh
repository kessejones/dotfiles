#!/bin/bash

DOTFILES=$HOME/.dotfiles
GIT="git --work-tree=$HOME --git-dir=$DOTFILES"
GITREPO=git@github.com:kessejones/dotfiles.git

cd $DOTFILES && $GIT pull --rebase 

echo "Updated"
