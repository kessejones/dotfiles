local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

wezterm.on("format-tab-title", function(tab, _tabs, _panes, _config, _hover, max_width)
    local pane = tab.active_pane
    local process_name = string.gsub(pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
    local title_text = string.format(" %d:%s ", tab.tab_index + 1, process_name)

    if tab.is_active then
        return {
            { Background = { Color = "#89b4fa" } },
            { Text = title_text },
        }
    end
    return title_text
end)

wezterm.on("update-right-status", function(window, pane)
    local name = window:active_key_table()
    window:set_right_status(name or "")
end)

config.term = "wezterm"
config.check_for_updates = false
config.color_scheme = "Catppuccin Mocha"
config.colors = {
    background = "#1E1E2F",
}

config.font = wezterm.font_with_fallback({
    { family = "JetBrainsMono Nerd Font", weight = "Medium" },
    { family = "Meslo LG S", scale = 1.3 },
})

if wezterm.target_triple:match("linux") then
    config.font_size = 10.0
else
    config.font_size = 14.0
end

config.underline_thickness = "2pt"
config.underline_position = -6

config.window_close_confirmation = "NeverPrompt"
config.bold_brightens_ansi_colors = false
config.default_cwd = wezterm.home_dir
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 400
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.enable_scroll_bar = false
config.window_decorations = "RESIZE"

config.window_padding = {
    left = 5,
    right = 0,
    top = 5,
    bottom = 0,
}

config = require("keys")(config)

return config
