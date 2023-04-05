function prompt_separator --on-event fish_postexec
    set_color 45475a
    echo (string repeat -n $COLUMNS '─')
    echo -n $line
end
