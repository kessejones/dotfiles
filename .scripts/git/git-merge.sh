#!/bin/bash

if [ -z "$@" ]; then
    git branch | awk '!/\\*/ { print $1 } ' | gum choose --limit 1 | xargs git merge
else
    git merge $@;
fi;
