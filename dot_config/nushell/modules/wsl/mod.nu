export-env {
    # config
    $env.BROWSER = 'wslview'

    # wsl paths
    $env.path ++= [
        "/mnt/c/Program Files/glzr.io/GlazeWM/cli",
        "/mnt/c/Users/JensFredskov/AppData/Local/Microsoft/WindowsApps",
        "/mnt/c/Users/JensFredskov/scoop/shims",
        "/mnt/c/WINDOWS/System32/OpenSSH",
        "/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0",
        "/mnt/c/WINDOWS/system32",
    ]
}

# aliases
export alias dn = dotnet
export alias rebuild = sudo nixos-rebuild switch
export alias search = nix-search
export alias wcopy = win32yank.exe -i
export alias wg = winget.exe
export alias wpaste = win32yank.exe -o
