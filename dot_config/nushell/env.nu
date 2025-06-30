def get-dir [filename: string] {
    $nu.data-dir | path join vendor autoload $"($filename).nu"
}

mkdir ($nu.data-dir | path join vendor autoload)

# Enable zoxide
zoxide init nushell --cmd cd | save -f (get-dir "zoxide")
# zoxide init nushell | save -f (get-dir "zoxide")

# Enable atuin
atuin init nu | save -f (get-dir "atuin")

# Enable sfsu
sfsu hook --shell nu | save -f (get-dir "sfsu")

# Add jujutsu completions
jj util completion nushell | save -f (get-dir "jujutsu")

# Enable carapace
# carapace _carapace nushell | save -f (get-dir "carapace")

# Enable oh-my-posh
oh-my-posh init nu --config ~/.config/oh-my-posh.yaml
