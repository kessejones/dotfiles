local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local ui = require("helpers.ui")

local M = {}

function M.new(s)
    local textclock = wibox.widget.textclock("%d/%m/%Y - %H:%M")
    textclock.font = beautiful.font_text_with_size(beautiful.wibar_widget_font_size, "Bold")
    textclock.fg = beautiful.xcolorT0

    local widget = wibox.widget({
        {
            {
                {
                    textclock,
                    widget = wibox.container.margin,
                    top = dpi(2),
                    bottom = dpi(2),
                    left = dpi(10),
                    right = dpi(10),
                },
                strategy = "exact",
                layout = wibox.container.constraint,
            },
            widget = wibox.container.background,
            bg = beautiful.wibar_widget_bg,
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 5)
            end,
        },
        widget = wibox.container.margin,
        left = dpi(5),
        right = dpi(5),
        top = dpi(5),
        bottom = dpi(5),
    })

    local calendar_popup = awful.popup({
        screen = s,
        ontop = true,
        visible = false,
        widget = wibox.container.background,
        bg = beautiful.bg_color,
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        placement = function(c)
            awful.placement.top(c, { margins = dpi(40) })
        end,
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, beautiful.border_radius)
        end,
    })

    calendar_popup:setup({
        wibox.widget({
            widget = wibox.widget.calendar.month,
            date = os.date("*t"),
            font = beautiful.font_text_with_size(12),
            long_weekdays = true,
            start_sunday = true,
        }),
        widget = wibox.container.margin,
        left = dpi(20),
        right = dpi(20),
        top = dpi(10),
        bottom = dpi(10),
    })

    calendar_popup:connect_signal("mouse::leave", function()
        calendar_popup.visible = false
    end)

    widget:buttons(gears.table.join(awful.button({}, 1, function()
        calendar_popup.visible = not calendar_popup.visible
    end)))

    ui.add_hover_cursor(widget, "hand1")

    return widget
end

return M
