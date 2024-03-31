local wezterm = require("wezterm")

return {
    font = wezterm.font({
        family = "MesloLGM Nerd Font",
        weight = "Regular",
        harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
    }),
    freetype_load_flags = "NO_HINTING|NO_AUTOHINT",
    font_size = 12,
    line_height = 1.0,
}
