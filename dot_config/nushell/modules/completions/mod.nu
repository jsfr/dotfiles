def expand_alias [spans] {
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -i 0.expansion

    if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ')
    } else {
        $spans
    }
}

export-env { 
    let carapace_completer = {|spans|
        carapace $spans.0 nushell ...$spans
        | from json
        | if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) { $in } else { null }
    }


    let zoxide_completer = {|spans|
        let zoxide_dirs = $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD} | take 5 | str replace $env.HOME "~"

        let path = $spans | last | path parse | update parent {|p| 
            if ($p.parent == "") { "./" } else $.parent
        };

        let ls_dirs = ls -la $path.parent
        | where {|f|
            let type = match $f.type {
                # For symlinks, use the type of the target
                symlink => ( $f.name | path expand | ls -D $in | get type.0 )
                # Otherwise just use the type:
                _ => $f.type
            }

            $type == "dir" and ($f.name | str starts-with --ignore-case $"($path.stem)($path.extension)")
        }
        | get name;

        $ls_dirs ++ $zoxide_dirs
    }

    let chezmoi_completer = {|spans|
        let spans = if $spans.1 == "git" { $spans | skip 1 } else $spans;

        do $carapace_completer $spans
    }

    let external_completer = {|spans|
        let spans = expand_alias $spans;
        let completer = match $spans.0 {
            __zoxide_z | __zoxide_zi => $zoxide_completer
            # chezmoi => $chezmoi_completer
            _ => $carapace_completer
        };

        do $completer $spans
    }

    # $env.config.completions.algorithm = 'fuzzy' # Make completions match using fuzzy
    $env.config.completions.external = {
        enable: true
        completer: $external_completer
    }
    $env.CARAPACE_BRIDGES = 'fish'
}
