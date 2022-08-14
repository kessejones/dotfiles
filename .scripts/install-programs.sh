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
    bpytop\
    tree-sitter\
    ripgrep\
    exa
