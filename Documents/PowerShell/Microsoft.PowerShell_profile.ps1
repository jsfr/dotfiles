$env:EDITOR = "C:\Users\JensFredskov\scoop\apps\neovim\current\bin\nvim.exe"

$env:HOME = "C:\Users\JensFredskov"

Remove-Item Alias:ls
function ls {
    eza -1 -F $args
}

function cm {
    chezmoi $args
}

function n {
    nvim $args
}

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })
