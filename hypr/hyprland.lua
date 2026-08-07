-- ══════════════════════════════════════════════════════════════════════════════
--                    HYPRLAND CONFIGURATION ENTRY POINT
-- ══════════════════════════════════════════════════════════════════════════════

-- ─── Programs (used in keybinds) ─────────────────────────────────────────────
TERMINAL     = "alacritty"
FILE_MANAGER = "thunar"
BROWSER      = "firefox"
MENU         = "rofi -show drun -show-icons"

-- ─── Modules ─────────────────────────────────────────────────────────────────
require("lua/display")
require("lua/autostart")
require("lua/keybinds")
require("lua/windowrules")
