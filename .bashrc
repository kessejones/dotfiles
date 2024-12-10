# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# enable vi mode
set -o vi

# clear screen
bind -x '"\C-l": clear;'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
    . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi 

LINUX_HOMEBREW=/home/linuxbrew/.linuxbrew/bin
MACOS_HOMEBREW=/opt/homebrew/bin
NIX_PROFILE_BIN=$HOME/.nix-profile/bin

SHELL_NAME=fish
# SHELL_NAME=nu

if [ -f $NIX_PROFILE_BIN/$SHELL_NAME ]; then
    export SHELL=$NIX_PROFILE_BIN/$SHELL_NAME
elif [ -f $LINUX_HOMEBREW/$SHELL_NAME ]; then
    export SHELL=$LINUX_HOMEBREW/$SHELL_NAME
elif [ -f $MACOS_HOMEBREW/$SHELL_NAME ]; then
    export SHELL=$MACOS_HOMEBREW/$SHELL_NAME
fi

if [ ! "$SHELL" = "/bin/bash" ]; then
    exec $SHELL
fi
