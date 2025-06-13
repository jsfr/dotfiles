# source environment vars
source ~/.config/fish/env.fish

# WSL
if uname -a | grep -q WSL2
    source ~/.config/fish/wsl.fish
end

# define aliases
alias ls="eza -1 -F"
alias n=nvim
alias k=kubectl
alias tf=terraform
alias lg=lazygit
alias g=git
alias j=jj
alias dn=dotnet

# define abbreviations
abbr zap "brew uninstall --force --zap"
abbr cask "brew install --cask"
abbr cdg "git root | cd"

alias cm=chezmoi
abbr --command cm a apply
abbr --command cm g git
abbr --command cm d diff
abbr --command cm s status
abbr --command cm e "edit --apply"
abbr --command cm u update

function hx -w hx
    env PATH="$PATH:$XDG_DATA_HOME/nvim/mason/bin" command hx $argv
end

# define custom keybindings
function fish_user_key_bindings
    bind \ej history-search-forward
    bind \ek history-search-backward
    bind \el forward-char
    bind \eh backward-char
    bind \ew forward-word
    bind \eb backward-word
end

# enable mise
if command -q mise
    bkt --ttl 1day -- mise activate fish | source
end

# enable zoxide
if command -q zoxide
    bkt --ttl 1day -- zoxide init fish --cmd cd | source
end

# enable atuin
if command -q atuin
    bkt --ttl 1day -- atuin init fish | source
end

# enable direnv
if command -q direnv
    bkt --ttl 1day -- direnv hook fish | source
end

# completions
if command -q just
    bkt --ttl 1day -- just --completions fish | source
end
if command -q wezterm
    bkt --ttl 1day -- wezterm shell-completion --shell fish | source
end
if command -q gs
    bkt --ttl 1day -- gs shell completion fish | source
end
if command -q jj
    # bkt --ttl 1day -- jj util completion fish | source
    COMPLETE=fish jj | source
end

if command -q oh-my-posh
    bkt --ttl 1day -- oh-my-posh init fish --config ~/.config/oh-my-posh.yaml | source
end
