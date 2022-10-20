local wezterm = require('wezterm')

return {
    set_environment_variables = {
        term = 'tmux-256color'
    },
    enable_tab_bar = false,
    color_scheme="Catppuccin Mocha",
    window_background_opacity = 0.93,
    font = wezterm.font({ family = 'Hack' }),

    font_size = 11.0,
}
