local wezterm = require("wezterm")

return {
    font_size = 11.0,
    default_domain = "WSL:Arch",
    keys = {
        {
            key = "t",
            mods = "CTRL",
            action = wezterm.action.SpawnTab("DefaultDomain"),
        },
        {
            key = "T",
            mods = "CTRL|SHIFT",
            action = wezterm.action.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }),
        },
        {
            key = "K",
            mods = "CTRL|SHIFT",
            action = wezterm.action.ActivateCommandPalette,
        },
        {
            key = "O",
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
    launch_menu = {
        {
            label = "New Tab (fish)",
        },
        {
            label = "New Tab (powershell)",
            args = { "pwsh.exe" },
            domain = { DomainName = "local" },
        },
    },
}
