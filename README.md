# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) for Fedora Asahi Linux (and other systems).

## What's Included

| Package | Description |
|---------|-------------|
| `alacritty` | Alacritty terminal configuration |
| `btop` | System monitor configuration |
| `claude` | Claude Code CLI settings and templates |
| `environment` | Environment variables (environment.d) |
| `fastfetch` | System info fetch configuration |
| `fish` | Fish shell configuration |
| `fontconfig` | Font configuration (Victor Mono Nerd Font) |
| `ghostty` | Ghostty terminal configuration |
| `git` | Git configuration and global gitignore |
| `hypr` | Hyprland window manager (includes hypridle, hyprlock) |
| `i3` | i3 window manager configuration |
| `kitty` | Kitty terminal configuration |
| `lazydocker` | Lazydocker TUI configuration |
| `lazygit` | Lazygit TUI configuration |
| `nvim` | Neovim configuration with LSP setup |
| `starship` | Starship prompt configuration |
| `sway` | Sway window manager configuration |
| `tmux` | Tmux configuration with plugins |
| `vscode` | VS Code settings and keybindings |
| `walker` | Walker launcher configuration |
| `waybar` | Waybar status bar configuration |
| `xremap` | Key remapping configuration |
| `zsh` | Zsh configuration with Oh My Zsh |

## Quick Start on New Machine

```bash
# Clone the repository
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles

# Install all configs (creates symlinks)
./stow.sh install

# Or install specific packages
stow nvim zsh tmux
```

## Usage

### Installing Configs

```bash
# Install all packages
./stow.sh install

# Install specific package
stow nvim

# Install multiple packages
stow nvim zsh tmux kitty
```

### Updating Configs

Configs are symlinked, so just edit them normally:

```bash
# Edit a config file (it's symlinked to ~/.dotfiles)
nvim ~/.config/nvim/init.lua

# Commit changes
cd ~/.dotfiles
git add -A
git commit -m "Update nvim config"
# Auto-pushes via post-commit hook if remotes are configured
```

### Adding New Configs

```bash
# 1. Create the stow directory structure
mkdir -p ~/.dotfiles/newapp/.config/newapp

# 2. Copy or move your config files
cp ~/.config/newapp/config.toml ~/.dotfiles/newapp/.config/newapp/

# 3. Remove original and stow
rm ~/.config/newapp/config.toml
stow newapp

# 4. Commit
git add newapp
git commit -m "Add newapp config"
```

For home-directory files (like `.bashrc`):

```bash
mkdir -p ~/.dotfiles/bash
cp ~/.bashrc ~/.dotfiles/bash/
rm ~/.bashrc
stow bash
```

### Restowing (After Conflicts)

```bash
# Restow all packages (removes and re-creates symlinks)
./stow.sh restow

# Restow specific package
stow -R nvim
```

### Uninstalling

```bash
# Remove all symlinks
./stow.sh uninstall

# Unstow specific package
stow -D nvim
```

## Adding Remote Repositories

```bash
# Add GitHub remote
git remote add origin git@github.com:USERNAME/dotfiles.git
git push -u origin main

# Add secondary remote (e.g., self-hosted, Raspberry Pi)
git remote add pi ssh://stan@PI-IP/~/git-repos/dotfiles.git
git push pi main
```

After adding remotes, the post-commit hook will auto-push to all configured remotes.

## Directory Structure

```
~/.dotfiles/
├── alacritty/.config/alacritty/
├── btop/.config/btop/
├── claude/.claude/
├── nvim/.config/nvim/
├── zsh/
│   ├── .zshrc
│   └── .zshrc-personal
├── tmux/
│   └── .tmux.conf
├── scripts/           # Helper scripts (not stowed)
├── stow.sh            # Stow helper script
├── .gitignore
└── README.md
```

## What's NOT Included

The following are explicitly excluded from this repository:

- **SSH keys** (`~/.ssh/`)
- **GPG keys** (`~/.gnupg/`)
- **Credentials and tokens** (any `*token*`, `*secret*`, `.credentials.json`)
- **Shell history** (`.bash_history`, `.zsh_history`, etc.)
- **Application caches** (Neovim plugins, VS Code storage, etc.)
- **Browser profiles** (Firefox, Chrome, Brave)

## Tips

### Handling Conflicts

If stow fails due to existing files:

```bash
# Check what would happen (dry run)
stow -n nvim

# Backup and remove conflicting files, then stow
mv ~/.config/nvim ~/.config/nvim.backup
stow nvim
```

### Selective Installation

You can install only what you need:

```bash
# Minimal setup
stow zsh git nvim

# Full desktop setup
stow hypr waybar kitty
```

### Per-Machine Customization

For machine-specific settings, use local override files that aren't tracked:

```bash
# Example: local zsh config
echo 'source ~/.zshrc-local' >> ~/.dotfiles/zsh/.zshrc
# Then create ~/.zshrc-local on each machine (not tracked)
```
