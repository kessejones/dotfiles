#!/bin/bash

APPS=nvim \
    fzf \
    bat \
    fish \
    tmux \
    tree-sitter \
    gum

brew >/dev/null

if [ $? -eq 127]; then
    echo "homebrew not installed"
else
    brew install $APPS
fi

