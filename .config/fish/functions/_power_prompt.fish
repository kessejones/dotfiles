function _power_prompt
    argparse 'b/background=' 'f/foreground=' 'r/reset=' 'o/bold' 't/text=' -- $argv
        or return

    set_color normal
    set_color -b $_flag_b
    if test -n "$_flag_o"
        set_color --bold $_flag_f
    else
        set_color $_flag_f
    end
    echo -n -s $_flag_t
    set_color -b $_flag_r

    if test -n "$_flag_o"
        set_color --bold $_flag_b
    else
        set_color $_flag_b
    end

    echo -n -s ''
end

