#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to check if a package is installed
is_installed() {
    pacman -Q "$1" &>/dev/null
}

# Install foot terminal if not already installed
if ! is_installed foot; then
    echo "Installing foot terminal..."
    sudo pacman -S --noconfirm foot foot-terminfo
else
    echo "Foot terminal is already installed."
fi

# Install zsh if not already installed
if ! is_installed zsh; then
    echo "Installing zsh..."
    sudo pacman -S --noconfirm zsh
else
    echo "Zsh is already installed."
fi

# Set zsh as the default shell for the current user
ZSH_PATH=$(which zsh)
if [ "$SHELL" != "$ZSH_PATH" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$ZSH_PATH"
    echo "Default shell changed to zsh. Please log out and log back in for the change to take effect."
else
    echo "Zsh is already set as the default shell."
fi
