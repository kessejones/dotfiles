local gears = require("gears")
local beautiful = require("beautiful")

local M = {}

function M.set(s)
    local wallpaper = beautiful.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
end

return M
