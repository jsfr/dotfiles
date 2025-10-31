#!/usr/bin/env bash
set -euo pipefail

rev="${1:-@}"

prefix='🚧: '
desc=$(jj log -r "$rev" -T 'description' --no-graph)

first=${desc%%$'\n'*}
rest=${desc#"$first"}

[[ "$rest" != "$desc" ]] && rest=${rest#$'\n'}

if [[ "$first" == "$prefix"* ]]; then
	first=${first#"$prefix"}
else
	first="${prefix}${first}"
fi

[[ -n "$rest" ]] && new_desc="$first"$'\n'"$rest" || new_desc="$first"

jj describe -r "$rev" -m "$new_desc"
