local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local M = {}

function M.new(s)
    local icon = wibox.widget({
        markup = "",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox,
        font = beautiful.font_icon_with_size(beautiful.topbar_icon_size),
        id = "icon",
    })

    local audio_menu = require("misc.audio").new(s)
    icon:buttons(awful.button({}, 1, function()
        audio_menu.visible = not audio_menu.visible
    end))

    require("lib.pulseaudio").on_volume_change(function(volume, muted)
        if muted then
            icon.markup = ""
        else
            icon.markup = ""
        end
    end)

    return icon
end

return M
