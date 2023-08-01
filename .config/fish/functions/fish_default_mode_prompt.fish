function fish_default_mode_prompt --description 'Display vi prompt mode'
  set -l reset_color $mode_color_normal
  set -l mode_text ""
  if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            case default
                set mode_text "[N]"
                set reset_color $mode_color_normal
            case insert
                set mode_text "[I]"
                set reset_color $mode_color_insert
            case replace_one
                set mode_text "[R]"
                set reset_color $mode_color_green
            case replace
                set mode_text "[R]"
                set reset_color $mode_color_replace
            case visual
                set mode_text "[V]"
                set reset_color $mode_color_visual
        end
    end

    if test -n "$SSH_TTY" || test -n "$SSH_CLIENT"
        set -l machine (hostname)
        _power_prompt --text=" [$machine] " --background=$fish_color_lavender --foreground=$fish_color_base --reset=$reset_color --bold
    end

    if test -n "$fish_private_mode"
        _power_prompt --text=' 󰗹 ' --background="292c3c" --foreground="cdd6f4" --reset=$reset_color --bold
    end

  if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
    _power_prompt --text=$mode_text --background=$reset_color --foreground=$mode_fg --reset=$mode_color_reset --bold
    echo -n -s ' '
  end
end
