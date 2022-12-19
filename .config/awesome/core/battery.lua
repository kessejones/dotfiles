local wbase = require("wibox.widget.base")
local upower = require("lgi").require("UPowerGlib")

local template = wbase.empty_widget()
local battery = wbase.make_widget_from_value(template)
battery.device = upower.Client():get_display_device()

battery.device.on_notify = function(d)
    awesome.emit_signal("signal::battery", d.percentage, d.state)
end

awesome.emit_signal("signal::battery", battery.device.percentage, battery.device.state)
