$env:EDITOR = "C:\Users\JensFredskov\scoop\apps\neovim\current\bin\nvim.exe"
$env:HOME = "C:\Users\JensFredskov"

$addPath = "$env:USERPROFILE\.cargo\bin"
[Environment]::SetEnvironmentVariable('PATH', ($env:PATH + ";$addPath"), 'User')

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

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Invoke-Expression (&{ zoxide init powershell --cmd cd | Out-String })
Invoke-Expression (&{ chezmoi completion powershell | Out-String })
Invoke-Expression (&sfsu hook)

Invoke-Expression (&starship init powershell)
