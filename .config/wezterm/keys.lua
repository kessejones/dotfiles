local wezterm = require("wezterm")
local act = wezterm.action

local leader = { key = "a", mods = "CTRL" }
local keys = {
    { key = "K", mods = "CTRL|SHIFT", action = act.SendString("\x1b[75;5u") },
    { key = "J", mods = "CTRL|SHIFT", action = act.SendString("\x1b[74;5u") },
    { key = "H", mods = "CTRL|SHIFT", action = act.SendString("\x1b[72;5u") },
    { key = "L", mods = "CTRL|SHIFT", action = act.SendString("\x1b[76;5u") },
    {
        key = "t",
        mods = "LEADER",
        action = act.SpawnTab("CurrentPaneDomain"),
    },
    {
        key = "\\",
        mods = "LEADER",
        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "'",
        mods = "LEADER",
        action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "m",
        mods = "LEADER",
        action = act.TogglePaneZoomState,
    },
    { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
    { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

    {
        key = "h",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Left"),
    },
    {
        key = "l",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Right"),
    },
    {
        key = "j",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Down"),
    },
    {
        key = "k",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Up"),
    },

    {
        key = "1",
        mods = "LEADER",
        action = act.ActivateTab(0),
    },
    {
        key = "2",
        mods = "LEADER",
        action = act.ActivateTab(1),
    },
    {
        key = "3",
        mods = "LEADER",
        action = act.ActivateTab(2),
    },
    {
        key = "4",
        mods = "LEADER",
        action = act.ActivateTab(3),
    },
    {
        key = "5",
        mods = "LEADER",
        action = act.ActivateTab(4),
    },
    {
        key = "6",
        mods = "LEADER",
        action = act.ActivateTab(5),
    },
    {
        key = "7",
        mods = "LEADER",
        action = act.ActivateTab(6),
    },
    {
        key = "8",
        mods = "LEADER",
        action = act.ActivateTab(7),
    },
    {
        key = "9",
        mods = "LEADER",
        action = act.ActivateTab(8),
    },
    {
        key = "0",
        mods = "LEADER",
        action = act.ActivateTab(9),
    },
    {
        key = "q",
        mods = "LEADER",
        action = act.CloseCurrentPane({ confirm = false }),
    },
    {
        key = "p",
        mods = "LEADER|SHIFT",
        action = act.MoveTabRelative(-1),
    },
    {
        key = "n",
        mods = "LEADER|SHIFT",
        action = act.MoveTabRelative(1),
    },
    {
        key = "l",
        mods = "LEADER|CTRL",
        action = act.AdjustPaneSize({ "Right", 5 }),
    },
    {
        key = "h",
        mods = "LEADER|CTRL",
        action = act.AdjustPaneSize({ "Left", 5 }),
    },
    {
        key = "k",
        mods = "LEADER|CTRL",
        action = act.AdjustPaneSize({ "Up", 5 }),
    },
    {
        key = "j",
        mods = "LEADER|CTRL",
        action = act.AdjustPaneSize({ "Down", 5 }),
    },
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = act.CopyTo("Clipboard"),
    },
    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = act.PasteFrom("Clipboard"),
    },
    {
        key = "r",
        mods = "LEADER",
        action = act.ActivateKeyTable({ name = "resize_panes", one_shot = false }),
    },
    {
        key = ";",
        mods = "LEADER",
        action = act.ActivateCommandPalette,
    },
    {
        key = "v",
        mods = "LEADER",
        action = act.ActivateCopyMode,
    },
    {
        key = ",",
        mods = "LEADER",
        action = act.PromptInputLine({
            description = "Enter new name for tab",
            action = wezterm.action_callback(function(window, _pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }),
    },
    {
        key = "s",
        mods = "LEADER",
        action = act.ActivateKeyTable({ name = "workspaces", one_shot = true }),
    },
}

local key_tables = {
    resize_panes = {
        {
            key = "l",
            action = act.AdjustPaneSize({ "Right", 1 }),
        },
        {
            key = "h",
            action = act.AdjustPaneSize({ "Left", 1 }),
        },
        {
            key = "k",
            action = act.AdjustPaneSize({ "Up", 1 }),
        },
        {
            key = "j",
            action = act.AdjustPaneSize({ "Down", 1 }),
        },
        {
            key = "Escape",
            action = act.PopKeyTable,
        },
        {
            key = "Enter",
            action = act.PopKeyTable,
        },
    },
    workspaces = {
        {
            key = "c",
            action = act.SwitchToWorkspace,
        },
        {
            key = "l",
            action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
        },
        {
            key = "n",
            action = act.SwitchWorkspaceRelative(1),
        },
        {
            key = "p",
            action = act.SwitchWorkspaceRelative(-1),
        },
    },
}

return function(config)
    config.disable_default_key_bindings = true
    config.leader = leader
    config.keys = keys
    config.key_tables = key_tables

    return config
end
