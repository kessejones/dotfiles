local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local M = {}

function M.new()
    local systray = wibox.widget.systray()
    systray.base_size = beautiful.systray_icon_size

    local widget = wibox.widget({
        {
            {
                {
                    systray,
                    widget = wibox.container.margin,
                    top = dpi(2),
                    bottom = dpi(2),
                    left = dpi(10),
                    right = dpi(15),
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

    return widget
end

return M
