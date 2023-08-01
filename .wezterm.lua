local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.check_for_updates = false
config.color_scheme = 'Catppuccin Mocha'
config.font_size = 14.0
config.font = wezterm.font("JetBrainsMono Nerd Font", {weight = "Medium", stretch = 'Normal', style = "Normal"})
config.bold_brightens_ansi_colors = true
config.use_cap_height_to_scale_fallback_fonts = true
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_rules = {
    {
        italic = true,
        font = wezterm.font("JetBrainsMono Nerd Font", {weight="Medium", stretch="Normal", style="Italic"}),
    },
    {
        intensity = "Bold",
        font = wezterm.font("JetBrainsMono Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
    },
    {
        intensity = "Bold",
        italic = true,
        font = wezterm.font("JetBrainsMono Nerd Font", {weight="Bold", stretch="Normal", style="Italic"})
    },
}

config.window_decorations = 'RESIZE'
config.front_end = "OpenGL"
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.default_cursor_style = 'SteadyBar'
config.enable_scroll_bar = false
config.freetype_load_target = "HorizontalLcd"
config.window_padding = {
  left = 5,
  right = 0,
  top = 5,
  bottom = 0,
}

wezterm.on(
  'format-tab-title',
  function(tab, _tabs, _panes, _config, _hover, max_width)
    local pane = tab.active_pane
    local process_name = string.gsub(pane.foreground_process_name, '(.*[/\\])(.*)', '%2')
    local title_text = string.format(' %d:%s ', tab.tab_index + 1, process_name)

    if tab.is_active then
    return {
        {Background = { Color = '#89b4fa' }},
        {Text = title_text}
    }
    end
    return title_text
  end
)

config.disable_default_key_bindings = true
config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
    {
        key = 't',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = "\\",
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal {domain = 'CurrentPaneDomain'},
    },
    {
        key = "'",
        mods = 'LEADER',
        action = wezterm.action.SplitVertical {domain = 'CurrentPaneDomain'},
    },
    {
        key = "m",
        mods = 'LEADER',
        action = wezterm.action.TogglePaneZoomState,
    },
    { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
    { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },

    {
        key = "h",
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = "l",
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = "j",
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = "k",
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },

    {
        key = "1",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(0),
    },
    {
        key = "2",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(1),
    },
    {
        key = "3",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(2),
    },
    {
        key = "4",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(3),
    },
    {
        key = "5",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(4),
    },
    {
        key = "6",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(5),
    },
    {
        key = "7",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(6),
    },
    {
        key = "8",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(7),
    },
    {
        key = "9",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(8),
    },
    {
        key = "0",
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(9),
    },
    {
        key = 'q',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        key = 'p',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.MoveTabRelative (-1),
    },
    {
        key = 'n',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.MoveTabRelative (1),
    },
    {
        key = 'l',
        mods = 'LEADER|CTRL',
        action = wezterm.action.AdjustPaneSize ({ 'Right', 5}),
    },
    {
        key = 'h',
        mods = 'LEADER|CTRL',
        action = wezterm.action.AdjustPaneSize ({ 'Left', 5}),
    },
    {
        key = 'k',
        mods = 'LEADER|CTRL',
        action = wezterm.action.AdjustPaneSize ({ 'Up', 5}),
    },
    {
        key = 'j',
        mods = 'LEADER|CTRL',
        action = wezterm.action.AdjustPaneSize ({ 'Down', 5}),
    },
-- { mods = "LEADER|SHIFT", key = "L", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
    {
        key = ',',
        mods = 'LEADER',
        action = wezterm.action.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },
}

return config
