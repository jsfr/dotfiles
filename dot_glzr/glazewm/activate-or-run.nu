def main [processName: string, app: string] {
    let query = '.data.windows | map(select(.processName == "' + $processName + '")) | first | .id';
    glazewm.exe q windows
        | jq -r $query
        | if $in != "null" { glazewm.exe c focus --container-id $in } else { exec $app }
}
