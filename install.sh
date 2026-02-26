#!/bin/bash

# Symlink zsh config
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Symlink nvim config
mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim

# Symlink kitty config
ln -sf ~/dotfiles/kitty ~/.config/kitty

echo "Dotfiles installed!"

# Install Oh My Zsh
echo "Instaling Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k theme
echo "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Autosuggestions
echo "Autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
echo "Syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Install eza"
brew install eza

echo "Fuzzy finding"
brew install fzf
$(brew --prefix)/opt/fzf/install
