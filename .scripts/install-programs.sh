#!/bin/bash

export BREWPATH="/home/linuxbrew/.linuxbrew/bin"
export PATH="$BREWPATH:$PATH"

if ! type "brew" > /dev/null; then
    echo "brew not installed"
    exit 1
fi

brew install\
    neovim\
    fzf\
    fish\
    tmux\
    btop\
    tree-sitter\
    ripgrep\
    eza\
    gnu-sed\
    tidy-html5\
    gum\
    delta\
    zoxide

# utils for kafka
brew tap birdayz/kaf
brew install kaf
