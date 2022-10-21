local awful = require("awful")
local fmt = string.format

local naughty = require("naughty")

local M = {}

local volume_step = 0.1
local pactl_default_sink = "pactl get-default-sink"
local pactl_set_volume = "pactl set-sink-volume"
local pactl_get_volume = "pactl get-sink-volume"

local pactl_default_source = "pactl get-default-source"
local pactl_set_volume_source = "pactl set-source-volume"
local pactl_get_volume_source = "pactl get-source-volume"

function M.volume_up()
    awful.spawn.easy_async(pactl_default_sink, function(output_sink)
        awful.spawn.easy_async(fmt("%s %s +%.2f", pactl_set_volume, output_sink, volume_step), function(stdout) end)
    end)
end

function M.volume_down()
    awful.spawn.easy_async(pactl_default_sink, function(output_sink)
        awful.spawn.easy_async(fmt("%s %s -%.2f", pactl_set_volume, output_sink, volume_step), function() end)
    end)
end

function M.set_volume(value)
    if value < 0 or value > 100 then
        return
    end

    awful.spawn.easy_async(pactl_default_sink, function(output_sink)
        awful.spawn.easy_async(fmt("%s %s %d%%", pactl_set_volume, output_sink, value), function() end)
    end)
end

function M.get_volume(callback)
    awful.spawn.easy_async(pactl_default_sink, function(output_sink)
        awful.spawn.easy_async(fmt("%s %s", pactl_get_volume, output_sink), function(output_volume)
            local volume = output_volume:match("(%d+)%% /")
            local volume_number = tonumber(volume)

            if callback and type(callback) == "function" then
                callback(volume_number)
            end
        end)
    end)
end

function M.toggle_mute()
    awful.spawn.easy_async(pactl_default_sink, function(output_sink)
        awful.spawn.easy_async(fmt("pactl set-sink-mute %s toggle", output_sink), function() end)
    end)
end

function M.get_muted(callback)
    awful.spawn.easy_async(pactl_default_sink, function(output_sink)
        awful.spawn.easy_async_with_shell(fmt("LANG=C pactl get-sink-mute %s", output_sink), function(output_muted)
            local muted = false
            if output_muted:find("yes") then
                muted = true
            end

            if callback and type(callback) == "function" then
                callback(muted)
            end
        end)
    end)
end

function M.source_toggle_mute()
    awful.spawn.easy_async(pactl_default_source, function(output_source)
        awful.spawn.easy_async(fmt("pactl set-source-mute %s toggle", output_source), function() end)
    end)
end

function M.source_volume_up()
    awful.spawn.easy_async(pactl_default_source, function(output_source)
        awful.spawn.easy_async(fmt("%s %s +%.2f", pactl_set_volume_source, output_source, volume_step), function() end)
    end)
end

function M.source_volume_down()
    awful.spawn.easy_async(pactl_default_source, function(output_source)
        awful.spawn.easy_async(fmt("%s %s -%.2f", pactl_set_volume_source, output_source, volume_step), function() end)
    end)
end

function M.set_source_volume(value)
    awful.spawn.easy_async(pactl_default_source, function(output_source)
        awful.spawn.easy_async(fmt("%s %s %d%%", pactl_set_volume_source, output_source, value), function() end)
    end)
end

function M.get_source_volume(callback)
    awful.spawn.easy_async(pactl_default_source, function(output_source)
        awful.spawn.easy_async(fmt("%s %s", pactl_get_volume_source, output_source), function(output_volume)
            local volume = output_volume:match("(%d+)%% /")
            local volume_number = tonumber(volume)

            if callback and type(callback) == "function" then
                callback(volume_number)
            end
        end)
    end)
end

function M.on_volume_change(callback)
    awesome.connect_signal("signal::volume", callback)
end

function M.on_volume_source_change(callback)
    awesome.connect_signal("signal::volume-source", callback)
end

return M
