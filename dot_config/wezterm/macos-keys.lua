local wezterm = require("wezterm")

return {
    {
        key = "k",
        mods = "SUPER",
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = "o",
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
        key = "/",
        mods = "SUPER|SHIFT",
        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "-",
        mods = "SUPER|SHIFT",
        action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
}
