Invoke-Expression (&starship init powershell)

$env:EDITOR = "C:\Users\JensFredskov\scoop\apps\neovim\current\bin\nvim.exe"

Set-Alias -Name ls -value "eza -1 -F"
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
