local awful = require("awful")
local helper = require("helpers")
local config = require("config")

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    helper.wallpaper.set(s)

    -- Each screen has its own tag table.
    awful.tag(config.tags, s, awful.layout.layouts[1])

    require("misc.bar").new(s)
end)
