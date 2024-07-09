# global variables
export EDITOR=nvim

# disable welcome message
set fish_greeting

set fish_cursor_insert line
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore
set fish_vi_force_cursor 1

# local config
if test -f ~/.config.fish
    source ~/.config.fish
end
