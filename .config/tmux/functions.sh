#!/bin/sh

setg() {
    tmux set-option -g "$1" "$2"
}
