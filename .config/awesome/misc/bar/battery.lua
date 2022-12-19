local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local helpers = require("helpers")

local M = {}
function M.new()
    local charging_icon = wibox.widget({
        markup = helpers.ui.colorize_text("", beautiful.xcolorT2),
        font = beautiful.font_icon_with_size(12),
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox,
    })

    local battery_bar = wibox.widget({
        max_value = 100,
        value = 50,
        forced_width = dpi(30),
        border_width = dpi(1),
        paddings = dpi(2),
        bar_shape = helpers.ui.rrect(2),
        shape = helpers.ui.rrect(5),
        color = beautiful.xcolorS1,
        background_color = beautiful.transparent,
        border_color = beautiful.xcolorT0,
        widget = wibox.widget.progressbar,
    })

    local battery = wibox.widget({
        battery_bar,
        charging_icon,
        layout = wibox.layout.stack,
        spacing = dpi(1),
    })

    local battery_percentage_text = wibox.widget({
        id = "percent_text",
        text = "0%",
        font = beautiful.font_text_with_size(12),
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox,
    })

    local battery_widget = wibox.widget({
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(5),
        {
            battery,
            top = dpi(1),
            bottom = dpi(1),
            widget = wibox.container.margin,
        },
        battery_percentage_text,
    })

    local last_value = 100
    awesome.connect_signal("signal::battery", function(value, state)
        battery_bar.value = value
        last_value = value

        battery_percentage_text:set_text(math.floor(value) .. "%")

        if charging_icon.visible then
            battery_bar.color = beautiful.xcolorS1
        elseif value <= 15 then
            battery_bar.color = beautiful.xcolorS1
        elseif value <= 30 then
            battery_bar.color = beautiful.xcolorS1
        else
            battery_bar.color = beautiful.xcolorS1
        end

        if state == 1 then
            charging_icon.visible = true
            battery_bar.color = beautiful.xcolorS1
        elseif last_value <= 15 then
            charging_icon.visible = false
            battery_bar.color = beautiful.xcolor10
        elseif last_value <= 20 then
            charging_icon.visible = false
            battery_bar.color = beautiful.xcolor8
        elseif last_value <= 30 then
            charging_icon.visible = false
            battery_bar.color = beautiful.xcolorS1
        else
            charging_icon.visible = false
            battery_bar.color = beautiful.xcolorS1
        end
    end)

    local widget = wibox.widget({
        {
            {
                {
                    battery_widget,
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

    return widget
end

return M
