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

check_pacman_installed() {
    if pacman -Qi "$1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Check for yay (AUR helper)
install_yay() {
    print_header "Checking AUR Helper (yay)"
    if check_installed yay; then
        print_success "yay already installed"
    else
        print_info "Installing yay as root user..."
        pacman -S --needed --noconfirm git base-devel go

        # Create temporary build user
        print_info "Creating temporary build user..."
        useradd -m -G wheel -s /bin/bash builduser 2>/dev/null || true
        echo "builduser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builduser

        # Clone yay repo (clean up first if exists)
        rm -rf /tmp/yay-bin
        git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
        chown -R builduser:builduser /tmp/yay-bin

        # Build and install yay-bin
        print_info "Building yay-bin..."
        su - builduser -c "cd /tmp/yay-bin && makepkg --noconfirm"
        pacman -U --noconfirm /tmp/yay-bin/yay-bin-*.pkg.tar.zst

        # Cleanup
        rm -rf /tmp/yay-bin
        print_success "yay installed"
        print_info "Note: builduser account created for AUR package building"
    fi
}

# Install terminal tools (CLI only for WSL)
install_terminal_tools() {
    print_header "Installing Terminal Tools"

    # Only tmux - no GUI terminal emulators needed in WSL
    if check_pacman_installed tmux; then
        print_success "tmux already installed"
    else
        print_info "Installing tmux..."
        pacman -S --noconfirm tmux
        print_success "tmux installed"
    fi

    print_info "Note: GUI terminal emulators (alacritty, ghostty) skipped - use Windows Terminal or your preferred Windows terminal"
}

# Install shell tools
install_shell_tools() {
    print_header "Installing Shell Tools"

    # Install zsh first
    if ! check_pacman_installed zsh; then
        print_info "Installing zsh..."
        pacman -S --noconfirm zsh
        print_success "zsh installed"
    fi

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
        if check_pacman_installed "$tool"; then
            print_success "$tool already installed"
        else
            print_info "Installing $tool..."
            pacman -S --noconfirm "$tool"
            print_success "$tool installed"
        fi
    done

    # Install Oh My Zsh
    if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
        print_info "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        print_success "Oh My Zsh installed"
    else
        print_success "Oh My Zsh already installed"
    fi

    # Install Oh My Zsh plugins
    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        print_info "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
        print_success "zsh-autosuggestions installed"
    fi

    if [ ! -d "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" ]; then
        print_info "Installing fast-syntax-highlighting..."
        git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
        print_success "fast-syntax-highlighting installed"
    fi

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]; then
        print_info "Installing zsh-autocomplete..."
        git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"
        print_success "zsh-autocomplete installed"
    fi

    # Install Powerlevel10k theme
    if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
        print_info "Installing Powerlevel10k theme..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
        print_success "Powerlevel10k installed"
    fi
}

# Install development tools
install_dev_tools() {
    print_header "Installing Development Tools"

    # Install pyenv
    if check_pacman_installed pyenv; then
        print_success "pyenv already installed"
    else
        print_info "Installing pyenv..."
        sudo pacman -S --noconfirm pyenv
        print_success "pyenv installed"
    fi

    # Install uv (fast Python package installer)
    if check_pacman_installed python-uv; then
        print_success "python-uv already installed"
    else
        print_info "Installing python-uv..."
        sudo pacman -S --noconfirm python-uv
        print_success "python-uv installed"
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

# Install API & testing tools (CLI only)
install_api_tools() {
    print_header "Installing API & Testing Tools (CLI only)"

    # Stripe CLI (from AUR)
    if check_installed stripe; then
        print_success "stripe already installed"
    else
        print_info "Installing stripe from AUR..."
        yay -S --noconfirm stripe-cli-bin
        print_success "stripe installed"
    fi

    print_info "Note: GUI tools (Bruno, Mockoon) skipped - use Windows versions or alternatives like curl/httpie"
}

# Install infrastructure tools (optional Docker)
install_infrastructure_tools() {
    print_header "Installing Infrastructure Tools"

    print_info "Note: Docker in WSL2 works best with Docker Desktop for Windows"
    print_info "You can install docker here, but consider using Docker Desktop instead"

    read -p "Do you want to install Docker in WSL? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        local tools=(
            "docker"
            "docker-compose"
        )

        for tool in "${tools[@]}"; do
            if check_pacman_installed "$tool"; then
                print_success "$tool already installed"
            else
                print_info "Installing $tool..."
                pacman -S --noconfirm "$tool"
                print_success "$tool installed"
            fi
        done

        # Enable docker service
        print_info "Enabling docker service..."
        systemctl enable --now docker

        # Add user to docker group
        if ! groups | grep -q docker; then
            print_info "Adding user to docker group..."
            usermod -aG docker $USER
            print_info "Note: Restart your WSL session for docker group changes to take effect"
        fi
    else
        print_info "Skipping Docker installation"
    fi
}

# Install Git tools
install_git_tools() {
    print_header "Installing Git Tools"

    # Git
    if check_pacman_installed git; then
        print_success "git already installed"
    else
        print_info "Installing git..."
        sudo pacman -S --noconfirm git
        print_success "git installed"
    fi

    # GitHub CLI
    if check_pacman_installed github-cli; then
        print_success "github-cli already installed"
    else
        print_info "Installing github-cli..."
        sudo pacman -S --noconfirm github-cli
        print_success "github-cli installed"
    fi

    # Lazygit
    if check_pacman_installed lazygit; then
        print_success "lazygit already installed"
    else
        print_info "Installing lazygit..."
        sudo pacman -S --noconfirm lazygit
        print_success "lazygit installed"
    fi
}

# Install Neovim and related tools
install_neovim_tools() {
    print_header "Installing Neovim Ecosystem"

    # Neovim
    if check_pacman_installed neovim; then
        print_success "neovim already installed"
    else
        print_info "Installing neovim..."
        sudo pacman -S --noconfirm neovim
        print_success "neovim installed"
    fi

    # Tree-sitter CLI
    if check_pacman_installed tree-sitter; then
        print_success "tree-sitter already installed"
    else
        print_info "Installing tree-sitter..."
        sudo pacman -S --noconfirm tree-sitter
        print_success "tree-sitter installed"
    fi
}

# Install fonts (useful for Windows Terminal)
install_fonts() {
    print_header "Installing Fonts"

    print_info "Installing fonts for use with Windows Terminal or other terminal emulators..."

    # Install fontconfig (needed for fc-cache)
    if ! check_pacman_installed fontconfig; then
        print_info "Installing fontconfig..."
        pacman -S --noconfirm fontconfig
    fi

    # JetBrains Mono Nerd Font
    if check_pacman_installed ttf-jetbrains-mono-nerd; then
        print_success "ttf-jetbrains-mono-nerd already installed"
    else
        print_info "Installing JetBrains Mono Nerd Font from AUR..."
        yay -S --noconfirm ttf-jetbrains-mono-nerd
        print_success "ttf-jetbrains-mono-nerd installed"
    fi

    # Rebuild font cache
    if check_installed fc-cache; then
        print_info "Rebuilding font cache..."
        fc-cache -fv
    fi

    print_info "To use the font in Windows Terminal, you may need to copy it to Windows fonts folder:"
    echo "  Windows fonts are typically at: /mnt/c/Windows/Fonts/"
}

# Main installation flow
main() {
    echo -e "${GREEN}"
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║                                                       ║"
    echo "║     Development Environment Setup Script             ║"
    echo "║     Arch Linux WSL Edition                            ║"
    echo "║                                                       ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo -e "${NC}\n"

    print_info "This script will install CLI tools for Arch Linux on WSL"
    print_info "GUI applications are excluded as they should be run from Windows"
    print_info "Press Ctrl+C to cancel, or Enter to continue..."
    read -r

    # Update system first
    print_header "Updating System"
    pacman -Syu --noconfirm

    # Install everything
    install_yay
    install_fonts
    install_terminal_tools
    install_shell_tools
    install_dev_tools
    install_api_tools
    install_infrastructure_tools
    install_git_tools
    install_neovim_tools

    # Summary
    print_header "Installation Complete!"
    echo -e "${GREEN}All CLI tools have been installed!${NC}\n"

    print_info "Next steps:"
    echo "  1. Restart your terminal or source your shell config"
    echo "  2. Run 'nvm install node' to install Node.js"
    echo "  3. Run 'pyenv install <version>' to install Python"
    echo "  4. Link your config files from this directory"
    echo "  5. Configure your tools (git, gh, atuin, etc.)"
    echo "  6. If you installed Docker, restart WSL for group changes"
    echo ""
    echo "  WSL-specific notes:"
    echo "  - Use Windows Terminal or your preferred Windows terminal emulator"
    echo "  - GUI apps (Bruno, Mockoon) should be installed on Windows"
    echo "  - Consider using Docker Desktop for Windows instead of Docker in WSL"

    echo -e "\n${BLUE}Happy coding on Arch Linux WSL!${NC}\n"
}

# Run the script
main
