function fish_prompt
    set -l cwd (basename (prompt_pwd))
    set -l git_info (string trim (fish_git_prompt) --chars " ()")

    echo -n (__fish_prompt_item --text="$cwd" --background=$fish_color_blue --foreground=$fish_color_base --reset=normal --bold)

    if test -n "$IN_NIX_SHELL"
        echo -n ' '
        echo -n (__fish_prompt_item --text=" nix-shell" --background=$fish_color_lavender --foreground=$fish_color_base --reset=normal --bold)
    end

    if test -n "$git_info"
        echo -n ' '

        echo -n (__fish_prompt_item --text=" $git_info" --background=$fish_color_mauve --foreground=$fish_color_base --reset=normal --bold)
    end

    set_color normal
    echo -n -s ' '
end

