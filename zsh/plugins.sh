#!/bin/bash

PATH_INSTALL=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
PLUGINS="zsh-users/zsh-autosuggestions zsh-users/zsh-syntax-highlighting softmoth/zsh-vim-mode"

plugin_name(){
    splitString=$1
    result="$(echo $splitString | cut -d"/" -f2)"
    echo $result
}

for plugin in $PLUGINS; do
    echo "Install plugin: $plugin"
    git clone https://github.com/${plugin}.git ${PATH_INSTALL}/plugins/$(plugin_name $plugin)
done

echo "Done!"
