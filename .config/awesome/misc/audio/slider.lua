local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local M = {}

function M.new(args)
    args = args or {}

    local widget_slider = wibox.widget({
        widget = wibox.widget.slider,
        shape = gears.shape.rounded_bar,
        bar_shape = gears.shape.rounded_bar,
        bar_color = beautiful.border_normal,
        bar_margins = { bottom = dpi(10), top = dpi(10) },
        bar_active_color = "#ff0000",
        handle_color = beautiful.border_focus,
        handle_shape = gears.shape.circle,
        handle_border_color = beautiful.border_focus,
        handle_border_width = dpi(5),
        value = 0,
        forced_width = dpi(200),
    })

    local widget_icon = wibox.widget({
        widget = wibox.widget.textbox,
        markup = args.icon or "",
        font = "Material Icons Round 18",
        align = "center",
        valign = "center",
    })

    local widget_text = wibox.widget({
        widget = wibox.widget.textbox,
        markup = " 0%",
        font = beautiful.font_name .. "12",
        align = "center",
        valign = "center",
    })

    widget_slider:connect_signal("property::value", function(c)
        if args.on_change and type(args.on_change) == "function" then
            args.on_change(c.value)
        end

        widget_text.markup = c.value .. "%"
    end)

    local widget = wibox.widget({
        layout = wibox.container.margin,
        left = dpi(10),
        right = dpi(10),
        {
            widget_icon,
            widget_slider,
            widget_text,
            layout = wibox.layout.fixed.horizontal,
            forced_height = dpi(40),
            spacing = dpi(10),
        },
        set_value = function(self, value)
            widget_slider.value = value
            widget_text.markup = value .. "%"
        end,
        set_icon = function(self, value)
            widget_icon.markup = value
        end,
    })

    return widget
end

return M
