# Hyprland Dotfiles

Catppuccin Mocha themed Hyprland setup with Waybar, Rofi, SwayNC, and more.

---

## Screenshots

> Lock screen, SDDM login, and desktop use wallpaper from `~/Pictures/wallpapers/6.png`

---

## Installation

### 1. Install packages

```bash
# Core
sudo pacman -S hyprland waybar rofi swaync hyprlock hypridle hyprpaper \
               alacritty thunar fish grim slurp swappy wl-clipboard \
               brightnessctl playerctl wireplumber pipewire \
               blueman network-manager-applet udiskie copyq \
               papirus-icon-theme ttf-jetbrains-mono-nerd \
               xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
               qt5-graphicaleffects qt5-quickcontrols2 qt5-svg \
               wlogout swayosd wf-recorder hyprshot

# AUR (using paru)
paru -S sddm-sugar-candy-git \
        hyprland-share-picker-preview-git \
        networkmanager-dmenu-git \
        arch-update
```

### 2. Apply configs

```bash
cd ~/dotfiles
task apply
```

### 3. Apply SDDM theme

```bash
sudo mkdir -p /etc/sddm.conf.d
sudo cp sddm/sddm.conf /etc/sddm.conf.d/theme.conf
sudo cp sddm/theme.conf /usr/share/sddm/themes/sugar-candy/theme.conf
# Copy wallpaper
sudo cp ~/Pictures/wallpapers/6_lock.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds/6_lock.jpg
```

### 4. Set default shell to fish

```bash
chsh -s /usr/bin/fish
```

---

## Task Commands

```bash
task update   # Copy configs from ~/.config to dotfiles
task apply    # Apply dotfiles to ~/.config
task reload   # Restart Waybar and SwayNC
```

---

## Keybindings

> `$mod` = Super (Windows key)

### Apps

| Key | Action |
|-----|--------|
| `Super + Enter` | Terminal (Alacritty) |
| `Super + T` | Terminal (Alacritty) |
| `Super + M` | App launcher (Rofi) |
| `Super + B` | Browser (Brave) |
| `Super + E` | File manager (Thunar) |
| `Super + V` | Clipboard manager (CopyQ) |
| `Super + L` | Lock screen |
| `Super + Escape` | Power menu (wlogout) |
| `Super + I` | Network manager |
| `Alt + Tab` | App switcher (all workspaces) |

### Windows

| Key | Action |
|-----|--------|
| `Super + Q` | Close window |
| `Super + F` | Fullscreen |
| `Super + D` | Toggle floating |
| `Super + W` | Toggle Waybar |
| `Super + ←↑↓→` | Move focus |
| `Super + Shift + ←↑↓→` | Move window |
| `Super + Ctrl + ←↑↓→` | Resize window |
| `Super + Mouse Left` | Move window |
| `Super + Mouse Right` | Resize window |

### Workspaces

| Key | Action |
|-----|--------|
| `Super + 1-0` | Switch to workspace 1-10 |
| `Super + Shift + 1-0` | Move window to workspace 1-10 |
| `Super + Tab` | Next workspace |
| `Super + Shift + Tab` | Previous workspace |
| `Super + S` | Toggle special workspace |
| `Super + Shift + S` | Move to special workspace |

### Screenshots

| Key | Action |
|-----|--------|
| `Print` | Region screenshot → clipboard + swappy |
| `Super + Print` | Full screen screenshot → clipboard + swappy |
| `Super + Shift + Print` | Window screenshot → clipboard + swappy |

> Saved to `~/Pictures/Screenshots/`

### Screen Recording

| Key | Action |
|-----|--------|
| `Super + F9` | Record region (toggle) |
| `Super + F10` | Record full screen (toggle) |

> Saved to `~/Videos/Screencasts/`

### Media & System

| Key | Action |
|-----|--------|
| `Volume Up/Down` | Volume ±5% |
| `Mute` | Toggle mute |
| `Brightness Up/Down` | Brightness ±5% |
| `Ctrl + M` | Toggle microphone mute |
| `Media Next/Prev/Play` | Media controls |

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

- NVIDIA GPU: WLR_DRM_DEVICES and GBM_BACKEND are set for proper rendering
- Lock screen uses optimized JPEG (`6_lock.jpg`) for instant unlock
- Screen share picker has dark theme + live window/screen previews
