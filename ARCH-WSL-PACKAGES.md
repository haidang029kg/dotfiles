# Arch Linux WSL Package List

This document lists packages for Arch Linux running in WSL2.

**Note:** GUI applications are excluded since WSL is primarily for CLI tools. Use Windows versions of GUI apps like Bruno, Mockoon, Alacritty, etc.

## Official Repository Packages (pacman)

### Terminal Tools
```bash
pacman -S tmux
```

### Shell Tools
```bash
pacman -S zsh atuin zoxide ripgrep fzf fd tree yazi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Oh My Zsh plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
```

### Development Tools
```bash
pacman -S pyenv python-uv git github-cli lazygit neovim tree-sitter
```

### Infrastructure (Optional)
```bash
# Docker - consider using Docker Desktop for Windows instead
pacman -S docker docker-compose
```

## AUR Packages (yay)

First, install yay (AUR helper). **Note:** Since you're running as root in WSL, we need to create a build user:
```bash
pacman -S --needed git base-devel go

# Create build user for AUR packages
useradd -m -G wheel -s /bin/bash builduser
echo "builduser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builduser

# Build and install yay
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
chown -R builduser:builduser /tmp/yay-bin
su - builduser -c "cd /tmp/yay-bin && makepkg --noconfirm"
pacman -U --noconfirm /tmp/yay-bin/yay-bin-*.pkg.tar.zst
rm -rf /tmp/yay-bin
```

Then install AUR packages:
```bash
yay -S stripe-cli-bin ttf-jetbrains-mono-nerd
```

## Excluded Packages (Use Windows Versions)

The following are NOT installed as they are GUI apps or unnecessary in WSL:

### GUI Terminal Emulators (use Windows Terminal)
- ❌ alacritty - Use on Windows or Windows Terminal
- ❌ ghostty - Use on Windows or Windows Terminal

### GUI Applications (install on Windows)
- ❌ bruno - Install Windows version from https://www.usebruno.com/
- ❌ mockoon - Install Windows version from https://mockoon.com/
- ❌ ngrok - Install Windows version from https://ngrok.com/

### Window Managers (not applicable in WSL)
- ❌ aerospace - macOS only
- ❌ i3/sway/hyprland - Use Windows window management

### Container Runtime
- ⚠️ docker - **Recommended:** Use Docker Desktop for Windows instead
  - Better integration with Windows
  - GUI management
  - Automatic WSL2 integration

## Node.js (via nvm)

Install nvm:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

Then install Node.js:
```bash
nvm install node
nvm install 21.7.3  # or your preferred version
```

## Quick Install Commands

### Minimal CLI Setup
```bash
# Update system
pacman -Syu

# Install core CLI tools
pacman -S tmux atuin zoxide ripgrep fzf fd tree yazi git github-cli lazygit neovim tree-sitter pyenv python-uv

# Install yay for AUR packages (as root - creates builduser)
pacman -S --needed git base-devel go
useradd -m -G wheel -s /bin/bash builduser 2>/dev/null || true
echo "builduser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builduser
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
chown -R builduser:builduser /tmp/yay-bin
su - builduser -c "cd /tmp/yay-bin && makepkg --noconfirm"
pacman -U --noconfirm /tmp/yay-bin/yay-bin-*.pkg.tar.zst
rm -rf /tmp/yay-bin

# Install AUR packages
yay -S stripe-cli-bin ttf-jetbrains-mono-nerd
```

### Full Setup (Run the script)
```bash
chmod +x install-arch-wsl.sh
./install-arch-wsl.sh
```

## Package Comparison Table

| Purpose | macOS (Homebrew) | Arch WSL | Source | Notes |
|---------|-----------------|----------|--------|-------|
| Shell | zsh | zsh | pacman | Pre-installed on macOS, but verified |
| Shell Framework | oh-my-zsh | oh-my-zsh | curl script | ✓ |
| Terminal Multiplexer | tmux | tmux | pacman | ✓ |
| Shell History | atuin | atuin | pacman | ✓ |
| Smart CD | zoxide | zoxide | pacman | ✓ |
| Code Search | ripgrep | ripgrep | pacman | ✓ |
| Fuzzy Finder | fzf | fzf | pacman | ✓ |
| File Finder | fd | fd | pacman | ✓ |
| Directory Tree | tree | tree | pacman | ✓ |
| File Manager | yazi | yazi | pacman | ✓ |
| Python Manager | pyenv | pyenv | pacman | ✓ |
| Python Installer | uv | python-uv | pacman | ✓ |
| Node Manager | nvm | nvm | curl script | ✓ |
| Tunneling | ngrok | ngrok | AUR | ✓ |
| Stripe CLI | stripe | stripe-cli-bin | AUR | ✓ |
| Version Control | git | git | pacman | ✓ |
| GitHub CLI | gh | github-cli | pacman | ✓ |
| Git TUI | lazygit | lazygit | pacman | ✓ |
| Text Editor | neovim | neovim | pacman | ✓ |
| Parser Generator | tree-sitter | tree-sitter | pacman | ✓ |
| Font | font-jetbrains-mono-nerd-font | ttf-jetbrains-mono-nerd | AUR | For Windows Terminal |
| Terminal Emulator | alacritty | ❌ | - | Use Windows version |
| Terminal Emulator | ghostty | ❌ | - | Use Windows version |
| API Client | bruno | ❌ | - | Use Windows version |
| API Mocking | mockoon | ❌ | - | Use Windows version |
| Tunneling | ngrok | ❌ | - | Use Windows version |
| Window Manager | aerospace | ❌ | - | Not applicable in WSL |
| Container Runtime | orbstack | docker* | pacman | *Or Docker Desktop |

## Post-Installation

After running the installation:

1. **Restart your shell**:
   ```bash
   exec $SHELL
   ```

2. **Install Node.js**:
   ```bash
   source ~/.nvm/nvm.sh  # or restart shell
   nvm install node
   ```

3. **Install Python**:
   ```bash
   pyenv install 3.12.0  # or your preferred version
   pyenv global 3.12.0
   ```

4. **Configure tools**:
   ```bash
   # Git
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"

   # GitHub CLI
   gh auth login

   # Atuin
   atuin login  # or: atuin register
   ```

5. **Docker (if installed)**:
   ```bash
   systemctl enable --now docker
   usermod -aG docker $USER
   # Restart WSL session: wsl --shutdown (from Windows)
   ```

## WSL-Specific Tips

### Using Fonts in Windows Terminal
The font is installed in WSL, but to use it in Windows Terminal:
1. Copy font to Windows: `/mnt/c/Windows/Fonts/`
2. Or install from: https://www.nerdfonts.com/
3. Configure in Windows Terminal settings: `"fontFace": "JetBrainsMono Nerd Font"`

### Docker Recommendations
- **Recommended:** Use Docker Desktop for Windows
  - Automatic WSL2 integration
  - Better performance
  - GUI management
  - No need to install Docker in WSL

- **Alternative:** Docker in WSL (what this script offers)
  - More lightweight
  - CLI-only
  - Requires manual setup

### Accessing Windows Files
```bash
# Windows C: drive
cd /mnt/c/

# Your Windows user folder
cd /mnt/c/Users/YourUsername/
```

### Running Windows Commands from WSL
```bash
# Open Windows Explorer in current directory
explorer.exe .

# Open VSCode in current directory (if installed on Windows)
code .
```
