local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local tags = require("misc.bar.tags")
local launcher = require("misc.bar.launcher")

local M = {}

function M.new(s)
    local mywibox = awful.wibar({ position = "top", screen = s })

    local tagslist = tags.new(s)
    -- local tasklist = task.new(s)

    local keyboardlayout = awful.widget.keyboardlayout()
    local promptbox = awful.widget.prompt()
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
            promptbox,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            nil,
        },
        -- tasklist, -- Middle widget
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
