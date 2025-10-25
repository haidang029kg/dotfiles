#!/bin/bash

# Setup faster key repeat on macOS
# Source: https://mac-key-repeat.zaymon.dev/

echo "Setting up faster key repeat settings..."

# Set initial key repeat delay (lower = faster)
defaults write -g InitialKeyRepeat -int 8

# Set key repeat rate (lower = faster)
defaults write -g KeyRepeat -int 2

# Disable press and hold for special characters
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Key repeat settings applied successfully!"
echo "Note: You may need to restart your applications for changes to take full effect."
