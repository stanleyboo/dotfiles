#!/bin/bash
# Quick stow/unstow helper for dotfiles management
# Usage: ./stow.sh {install|uninstall|restow|list|status}

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES_DIR"

# Get all stow packages (directories excluding .git, scripts, and hidden dirs)
get_packages() {
    find . -maxdepth 1 -type d \
        ! -name '.' \
        ! -name '.git' \
        ! -name 'scripts' \
        -printf '%f\n' | sort
}

case "$1" in
    install)
        echo "Installing all dotfiles packages..."
        for pkg in $(get_packages); do
            echo "  Stowing $pkg"
            stow -v "$pkg" 2>&1 | grep -v "^BUG" || true
        done
        echo "Done!"
        ;;
    uninstall)
        echo "Uninstalling all dotfiles packages..."
        for pkg in $(get_packages); do
            echo "  Unstowing $pkg"
            stow -D -v "$pkg" 2>&1 | grep -v "^BUG" || true
        done
        echo "Done!"
        ;;
    restow)
        echo "Restowing all dotfiles packages..."
        for pkg in $(get_packages); do
            echo "  Restowing $pkg"
            stow -R -v "$pkg" 2>&1 | grep -v "^BUG" || true
        done
        echo "Done!"
        ;;
    list)
        echo "Available packages:"
        for pkg in $(get_packages); do
            echo "  - $pkg"
        done
        ;;
    status)
        echo "Checking stow status for each package..."
        for pkg in $(get_packages); do
            if stow -n "$pkg" 2>&1 | grep -q "LINK"; then
                echo "  [NEEDS STOW] $pkg"
            else
                echo "  [OK] $pkg"
            fi
        done
        ;;
    *)
        echo "Dotfiles Stow Helper"
        echo ""
        echo "Usage: $0 {install|uninstall|restow|list|status}"
        echo ""
        echo "Commands:"
        echo "  install    - Stow all packages (create symlinks)"
        echo "  uninstall  - Unstow all packages (remove symlinks)"
        echo "  restow     - Restow all packages (refresh symlinks)"
        echo "  list       - List available packages"
        echo "  status     - Check which packages need stowing"
        exit 1
        ;;
esac
