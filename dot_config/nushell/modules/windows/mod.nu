export-env {
    $env.BROWSER = 'C:\Program Files\Zen Browser\zen.exe'
    # $env.GIT_EDITOR = 'micro'

    $env.HOME = $env.USERPROFILE
}

export alias wg = winget
export alias dn = dotnet
export alias wcopy = win32yank -i
export alias wpaste = win32yank -o
