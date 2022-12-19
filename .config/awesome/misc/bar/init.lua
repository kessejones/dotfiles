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
    local date = require("misc.bar.date").new()
    local layoutbox = require("misc.bar.layoutbox").new(s)
    local systray = require("misc.bar.systray").new()
    local battery = require("misc.bar.battery").new()

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
    return wibar
end

return M
