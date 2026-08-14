#!/usr/bin/env bash
# ══════════════════════════════════════════════════════════════════════════════
#                         SETUP.SH
#   Applies all dotfiles configs to ~/.config and sets up SDDM theme
# ══════════════════════════════════════════════════════════════════════════════

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "══════════════════════════════════════════════════════"
echo "        Hyprland Dotfiles — Config Setup"
echo "══════════════════════════════════════════════════════"
echo ""

# ─── Create config dirs ───────────────────────────────────────────────────────
echo "Creating config directories..."
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/swaync
mkdir -p ~/.config/wlogout
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/kitty
mkdir -p ~/.config/swappy
mkdir -p ~/.config/networkmanager-dmenu
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/btop/themes
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/fish
echo "✓ Directories ready"

# ─── Hyprland ─────────────────────────────────────────────────────────────────
echo ""
echo "Applying Hyprland config..."
cp -r "$DOTFILES_DIR/hypr/"* ~/.config/hypr/
echo "✓ Hyprland config applied"

# ─── Waybar ───────────────────────────────────────────────────────────────────
echo "Applying Waybar config..."
cp -r "$DOTFILES_DIR/waybar/"* ~/.config/waybar/
echo "✓ Waybar config applied"

# ─── Rofi ─────────────────────────────────────────────────────────────────────
echo "Applying Rofi config..."
cp -r "$DOTFILES_DIR/rofi/"* ~/.config/rofi/
echo "✓ Rofi config applied"

# ─── SwayNC ───────────────────────────────────────────────────────────────────
echo "Applying SwayNC config..."
cp -r "$DOTFILES_DIR/swaync/"* ~/.config/swaync/
echo "✓ SwayNC config applied"

# ─── wlogout ──────────────────────────────────────────────────────────────────
echo "Applying wlogout config..."
cp -r "$DOTFILES_DIR/wlogout/"* ~/.config/wlogout/
echo "✓ wlogout config applied"

# ─── Alacritty ────────────────────────────────────────────────────────────────
echo "Applying Alacritty config..."
cp -r "$DOTFILES_DIR/alacritty/"* ~/.config/alacritty/
echo "✓ Alacritty config applied"

# ─── Kitty ────────────────────────────────────────────────────────────────────
echo "Applying Kitty config..."
cp -r "$DOTFILES_DIR/kitty/"* ~/.config/kitty/
echo "✓ Kitty config applied"

# ─── Swappy ───────────────────────────────────────────────────────────────────
echo "Applying Swappy config..."
cp -r "$DOTFILES_DIR/swappy/"* ~/.config/swappy/
echo "✓ Swappy config applied"

# ─── Networkmanager-dmenu ─────────────────────────────────────────────────────
echo "Applying networkmanager-dmenu config..."
cp -r "$DOTFILES_DIR/networkmanager-dmenu/"* ~/.config/networkmanager-dmenu/
echo "✓ networkmanager-dmenu config applied"

# ─── Fastfetch ────────────────────────────────────────────────────────────────
echo "Applying Fastfetch config..."
cp -r "$DOTFILES_DIR/fastfetch/"* ~/.config/fastfetch/
echo "✓ Fastfetch config applied"

# ─── Btop ─────────────────────────────────────────────────────────────────────
echo "Applying Btop config..."
cp "$DOTFILES_DIR/btop/btop.conf" ~/.config/btop/
cp -r "$DOTFILES_DIR/btop/themes/"* ~/.config/btop/themes/
echo "✓ Btop config applied"

# ─── Neovim ───────────────────────────────────────────────────────────────────
echo "Applying Neovim config..."
cp "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/
cp -r "$DOTFILES_DIR/nvim/lua/"* ~/.config/nvim/lua/
cp -r "$DOTFILES_DIR/nvim/plugin/"* ~/.config/nvim/plugin/
echo "✓ Neovim config applied"

# ─── Fish ─────────────────────────────────────────────────────────────────────
echo "Applying Fish config..."
cp "$DOTFILES_DIR/fish/config.fish" ~/.config/fish/config.fish
cp "$DOTFILES_DIR/fish/fish_plugins" ~/.config/fish/fish_plugins
echo "✓ Fish config applied"

# ─── SDDM theme ───────────────────────────────────────────────────────────────
echo ""
echo "Applying SDDM theme (requires sudo)..."
sudo mkdir -p /etc/sddm.conf.d
sudo cp "$DOTFILES_DIR/sddm/sddm.conf" /etc/sddm.conf.d/theme.conf
sudo cp "$DOTFILES_DIR/sddm/theme.conf" /usr/share/sddm/themes/sugar-candy/theme.conf

# Copy lock wallpaper if it exists
if [ -f ~/Pictures/wallpapers/6_lock.jpg ]; then
    sudo cp ~/Pictures/wallpapers/6_lock.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds/6_lock.jpg
    echo "✓ SDDM lock wallpaper copied"
else
    echo "⚠ ~/Pictures/wallpapers/6_lock.jpg not found — copy it manually for the SDDM background"
fi
echo "✓ SDDM theme applied"

echo ""
echo "══════════════════════════════════════════════════════"
echo "  All configs applied successfully!"
echo "  Log out and log back in (or reboot) to take effect."
echo "══════════════════════════════════════════════════════"
