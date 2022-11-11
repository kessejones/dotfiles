local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")
local helper = require("helpers")

local function window_rounded(c)
    c.shape = function(cr, w, h)
        if not c.fullscreen and not c.maximized then
            gears.shape.rounded_rect(cr, w, h, beautiful.border_radius)
        else
            gears.shape.rounded_rect(cr, w, h, 0)
        end
    end
end

client.connect_signal("manage", function(c)
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end

    -- NOTE: demaximize windows when new window is opened
    if not c.floating then
        local function filter_maximized(filter_c)
            return (filter_c.maximized == true or filter_c.fullscreen == true)
                and filter_c.screen == c.screen
                and filter_c.first_tag == c.first_tag
        end

        for iter_c in awful.client.iterate(filter_maximized) do
            iter_c.maximized = false
            iter_c.fullscreen = false
        end
    end
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("property::minimized", function(c)
    c.minimized = false
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

client.connect_signal("property::geometry", function(c)
    window_rounded(c)
end)

client.connect_signal("property::fullscreen", function(c)
    window_rounded(c)
end)

client.connect_signal("property::floating", function(c)
    c.ontop = c.floating
    if c.floating then
        awful.placement.centered(c)
    end
end)

screen.connect_signal("property::geometry", helper.wallpaper.set)
