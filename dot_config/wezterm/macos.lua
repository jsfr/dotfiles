local wezterm = require("wezterm")

return {
    font_size = 14.0,
    default_prog = { "/opt/homebrew/bin/fish" },
    font = wezterm.font({
        family = "JetBrains Mono",
        weight = "Medium",
    }),
    -- Hotfix for https://github.com/wez/wezterm/issues/3774
    freetype_load_target = "Light",
    cell_width = 0.9,
    keys = {
        {
            key = "k",
            mods = "CTRL",
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
                local cols = dimensions.pixel_width
                local rows = dimensions.pixel_height

                if cols > rows then
                    pane:split({ direction = "Right" })
                else
                    pane:split({ direction = "Bottom" })
                end
            end),
        },
    },
}
