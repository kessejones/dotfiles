local awful = require("awful")

local programs = {
    os.getenv("HOME") .. "/.config/picom/start.sh",
    os.getenv("HOME") .. "/.scripts/linux/monitor.sh",
    os.getenv("HOME") .. "/.scripts/linux/enable-tapping-touchpad.sh",
    os.getenv("HOME") .. "/.scripts/linux/polkit-gnome-authentication-agent.sh",
    "nm-applet",
}

for _, program in ipairs(programs) do
    awful.spawn(program)
end
