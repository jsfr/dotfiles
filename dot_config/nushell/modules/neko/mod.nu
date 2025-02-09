export alias "cli" = dotnet ./artifacts/bin/Api.Client.Cli/debug/Api.Client.Cli.dll

export def "jwt create dev" [] {
    az account get-access-token --resource='https://dev.cur8.co/api' | from json | get accessToken}

export def "jwt create prod" [] {
    az account get-access-token --resource='https://cur8.co/api' | from json | get accessToken
}

export def "jwt inspect" [] {
    $in | str replace "Bearer " "" | str trim | split row "." | take 2 | each {|x| $x | base64 --decode } | to text | fx
}
