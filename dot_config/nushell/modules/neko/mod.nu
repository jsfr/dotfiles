export def cli [...args] {
    dotnet ./artifacts/bin/Api.Client.Cli/debug/Api.Client.Cli.dll ...$args
}

export def "jwt create" [] {
    az account get-access-token --resource='https://dev.cur8.co/api' --query accessToken --output tsv
}

export def "jwt inspect" [] {
    $in | str replace "Bearer " "" | str trim | split row "." | take 2 | each {|x| $x | base64 --decode } | to text | fx
}
