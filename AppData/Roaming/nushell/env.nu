mkdir ($nu.data-dir | path join "vendor/autoload")

# Enable carapace
carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")

# Enable zoxide
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

# Enable atuin
atuin init nu | save -f ($nu.data-dir | path join "vendor/autoload/atuin.nu")

# Enable sfsu
sfsu hook --shell nu | save -f ($nu.data-dir | path join "vendor/autoload/sfsu.nu")

# Enable starship
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
