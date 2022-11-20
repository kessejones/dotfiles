function _build_dots
    echo "dotfiles $HOME/.dotfiles"
    echo "nvim $HOME/.config/nvim"
    echo "awesome $HOME/.config/awesome"
    echo "fish $HOME/.config/fish"
    echo "yabai $HOME/.config/yabai"
    echo "skhd $HOME/.config/skhd"
    echo "alacritty $HOME/.config/alacritty"
end

function dotconf
    set -l dots (_build_dots)

    clear
    set -l selected (gum choose --limit 1 $dots | cut -d' ' -f2)
    if test -n "$selected"
        cd $selected
    end

    commandline --function repaint
end
