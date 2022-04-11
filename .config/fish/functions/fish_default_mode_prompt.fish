function fish_default_mode_prompt --description 'Display vi prompt mode'
  set -l reset_color '49556a'
  set -l foreground '394050'

  set -l color_red 'BF616A'
  set -l color_green '76946a'
  set -l color_cyan '88C0D0'
  set -l color_magenta 'B48EAD'

  if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            case default
                _power_prompt --text='[N]' --background=$color_red --foreground=$foreground --reset=$reset_color --bold
            case insert
                _power_prompt --text='[I]' --background=$color_green --foreground=$foreground --reset=$reset_color --bold
            case replace_one
                _power_prompt --text='[R]' --background=$color_green --foreground=$foreground --reset=$reset_color --bold
            case replace
                _power_prompt --text='[R]' --background=$color_cyan --foreground=$foreground --reset=$reset_color --bold
            case visual
                _power_prompt --text='[V]' --background=$color_magenta --foreground=$foreground --reset=$reset_color --bold
        end
        echo -n -s ' '
    end
end
