local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = require("theme.catppuccin.theme")

theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/theme/assets/wallpaper.png"
theme.border_radius = dpi(12)

return theme
