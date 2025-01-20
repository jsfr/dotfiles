def get-dir [filename: string] {
  $nu.data-dir | path join $"vendor/autoload/($filename).nu"
}

mkdir ($nu.data-dir | path join "vendor/autoload")

# Enable carapace
carapace _carapace nushell | save -f (get-dir "carapace")

# Enable zoxide
zoxide init nushell --cmd cd | save -f (get-dir "zoxide")

# Enable atuin
atuin init nu | save -f (get-dir "atuin")

# Enable sfsu
def --wrapped sfsu [...args] {
  /mnt/c/Users/JensFredskov/scoop/shims/sfsu.exe ...$args
}
sfsu hook --shell nu | save -f (get-dir "sfsu")

# Enable starship
# starship init nu | save -f (get-dir "starship")
