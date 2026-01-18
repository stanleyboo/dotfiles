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

# Detect Hyprland version (returns "legacy" for <0.53, "modern" for >=0.53)
get_hyprland_version_type() {
    if command -v hyprctl &>/dev/null; then
        version=$(hyprctl version 2>/dev/null | grep -oP 'Hyprland \K[0-9]+\.[0-9]+' | head -1)
        if [ -n "$version" ]; then
            major=$(echo "$version" | cut -d. -f1)
            minor=$(echo "$version" | cut -d. -f2)
            # 0.53+ uses modern syntax
            if [ "$major" -gt 0 ] || ([ "$major" -eq 0 ] && [ "$minor" -ge 53 ]); then
                echo "modern"
                return
            fi
        fi
    fi
    # Default to legacy for older versions or if hyprctl not available
    echo "legacy"
}

# Post-install setup for device-specific configs
post_install() {
    # Create hypr device.conf if it doesn't exist
    if [ ! -f "$HOME/.config/hypr/device.conf" ]; then
        echo "  Setting up hypr device.conf..."
        if grep -q "microsoft\|WSL" /proc/version 2>/dev/null; then
            # WSL/Windows - use ALT as mainMod
            cp "$HOME/.config/hypr/device.conf.windows" "$HOME/.config/hypr/device.conf"
            echo "    Created device.conf with mainMod=ALT (Windows/WSL detected)"
        else
            # Linux - use SUPER as mainMod
            cp "$HOME/.config/hypr/device.conf.linux" "$HOME/.config/hypr/device.conf"
            echo "    Created device.conf with mainMod=SUPER (Linux detected)"
        fi
    fi

    # Setup version-specific Hyprland configs
    version_type=$(get_hyprland_version_type)
    echo "  Setting up Hyprland configs for $version_type syntax..."

    if [ ! -f "$HOME/.config/hypr/windowrules.conf" ]; then
        cp "$HOME/.config/hypr/windowrules.conf.$version_type" "$HOME/.config/hypr/windowrules.conf"
        echo "    Created windowrules.conf ($version_type)"
    fi

    if [ ! -f "$HOME/.config/hypr/looknfeel.conf" ]; then
        cp "$HOME/.config/hypr/looknfeel.conf.$version_type" "$HOME/.config/hypr/looknfeel.conf"
        echo "    Created looknfeel.conf ($version_type)"
    fi
}

case "$1" in
    install)
        echo "Installing all dotfiles packages..."
        for pkg in $(get_packages); do
            echo "  Stowing $pkg"
            stow -v "$pkg" 2>&1 | grep -v "^BUG" || true
        done
        post_install
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
        post_install
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
