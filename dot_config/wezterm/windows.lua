local wezterm = require("wezterm")

return {
    font_size = 11.0,
    default_domain = "WSL:NixOS",
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
                local domain = pane:get_domain_name()

                pane:split({
                    domain = "CurrentPaneDomain",
                    direction = dimensions.pixel_width > dimensions.pixel_height and "Right" or "Bottom",
                    args = domain == "local" and { "nu.exe" } or nil,
                })
            end),
        },
    },
    launch_menu = {
        {
            label = "New Tab (wsl)",
        },
        {
            label = "New Tab (win: nushell)",
            args = { "nu.exe" },
            domain = { DomainName = "local" },
        },
        -- {
        --     label = "New Tab (win: pwsh)",
        --     args = { "pwsh.exe" },
        --     domain = { DomainName = "local" },
        -- },
    },
}
