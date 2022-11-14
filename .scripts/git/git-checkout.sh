#!/bin/bash

if [ -z "$@" ]; then
    git branch | cut -c 3- | gum choose --limit 1 | xargs git checkout
else
    git checkout $@
fi
