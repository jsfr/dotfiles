def get-dir [filename: string] {
  $nu.data-dir | path join $"vendor/autoload/($filename).nu"
}

mkdir ($nu.data-dir | path join "vendor/autoload")

# Enable carapace
carapace _carapace nushell | save -f (get-dir "carapace")

# Enable zoxide
zoxide init nushell | save -f (get-dir "zoxide")

# Enable atuin
atuin init nu | save -f (get-dir "atuin")

# Enable sfsu
sfsu hook --shell nu | save -f (get-dir "sfsu")

# Enable starship
starship init nu | save -f (get-dir "starship")
