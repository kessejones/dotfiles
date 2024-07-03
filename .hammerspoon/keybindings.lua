local config = require("config")

local logger = hs.logger.new("logger", "debug")

local function current_screen()
    local all_spaces = hs.spaces.allSpaces()
    local focused_space = hs.spaces.focusedSpace()

    for screen_uuid, spaces in pairs(all_spaces) do
        for _, space_id in ipairs(spaces) do
            if space_id == focused_space then
                for _, screen in ipairs(hs.screen.allScreens()) do
                    if screen:getUUID() == screen_uuid then
                        return screen
                    end
                end
            end
        end
    end

    return nil
end

local function index_by_space()
    local screen = current_screen()
    local focused_space = hs.spaces.focusedSpace()
    local spaces = hs.spaces.spacesForScreen(screen)

    for i, s in ipairs(spaces) do
        if s == focused_space then
            return i
        end
    end

    return nil
end

local function mouse_to_focused_window()
    hs.timer.doAfter(0.04, function()
        local win = hs.window.focusedWindow()
        local rect
        if win then
            rect = win:frame()
        else
            local screen = current_screen()
            rect = screen:frame()
        end
        hs.mouse.absolutePosition({
            x = rect:getx(),
            y = rect:gety(),
        })
    end)
end

local function toggle_window_full_screen()
    local win = hs.window.focusedWindow()
    if win ~= nil then
        win:setFullScreen(not win:isFullScreen())
    end
end

-- foucs window
hs.hotkey.bind({ config.modkey }, "l", function()
    if not hs.window.focusedWindow():focusWindowEast(nil, true) then
        local cur_screen = current_screen()
        if not cur_screen then
            return
        end
        local screen = cur_screen:toEast()
        local space_id = hs.spaces.activeSpaceOnScreen(screen)
        if space_id then
            hs.spaces.gotoSpace(space_id)
        end
    end
    mouse_to_focused_window()
end)

hs.hotkey.bind({ config.modkey }, "h", function()
    if not hs.window.focusedWindow():focusWindowWest(nil, true) then
        local cur_screen = current_screen()
        if not cur_screen then
            return
        end
        local screen = cur_screen:toEast()
        local space_id = hs.spaces.activeSpaceOnScreen(screen)
        if space_id then
            hs.spaces.gotoSpace(space_id)
        end
    end
    mouse_to_focused_window()
end)

hs.hotkey.bind({ config.modkey }, "k", function()
    hs.window.focusedWindow():focusWindowNorth(nil, true)
    mouse_to_focused_window()
end)

hs.hotkey.bind({ config.modkey }, "j", function()
    hs.window.focusedWindow():focusWindowSouth(nil, true)
    mouse_to_focused_window()
end)

hs.hotkey.bind({ config.modkey }, "z", function()
    toggle_window_full_screen()
end)

-- hs.hotkey.bind({ config.modkey }, "n", function()
--     local screen = current_screen()
--     local spaces = hs.spaces.spacesForScreen(screen)
--     local index = index_by_space()
--     if not index then
--         return
--     end
--     local next_index = index + 1
--     local space_id = spaces[next_index]
--     if space_id then
--         hs.spaces.gotoSpace(space_id)
--     end
-- end)
--
-- hs.hotkey.bind({ config.modkey }, "p", function()
--     local screen = current_screen()
--     local spaces = hs.spaces.spacesForScreen(screen)
--     local index = index_by_space()
--     if not index then
--         return
--     end
--     local prev_index = index - 1
--     local space_id = spaces[prev_index]
--     if space_id then
--         hs.spaces.gotoSpace(space_id)
--     end
-- end)

for i = 0, 9, 1 do
    hs.hotkey.bind({ config.modkey }, tostring(i), function()
        local screen = current_screen()
        local spaces = hs.spaces.spacesForScreen(screen)
        local space_id = spaces[i]
        if space_id then
            hs.spaces.gotoSpace(space_id)
        end
    end)
end

hs.hotkey.bind({ config.modkey }, "t", function()
    local wins = hs.window.filter.new():setCurrentSpace(true):getWindows()
    local screen = hs.screen.mainScreen():currentMode()
    local rect = hs.geometry(0, 0, screen["w"], screen["h"])
    hs.window.tiling.tileWindows(wins, rect)
end)

hs.hotkey.bind({ config.modkey }, "q", function()
    local win = hs.window.focusedWindow()
    win:close()
end)

-- hs.hotkey.bind({config.modkey}, "m", function()
-- local modal = hs.hotkey.modal.new({config.modkey}, "m")

-- modal:bind({modkey}, "l", nil, function()
--
-- end,
--
-- )
-- end)
--
hs.hotkey.bind({ config.modkey, "shift" }, "R", function()
    hs.reload()
end)

local modal = hs.hotkey.modal.new({ config.modkey }, "m")
modal:bind({ config.modkey }, "l", function() end)

hs.alert.show("Config loaded")
