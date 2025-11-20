#!/bin/sh

DIRECTION_MODE=$2

if [ $DIRECTION_MODE == "floating" ]; then
    zellij action new-pane -c --cwd "$HOME/$1" --floating -- $SHELL
else
    zellij action new-pane -c --cwd "$HOME/$1" --direction $DIRECTION_MODE -- $SHELL
fi
