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
        height = dpi(36),
    })

    local tagslist = tags.new(s)

    local keyboardlayout = require("misc.bar.keyboardlayout").new()
    local audio = require("misc.bar.audio").new(s)
    local date = require("misc.bar.date").new(s)
    local systray = require("misc.bar.systray").new()
    local layoutbox = require("misc.bar.layoutbox").new(s)

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
        expand = "none",
        -- left
        {
            layout = wibox.container.margin,
            left = dpi(5),
            right = dpi(5),
            {
                layout = wibox.layout.align.horizontal,
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
                audio,
                layoutbox,
            },
        },
    })
    return wibar
end

return M
