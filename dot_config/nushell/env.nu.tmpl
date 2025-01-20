# vim: set syntax=nu :

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

{{- if or (eq .chezmoi.os "windows") (and (eq .chezmoi.os "linux") (.chezmoi.kernel.osrelease | lower | contains "microsoft")) }}
# Enable sfsu
{{- if and (eq .chezmoi.os "linux") (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
def --wrapped sfsu [...args] {
  /mnt/c/Users/JensFredskov/scoop/shims/sfsu.exe ...$args
}
{{- end }}
sfsu hook --shell nu | save -f (get-dir "sfsu")
{{- end }}

# Enable starship
starship init nu | save -f (get-dir "starship")
