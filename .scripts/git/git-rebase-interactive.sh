#!/bin/bash

args=$@

if [ -z "$args" ]; then
    args=$(git log --oneline | gum choose --limit 1 | cut -d' ' -f1)
    [ -z "$args" ] && exit 1
fi

git rebase -i $args
