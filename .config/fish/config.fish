# global variables
export EDITOR=nvim

# disable welcome message
set fish_greeting

set fish_cursor_insert line
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore

# local config
if test -f ~/.config.fish
    source ~/.config.fish
end

# custom theme
source ~/.config/fish/themes/catppuccin-mocha.fish
source ~/.config/fish/themes/theme.fish
