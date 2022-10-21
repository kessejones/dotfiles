local awful = require("awful")

local function emit_volume_info()
    require("lib.pulseaudio").get_volume(function(volume)
        require("lib.pulseaudio").get_muted(function(muted)
            awesome.emit_signal("signal::volume", volume, muted)
        end)
    end)
end

emit_volume_info()

local volume_script = [[
    bash -c "LANG=C pactl subscribe 2> /dev/null | grep --line-buffered \"Event 'change' on sink #\""
]]

awful.spawn.easy_async({
    "pkill",
    "--full",
    "--uid",
    os.getenv("USER"),
    "^pactl subscribe",
}, function()
    awful.spawn.with_line_callback(volume_script, {
        stdout = function(_line)
            emit_volume_info()
        end,
    })
end)
