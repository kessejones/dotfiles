local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local M = {}

function M.new(s)
    local icon = wibox.widget({
        widget = wibox.widget.imagebox,
        image = beautiful.get_asset("catppuccin/assets/volume-on.png"),
        resize = true,
    })

    local widget = wibox.widget({
        {
            {
                {
                    icon,
                    widget = wibox.container.margin,
                    left = dpi(5),
                    right = dpi(5),
                    top = dpi(3),
                    bottom = dpi(3),
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

    local audio_menu = require("misc.audio").new(s)
    widget:buttons(awful.button({}, 1, function()
        audio_menu.visible = not audio_menu.visible
    end))

    require("lib.pulseaudio").on_volume_change(function(volume, muted)
        if muted then
            icon.image = beautiful.get_asset("catppuccin/assets/volume-off.png")
        else
            icon.image = beautiful.get_asset("catppuccin/assets/volume-on.png")
        end
    end)

    return widget
end

return M
