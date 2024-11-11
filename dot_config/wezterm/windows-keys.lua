local wezterm = require("wezterm")

return {
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = "o",
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
        key = "/",
        mods = "CTRL",
        action = wezterm.action_callback(function(_, pane)
            local dimensions = pane:get_dimensions()
            local cols = dimensions.cols
            local rows = dimensions.viewport_rows

            if cols > rows then
                pane:split({ direction = "Right" })
            else
                pane:split({ direction = "Bottom" })
            end
        end),
    },
}
