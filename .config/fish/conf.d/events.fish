function prompt_separator --on-event fish_postexec
    set_color $fish_color_surface1
    echo (string repeat -n $COLUMNS '─')
    echo -n $line
end
