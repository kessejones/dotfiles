local awful = require("awful")
local helper = require("helpers")

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    helper.wallpaper.set(s)

    require("misc.bar").new(s)
end)
