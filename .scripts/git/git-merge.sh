#!/bin/sh

args=$@

if [ -z "$args" ]; then
    args=$(git branch | awk '!/\*/ { print $1 } ' | gum choose --limit 1)
    [ -z "$args" ] && exit 1
fi

git merge $args
