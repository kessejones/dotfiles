function __fish_toggle_private_mode
    if test -n "$fish_private_mode"
        exec fish
    else
        exec fish --private
    end
    commandline --function repaint
end
