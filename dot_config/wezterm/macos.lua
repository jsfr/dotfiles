local wezterm = require("wezterm")

return {
    font_size = 13.0,
    default_prog = { "/opt/homebrew/bin/fish" },
    keys = {
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
    -- Hotfix for https://github.com/wez/wezterm/issues/3774
    freetype_load_target = "Light",
    -- config.freetype_render_target = "HorizontalLcd"
    cell_width = 0.9,
}
