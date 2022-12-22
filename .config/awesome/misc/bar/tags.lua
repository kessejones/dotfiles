local awful = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local wibox = require("wibox")
local gears = require("gears")
local dpi = xresources.apply_dpi

local helper = require("helpers.ui")
local keys = require("core.keys")
local ui = require("helpers.ui")

local function update_tag(item, tag, index)
    if tag.selected then
        item:get_children_by_id("tag")[1].markup = helper.colorize_text("", beautiful.xcolor2)
    elseif #tag:clients() > 0 then
        item:get_children_by_id("tag")[1].markup = helper.colorize_text("", beautiful.xcolorS2)
    else
        item:get_children_by_id("tag")[1].markup = helper.colorize_text("", beautiful.xcolorS2)
    end
end

local M = {}

M.new = function(s)
    local taglist_buttons = gears.table.join(
        awful.button({}, 1, function(t)
            t:view_only()
        end),
        awful.button({ keys.modKey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({ keys.modKey }, 3, function(t)
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
        style = {
            spacing = dpi(10),
        },
        widget_template = {
            id = "tag",
            font = beautiful.font_icon_with_size(beautiful.topbar_icon_size),
            widget = wibox.widget.textbox,
            create_callback = function(self, c3, index, object)
                update_tag(self, c3, index)
                ui.add_hover_cursor(self, "hand1")
            end,

            update_callback = function(self, c3, index, object)
                update_tag(self, c3, index)
            end,
        },
    })

    local widget = wibox.widget({
        {
            {
                {
                    taglist,
                    widget = wibox.container.margin,
                    left = dpi(10),
                    right = dpi(10),
                    top = dpi(2),
                    bottom = dpi(2),
                },
                strategy = "exact",
                layout = wibox.container.constraint,
            },
            widget = wibox.container.background,
            bg = beautiful.wibar_widget_bg,
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 5)
            end,
        },
        widget = wibox.container.margin,
        left = dpi(5),
        right = dpi(5),
        top = dpi(5),
        bottom = dpi(5),
    })

    return widget
end

return M
