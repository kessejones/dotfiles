local awful = require("awful")
local gears = require("gears")
local config = require("config")
local default = require("default")

local Modifiers = {
    Alt = "Mod1",
    Super = "Mod4",
    Shift = "Shift",
    Ctrl = "Control",
}

local modKey = Modifiers.Alt

local M = {}

M.Modifiers = Modifiers
M.modKey = modKey

local function key_move_to_tag()
    local keys = {}

    for i, name in ipairs(config.tags) do
        local key = {
            { modKey },
            tostring(i),
            function()
                if client.focus then
                    -- move focused client to the "i" tag and set the focus to this tag
                    local t = awful.tag.find_by_name(awful.screen.focused(), name)
                    client.focus:move_to_tag(t)
                    t:view_only(t)
                end
            end,
        }

        table.insert(keys, key)
    end

    return keys
end

function M.get_global_keys()
    local globalkeys = gears.table.join(
        -- launcher
        awful.key({ modKey }, "d", function()
            awful.spawn(default.launcher)
        end, { description = "show help", group = "awesome" }),

        -- layouts
        awful.key({ modKey }, "u", function()
            awful.layout.inc(-1, screen.screen)
        end, { description = "next layout", group = "layout" }),
        awful.key({ modKey }, "i", function()
            awful.layout.inc(1, screen.screen)
        end, { description = "previous layout", group = "layout" }),

        -- focus
        awful.key({ modKey }, "h", function()
            local old_client = client.focus
            awful.client.focus.bydirection("left")
            if screen.count() > 1 and old_client == client.focus then
                awful.screen.focus_bydirection("left")
            end
        end, { description = "focus next by index", group = "client" }),
        awful.key({ modKey }, "l", function()
            local old_client = client.focus
            awful.client.focus.bydirection("right")
            if screen.count() > 1 and old_client == client.focus then
                awful.screen.focus_bydirection("right")
            end
        end, { description = "focus next by index", group = "client" }),
        awful.key({ modKey }, "j", function()
            awful.client.focus.bydirection("down")
        end, { description = "focus next by index", group = "client" }),
        awful.key({ modKey }, "k", function()
            awful.client.focus.bydirection("up")
        end, { description = "focus previous by index", group = "client" }),

        -- standard program
        awful.key({ modKey }, "Return", function()
            awful.spawn(default.terminal)
        end, { description = "open a terminal", group = "launcher" }),
        awful.key({ modKey }, ";", function()
            awful.spawn(default.secondary_terminal)
        end, { description = "open a terminal", group = "launcher" }),

        -- system
        awful.key(
            { modKey, Modifiers.Ctrl },
            "r",
            awesome.restart,
            { description = "reload awesome", group = "awesome" }
        ),
        awful.key({ modKey, Modifiers.Shift }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

        -- resize
        awful.key(
            { modKey },
            "r",
            awful.keygrabber({
                keybindings = {
                    {
                        { modKey },
                        "h",
                        function()
                            awful.tag.incmwfact(-0.05)
                        end,
                    },
                    {
                        { modKey },
                        "l",
                        function()
                            awful.tag.incmwfact(0.05)
                        end,
                    },
                    {
                        { modKey },
                        "j",
                        function()
                            awful.client.incwfact(-0.05)
                        end,
                    },
                    {
                        { modKey },
                        "k",
                        function()
                            awful.client.incwfact(0.05)
                        end,
                    },
                    {
                        { modKey },
                        "r",
                        function()
                            awful.placement.restore()
                        end,
                    },
                },
                stop_key = modKey,
                stop_event = "release",
            }),
            { description = "resize", group = "client" }
        ),

        -- switch tags
        awful.key({ modKey }, "p", function()
            local s = awful.screen.focused()
            awful.tag.viewprev(s)
        end, { description = "go to prev tag", group = "tags" }),

        awful.key({ modKey }, "n", function()
            local s = awful.screen.focused()
            awful.tag.viewnext(s)
        end, { description = "go to next tag", group = "tags" }),

        awful.key({ modKey }, "w", function()
            awful.spawn("rofi -show p -modi p:rofi-power-menu")
        end, { description = "go to next tag", group = "tags" }),

        -- volume
        awful.key({}, "XF86AudioMute", function()
            require("lib.pulseaudio").toggle_mute()
        end),
        awful.key({}, "XF86AudioRaiseVolume", function()
            require("lib.pulseaudio").volume_up()
        end),
        awful.key({}, "XF86AudioLowerVolume", function()
            require("lib.pulseaudio").volume_down()
        end)
    )

    for i = 1, #config.tags do
        globalkeys = gears.table.join(
            globalkeys,
            -- View tag only.
            awful.key({ modKey }, "#" .. i + 9, function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end, { description = "view tag #" .. i, group = "tag" }),
            -- Toggle tag display.
            awful.key({ modKey, Modifiers.Ctrl }, "#" .. i + 9, function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end, { description = "toggle tag #" .. i, group = "tag" }),
            -- Move client to tag.
            awful.key({ modKey, Modifiers.Shift }, "#" .. i + 9, function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end, { description = "move focused client to tag #" .. i, group = "tag" }),
            -- Toggle tag on focused client.
            awful.key({ modKey, Modifiers.Ctrl, Modifiers.Shift }, "#" .. i + 9, function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end, { description = "toggle focused client on tag #" .. i, group = "tag" })
        )
    end

    return globalkeys
end

function M.get_client_keys()
    local keys_move_to_tag = key_move_to_tag()

    local keys = gears.table.join(
        awful.key({ modKey }, "g", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, { description = "toggle fullscreen", group = "client" }),
        awful.key({ modKey }, "f", function(c)
            c.maximized = not c.maximized
            c:raise()
        end, { description = "toggle maximized", group = "client" }),

        awful.key({ modKey }, "q", function(c)
            c:kill()
        end, { description = "close", group = "client" }),

        awful.key({ modKey }, "t", function(c)
            c.ontop = not c.ontop
        end, { description = "toggle keep on top", group = "client" }),

        awful.key(
            { modKey },
            "m",
            awful.keygrabber({
                keybindings = gears.table.join({
                    {
                        { modKey },
                        "h",
                        function()
                            local c = client.focus
                            local x, y = c.x, c.y
                            awful.client.swap.bydirection("left")
                            gears.timer.delayed_call(function()
                                if x == c.x and y == c.y then
                                    local s = c.screen:get_next_in_direction("left")
                                    if s then
                                        c:move_to_screen(s)
                                    end
                                end
                            end)
                        end,
                    },
                    {
                        { modKey },
                        "l",
                        function()
                            local c = client.focus
                            local x, y = c.x, c.y
                            awful.client.swap.bydirection("right")
                            gears.timer.delayed_call(function()
                                if x == c.x and y == c.y then
                                    local s = c.screen:get_next_in_direction("right")
                                    if s then
                                        c:move_to_screen(s)
                                    end
                                end
                            end)
                        end,
                    },
                    {
                        { modKey },
                        "j",
                        function()
                            awful.client.swap.bydirection("down")
                        end,
                    },
                    {
                        { modKey },
                        "k",
                        function()
                            awful.client.swap.bydirection("up")
                        end,
                    },
                    {
                        { modKey },
                        "n",
                        function()
                            local c = client.focus
                            local s = awful.screen.focused()
                            if c and s then
                                awful.tag.viewnext(awful.screen.focused())
                                c:move_to_tag(s.selected_tag)
                            end
                        end,
                    },
                    {
                        { modKey },
                        "p",
                        function()
                            local c = client.focus
                            local s = awful.screen.focused()
                            if c and s then
                                awful.tag.viewprev(awful.screen.focused())
                                c:move_to_tag(s.selected_tag)
                            end
                        end,
                    },
                }, keys_move_to_tag),
                stop_key = modKey,
                stop_event = "release",
            }),
            { description = "focus previous by index", group = "client" }
        )
    )

    return keys
end

function M.get_client_buttons()
    local buttons = gears.table.join(
        awful.button({}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end),
        awful.button({ modKey }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({ modKey }, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    return buttons
end

return M
