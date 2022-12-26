local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")

local default = require("default")
local ui = require("helpers.ui")

local M = {}

function M.new()
    local awesome_menu = {
        {
            "Poweroff",
            function()
                awesome.spawn("systemctl poweroff")
            end,
        },
        {
            "Reboot",
            function()
                awesome.spawn("systemctl reboot")
            end,
        },
        { "Restart", awesome.restart },
        {
            "Quit",
            function()
                awesome.quit()
            end,
        },
    }

    local terminal_menu = {
        { "Terminal Tmux", default.terminal },
        { "Terminal Fish", default.secondary_terminal },
    }

    local internet_menu = {
        { "Firefox", default.webbrowser },
        { "Brave", default.secondary_webbrowser },
        { "Discord", default.discord },
    }

    local menu_items = {
        { "Awesome", awesome_menu },
        { "Terminal", terminal_menu },
        { "Internet", internet_menu },
        { "Files", default.filemanager },
    }

    local main_menu = awful.menu({
        items = menu_items,
    })
    main_menu:get_root().wibox.shape = gears.shape.rounded_rect

    local launcher = awful.widget.launcher({
        image = beautiful.awesome_icon,
        menu = main_menu,
        clip_shape = gears.shape.squircle,
    })

    local widget = wibox.widget({
        {
            {
                {
                    launcher,
                    widget = wibox.container.margin,
                    left = dpi(5),
                    right = dpi(5),
                    top = dpi(5),
                    bottom = dpi(5),
                },
                strategy = "exact",
                layout = wibox.container.constraint,
            },
            widget = wibox.container.background,
            bg = beautiful.wibar_widget_bg,
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 5)
            end,
        },
        widget = wibox.container.margin,
        left = dpi(5),
        right = dpi(5),
        top = dpi(5),
        bottom = dpi(5),
    })

    ui.add_hover_cursor(widget, "hand1")

    return widget
end

return M
