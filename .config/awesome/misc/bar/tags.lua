local awful = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local wibox = require("wibox")
local gears = require("gears")
local dpi = xresources.apply_dpi

local function update_tag(item, tag, index)
    if tag.selected then
        item:get_children_by_id("tag")[1].markup = "<span foreground='" .. beautiful.fg .. "'>◆</span>"
    elseif #tag:clients() > 0 then
        item:get_children_by_id("tag")[1].markup = "<span foreground='" .. beautiful.fg .. "'>◇</span>"
    else
        item:get_children_by_id("tag")[1].markup = "<span foreground='" .. beautiful.bg_alt .. "'>◇</span>"
    end
end

local M = {}

local modKey = "Mod1"

M.new = function(s)
    local taglist_buttons = gears.table.join(
        awful.button({}, 1, function(t)
            t:view_only()
        end),
        awful.button({ modKey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({ modKey }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end),
        awful.button({}, 4, function(t)
            awful.tag.viewnext(t.screen)
        end),
        awful.button({}, 5, function(t)
            awful.tag.viewprev(t.screen)
        end)
    )

    local taglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        layout = {
            spacing = dpi(4),
            layout = wibox.layout.fixed.horizontal,
        },
        style = {
            spacing = dpi(10),
        },
        -- widget_template = {
        --     id = "tag",
        --     font = "Operator Mono 14",
        --     widget = wibox.widget.textbox,
        --
        --     create_callback = function(self, c3, index, object)
        --         update_tag(self, c3, index)
        --     end,
        --
        --     update_callback = function(self, c3, index, object)
        --         update_tag(self, c3, index)
        --     end,
        -- },
    })

    return taglist
end

return M
