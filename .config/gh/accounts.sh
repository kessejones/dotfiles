#!/bin/bash

GH_PATH="$HOME/.config/gh"
GH_ACCOUNTS="$GH_PATH/accounts"

if [ -d "$GH_ACCOUNTS/" ]; then
    ls "$GH_ACCOUNTS/" | cut -d'.' -f1 | gum choose | xargs gh set-account
else
    echo "You have only the default account set up"
fi
