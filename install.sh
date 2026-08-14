#!/usr/bin/env bash
# ══════════════════════════════════════════════════════════════════════════════
#                        INSTALL.SH
#   Installs all packages required for this Hyprland dotfiles config
# ══════════════════════════════════════════════════════════════════════════════

set -e

echo "══════════════════════════════════════════════════════"
echo "        Hyprland Dotfiles — Package Installer"
echo "══════════════════════════════════════════════════════"
echo ""

# ─── Check for paru ───────────────────────────────────────────────────────────
if ! command -v paru &>/dev/null; then
    echo "paru not found. Installing paru (AUR helper)..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    (cd /tmp/paru && makepkg -si --noconfirm)
    rm -rf /tmp/paru
    echo "✓ paru installed"
fi

# ─── Pacman packages ──────────────────────────────────────────────────────────
echo ""
echo "Installing pacman packages..."

sudo pacman -S --needed --noconfirm \
    hyprland \
    hyprlock \
    hypridle \
    hyprpaper \
    kitty \
    thunar \
    fish \
    firefox \
    rofi \
    swaync \
    swayosd \
    grim \
    slurp \
    swappy \
    wl-clipboard \
    cliphist \
    copyq \
    brightnessctl \
    playerctl \
    wireplumber \
    pipewire \
    pipewire-pulse \
    pipewire-alsa \
    blueman \
    network-manager-applet \
    networkmanager \
    udiskie \
    wf-recorder \
    wlogout \
    fastfetch \
    btop \
    papirus-icon-theme \
    ttf-jetbrains-mono-nerd \
    polkit-gnome \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    qt5-graphicaleffects \
    qt5-quickcontrols2 \
    qt5-svg \
    neovim \
    zed

echo "✓ Pacman packages installed"

# ─── AUR packages ─────────────────────────────────────────────────────────────
echo ""
echo "Installing AUR packages..."

paru -S --needed --noconfirm \
    waybar-git \
    sddm-sugar-candy-git \
    hyprshot \
    hyprland-share-picker-preview-git \
    networkmanager-dmenu-git \
    arch-update

echo "✓ AUR packages installed"

# ─── Create required directories ──────────────────────────────────────────────
echo ""
echo "Creating required directories..."
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Videos/Screencasts
mkdir -p ~/Pictures/wallpapers
echo "✓ Directories created"

# ─── Set fish as default shell ────────────────────────────────────────────────
echo ""
if [ "$SHELL" != "/usr/bin/fish" ]; then
    echo "Setting fish as default shell..."
    chsh -s /usr/bin/fish
    echo "✓ Default shell set to fish"
else
    echo "✓ Fish is already the default shell"
fi

echo ""
echo "══════════════════════════════════════════════════════"
echo "  All packages installed successfully!"
echo "  Run ./setup.sh to apply the configs."
echo "══════════════════════════════════════════════════════"
