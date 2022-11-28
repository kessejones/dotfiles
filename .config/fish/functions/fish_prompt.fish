function fish_prompt
    set -l cwd (basename (prompt_pwd))
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showupstream true
    set -g __fish_git_prompt_char_upstream_equal ''

    set -l git_info (fish_git_prompt)

    if test -n "$git_info"
        _power_prompt --text="$cwd " --background=$fish_color_cwd_bg --foreground=$fish_color_cwd_fg --reset=$fish_color_git_bg
        _power_prompt --text="$git_info" --background=$fish_color_git_bg --foreground=$fish_color_git_fg --reset=normal
    else
        _power_prompt --text="$cwd " --background=$fish_color_cwd_bg --foreground=$fish_color_cwd_fg --reset=normal
    end

    echo -n -s ' ' $normal
end

