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
- **Visual Studio Code** - Code editor settings
- **IdeaVim** - Vim emulation for JetBrains IDEs

### 🪟 Window Management

- **AeroSpace** - macOS tiling window manager
- **JWNO** - Windows tiling window manager

### 🛠️ Development Tools

- **Git** - Version control configuration
- **Jujutsu (jj)** - Next-generation VCS
- **Mise** - Runtime version manager
- **Atuin** - Shell history sync
- **Bottom** - System monitor
- **Tealdeer** - Fast tldr client

### 🌐 Web & Browsing

- **Tridactyl** - Firefox Vim-like navigation

### 📦 Package Management

- **Metapac** - Package manager wrapper
- **Topgrade** - System updater
- **Brewfile** - Homebrew package definitions

### 🎨 Status Bars & UI

- **SwiftBar** - macOS menu bar

### 🔧 System Tools

- **Hammerspoon** - macOS automation
- **AutoHotkey** - Windows automation scripts
- **Karabiner** - macOS key remapping
- **Espanso** - Text expander
- **WezTerm** - GPU-accelerated terminal

---

_Managed with ❤️ using [chezmoi](https://www.chezmoi.io/)_
