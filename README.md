# Hyprland Dotfiles

Catppuccin Mocha themed Hyprland setup with Waybar, Rofi, SwayNC, and more.

- **Terminal**: Kitty
- **Shell**: Fish
- **Browser**: Firefox
- **Editor**: Neovim
- **Color scheme**: Catppuccin Mocha
- **Icons**: Papirus-Dark
- **Font**: JetBrains Mono Nerd Font

---

## Screenshots

> Lock screen, SDDM login, and desktop use wallpaper from `~/Pictures/wallpapers/6.png`

---

## Installation

### 1. Install packages

```bash
./install.sh
```

This installs all required pacman and AUR packages (uses `paru` for AUR, installs it automatically if missing).

### 2. Apply configs

```bash
./setup.sh
```

This copies all configs to `~/.config` and sets up the SDDM theme.

### 3. Add wallpaper

Place your wallpapers at:
- `~/Pictures/wallpapers/6.png` — desktop wallpaper
- `~/Pictures/wallpapers/6_lock.jpg` — lock screen / SDDM background (optimized JPEG for fast unlock)

---

## Config Paths

| Config | Path |
|--------|------|
| Hyprland | `~/.config/hypr/hyprland.lua` |
| Hyprland keybinds | `~/.config/hypr/lua/keybinds.lua` |
| Hyprland keybinds reference | `~/.config/hypr/KEYBINDINGS.md` |
| Waybar | `~/.config/waybar/config.jsonc` |
| Rofi | `~/.config/rofi/config.rasi` |
| SwayNC | `~/.config/swaync/config.json` |
| Kitty | `~/.config/kitty/kitty.conf` |
| Fish | `~/.config/fish/config.fish` |
| Neovim | `~/.config/nvim/init.lua` |
| Neovim keybinds | `~/.config/nvim/KEYBINDINGS.md` |
| Hyprlock | `~/.config/hypr/hyprlock.conf` |
| Hypridle | `~/.config/hypr/hypridle.conf` |
| Hyprpaper | `~/.config/hypr/hyprpaper.conf` |
| wlogout | `~/.config/wlogout/` |
| SDDM theme | `/usr/share/sddm/themes/sugar-candy/theme.conf` |

---

## Task Commands

```bash
task update   # Copy configs from ~/.config to dotfiles
task apply    # Apply dotfiles to ~/.config
task reload   # Restart Waybar and SwayNC
```

---

## Theme

- **Color scheme**: Catppuccin Mocha
- **Icons**: Papirus-Dark
- **Font**: JetBrains Mono Nerd Font
- **GTK theme**: Adwaita Dark
- **SDDM theme**: sugar-candy (full blur, dark)
- **Window opacity**: 0.89 (browsers and Discord excluded)

---

## Notes

- NVIDIA GPU: `WLR_DRM_DEVICES` and `GBM_BACKEND` are set in `hyprland.lua` for proper rendering
- Lock screen uses an optimized JPEG (`6_lock.jpg`) for instant unlock
- Screen share picker has dark theme with live window/screen previews
- Waybar uses `waybar-git` (AUR) for latest features
