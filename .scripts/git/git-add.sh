#!/bin/bash

if [ -z "$@" ]; then
    git status --short | cut -c 4- | gum choose --no-limit | xargs git add
else
    git add $@
fi
