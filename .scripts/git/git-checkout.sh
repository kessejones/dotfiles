#!/bin/sh

args=$@
if [ -z "$args" ]; then
    args=$(git branch | cut -c 3- | gum choose --limit 1)
    [ -z "$args" ] && exit 1
fi

git checkout $args
