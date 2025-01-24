export def cli [...args] {
    dotnet ./artifacts/bin/Api.Client.Cli/debug/Api.Client.Cli.dll ...$args
}

export def jwt [] {
    az account get-access-token --resource='https://dev.cur8.co/api' --query accessToken --output tsv
}
