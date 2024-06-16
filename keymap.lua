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

wezterm.on("toggle-tabbar", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.enable_tab_bar == false then
		wezterm.log_info("tab bar shown")
		overrides.enable_tab_bar = true
	else
		wezterm.log_info("tab bar hidden")
		overrides.enable_tab_bar = false
	end
	window:set_config_overrides(overrides)
end)
table.insert(keys, { key = "t", mods = "CTRL", action = act.SpawnTab("DefaultDomain") })
table.insert(keys, { key = "w", mods = "CTRL | SHIFT", action = act.CloseCurrentTab({ confirm = true }) })
table.insert(keys, { key = "z", mods = "CTRL", action =  act.EmitEvent("toggle-tabbar") })

return {
    keys = keys,
}
