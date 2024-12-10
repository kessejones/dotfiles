local wezterm = require("wezterm")

local keys = require("keys")
local tabs = require("tabs")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

keys.setup(config)
tabs.setup()

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
    -- config.animation_fps = 1
end

config.underline_thickness = "2pt"
config.underline_position = -6
config.webgpu_power_preference = "HighPerformance"
config.window_close_confirmation = "NeverPrompt"
config.bold_brightens_ansi_colors = true
config.default_cwd = wezterm.home_dir
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 400
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.enable_scroll_bar = false
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true

config.enable_kitty_keyboard = true

config.window_padding = {
    left = 5,
    right = 0,
    top = 5,
    bottom = 0,
}

return config
