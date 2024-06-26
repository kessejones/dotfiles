#!/bin/sh

args=$@

if [ -z "$args" ]; then
    args=$(git log --oneline --no-merges | gum choose --limit 1 | cut -d' ' -f1)
    [ -z "$args" ] && exit 1
fi

git diff $args
