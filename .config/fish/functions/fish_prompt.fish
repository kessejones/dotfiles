function fish_prompt
    set -l cwd (basename (prompt_pwd))
    set -l git_info (string trim (fish_git_prompt) --chars " ()")

    echo -n (__fish_prompt_item --text="$cwd" --background=$fish_color_blue --foreground=$fish_color_base --reset=normal --bold)
    if test -n "$git_info"
        echo -n ' '

        echo -n (__fish_prompt_item --text=" $git_info" --background=$fish_color_mauve --foreground=$fish_color_base --reset=normal --bold)
    end

    set -l mode_color (set_color normal)
    switch $fish_bind_mode
        case default
            set mode_color (set_color $fish_color_red)
        case insert
            set mode_color (set_color $fish_color_subtext1)
        case visual
            set mode_color (set_color $fish_color_mauve)
    end

    echo -n "$mode_color"
    set_color normal
    echo -n -s ' '
end

