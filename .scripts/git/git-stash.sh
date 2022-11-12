#!/bin/bash

if [ -z "$2" ]; then
    git stash list | gum choose --limit 1 | cut -d':' -f1 | xargs git stash $1
else
    git stash $@
fi
