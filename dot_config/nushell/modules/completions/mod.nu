def expand_alias [spans] {
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -i 0.expansion

    if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ' | take 1)
    } else {
        $spans
    }
}

export-env { 
    let carapace_completer = {|spans|
        carapace $spans.0 nushell ...$spans | from json
    }

    # let zoxide_completer = {|spans|
    #     $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
    # }

    let external_completer = {|spans|
        let spans = expand_alias $spans;
        let completer = match $spans.0 {
            # __zoxide_z | __zoxide_zi => $zoxide_completer
            _ => $carapace_completer
        };

        do $completer $spans
    }

    $env.config.completions.algorithm = 'fuzzy' # Make completions match using fuzzy
    $env.config.completions.external = {
        enable: true
        completer: $external_completer
    }
}
