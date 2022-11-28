function fish_default_mode_prompt --description 'Display vi prompt mode'
  if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            case default
                _power_prompt --text='[N]' --background=$mode_color_normal --foreground=$mode_fg --reset=$mode_color_reset --bold
            case insert
                _power_prompt --text='[I]' --background=$mode_color_insert --foreground=$mode_fg --reset=$mode_color_reset --bold
            case replace_one
                _power_prompt --text='[R]' --background=$mode_color_green --foreground=$mode_fg --reset=$mode_color_reset --bold
            case replace
                _power_prompt --text='[R]' --background=$mode_color_replace --foreground=$mode_fg --reset=$mode_color_reset --bold
            case visual
                _power_prompt --text='[V]' --background=$mode_color_visual --foreground=$mode_fg --reset=$mode_color_reset --bold
        end
        echo -n -s ' '
    end
end
