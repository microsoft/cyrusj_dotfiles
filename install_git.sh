#!/bin/bash

# Git dotfile installation script
# This script will backup your existing .gitconfig and install the dotfile version

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup"

echo "Installing git configuration..."

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Created backup directory: $BACKUP_DIR"
fi

# Backup existing .gitconfig if it exists
if [ -f "$HOME/.gitconfig" ]; then
    cp "$HOME/.gitconfig" "$BACKUP_DIR/.gitconfig.$(date +%Y%m%d_%H%M%S)"
    echo "Backed up existing .gitconfig"
fi

# Install the new .gitconfig
cp "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
echo "Installed .gitconfig from dotfiles"

# Verify installation
if git config --global user.name > /dev/null 2>&1; then
    echo "✅ Git configuration installed successfully!"
    echo "User: $(git config --global user.name) <$(git config --global user.email)>"
else
    echo "❌ Something went wrong with the installation"
    exit 1
fi

echo "Done!"
