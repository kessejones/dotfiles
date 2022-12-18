local gfs = require("gears.filesystem")

local theme = require("theme.catppuccin.theme")
local themes_path = gfs.get_configuration_dir() .. "theme/"

-- theme.wallpaper = themes_path .. "assets/wallpaper.png"
-- theme.wallpaper = themes_path .. "assets/romb.png"
theme.wallpaper = themes_path .. "assets/cat-waves.png"

theme.border_radius = 8
theme.cursor_name = "Catppuccin-Mocha-Dark-Cursors"

theme.topbar_icon_size = 16
theme.font_icon = "Material Icons Round"
theme.font_icon_with_size = function(size)
    return string.format("%s %d", theme.font_icon, size or 1)
end

theme.font_text_with_size = function(size)
    return string.format("%s %d", theme.font_name, size or 1)
end

theme.wibar_border_color = theme.border_normal

-- theme.volume_icon = themes_path .. "catppuccin/assets/volume-on.png"

theme.get_asset = function(name)
    return string.format("%s/%s", themes_path, name)
end

return theme
