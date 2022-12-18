local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")

local M = {}

function M.new()
    local systray = wibox.widget.systray()

    local widget = wibox.widget({
        {
            {
                {
                    systray,
                    widget = wibox.container.margin,
                },
                strategy = "exact",
                layout = wibox.container.constraint,
            },
            widget = wibox.container.background,
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
