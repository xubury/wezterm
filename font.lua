local wezterm = require("wezterm")

return {
    font = wezterm.font({
        family = "JetBrainsMono NF",
        harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    }),
    line_height = 1.11,
    use_resize_increments = true,
}
