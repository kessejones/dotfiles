function __power_text_rounded
    argparse 'b/background=' 'f/foreground=' 'r/reset=' 'o/bold' 't/text=' -- $argv
        or return

    set -l text "$_flag_t"
    if set -ql _flag_o
        set text (string join '' -- (set_color --bold $_flag_f) $text)
    else
        set text (string join '' -- (set_color $_flag_f) $text)
    end

    string join '' -- (set_color -b $_flag_r) (set_color $_flag_b) "" (set_color -b $_flag_b) "$text" $(set_color -b $_flag_r) (set_color $_flag_b) ""
end

