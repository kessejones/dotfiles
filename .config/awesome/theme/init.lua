local gfs = require("gears.filesystem")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = require("theme.catppuccin.theme")
local themes_path = gfs.get_configuration_dir() .. "theme/"

-- theme.wallpaper = themes_path .. "assets/wallpaper.png"

theme.border_radius = 8

theme.topbar_icon_size = 16
theme.font_icon = "Material Icons Round"
theme.font_icon_with_size = function(size)
    return string.format("%s %d", theme.font_icon, size or 1)
end

theme.font_text_with_size = function(size, type)
    type = type or ""
    return string.format("%s %s %d", theme.font_name, type, size or 1)
end

theme.wibar_border_color = theme.border_normal
theme.wibar_widget_bg = theme.xcolormantle
theme.wibar_widget_font_size = theme.font_size

theme.bg_systray = theme.wibar_widget_bg
theme.systray_icon_spacing = dpi(10)
theme.systray_icon_size = dpi(20)

theme.get_asset = function(name)
    return string.format("%s/%s", themes_path, name)
end

return theme
