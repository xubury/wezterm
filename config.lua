local wezterm = require("wezterm")

---@class Config
---@field options table
local Config = {}

---Initialize Config
---@return Config
function Config:init()
    self.__index = self
    local config = setmetatable({ options = {} }, self)
    return config
end

---Append to `Config.options`
---@param new_options table new options to append
---@return Config
function Config:append(new_options)
    for k, v in pairs(new_options) do
        if self.options[k] ~= nil then
            wezterm.log_warn("Duplicate config option detected: ", { old = self.options[k], new = new_options[k] })
        else
            self.options[k] = v
        end
    end
    return self
end

require("tab-title").setup()
require("new-tab-button").setup()
require("right-status").setup()

return Config:init():append(require("basic")):append(require("font")):append(require("keymap")).options
