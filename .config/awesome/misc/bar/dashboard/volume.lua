local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local M = {}

function M.new()
    local widget = wibox.widget({
        bar_shape = gears.shape.rounded_bar,
        bar_height = dpi(20),
        bar_color = beautiful.border_normal,
        handle_color = beautiful.border_focus,
        handle_shape = gears.shape.circle,
        handle_border_color = beautiful.border_focus,
        handle_border_width = dpi(10),
        value = 0,
        maximum = 100,
        minimum = 0,
        forced_height = dpi(20),
        forced_width = dpi(190),
        widget = wibox.widget.slider,
    })

    require("lib.pulseaudio").get_volume(function(volume)
        widget.value = volume * 100
    end)

    local timer = gears.timer({
        timeout = 0.3,
        autostart = false,
        callback = function()
            require("lib.pulseaudio").set_volume(widget.value / 100)
        end,
    })

    widget:connect_signal("button::press", function()
        timer:start()
    end)

    widget:connect_signal("button::release", function()
        timer:stop()
    end)

    return widget
end

return M
