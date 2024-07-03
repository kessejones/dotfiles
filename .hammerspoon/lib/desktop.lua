local spaces = require("hs._asm.undocumented.spaces.init")

local config = {
    spacesDelay = 0.3,
}

local Desktop = {
    active = 1,
    lastMove = 0,
}

function Desktop.layout()
    return spaces.layout()[spaces.MainScreenUUID()]
end

function Desktop.activeSpace()
    return Desktop.spaceId(Desktop.active)
end

function Desktop.spaceId(index)
    return Desktop.layout()[index]
end

function Desktop.set(active, force)
    if active ~= Desktop.active or force then
        Desktop.active = active
        hs.window.filter.switchToSpace(active)
        for _, fn in ipairs(Desktop._listeners) do
            fn(active)
        end
    end
end

function Desktop._update(force)
    local active = spaces.activeSpace()
    for i, space in ipairs(Desktop.layout()) do
        if space == active then
            Desktop.set(i, force)
            break
        end
    end
end

Desktop._trigger = nil
Desktop._triggerUpdate = function()
    if Desktop._trigger then
        Desktop._trigger:setNextTrigger(config.spacesDelay)
    else
        Desktop._trigger = hs.timer.doAfter(config.spacesDelay, function()
            if spaces.isAnimating() then
                Desktop._trigger:setNextTrigger(config.spacesDelay)
            else
                Desktop._trigger = nil
                Desktop._update()
            end
        end)
    end
end

function Desktop.move(count)
    Desktop.lastMove = hs.timer.secondsSinceEpoch()
    Desktop.set((((Desktop.active + count) - 1) % #Desktop.layout()) + 1)
end

function Desktop.next()
    Desktop.move(1)
end

function Desktop.prev()
    Desktop.move(-1)
end

function Desktop.onChange(fn)
    table.insert(Desktop._listeners, fn)
    Desktop._update(true)
end

Desktop._watcher = spaces.watcher.new(function()
    Desktop._triggerUpdate()
end)

Desktop._wacher:start()

function Desktop.changeTo(index)
    Desktop.set(index)
    hs.eventtap.keyStroke({ "ctrl" }, string.format("%d", index), 1000)
end

Desktop._tap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
    local hasSpacesMods = event:getFlags():containsExactly({ "ctrl" })
    local hasMods = event:getFlags():containsExactly({ "ctrl", "cmd", "fn" })
    local isUp = event:getKeyCode() == hs.keycodes.map["up"]
    local isDown = event:getKeyCode() == hs.keycodes.map["down"]

    for s = 1, 9 do
        if hasSpacesMods and event:getKeyCode() == hs.keycodes.map[tostring(s)] then
            Desktop.set(s)
        end
    end

    if hasMods and isUp then
        if Desktop.active ~= 1 then
            Desktop.prev()
        end
    end

    if hasMods and isDown then
        if Desktop.active ~= #Desktop.layout() then
            Desktop.next()
        end
    end
end)

Desktop._tap:start()

Desktop._update(true)

Desktop._listeners = {}

return Desktop
