#!/bin/sh

if [ -z "$@" ]; then 
    git_files=$(git status --short -uno | grep -v '^ ' | awk '{print $2}')
    if [ ! -z "$git_files" ]; then
        files=$(gum choose --no-limit $git_files)
        if [ -n "$files" ]; then
            git restore --staged $files
        fi
    fi
else
    git restore --staged $@
fi
