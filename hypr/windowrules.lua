-- ══════════════════════════════════════════════════════════════════════════════
--                         WINDOW RULES
-- ══════════════════════════════════════════════════════════════════════════════

-- ─── Floating Windows ────────────────────────────────────────────────────────
hl.window_rule({ match = { class = "^(com.github.hluk.copyq)$" }, float = true, size = { 600, 600 } })
hl.window_rule({ match = { class = "^(copyq)$" }, float = true, size = { 600, 600 } })

hl.window_rule({ match = { class = "^(org.hyprland.xdg-desktop-portal-hyprland)$" }, float = true })

hl.window_rule({ match = { class = "^(pavucontrol)$" }, float = true, size = { 900, 600 } })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true, size = { 900, 600 } })

-- Thunar dialogs (float if not main window)
hl.window_rule({
   match = { class = "^(thunar)$", initial_title = "negative:rana - Thunar" },
   float = true,
   size = { 900, 600 },
})

hl.window_rule({ match = { title = "^(Rename .*)$" }, float = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { title = "^(File Operation Progress)$" }, float = true })
hl.window_rule({ match = { title = "^(Open File)$" }, float = true })
hl.window_rule({ match = { title = "^(Save File)$" }, float = true })

-- ─── Gaming (tearing) ───────────────────────────────────────────────────────
hl.window_rule({ match = { class = "^(cs2)$" }, content = "game" })
hl.window_rule({ match = { class = "^(steam_app_.*)$" }, content = "game" })

-- ─── Opacity Exceptions (browsers + Discord = fully opaque) ─────────────────
hl.window_rule({ match = { class = "^(brave-browser)$" }, opacity = "1.0 override 1.0 override" })
hl.window_rule({ match = { class = "^(google-chrome)$" }, opacity = "1.0 override 1.0 override" })
hl.window_rule({ match = { class = "^(chromium)$" }, opacity = "1.0 override 1.0 override" })
hl.window_rule({ match = { class = "^(firefox)$" }, opacity = "1.0 override 1.0 override" })
hl.window_rule({ match = { class = "^(discord)$" }, opacity = "1.0 override 1.0 override" })

-- ─── Google Login Popup ──────────────────────────────────────────────────────
hl.window_rule({
   match = { class = "^(google-chrome)$", title = "^(Sign in - Google Accounts - Google Chrome)$" },
   float = true,
   size = { 500, 600 },
   center = true,
})
hl.window_rule({
   match = { class = "^(google-chrome)$", initial_title = "^(Untitled - Google Chrome)$" },
   float = true,
   size = { 500, 600 },
   center = true,
})

-- ─── Firefox Picture-in-Picture ─────────────────────────────────────────────
hl.window_rule({
   match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
   float = true,
   pin = true,
   no_initial_focus = true,
   focus_on_activate = false,
   size = { 350, 200 },
   opacity = "1.0 override 1.0 override",
})

-- ─── Layer Rules ─────────────────────────────────────────────────────────────
-- Enable blur for waybar and rofi
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync" }, blur = true, ignore_alpha = 0.5 })
