#!/bin/sh

mode=$1 # apply, drop, list or pop

if [ -n "$mode" ]; then
    stash=$(git stash list | gum choose --limit 1 | cut -d':' -f1)
    if [ -n "$stash" ]; then
        git stash $mode $stash
    fi
fi
