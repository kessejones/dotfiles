#!/bin/sh

mode="$1"
shift
args="$@"

if [ -z "$args" ]; then
    args=$(git branch | awk '!/\*/ { print $1 } ' | gum choose --no-limit)

    [ -z "$args" ] && exit 1
fi

git branch $mode $args
