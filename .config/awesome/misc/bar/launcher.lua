local awful = require("awful")
local debian = require("debian.menu")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local has_fdo, freedesktop = pcall(require, "freedesktop")
local default = require("default")

local M = {}

function M.new()
    local awesome_menu = {
        {
            "hotkeys",
            function()
                hotkeys_popup.show_help(nil, awful.screen.focused())
            end,
        },
        { "manual", default.terminal .. " -e man awesome" },
        { "restart", awesome.restart },
        {
            "quit",
            function()
                awesome.quit()
            end,
        },
    }

    local menu_awesome = { "awesome", awesome_menu, beautiful.awesome_icon }
    local menu_terminal = { "open terminal", default.terminal }

    local main_menu
    if has_fdo then
        main_menu = freedesktop.menu.build({
            before = { menu_awesome },
            after = { menu_terminal },
        })
    else
        main_menu = awful.menu({
            items = {
                menu_awesome,
                { "Debian", debian.menu.Debian_menu.Debian },
                menu_terminal,
            },
        })
    end

    local launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = main_menu })

    return launcher
end

return M
