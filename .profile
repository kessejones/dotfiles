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

# set homebrew to path
export PATH="$LINUX_HOMEBREW:$MACOS_HOMEBREW:$PATH"

export XDG_DATA_DIRS="$HOMEBREW/share:$HOME/.nix-profile/share:$HOME/.share:$XDG_DATA_DIRS"
