#!/usr/bin/env nu

if $env.CHEZMOI_OS == "windows" {
    cd "C:/Users/JensFredskov/.local/share/chezmoi/dot_glzr/zebar/default"
    make
}
