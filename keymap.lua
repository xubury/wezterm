local wezterm = require("wezterm")
local act = wezterm.action

local keys = {}
for i = 1, 9 do
    -- CTRL + number to activate that tab
    table.insert(keys, {
        key = tostring(i),
        mods = "CTRL",
        action = act.ActivateTab(i - 1),
    })
end

table.insert(keys, { key = "t", mods = "CTRL", action = act.SpawnTab("DefaultDomain") })
table.insert(keys, { key = "w", mods = "CTRL | SHIFT", action = act.CloseCurrentTab({ confirm = true }) })

return {
    keys = keys,
}
