#!/bin/bash
set -eu

repo="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
command -v brew >/dev/null || { echo 'Install Homebrew first: https://brew.sh/' >&2; exit 1; }
brew bundle install --no-upgrade --file="$repo/Brewfile"

zsh_dir="$HOME/.oh-my-zsh"
custom="${ZSH_CUSTOM:-$zsh_dir/custom}"
clone_if_missing() {
  if [ ! -d "$2" ]; then
    mkdir -p "$(dirname "$2")"
    git clone --depth=1 "$1" "$2"
  fi
}
clone_if_missing https://github.com/ohmyzsh/ohmyzsh.git "$zsh_dir"
clone_if_missing https://github.com/romkatv/powerlevel10k.git "$custom/themes/powerlevel10k"
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions.git "$custom/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting.git "$custom/plugins/zsh-syntax-highlighting"

backup_dir=''
link_config() {
  local source="$1" target="$2"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    return
  fi
  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ -z "$backup_dir" ]; then
      backup_dir="$(mktemp -d "$HOME/.dotfiles-backup.XXXXXX")"
      printf 'Backing up existing configuration to %s\n' "$backup_dir"
    fi
    mv "$target" "$backup_dir/$(basename "$target")"
  fi
  ln -s "$source" "$target"
}
mkdir -p "$HOME/.config"
link_config "$repo/.zshrc" "$HOME/.zshrc"
link_config "$repo/nvim" "$HOME/.config/nvim"
link_config "$repo/kitty" "$HOME/.config/kitty"
printf 'Dotfiles installed. Open a new shell.\n'
