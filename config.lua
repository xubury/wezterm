local wezterm = require("wezterm")
local act = wezterm.action

local mykeys = {}
for i = 1, 9 do
    -- CTRL + number to activate that tab
    table.insert(mykeys, {
        key = tostring(i),
        mods = "CTRL",
        action = act.ActivateTab(i - 1),
    })
end

table.insert(mykeys, { key = "t", mods = "CTRL", action = act.SpawnTab("DefaultDomain") })

table.insert(mykeys, { key = "w", mods = "CTRL | SHIFT", action = act.CloseCurrentTab({ confirm = true }) })

require("tab-title").setup()
require("new-tab-button").setup()
require("right-status").setup()

return {
    default_prog = { "pwsh" },

    color_scheme = "Catppuccin Mocha",

    launch_menu = {
        { label = "PowerShell Core", args = { "pwsh" } },
        { label = "PowerShell Desktop", args = { "powershell" } },
        { label = "Command Prompt", args = { "cmd" } },
    },

    font = wezterm.font({
        family = "MesloLGL Nerd Font",
        weight = "Regular",
        harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
    }),

    animation_fps = 60,
    max_fps = 60,
    front_end = "WebGpu",
    webgpu_power_preference = "HighPerformance",

    freetype_load_flags = "NO_HINTING|NO_AUTOHINT",
    font_size = 12,
    line_height = 1.0,

    keys = mykeys,

    tab_max_width = 100,

    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    window_background_opacity = 1.0,

    default_cursor_style = "BlinkingBlock",
    cursor_blink_rate = 900,
    cursor_blink_ease_in = "Linear",
    cursor_blink_ease_out = "Linear",

    bold_brightens_ansi_colors = true,
    use_resize_increments = false,

    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    window_close_confirmation = "NeverPrompt",
    window_frame = {
        active_titlebar_bg = "#090909",
    },

    tab_bar_at_bottom = false,
    use_fancy_tab_bar = false,
    show_tab_index_in_tab_bar = false,
    switch_to_last_active_tab_when_closing_tab = true,

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
}
