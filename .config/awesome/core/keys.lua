local awful = require("awful")
local gears = require("gears")
local config = require("config")
local default = require("default")
local helper = require("helpers.ui")

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

local function focus_client_direction(dir)
    if dir == "down" or dir == "up" then
        awful.client.focus.bydirection(dir)
        helper.move_cursor_to_window(client.focus)
        return
    end

    local client_focused = client.focus
    if client_focused and client_focused.maximized then
        awful.screen.focus_bydirection(dir)
    else
        awful.client.focus.bydirection(dir)
        if screen.count() > 1 and client_focused == client.focus then
            awful.screen.focus_bydirection(dir)
            gears.timer.delayed_call(function()
                if #awful.screen.focused().clients == 0 then
                    client.focus = nil
                else
                    helper.move_cursor_to_window(client.focus)
                end
            end)
        else
            helper.move_cursor_to_window(client.focus)
        end
    end
end

local function move_client_direction(dir)
    local client_focused = client.focus
    local screen_focused = awful.screen.focused()

    if client_focused.floating then
        local step_y = screen_focused.geometry.height * 0.1
        local step_x = screen_focused.geometry.width * 0.1

        if dir == "down" then
            if
                client_focused.y + client_focused.height
                < screen_focused.geometry.y + screen_focused.geometry.height
            then
                client_focused.y = client_focused.y + step_y
                return
            end
        elseif dir == "up" then
            if client_focused.y > screen_focused.geometry.y then
                client_focused.y = client_focused.y - step_y
                return
            end
        elseif dir == "left" then
            if client_focused.x > screen_focused.geometry.x then
                client_focused.x = client_focused.x - step_x
                return
            end
        elseif dir == "right" then
            if client_focused.x + client_focused.width < screen_focused.geometry.x + screen_focused.geometry.width then
                client_focused.x = client_focused.x + step_x
                return
            end
        end
    end

    if dir == "down" or dir == "up" then
        awful.client.swap.bydirection(dir)
        gears.timer.delayed_call(function()
            helper.move_cursor_to_window(client.focus)
        end)
        return
    end

    local x, y = client_focused.x, client_focused.y
    awful.client.swap.bydirection(dir)

    gears.timer.delayed_call(function()
        if x == client_focused.x and y == client_focused.y then
            local screen_in_direction = client_focused.screen:get_next_in_direction(dir)
            if screen_in_direction then
                client_focused:move_to_screen(screen_in_direction)
            end
        end

        gears.timer.delayed_call(function()
            helper.move_cursor_to_window(client.focus)
        end)
    end)
end

local function resize_by_orientation(orientation, value)
    local focused = client.focus
    local screen_focused = awful.screen.focused()

    local tile_step = 0.05

    if orientation == "vertical" then
        if focused.floating then
            local step = screen_focused.geometry.height * 0.1
            focused.height = focused.height + (step * value)
        else
            awful.client.incwfact(tile_step * value)
        end
    elseif orientation == "horizontal" then
        if focused.floating then
            local step = screen_focused.geometry.width * 0.1
            focused.width = focused.width + (step * value)
        else
            awful.tag.incmwfact(tile_step * value)
        end
    end
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
            focus_client_direction("left")
        end, { description = "focus next by index", group = "client" }),
        awful.key({ modKey }, "l", function()
            focus_client_direction("right")
        end, { description = "focus next by index", group = "client" }),
        awful.key({ modKey }, "j", function()
            focus_client_direction("down")
        end, { description = "focus next by index", group = "client" }),
        awful.key({ modKey }, "k", function()
            focus_client_direction("up")
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
                            resize_by_orientation("horizontal", -1)
                        end,
                    },
                    {
                        { modKey },
                        "l",
                        function()
                            resize_by_orientation("horizontal", 1)
                        end,
                    },
                    {
                        { modKey },
                        "j",
                        function()
                            resize_by_orientation("vertical", -1)
                        end,
                    },
                    {
                        { modKey },
                        "k",
                        function()
                            resize_by_orientation("vertical", 1)
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
            end, { description = "view tag #" .. i, group = "tag" })
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

        awful.key({ modKey }, "z", function(c)
            c.floating = not c.floating
        end, { description = "toggle floating", group = "client" }),

        awful.key(
            { modKey },
            "m",
            awful.keygrabber({
                keybindings = gears.table.join({
                    {
                        { modKey },
                        "h",
                        function()
                            move_client_direction("left")
                        end,
                    },
                    {
                        { modKey },
                        "l",
                        function()
                            move_client_direction("right")
                        end,
                    },
                    {
                        { modKey },
                        "j",
                        function()
                            move_client_direction("down")
                        end,
                    },
                    {
                        { modKey },
                        "k",
                        function()
                            move_client_direction("up")
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
                    {
                        { modKey },
                        "m",
                        function()
                            awful.placement.centered(client.focus)
                        end,
                    },
                }, keys_move_to_tag),
                stop_key = modKey,
                stop_event = "release",
            }),
            { description = "move client by direction or tag index", group = "client" }
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
