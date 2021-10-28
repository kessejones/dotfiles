#!/bin/bash

PATH_INSTALL=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
PLUGINS="zsh-autosuggestions zsh-syntax-highlighting"

for plugin in $PLUGINS; do
    echo "Install plugin: $plugin"
    git clone https://github.com/zsh-users/${plugin}.git ${PATH_INSTALL}/plugins/${plugin}
done

echo "Done!"
