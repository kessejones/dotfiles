local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local tags = require("misc.bar.tags")

local M = {}

function M.new(s)
    local wibar = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(38),
    })

    local tagslist = tags.new(s)

    local launcher = require("misc.bar.launcher").new()
    local keyboardlayout = require("misc.bar.keyboardlayout").new()
    local volume = require("misc.bar.volume").new(s)
    local date = require("misc.bar.date").new(s)
    local layoutbox = require("misc.bar.layoutbox").new(s)
    local battery = require("misc.bar.battery").new()
    local systray = awful.widget.only_on_screen(require("misc.bar.systray").new(), screen.primary)

    layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 3, function()
            awful.layout.inc(-1)
        end),
        awful.button({}, 4, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 5, function()
            awful.layout.inc(-1)
        end)
    ))

    local separator = wibox.widget({
        widget = wibox.container.margin,
        left = dpi(5),
        right = dpi(5),
        {
            widget = wibox.widget.separator,
            color = beautiful.border_normal,
            orientation = "vertical",
            forced_width = 5,
        },
    })

    wibar:setup({
        layout = wibox.layout.align.horizontal,
        expand = "none",
        -- left
        {
            layout = wibox.container.margin,
            left = dpi(5),
            right = dpi(5),
            {
                layout = wibox.layout.align.horizontal,
                launcher,
                separator,
                tagslist,
            },
        },
        -- center
        {
            layout = wibox.container.margin,
            left = dpi(5),
            right = dpi(5),
            {
                layout = wibox.layout.align.horizontal,
                date,
            },
        },
        -- right
        {
            layout = wibox.container.margin,
            left = dpi(5),
            right = dpi(5),
            {
                layout = wibox.layout.fixed.horizontal,
                systray,
                keyboardlayout,
                volume,
                battery,
                layoutbox,
            },
        },
    })

    awesome.connect_signal("wibar::visibility", function(visible, screen)
        if screen == s then
            wibar.visible = visible
        end
    end)

    return wibar
end

return M
