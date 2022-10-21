local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local M = {}

function M.new(s)
    local widget = awful.popup({
        screen = s,
        ontop = true,
        visible = false,
        widget = wibox.container.background,
        bg = beautiful.bg_color,
        minimum_width = dpi(300),
        minimum_height = dpi(500),
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, beautiful.border_radius)
        end,
    })

    local volume_bar = require("misc.dashboard.volume").new()

    widget:setup({
        {
            layout = wibox.container.margin,
            margins = dpi(5),
            {
                layout = wibox.layout.align.vertical,
                volume_bar,
            },
        },
        bg = beautiful.bg_color,
        widget = wibox.container.background,
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, beautiful.border_radius)
        end,
    })

    return widget
end

return M
