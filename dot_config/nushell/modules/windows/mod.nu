export-env {
    $env.BROWSER = 'C:\Program Files\Mozilla Firefox\firefox.exe'
    $env.path ++= [
        'C:\Program Files\Git\bin',
        # 'C:\Program Files\Git\usr\bin',
    ]
    $env.GIT_EDITOR = 'hx'

    $env.HOME = $env.USERPROFILE
}

export alias wg = winget
export alias dn = dotnet
export alias wcopy = win32yank -i
export alias wpaste = win32yank -o

export def "pr" [action] {
    sh -c $"~/.local/bin/pr ($action)"
}
