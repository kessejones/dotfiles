local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local tags = require("misc.bar.tags")
local launcher = require("misc.bar.launcher")

local M = {}

function M.new(s)
    local mywibox = awful.wibar({ position = "top", screen = s, height = dpi(32) })

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

    mywibox:setup({
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            launcher.new(),
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

    return mywibox
end

return M
