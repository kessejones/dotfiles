#!/bin/bash

SHELLS=/etc/shells
FISHPATH="/usr/local/bin/fish"
TMUXPATH="/usr/local/bin/tmux"

export BREWPATH="/home/linuxbrew/.linuxbrew/bin"
export PATH="$BREWPATH:$PATH"

# if brew not installed then exit
if ! type "brew" > /dev/null; then
    echo "brew is required for this installation"
    exit 1
fi

if [ "$(id -u)" != 0 ]; then
    exec sudo -E -- "$0" "$@" || die "this script needs to run as root"
else
    : "${SUDO_UID:=0}" "${SUDO_GID:=0}"
fi

echo "Starting setup"

# install fish if not exists
if ! type "fish" > /dev/null; then
    echo " - fish: starting installation"
    brew install fish
    echo " - fish: installation done"
else
    echo " - fish: already installed"
fi

# add symbolic link if needed
if [ ! -L $FISHPATH ]; then
    sudo ln -s "$BREWPATH/fish" $FISHPATH
    echo " - fish: added symbolic link"
fi

# add fish to shells file
if ! grep -q "fish" "$SHELLS"; then
    sudo echo "$FISHPATH" >> "$SHELLS"
    echo " - fish: added on shells file"
fi

# install tmux if not exists
if ! type "tmux" > /dev/null; then
    echo " - tmux: starting installation"
    brew install tmux

    echo " - tmux: installation done"
else
    echo " - tmux: already installed"
fi

# add symbolic link if needed
if [ ! -L $TMUXPATH ]; then
    sudo ln -s "$BREWPATH/tmux" $TMUXPATH
    echo " - tmux: added symbolic link"
fi
