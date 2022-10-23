local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local tags = require("misc.bar.tags")

local M = {}

function M.new(s)
    local wibar = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(32),
    })

    local tagslist = tags.new(s)

    local keyboardlayout = awful.widget.keyboardlayout()
    local layoutbox = awful.widget.layoutbox(s)
    local textclock = wibox.widget.textclock()
    local audio = require("misc.bar.audio").new(s)

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

    wibar:setup({
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.container.margin,
            left = dpi(4),
            tagslist,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            nil,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            audio,
            keyboardlayout,
            wibox.widget.systray(),
            textclock,
            layoutbox,
        },
    })

    return wibar
end

return M
