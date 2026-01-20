local wezterm = require("wezterm")

return {
    font = wezterm.font({
        family = "Sarasa Mono SC",
        harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    }),
    font_size = 14,
}
