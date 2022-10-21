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
        minimum_width = dpi(280),
        minimum_height = dpi(100),
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        placement = function(c)
            awful.placement.top_right(c, { margins = dpi(40) })
        end,
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, beautiful.border_radius)
        end,
    })

    local output_volume = require("misc.audio.slider").new({
        on_change = function(value)
            require("lib.pulseaudio").set_volume(value)
        end,
        icon = "",
    })

    local input_volume = require("misc.audio.slider").new({
        on_change = function(value)
            require("lib.pulseaudio").set_source_volume(value)
        end,
        icon = "",
    })

    widget:setup({
        layout = wibox.layout.fixed.vertical,
        spacing = dpi(10),
        output_volume,
        input_volume,
    })

    widget:connect_signal("property::visible", function()
        if widget.visible == true then
            require("lib.pulseaudio").get_volume(function(volume)
                output_volume.value = volume
            end)

            require("lib.pulseaudio").get_source_volume(function(volume)
                input_volume.value = volume
            end)
        end
    end)

    require("lib.pulseaudio").on_volume_change(function(volume, muted)
        if muted then
            output_volume.icon = ""
        else
            output_volume.icon = ""
        end
    end)

    widget:connect_signal("mouse::leave", function()
        widget.visible = false
    end)

    return widget
end

return M
