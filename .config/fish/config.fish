# general
set -gx EDITOR nvim

# disable welcome message
set fish_greeting

# custom colors
set fish_color_command green
set fish_color_autosuggestion 656565 
set fish_color_error red

# path
fish_add_path ~/.local/bin

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

# local config
if test -f ~/.user-config.fish
    source ~/.user-config.fish
end
