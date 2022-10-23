local awful = require("awful")
local beautiful = require("beautiful")
local default = require("default")

local M = {}

function M.new()
    local awesome_menu = {
        { "restart", awesome.restart },
        {
            "Quit",
            function()
                awesome.quit()
            end,
        },
    }

    local menu_awesome = { "awesome", awesome_menu, beautiful.awesome_icon }
    local menu_terminal = { "open terminal", default.terminal }

    local main_menu = awful.menu({
        items = {
            menu_awesome,
            menu_terminal,
        },
    })

    return awful.widget.launcher({ image = beautiful.awesome_icon, menu = main_menu })
end

return M
