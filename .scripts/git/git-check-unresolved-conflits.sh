#!/bin/sh

CONFLITS=$(rg --ignore-file .gitignore -e "<<<<<<< HEAD")
if [ $? -eq 0 ]; then
    printf "Files with conflicts were detected\n"
    echo $CONFLITS
    exit 1
fi
