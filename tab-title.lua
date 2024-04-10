local wezterm = require("wezterm")

-- Inspired by https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614

local GLYPH_SEMI_CIRCLE_LEFT = ""
-- local GLYPH_SEMI_CIRCLE_LEFT = utf8.char(0xe0b6)
local GLYPH_SEMI_CIRCLE_RIGHT = ""
-- local GLYPH_SEMI_CIRCLE_RIGHT = utf8.char(0xe0b4)
local GLYPH_CIRCLE = ""
-- local GLYPH_CIRCLE = utf8.char(0xf111)
local GLYPH_ADMIN = "󰞀"
-- local GLYPH_ADMIN = utf8.char(0xf0780)

local M = {}

local __cells__ = {}

local colors = {
    default = {
        bg = "#45475a",
        fg = "#1c1b19",
    },
    is_active = {
        bg = "#7FB4CA",
        fg = "#11111b",
    },

    hover = {
        bg = "#587d8c",
        fg = "#1c1b19",
    },
}

local _set_process_name = function(s)
    local a = string.gsub(s, "(.*[/\\])(.*)", "%2")
    return a:gsub("%.exe$", "")
end

local _set_title = function(process_name, base_title, max_width, inset)
    inset = inset or 6
    if inset > max_width then
        inset = 0
    end
    local title = base_title

    local homeDir = os.getenv("UserProfile")
    if homeDir then
        title = string.gsub(title, homeDir, "~")
    end

    if title:len() > max_width - inset then
        title = wezterm.truncate_left(title, max_width - inset)
    end

    return title
end

---@param fg string
---@param bg string
---@param attribute table
---@param text string
local _push = function(bg, fg, attribute, text)
    table.insert(__cells__, { Background = { Color = bg } })
    table.insert(__cells__, { Foreground = { Color = fg } })
    table.insert(__cells__, { Attribute = attribute })
    table.insert(__cells__, { Text = text })
end

M.setup = function()
    local real_max_width = 0
    wezterm.on("format-tab-title", function(tab, _tabs, _panes, _config, hover, max_width)
        __cells__ = {}

        local bg
        local fg
        local process_name = _set_process_name(tab.active_pane.foreground_process_name)
        real_max_width = math.max(real_max_width, max_width)
        local title = _set_title(process_name, tab.active_pane.title, real_max_width, 8)

        if tab.is_active then
            bg = colors.is_active.bg
            fg = colors.is_active.fg
        elseif hover then
            bg = colors.hover.bg
            fg = colors.hover.fg
        else
            bg = colors.default.bg
            fg = colors.default.fg
        end

        -- Left semi-circle
        _push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_LEFT)

        -- Title
        _push(bg, fg, { Intensity = "Bold" }, " " .. title)

        -- Unseen output alert
        -- local has_unseen_output = false
        -- for _, pane in ipairs(tab.panes) do
        --     if pane.has_unseen_output then
        --         has_unseen_output = true
        --         break
        --     end
        -- end
        -- if has_unseen_output then
        -- _push(bg, "#FFA066", { Intensity = "Bold" }, " " .. GLYPH_CIRCLE)
        -- end

        -- Right padding
        _push(bg, fg, { Intensity = "Bold" }, " ")

        -- Right semi-circle
        _push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_RIGHT)

        return __cells__
    end)
end

return M
