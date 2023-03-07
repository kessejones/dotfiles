#!/bin/sh

set() {
    tmux set-option -g "$1" "$2"
}
