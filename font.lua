local wezterm = require("wezterm")

return {
    font = wezterm.font({
        family = "JetBrains Mono",
        weight = "Regular",
        harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    }),
    freetype_load_flags = "NO_HINTING|NO_AUTOHINT",
    font_size = 12,
    line_height = 1.0,
}
