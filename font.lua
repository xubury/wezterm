local wezterm = require("wezterm")

return {
    font = wezterm.font({
        family = "JetBrains Mono",
        weight = "Regular",
        harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    }),
}
