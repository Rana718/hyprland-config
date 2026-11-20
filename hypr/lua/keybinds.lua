-- ══════════════════════════════════════════════════════════════════════════════
--                         KEYBINDINGS
-- ══════════════════════════════════════════════════════════════════════════════

local mod = "SUPER"

-- ─── Helper ──────────────────────────────────────────────────────────────────
local function bind_many(binds, opts)
   for _, b in ipairs(binds) do
      hl.bind(b[1], hl.dsp.exec_cmd(b[2]), b[3] or opts or {})
   end
end

-- ─── Apps ────────────────────────────────────────────────────────────────────
bind_many({
   { mod .. " + Return", TERMINAL },
   { mod .. " + T",      TERMINAL },
   { mod .. " + M",      MENU },
   { mod .. " + B",      BROWSER },
   { mod .. " + E",      FILE_MANAGER },
   { mod .. " + V",      "copyq toggle" },
   { mod .. " + L",      "hyprlock --immediate-render --no-fade-in" },
   { mod .. " + escape", "killall wlogout || wlogout" },
   { mod .. " + I",      "networkmanager_dmenu" },
   { mod .. " + Z",      "zeditor" },
   { mod .. " + W",      "killall -SIGUSR1 waybar" },
})

-- ─── Window Management ───────────────────────────────────────────────────────
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mod .. " + D", hl.dsp.window.float({ action = "toggle" }))

-- ─── Directional (focus / move / resize) ─────────────────────────────────────
local dirs = {
   left  = { dir = "l", dx = -30, dy = 0   },
   right = { dir = "r", dx =  30, dy = 0   },
   up    = { dir = "u", dx =  0,  dy = -30 },
   down  = { dir = "d", dx =  0,  dy =  30 },
}
for arrow, v in pairs(dirs) do
   hl.bind(mod .. " + " .. arrow,              hl.dsp.focus({ direction = v.dir }))
   hl.bind(mod .. " + SHIFT + " .. arrow,      hl.dsp.window.move({ direction = v.dir }))
   hl.bind(mod .. " + CTRL + " .. arrow,       hl.dsp.window.resize({ x = v.dx, y = v.dy, relative = true }))
end

-- ─── Workspaces ──────────────────────────────────────────────────────────────
for i = 1, 10 do
   local key = i % 10
   hl.bind(mod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
   hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Cycle
local cycle = {
   { mod .. " + bracketright",          "e+1", false },
   { mod .. " + bracketleft",           "e-1", false },
   { "CTRL + ALT + right",              "e+1", false },
   { "CTRL + ALT + left",               "e-1", false },
   { "CTRL + SUPER + ALT + right",      "e+1", true  },
   { "CTRL + SUPER + ALT + left",       "e-1", true  },
}
for _, c in ipairs(cycle) do
   local action = c[3] and hl.dsp.window.move or hl.dsp.focus
   hl.bind(c[1], action({ workspace = c[2] }))
end

-- Empty workspace
for arrow in pairs(dirs) do
   hl.bind("CTRL + SHIFT + ALT + " .. arrow,         hl.dsp.focus({ workspace = "empty" }))
   hl.bind("CTRL + SHIFT + ALT + SUPER + " .. arrow, hl.dsp.window.move({ workspace = "empty" }))
end

-- Special workspace
hl.bind(mod .. " + S",       hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- ─── Workspace Overview (hyprexpo) ───────────────────────────────────────────
hl.bind(mod .. " + Tab", function() hl.plugin.hyprexpo.expo("toggle") end)

hl.define_submap("hyprexpo", function()
   for _, arrow in ipairs({ "left", "right", "up", "down" }) do
      local a = arrow
      hl.bind(a, function() hl.plugin.hyprexpo.kb_focus(a) end)
   end
   hl.bind("return", function() hl.plugin.hyprexpo.kb_confirm() end)
   hl.bind("escape", function() hl.plugin.hyprexpo.expo("cancel") end)
   for i = 1, 9 do
      hl.bind(tostring(i), function() hl.plugin.hyprexpo.kb_selecti(i) end)
   end
   hl.bind("0", function() hl.plugin.hyprexpo.kb_selecti(10) end)
end)

-- ─── App Switcher ────────────────────────────────────────────────────────────
hl.bind("ALT + Tab", hl.dsp.exec_cmd(
   "rofi -show window -show-icons -icon-theme Papirus -theme ~/.config/rofi/window.rasi"
))

-- ─── Mouse ───────────────────────────────────────────────────────────────────
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ─── Screenshots ─────────────────────────────────────────────────────────────
bind_many({
   { "Print",               'grim -s 1.2 -g "$(slurp)" - | swappy -f -' },
   { mod .. " + Print",     "grim -s 1.2 - | swappy -f -" },
   { mod .. " + SHIFT + Print", "hyprshot -m window --raw | swappy -f -" },
})

-- ─── Screen Recording ────────────────────────────────────────────────────────
local rec_stop  = 'killall -q wf-recorder && notify-send "Recording stopped" || '
local rec_file  = '-f ~/Videos/Screencasts/recording_$(date +%Y%m%d_%H%M%S).mp4'
local rec_start = 'notify-send "Recording started"'
bind_many({
   { mod .. " + F9",  rec_stop .. '(wf-recorder -g "$(slurp)" ' .. rec_file .. ' & ' .. rec_start .. ')' },
   { mod .. " + F10", rec_stop .. '(wf-recorder ' .. rec_file .. ' & ' .. rec_start .. ')' },
})

-- ─── Volume ──────────────────────────────────────────────────────────────────
local rep_lock = { locked = true, repeating = true }
bind_many({
   { "XF86AudioRaiseVolume", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+", rep_lock },
   { "XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",      rep_lock },
   { "XF86AudioMute",        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",     rep_lock },
   { "XF86AudioMicMute",     "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",   rep_lock },
   { "CTRL + M",             "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" },
})

-- ─── Brightness ──────────────────────────────────────────────────────────────
bind_many({
   { "XF86MonBrightnessUp",   "brightnessctl -e4 -n2 set 5%+", rep_lock },
   { "XF86MonBrightnessDown", "brightnessctl -e4 -n2 set 5%-", rep_lock },
})

-- ─── Media ───────────────────────────────────────────────────────────────────
bind_many({
   { "XF86AudioNext",  "playerctl next" },
   { "XF86AudioPause", "playerctl play-pause" },
   { "XF86AudioPlay",  "playerctl play-pause" },
   { "XF86AudioPrev",  "playerctl previous" },
   { "ALT + F1",       "playerctl previous" },
   { "ALT + F2",       "playerctl play-pause" },
   { "ALT + F3",       "playerctl next" },
}, { locked = true })
