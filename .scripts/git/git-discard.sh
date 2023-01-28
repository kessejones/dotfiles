#!/bin/sh

args=$@

if [ -z "$args" ]; then
    args=$(git status --short | cut -c 4- | gum choose --no-limit) 
    [ -z "$args" ] && exit 1
fi

git checkout $args
