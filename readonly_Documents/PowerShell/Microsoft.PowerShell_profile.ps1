Invoke-Expression (&starship init powershell)

$env:EDITOR = "C:\Users\JensFredskov\scoop\apps\neovim\current\bin\nvim.exe"

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

Remove-Item Alias:ls
function ls {
    eza -1 -F $args
}

function cm {
    chezmoi $args
}
