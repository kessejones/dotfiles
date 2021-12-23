#!/bin/bash

PATH_INSTALL=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
PLUGINS="zsh-users/zsh-autosuggestions zsh-users/zsh-syntax-highlighting jeffreytse/zsh-vi-mode"

for plugin in $PLUGINS; do
    echo "Install plugin: $plugin"
    git clone https://github.com/${plugin}.git ${PATH_INSTALL}/plugins/${plugin}
done

echo "Done!"
