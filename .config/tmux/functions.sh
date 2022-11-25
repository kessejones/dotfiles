#!/bin/bash

set() {
    tmux set-option -g "$1" "$2"
}
