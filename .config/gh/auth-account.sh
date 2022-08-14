#!/bin/bash

NAME=$1
GH_PATH="$HOME/.config/gh"
GH_ACCOUNTS="$GH_PATH/accounts"

mkdir -p $GH_ACCOUNTS

gh auth login
cp "$GH_PATH/hosts.yml" "$GH_ACCOUNTS/$NAME.yml"
