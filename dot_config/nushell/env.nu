def get-dir [filename: string] {
    $nu.data-dir | path join vendor autoload $"($filename).nu"
}

mkdir ($nu.data-dir | path join vendor autoload)

# Enable zoxide
zoxide init nushell --cmd cd | save -f (get-dir "zoxide")

# Enable atuin
atuin init nu | save -f (get-dir "atuin")

# Enable sfsu
sfsu hook --shell nu | save -f (get-dir "sfsu")

# Enable oh-my-posh
oh-my-posh init nu --config ~/.config/oh-my-posh.yaml | save -f (get-dir "oh-my-posh")
