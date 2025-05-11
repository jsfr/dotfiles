# path
fish_add_path -P /opt/homebrew/bin
fish_add_path -P ~/.local/bin

set -gx SHELL (which fish)

# set -gx PAGER moar
set -gx FZF_DEFAULT_COMMAND "fd -It f"
set -gx EDITOR nvim

set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_CACHE_HOME ~/.cache
set -gx XDG_DATA_HOME ~/.local/share
set -gx XDG_STATE_HOME ~/.local/state

# golang
set -gx GOPATH ~/go
set -gx GOBIN $GOPATH/bin
fish_add_path -P $GOBIN

# rust
set -gx CARGO_BIN_PATH ~/.cargo/bin
fish_add_path -P $CARGO_BIN_PATH
set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# bkt
set -gx BKT_CACHE_DIR $XDG_CACHE_HOME

# dotnet
set -gx NUGET_CREDENTIALPROVIDER_MSAL_ENABLED true
set -gx NUGET_CREDENTIALPROVIDER_FORCE_CANSHOWDIALOG_TO true
fish_add_path -P ~/.dotnet/tools

# mise
fish_add_path -P $XDG_DATA_HOME/mise/shims
