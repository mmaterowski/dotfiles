#!/bin/bash
set -eu

dotfiles_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
codex_dir="${CODEX_HOME:-$HOME/.codex}"
source_config="$dotfiles_dir/.codex/config.toml"
target_config="$codex_dir/config.toml"

mkdir -p "$codex_dir"
if [ -L "$target_config" ] && [ "$(readlink "$target_config")" = "$source_config" ]; then
  exit 0
fi

if [ -e "$target_config" ] || [ -L "$target_config" ]; then
  backup_config="$(mktemp "$codex_dir/config.toml.backup.XXXXXX")"
  mv -f "$target_config" "$backup_config"
  printf 'Backed up Codex config to %s\n' "$backup_config"
fi

ln -s "$source_config" "$target_config"
