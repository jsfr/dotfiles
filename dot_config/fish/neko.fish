function apicli
    pushd ~/Repos/ssh.dev.azure.com/cur8/Engineering/APIBackend
    dotnet ./artifacts/bin/Api.Client.Cli/debug/Api.Client.Cli.dll $argv
    popd
end

function dbcli
    pushd ~/Repos/ssh.dev.azure.com/cur8/Engineering/DeviceBackend
    dotnet ./artifacts/bin/Api.Client.Cli/debug/Api.Client.Cli.dll $argv
    popd
end
