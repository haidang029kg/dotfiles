# CLI Tools Reference

This document lists all the CLI tools used in this configuration setup.

## Table of Contents
- [Terminal & Window Management](#terminal--window-management)
- [Shell Tools](#shell-tools)
- [Development Tools](#development-tools)
- [API & Testing Tools](#api--testing-tools)
- [Infrastructure & Containers](#infrastructure--containers)
- [Git Tools](#git-tools)
- [Neovim Ecosystem](#neovim-ecosystem)
- [Package Managers](#package-managers)

---

## Terminal & Window Management

### Alacritty
**Purpose:** GPU-accelerated terminal emulator
**Config:** `alacritty/alacritty.toml`
**Website:** https://alacritty.org/

### Ghostty
**Purpose:** Fast, native, feature-rich terminal emulator written in Zig
**Config:** `ghostty/config`
**Website:** https://ghostty.org/

### tmux
**Purpose:** Terminal multiplexer - manage multiple terminal sessions
**Config:** `.tmux.conf`
**Website:** https://github.com/tmux/tmux

### AeroSpace
**Purpose:** Tiling window manager for macOS
**Config:** `.aerospace.toml`
**Website:** https://github.com/nikitabobko/AeroSpace

---

## Shell Tools

### Atuin
**Purpose:** Magical shell history with sync and search capabilities
**Config:** `atuin/config.toml`
**Website:** https://atuin.sh/

### Zoxide
**Purpose:** Smarter cd command that learns your habits
**Config:** N/A (uses shell integration)
**Website:** https://github.com/ajeetdsouza/zoxide

### ripgrep (rg)
**Purpose:** Extremely fast grep alternative for searching code
**Website:** https://github.com/BurntSushi/ripgrep

### fzf
**Purpose:** Command-line fuzzy finder
**Website:** https://github.com/junegunn/fzf

### fd
**Purpose:** Fast and user-friendly alternative to find
**Website:** https://github.com/sharkdp/fd

### tree
**Purpose:** Display directory structure in tree format
**Website:** http://mama.indstate.edu/users/ice/tree/

### yazi
**Purpose:** Terminal file manager
**Website:** https://github.com/sxyazi/yazi

---

## Development Tools

### nvm
**Purpose:** Node Version Manager - manage multiple Node.js versions
**Current version:** v21.7.3
**Website:** https://github.com/nvm-sh/nvm

### Node.js & npm
**Purpose:** JavaScript runtime and package manager
**Managed by:** nvm
**Current version:** v21.7.3
**Website:** https://nodejs.org/

### pyenv
**Purpose:** Python version manager
**Website:** https://github.com/pyenv/pyenv

### Python
**Purpose:** Python programming language
**Managed by:** pyenv
**Website:** https://www.python.org/

### uv
**Purpose:** Fast Python package installer and resolver
**Config:** `uv/`
**Website:** https://github.com/astral-sh/uv

---

## API & Testing Tools

### Bruno
**Purpose:** Open-source API client (alternative to Postman/Insomnia)
**Website:** https://www.usebruno.com/

### Mockoon
**Purpose:** API mocking tool - create mock REST APIs
**Website:** https://mockoon.com/

### ngrok
**Purpose:** Secure tunneling to localhost - expose local servers to the internet
**Website:** https://ngrok.com/

### Stripe CLI
**Purpose:** Stripe API testing and development
**Config:** `stripe/config.toml`
**Website:** https://stripe.com/docs/stripe-cli

---

## Infrastructure & Containers

### OrbStack
**Purpose:** Fast, light, and easy way to run Docker containers and Linux on macOS
**Website:** https://orbstack.dev/

---

## Git Tools

### Git
**Purpose:** Version control system
**Config:** `git/`
**Website:** https://git-scm.com/

### GitHub CLI (gh)
**Purpose:** GitHub from the command line
**Config:** `gh/config.yml`
**Website:** https://cli.github.com/

### Lazygit
**Purpose:** Terminal UI for git commands
**Website:** https://github.com/jesseduffield/lazygit
**Used by:** Neovim (lazygit.nvim plugin)

---

## Neovim Ecosystem

### Neovim
**Purpose:** Modern terminal-based text editor
**Config:** `nvim/`
**Website:** https://neovim.io/

### Required CLI Tools

These external CLI tools are required by Neovim plugins:

- **ripgrep (rg)** - Used by telescope.nvim for grep functionality
- **fzf** - Used by telescope.nvim for fuzzy finding
- **fd** - Used by telescope.nvim for file finding
- **tree-sitter** - Parser generator for syntax highlighting
- **Lazygit** - Required by lazygit.nvim plugin

## Package Managers

- **Homebrew** - macOS package manager (used to install most CLI tools)
- **nvm** - Node Version Manager
- **pyenv** - Python version manager
- **Mason** - Neovim LSP/DAP/linter manager

---

## Fonts

### JetBrains Mono Nerd Font
**Purpose:** Primary monospace font with programming ligatures and Nerd Font icons
**Installed via:** Homebrew (`font-jetbrains-mono-nerd-font`)
**Used by:** Ghostty, Alacritty, and other terminal emulators
**Website:** https://www.nerdfonts.com/
**Features:**
- Programming ligatures for better code readability
- Extensive icon set from Nerd Fonts
- Optimized for long coding sessions
- Excellent Unicode coverage

