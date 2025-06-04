fish_add_path -aP \
    "/mnt/c/Program Files/glzr.io/GlazeWM/cli" \
    /mnt/c/Users/JensFredskov/AppData/Local/Microsoft/WindowsApps \
    /mnt/c/Users/JensFredskov/scoop/shims \
    "/mnt/c/Program Files/WezTerm" \
    /mnt/c/WINDOWS/System32/OpenSSH \
    "/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0" \
    /mnt/c/WINDOWS/system32

alias rebuild="sudo nixos-rebuild switch"
alias search=nix-search
alias dn=dotnet
alias wg=winget.exe
alias wcopy="win32yank.exe -i"
alias wpaste="win32yank.exe -o"
alias apicli="dotnet ./artifacts/bin/Api.Client.Cli/debug/Api.Client.Cli.dll"
