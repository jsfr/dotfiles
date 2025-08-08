# 🏠 Dotfiles

Personal dotfiles and configuration files managed with [chezmoi](https://www.chezmoi.io/). This repository contains my cross-platform development environment setup for Windows, macOS, and Linux.

## 🚀 Installation

### Prerequisites

1. Install [chezmoi](https://www.chezmoi.io/install/)
2. Initialize and apply dotfiles:
   ```bash
   chezmoi init --apply https://github.com/jsfr/dotfiles.git
   ```

## 📁 Repository Structure

- **`dot_config/`** - Cross-platform configuration files
- **`AppData/`** - Windows-specific application data
- **`Library/`** - macOS-specific application support
- **`Documents/`** - PowerShell and other document configs
- **`dot_*`** - Direct home directory dotfiles

## ⚙️ Supported Applications

### 🖥️ Terminal & Shell

- **Fish** - Modern shell with intelligent auto completions
- **Nushell** - Data-driven shell for cross-platform scripting (good alternative to PowerShell on Windows)
- **PowerShell** - Windows PowerShell profile
- **Starship** - Cross-shell prompt
- **Oh My Posh** - Prompt theme engine

### 📝 Editors & IDEs

- **Neovim** - Highly customizable text editor
- **Helix** - Post-modern text editor
- **Visual Studio Code** - Code editor settings
- **IdeaVim** - Vim emulation for JetBrains IDEs

### 🪟 Window Management

- **AeroSpace** - macOS tiling window manager
- **JWNO** - Windows tiling window manager
- **GlazeWM** - Alternative Windows tiling window manager
- **Hammerspoon** - macOS automation
- **Yabai** - Alternative macOS window manager
- **AutoHotkey** - Windows automation scripts

### 🛠️ Development Tools

- **Git** - Version control configuration
- **Jujutsu (jj)** - Next-generation VCS
- **Mise** - Runtime version manager
- **Atuin** - Shell history sync
- **Bottom** - System monitor
- **Tealdeer** - Fast tldr client

### 🌐 Web & Browsing

- **Tridactyl** - Firefox Vim-like navigation
- **Karabiner** - macOS key remapping

### 📦 Package Management

- **Metapac** - Package manager wrapper
- **Topgrade** - System updater
- **Brewfile** - Homebrew package definitions

### 🎨 Status Bars & UI

- **Zebar** - Windows status bar
- **SwiftBar** - macOS menu bar
- **YASB** - Yet Another Status Bar

### 🔧 System Tools

- **Espanso** - Text expander
- **Kanata** - Key remapper
- **WezTerm** - GPU-accelerated terminal

## 🎯 Key Features

- **Cross-platform compatibility** - Works on Windows, macOS, and Linux
- **Modular configuration** - Easy to enable/disable specific tools
- **Template support** - Dynamic configs based on OS/environment
- **Symlink management** - Proper handling of symlinked configs
- **Package automation** - Automated installation of dependencies

## 📋 Platform-Specific Notes

### Windows

- Uses `AppData` for application configurations
- PowerShell profile for enhanced shell experience
- AutoHotkey scripts for system automation
- JWNO for tiling window management

### macOS

- Homebrew package management via Brewfile
- AeroSpace for window tiling
- Hammerspoon for advanced automation
- Karabiner for key remapping

### Linux

- Standard XDG config directory structure
- Shell-agnostic configurations

## 🔄 Management Commands

```bash
# Apply changes
chezmoi apply

# Edit a config file
chezmoi edit ~/.config/nvim/init.lua

# Update from remote
chezmoi update

# Check what would change
chezmoi diff

# Add new file to dotfiles
chezmoi add ~/.config/newapp/config.toml
```

## 🎨 Customization

This setup is highly modular. To customize:

1. Fork this repository
2. Modify configurations in `.config/` or platform-specific directories
3. Update templates in `.chezmoi.*` files for dynamic behavior
4. Add your own applications to the supported tools list

---

_Managed with ❤️ using [chezmoi](https://www.chezmoi.io/)_
