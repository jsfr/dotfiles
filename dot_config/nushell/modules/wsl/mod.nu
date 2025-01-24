export-env {
    # config
    $env.BROWSER = 'wslview'

    # wsl paths
    $env.path ++= [
        "/mnt/c/WINDOWS/System32/OpenSSH",
        "/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/",
        "/mnt/c/Users/JensFredskov/scoop/shims",
        "/mnt/c/Users/JensFredskov/AppData/Local/Microsoft/WindowsApps",
    ]
}

# aliases
export alias rebuild = sudo nixos-rebuild switch
export alias search = nix-search
export alias wcopy = win32yank.exe -i
export alias wpaste = win32yank.exe -o
export alias wg = winget.exe
export alias dn = dotnet
