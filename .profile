# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
    . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi 

LINUX_HOMEBREW=/home/linuxbrew/.linuxbrew/bin
MACOS_HOMEBREW=/opt/homebrew/bin
NIX_PROFILE_BIN=$HOME/.nix-profile/bin

if [ -f $NIX_PROFILE_BIN/fish ]; then
    export SHELL=$NIX_PROFILE_BIN/fish
elif [ -f $LINUX_HOMEBREW/fish ]; then
    export SHELL=$LINUX_HOMEBREW/fish
elif [ -f $MACOS_HOMEBREW/fish ]; then
    export SHELL=$MACOS_HOMEBREW/fish
fi

# set homebrew to path
export PATH="$LINUX_HOMEBREW:$MACOS_HOMEBREW:$PATH"
