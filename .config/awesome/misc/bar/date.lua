local wibox = require("wibox")
local beautiful = require("beautiful")

local M = {}

function M.new(s)
    -- local text_widget = wibox.widget.textbox({})
    -- local text_widget = wibox.widget.textbox()
    -- local widget = wibox.widget.textclock("%d/%m/%Y - %H:%M")

    -- return widget
    -- local date = wibox.widget.textbox()
    -- date.font = beautiful.font_name.."11"
    -- gears.timer {
    -- 	timeout = 60,
    -- 	autostart = true,
    -- 	call_now = true,
    -- 	callback = function()
    -- 		date.markup = os.date(" %a %b %d")
    -- 	end
    -- }

    local widget = wibox.widget.textclock("%d/%m/%Y - %H:%M")
    widget.font = beautiful.font_text_with_size(12)

    return widget
end

return M
