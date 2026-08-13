-- ══════════════════════════════════════════════════════════════════════════════
--                         WINDOW RULES & LAYER RULES
-- ══════════════════════════════════════════════════════════════════════════════

local OPAQUE = "1.0 override 1.0 override"

-- ─── Floating by class ───────────────────────────────────────────────────────
local float_classes = {
   { "^(com.github.hluk.copyq)$",                    { 600, 600 } },
   { "^(copyq)$",                                    { 600, 600 } },
   { "^(pavucontrol)$",                              { 900, 600 } },
   { "^(org.pulseaudio.pavucontrol)$",               { 900, 600 } },
   { "^(nm-connection-editor)$",                     nil },
   { "^(blueman-manager)$",                          nil },
   { "^(org.hyprland.xdg-desktop-portal-hyprland)$", nil },
}
for _, r in ipairs(float_classes) do
   local rule = { match = { class = r[1] }, float = true }
   if r[2] then rule.size = r[2] end
   hl.window_rule(rule)
end

-- ─── Floating by title ───────────────────────────────────────────────────────
for _, title in ipairs({ "^(Rename .*)$", "^(File Operation Progress)$", "^(Open File)$", "^(Save File)$" }) do
   hl.window_rule({ match = { title = title }, float = true })
end

-- Thunar dialogs
hl.window_rule({ match = { class = "^(thunar)$", initial_title = "negative:rana - Thunar" }, float = true, size = { 900, 600 } })

-- ─── Opaque windows ──────────────────────────────────────────────────────────
for _, class in ipairs({ "^(brave-browser)$", "^(google-chrome)$", "^(chromium)$", "^(firefox)$", "^(discord)$" }) do
   hl.window_rule({ match = { class = class }, opacity = OPAQUE })
end


-- ─── Firefox Picture-in-Picture ──────────────────────────────────────────────
hl.window_rule({
   match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
   float = true,
   pin = true,
   no_initial_focus = true,
   focus_on_activate = false,
   size = { 350, 200 },
   opacity = OPAQUE,
})

-- ─── Google Login Popups ─────────────────────────────────────────────────────
for _, title_key in ipairs({
   { title = "^(Sign in - Google Accounts - Google Chrome)$" },
   { initial_title = "^(Untitled - Google Chrome)$" },
}) do
   local match = { class = "^(google-chrome)$" }
   for k, v in pairs(title_key) do match[k] = v end
   hl.window_rule({ match = match, float = true, size = { 500, 600 }, center = true })
end

-- ─── Gaming ──────────────────────────────────────────────────────────────────
for _, class in ipairs({ "^(cs2)$", "^(steam_app_.*)$" }) do
   hl.window_rule({ match = { class = class }, content = "game" })
end

-- ─── Layer Rules ─────────────────────────────────────────────────────────────
local layer_rules = {
   { "waybar", 0.05 },
   { "rofi",   0.5 },
   { "swaync", 0.5 },
}
for _, r in ipairs(layer_rules) do
   hl.layer_rule({ match = { namespace = r[1] }, blur = true, ignore_alpha = r[2] })
end

-- Fix: Ensure rofi popups render above waybar and receive mouse input
hl.layer_rule({ match = { namespace = "rofi" }, order = 1 })
