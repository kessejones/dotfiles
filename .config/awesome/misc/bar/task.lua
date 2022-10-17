local awful = require("awful")

local M = {}

M.new = function(s, buttons)
    local mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = buttons,
    })

    return mytasklist
end

return M
