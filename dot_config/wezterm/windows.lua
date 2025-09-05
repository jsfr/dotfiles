local wezterm = require("wezterm")

-- local WIN_LOGO = wezterm.nerdfonts.md_microsoft
-- local NIX_LOGO = wezterm.nerdfonts.md_nix
local WIN_LOGO = "  "
local NIX_LOGO = "  "

wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
    local active_pane = tab.active_pane
    local title = active_pane.title

    if active_pane.domain_name == "local" then
        title = WIN_LOGO .. title
    else
        title = NIX_LOGO .. title
    end

    title = "[" .. tab.tab_index + 1 .. "] " .. title
    title = wezterm.truncate_right(title, max_width - 2)

    return " " .. title .. " "
end)

-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
--     pane:split({
--         direction = "Right",
--         domain = { DomainName = "local" },
--         args = { "nu.exe" },
--     })
-- end)

return {
    font_size = 11.0,
    -- default_domain = "WSL:NixOS",
    default_prog = { "nu.exe" },
    tab_max_width = 20,
    keys = {
        {
            key = "t",
            mods = "CTRL",
            action = wezterm.action.SpawnTab({ DomainName = "WSL:NixOS" }),
        },
        {
            key = "T",
            mods = "CTRL|SHIFT",
            action = wezterm.action.SpawnTab("DefaultDomain"),
        },
        {
            key = "K",
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

                pane:split({
                    direction = dimensions.pixel_width > dimensions.pixel_height and "Right" or "Bottom",
                    domain = { DomainName = "WSL:NixOS" },
                })
            end),
        },
        {
            key = "?",
            mods = "CTRL|SHIFT",
            action = wezterm.action_callback(function(_, pane)
                local dimensions = pane:get_dimensions()

                pane:split({
                    direction = dimensions.pixel_width > dimensions.pixel_height and "Right" or "Bottom",
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
        {
            label = "New Tab (win: topgrade)",
            args = { "topgrade.exe" },
            domain = { DomainName = "local" },
        },
    },
}
