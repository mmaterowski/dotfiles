# Dotfiles

Personal macOS setup for Zsh, LazyVim, and Kitty.

## Install

Install Xcode Command Line Tools, Git, and [Homebrew](https://brew.sh/), then clone this repository and run `./install.sh`. The installer installs the packages in `Brewfile`, clones Oh My Zsh and its configured plugins, and links the shell, editor, and terminal configuration. Existing files or directories are moved to a uniquely named backup directory in your home directory; running it again leaves correct links alone. Open a new shell afterward.

Run `brew bundle check --no-upgrade --file=Brewfile` to check the package list. The installer does not pin package versions. Neovim installs its plugins on first launch. Run `p10k configure` to create your local prompt configuration.

For the work-specific Kitty session, edit `kitty/startup.conf` for your projects and launch it with `kitty --session ~/.config/kitty/startup.conf`. Normal Kitty launches open a shell. Node, Angular CLI, Claude, Ollama and its models, yt-dlp, Whisper, and other project-specific tools are optional and installed separately. The `task` shell function expects Ollama with `qwen2.5-coder:7b` and Glow; Neovim's local completion expects `qwen2.5-coder:3b`.

## Codex

Codex keeps credentials, trust decisions, plugins, and app-managed runtime paths in its local configuration. Configure these on each machine; do not copy the entire live configuration between accounts. The tracked `.codex/config.toml` is this machine's existing configuration, not a portable bootstrap template. `scripts/link-codex.sh` remains available as an explicit opt-in to link that file; it backs up an existing configuration before linking. Opening a shell does not run it.
