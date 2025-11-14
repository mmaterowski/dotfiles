#!/bin/bash

# Symlink zsh config
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Symlink nvim config
mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim

echo "Dotfiles installed!"
