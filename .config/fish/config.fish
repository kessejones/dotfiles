# global variables
export EDITOR=nvim

# disable welcome message
set fish_greeting

# local config
if test -f ~/.config.fish
    source ~/.config.fish
end

# custom theme
source ~/.config/fish/themes/catppuccin-mocha.fish
source ~/.config/fish/themes/theme.fish
