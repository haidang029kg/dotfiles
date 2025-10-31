#!/bin/bash

# Setup faster key repeat on macOS
# Source: https://mac-key-repeat.zaymon.dev/

echo "Setting up faster key repeat settings..."

# Set initial key repeat delay (lower = faster)
# 10-15 is good balance: prevents accidental repeats while typing, but still responsive for Vim
defaults write -g InitialKeyRepeat -int 12

# Set key repeat rate (lower = faster)
# 1-2 is very fast for smooth Vim navigation
defaults write -g KeyRepeat -int 1

# Disable press and hold for special characters
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Key repeat settings applied successfully!"
echo "Note: You may need to restart your applications for changes to take full effect."
