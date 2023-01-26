local wbase = require("wibox.widget.base")

local function setup()
    local ok, upower = pcall(require("lgi").require, "UPowerGlib")
    if not ok then
        return
    end

    local function get_device(path)
        local devices = upower.Client():get_devices()

        for _, d in ipairs(devices) do
            if d:get_object_path() == path then
                return d
            end
        end

        return nil
    end

    local template = wbase.empty_widget()
    local battery = wbase.make_widget_from_value(template)
    battery.device = get_device("/org/freedesktop/UPower/devices/battery_BAT1")

    battery.device.on_notify = function(d)
        awesome.emit_signal("signal::battery", d.percentage, d.state)
    end

    awesome.emit_signal("signal::battery", battery.device.percentage, battery.device.state)
    awesome.emit_signal("signal::battery-setup", {})
end

setup()
