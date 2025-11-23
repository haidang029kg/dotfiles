#!/usr/bin/env bash

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "\n${BLUE}===================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}===================================${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_info() {
    echo -e "${YELLOW}→${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

check_installed() {
    if command -v "$1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Install Homebrew if not installed
install_homebrew() {
    print_header "Checking Homebrew"
    if check_installed brew; then
        print_success "Homebrew already installed"
    else
        print_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        print_success "Homebrew installed"
    fi
}

# Install terminal emulators and window management
install_terminal_tools() {
    print_header "Installing Terminal & Window Management"

    local tools=(
        "alacritty"
        "kitty"
        "tmux"
    )

    for tool in "${tools[@]}"; do
        if check_installed "$tool"; then
            print_success "$tool already installed"
        else
            print_info "Installing $tool..."
            brew install "$tool"
            print_success "$tool installed"
        fi
    done

    # AeroSpace (tiling window manager)
    if check_installed aerospace; then
        print_success "aerospace already installed"
    else
        print_info "Installing aerospace..."
        brew install --cask nikitabobko/tap/aerospace
        print_success "aerospace installed"
    fi
}

# Install shell tools
install_shell_tools() {
    print_header "Installing Shell Tools"

    local tools=(
        "atuin"
        "zoxide"
        "ripgrep"
        "fzf"
        "fd"
        "tree"
        "yazi"
    )

    for tool in "${tools[@]}"; do
        if check_installed "$tool"; then
            print_success "$tool already installed"
        else
            print_info "Installing $tool..."
            brew install "$tool"
            print_success "$tool installed"
        fi
    done
}

# Install development tools
install_dev_tools() {
    print_header "Installing Development Tools"

    # Install pyenv
    if check_installed pyenv; then
        print_success "pyenv already installed"
    else
        print_info "Installing pyenv..."
        brew install pyenv
        print_success "pyenv installed"
    fi

    # Install uv (fast Python package installer)
    if check_installed uv; then
        print_success "uv already installed"
    else
        print_info "Installing uv..."
        brew install uv
        print_success "uv installed"
    fi

    # Install nvm (Node Version Manager)
    if [ -d "$HOME/.nvm" ]; then
        print_success "nvm already installed"
    else
        print_info "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
        print_success "nvm installed"
        print_info "Note: Restart your shell or source your profile to use nvm"
    fi
}

# Install API & testing tools
install_api_tools() {
    print_header "Installing API & Testing Tools"

    # Bruno
    if check_installed bruno; then
        print_success "bruno already installed"
    else
        print_info "Installing bruno..."
        brew install --cask bruno
        print_success "bruno installed"
    fi

    # ngrok
    if check_installed ngrok; then
        print_success "ngrok already installed"
    else
        print_info "Installing ngrok..."
        brew install ngrok/ngrok/ngrok
        print_success "ngrok installed"
    fi

    # Stripe CLI
    if check_installed stripe; then
        print_success "stripe already installed"
    else
        print_info "Installing stripe..."
        brew install stripe/stripe-cli/stripe
        print_success "stripe installed"
    fi

    # Mockoon (GUI app)
    if [ -d "/Applications/Mockoon.app" ]; then
        print_success "mockoon already installed"
    else
        print_info "Installing mockoon..."
        brew install --cask mockoon
        print_success "mockoon installed"
    fi
}

# Install infrastructure tools
install_infrastructure_tools() {
    print_header "Installing Infrastructure Tools"

    # OrbStack
    if check_installed orb; then
        print_success "orbstack already installed"
    else
        print_info "Installing orbstack..."
        brew install --cask orbstack
        print_success "orbstack installed"
    fi
}

# Install Git tools
install_git_tools() {
    print_header "Installing Git Tools"

    # Git (usually pre-installed on macOS, but ensuring latest version)
    if check_installed git; then
        print_success "git already installed"
    else
        print_info "Installing git..."
        brew install git
        print_success "git installed"
    fi

    # GitHub CLI
    if check_installed gh; then
        print_success "gh already installed"
    else
        print_info "Installing gh..."
        brew install gh
        print_success "gh installed"
    fi

    # Lazygit
    if check_installed lazygit; then
        print_success "lazygit already installed"
    else
        print_info "Installing lazygit..."
        brew install lazygit
        print_success "lazygit installed"
    fi
}

# Install Neovim and related tools
install_neovim_tools() {
    print_header "Installing Neovim Ecosystem"

    # Neovim
    if check_installed nvim; then
        print_success "neovim already installed"
    else
        print_info "Installing neovim..."
        brew install neovim
        print_success "neovim installed"
    fi

    # Tree-sitter CLI (optional, nvim has it built-in)
    if check_installed tree-sitter; then
        print_success "tree-sitter already installed"
    else
        print_info "Installing tree-sitter..."
        brew install tree-sitter
        print_success "tree-sitter installed"
    fi
}

# Main installation flow
main() {
    echo -e "${GREEN}"
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║                                                       ║"
    echo "║     Development Environment Setup Script             ║"
    echo "║     Based on tools.md configuration                   ║"
    echo "║                                                       ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo -e "${NC}\n"

    print_info "This script will install all tools listed in tools.md"
    print_info "Press Ctrl+C to cancel, or Enter to continue..."
    read -r

    # Install everything
    install_homebrew
    install_terminal_tools
    install_shell_tools
    install_dev_tools
    install_api_tools
    install_infrastructure_tools
    install_git_tools
    install_neovim_tools

    # Summary
    print_header "Installation Complete!"
    echo -e "${GREEN}All tools from tools.md have been installed!${NC}\n"

    print_info "Next steps:"
    echo "  1. Restart your terminal or source your shell config"
    echo "  2. Run 'nvm install node' to install Node.js"
    echo "  3. Run 'pyenv install <version>' to install Python"
    echo "  4. Link your config files from this directory"
    echo "  5. Configure your tools (git, gh, atuin, etc.)"

    echo -e "\n${BLUE}Happy coding!${NC}\n"
}

# Run the script
main
