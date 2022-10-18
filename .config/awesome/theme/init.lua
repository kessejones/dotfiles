local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")

local theme = require("theme.catppuccin.theme")
local themes_path = gfs.get_configuration_dir() .. "theme/"

theme.wallpaper = themes_path .. "assets/wallpaper.png"
theme.border_radius = dpi(10)

return theme
