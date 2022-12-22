local awful = require("awful")

local scripts_path = os.getenv("HOME") .. "/.scripts/linux/"

local function run(args)
    if not args or #args == 0 then
        return
    end

    local command = args.command or args[1]
    if args.script then
        command = scripts_path .. command
    end

    if args.single then
        awful.spawn.single_instance(command, {}, {}, command)
    else
        awful.spawn(command)
    end
end

local programs = {
    { "monitor.sh", script = true },
    { "enable-tapping-touchpad.sh", script = true },
    { "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1", single = true },
    { "nm-applet", single = true },
    { "picom -b", single = true },
    { "setxkbmap br" },
}

for _, program in ipairs(programs) do
    run(program)
end

awesome.connect_signal("exit", function()
    awful.spawn(scripts_path .. "on-exit.sh")
end)
