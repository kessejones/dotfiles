## Disable welcome message
set fish_greeting

## Setup cursor
set fish_cursor_insert line
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore
set fish_vi_force_cursor 1

## Load local fish config if exists
if test -f ~/.config.fish
   source ~/.config.fish
end
