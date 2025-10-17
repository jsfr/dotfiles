# source environment vars
if uname -a | grep -q Darwin
    # MacOS
    source ~/.config/fish/macos.fish
else if uname -a | grep -q WSL2
    # WSL
    source ~/.config/fish/wsl.fish
end
source ~/.config/fish/env.fish
source ~/.config/fish/neko.fish

export fish_user_paths

# define custom keybindings
function fish_user_key_bindings
    bind \ej history-search-forward
    bind \ek history-search-backward
    bind \el forward-char
    bind \eh backward-char
    bind \ew forward-word
    bind \eb backward-word
end

if status is-interactive
    # define aliases
    alias ls="eza -1 -F"
    alias n=nvim
    alias k=kubectl
    alias kx=kubectx
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
        COMPLETE=fish jj | source
    end

    # enable zoxide
    if command -q zoxide
        bkt --ttl 1day -- zoxide init fish --cmd cd | source
    end

    # enable atuin
    if command -q atuin
        # TODO: Fix until https://github.com/atuinsh/atuin/issues/2803 is fixed
        bkt --ttl 1day -- atuin init fish | sed 's/-k up/up/' | source
    end

    # enable direnv
    if command -q direnv
        bkt --ttl 1day -- direnv hook fish | source
    end

    # enable oh-my-posh
    if command -q oh-my-posh
        bkt --ttl 1day -- oh-my-posh init fish --config ~/.config/oh-my-posh.yaml | source
    end
end
