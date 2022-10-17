local awful = require("awful")
local beautiful = require("beautiful")

local keys = require("core.keys")

awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.get_client_keys(),
            buttons = keys.get_client_buttons(),
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            maximized = false,
            floating = false,
        },
    },
    -- Floating clients.
    -- {
    --     rule_any = {
    --         instance = {
    --             "DTA", -- Firefox addon DownThemAll.
    --             "copyq", -- Includes session name in class.
    --             "pinentry",
    --         },
    --         class = {
    --             "Arandr",
    --             "Blueman-manager",
    --             "Gpick",
    --             "Kruler",
    --             "MessageWin", -- kalarm.
    --             "Sxiv",
    --             "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
    --             "Wpa_gui",
    --             "veromix",
    --             "xtightvncviewer",
    --         },
    --
    --         -- Note that the name property shown in xprop might be set slightly after creation of the client
    --         -- and the name shown there might not match defined rules here.
    --         name = {
    --             "Event Tester", -- xev.
    --         },
    --         role = {
    --             "AlarmWindow", -- Thunderbird's calendar.
    --             "ConfigManager", -- Thunderbird's about:config.
    --             "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
    --         },
    --     },
    --     properties = { floating = true },
    -- },

    -- { rule = { class = "Firefox" }, except = { instance = "Navigator" }, properties = { floating = true } },
    -- { rule = { class = "Firefox" }, except = { instance = "Navigator" }, properties = { floating = true } },
    -- { rule = { class = "Firefox" }, properties = { floating = false } },
    -- Add titlebars to normal clients and dialogs
    -- { rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = true } },
    --
    {
        rule = { class = "thunar" },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            opacity = 1,
            maximized = false,
            floating = false,
        },
    },
    {
        rule = { class = "firefox" },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            opacity = 1,
            maximized = false,
            floating = false,
        },
    },
    {
        rule_any = { type = { "dialog" } },
        properties = {
            titlebars_enabled = true,
            floating = true,
            placement = awful.placement.centered,
        },
    },
}
