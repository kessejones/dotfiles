#!/bin/sh

zellij action new-tab --cwd "$HOME/$1"
INDEX=$(zellij action query-tab-names | wc -l)
zellij action go-to-tab "$INDEX"
