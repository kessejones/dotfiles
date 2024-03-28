function prompt_separator --on-event fish_postexec
    if test -e $fish_line_seperator 1
        set_color $fish_color_surface1
        echo (string repeat -n $COLUMNS '─')
        echo -n $line
    end
end
