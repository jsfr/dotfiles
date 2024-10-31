Invoke-Expression (&starship init powershell)

$env:EDITOR = "C:\Users\JensFredskov\scoop\apps\neovim\current\bin\nvim.exe"

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

function ls {
    eza -1 -F $args
}
