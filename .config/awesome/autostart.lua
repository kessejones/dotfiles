local awful = require("awful")

local programs = {
    os.getenv("HOME") .. "/.config/picom/start.sh",
    os.getenv("HOME") .. "/.screenlayout/monitor.sh",
}

for _, program in ipairs(programs) do
    awful.spawn(program)
end
