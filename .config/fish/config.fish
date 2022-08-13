# global variables
export EDITOR=nvim

# disable welcome message
set fish_greeting

# custom colors
set fish_color_command green
set fish_color_autosuggestion 656565 
set fish_color_error red

# local config
if test -f ~/.config.fish
    source ~/.config.fish
end
