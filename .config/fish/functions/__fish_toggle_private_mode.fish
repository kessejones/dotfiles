function __fish_toggle_private_mode
    if test -n "$fish_private_mode"
      set -e fish_private_mode
    else
      set -g fish_private_mode 1
    end
    commandline --function repaint
end
