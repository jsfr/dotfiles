# config
$env.BROWSER = 'wslview'

# wsl paths
$env.path ++= [ "/mnt/c/WINDOWS/System32/OpenSSH" ]
$env.path ++= [ "/mnt/c/Users/JensFredskov/scoop/shims" ]
$env.path ++= [ "/mnt/c/Users/JensFredskov/AppData/Local/Microsoft/WindowsApps" ]

# aliases
alias rebuild = sudo nixos-rebuild switch
alias search = nix-search
