local wezterm = require("wezterm")
local mux = wezterm.mux

return {
    default_prog = { "pwsh" },

    color_scheme = "Catppuccin Mocha",

    launch_menu = {
        { label = "PowerShell Core", args = { "pwsh" } },
        { label = "PowerShell Desktop", args = { "powershell" } },
        { label = "Command Prompt", args = { "cmd" } },
    },

    animation_fps = 60,
    max_fps = 60,
    front_end = "WebGpu",
    webgpu_power_preference = "HighPerformance",

    default_cursor_style = "BlinkingBlock",
    cursor_blink_rate = 900,
    cursor_blink_ease_in = "Linear",
    cursor_blink_ease_out = "Linear",

    bold_brightens_ansi_colors = true,

    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    window_background_opacity = 1.0,
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

    tab_max_width = 32,
    tab_bar_at_bottom = false,
    use_fancy_tab_bar = false,
    show_tab_index_in_tab_bar = false,
    switch_to_last_active_tab_when_closing_tab = true,

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
}
