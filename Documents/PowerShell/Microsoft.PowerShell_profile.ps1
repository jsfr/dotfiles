$env:HOME = "$env:USERPROFILE"
$env:EDITOR = "$env:HOME\scoop\apps\neovim\current\bin\nvim.exe"
$env:PATH = "$env:HOME\.cargo\bin;$env:PATH"
$env:PATH = "$env:HOME\.local\bin;$env:PATH"

Remove-Item Alias:ls
function ls {
    eza -1 -F $args
}
function la {
    eza -1 -F -a $args
}

Import-Module Abbr
ealias cm "chezmoi"
ealias n "nvim"

# Import-Module PSReadLine
# Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
# Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

$env:CARAPACE_BRIDGES = 'powershell'
Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
carapace _carapace | Out-String | Invoke-Expression

Invoke-Expression (&{ zoxide init powershell --cmd cd | Out-String })
Invoke-Expression (&{ chezmoi completion powershell | Out-String })
Invoke-Expression (&sfsu hook)

Invoke-Expression (&starship init powershell)
