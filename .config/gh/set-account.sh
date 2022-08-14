#!/bin/bash

NAME=$1
GH_PATH="$HOME/.config/gh"
GH_ACCOUNTS="$GH_PATH/accounts"

if [ -f "$GH_ACCOUNTS/$NAME.yml" ]; then
    cp "$GH_ACCOUNTS/$NAME.yml" "$GH_PATH/hosts.yml"
else
    echo "Account not exists"
fi
