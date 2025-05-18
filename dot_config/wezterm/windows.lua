local wezterm = require("wezterm")

-- local WIN_LOGO = wezterm.nerdfonts.md_microsoft
-- local NIX_LOGO = wezterm.nerdfonts.md_nix
local WIN_LOGO = "🪟 "
local NIX_LOGO = "🐧 "

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

return {
    font_size = 11.0,
    font = wezterm.font("JetBrainsMono Nerd Font Mono"),
    default_domain = "WSL:NixOS",
    tab_max_width = 20,
    keys = {
        {
            key = "t",
            mods = "CTRL",
            action = wezterm.action.SpawnTab("DefaultDomain"),
        },
        {
            key = "T",
            mods = "CTRL|SHIFT",
            action = wezterm.action.SpawnCommandInNewTab({
                args = { "nu.exe" },
                domain = { DomainName = "local" },
            }),
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

                pane:split({
                    direction = dimensions.pixel_width > dimensions.pixel_height and "Right" or "Bottom",
                })
            end),
        },
        {
            key = "?",
            mods = "CTRL|SHIFT",
            action = wezterm.action_callback(function(_, pane)
                local dimensions = pane:get_dimensions()

                pane:split({
                    domain = { DomainName = "local" },
                    direction = dimensions.pixel_width > dimensions.pixel_height and "Right" or "Bottom",
                    args = { "nu.exe" },
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
