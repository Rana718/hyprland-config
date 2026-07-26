-- ══════════════════════════════════════════════════════════════════════════════
--                         KEYBINDINGS
-- ══════════════════════════════════════════════════════════════════════════════

local mod = "SUPER"

local terminal    = "alacritty"
local fileManager = "thunar"
local browser     = "brave"
local menu        = "rofi -show drun -show-icons"


-- ─── Apps ─────────────────────────────────────────────────────────────────────
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + T",      hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + M",      hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + B",      hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + V",      hl.dsp.exec_cmd("copyq toggle"))
hl.bind(mod .. " + L",      hl.dsp.exec_cmd("hyprlock --immediate-render --no-fade-in"))
hl.bind(mod .. " + escape", hl.dsp.exec_cmd("killall wlogout || wlogout"))
hl.bind(mod .. " + I",      hl.dsp.exec_cmd("networkmanager_dmenu"))
hl.bind(mod .. " + Z",      hl.dsp.exec_cmd("zeditor"))


-- ─── Window Management ────────────────────────────────────────────────────────
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mod .. " + D", hl.dsp.window.float())
hl.bind(mod .. " + W", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))


-- ─── Focus ────────────────────────────────────────────────────────────────────
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))


-- ─── Resize ───────────────────────────────────────────────────────────────────
hl.bind(mod .. " + CTRL + left",  hl.dsp.window.resize({ x = -30, y = 0,   relative = true }))
hl.bind(mod .. " + CTRL + right", hl.dsp.window.resize({ x = 30,  y = 0,   relative = true }))
hl.bind(mod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0,   y = -30, relative = true }))
hl.bind(mod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0,   y = 30,  relative = true }))


-- ─── Move Window ──────────────────────────────────────────────────────────────
hl.bind(mod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))


-- ─── App Switcher ─────────────────────────────────────────────────────────────
hl.bind("ALT + Tab", hl.dsp.exec_cmd(
    "rofi -show window -show-icons -icon-theme Papirus -theme ~/.config/rofi/window.rasi"
))


-- ─── Workspaces ───────────────────────────────────────────────────────────────
for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("CTRL + ALT + left",              hl.dsp.focus({ workspace = "e-1" }))
hl.bind("CTRL + ALT + right",             hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + TAB",                  hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + SHIFT + TAB",          hl.dsp.focus({ workspace = "e-1" }))
hl.bind("CTRL + " .. mod .. " + ALT + left",  hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("CTRL + " .. mod .. " + ALT + right", hl.dsp.window.move({ workspace = "e+1" }))

-- Special workspace
hl.bind(mod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


-- ─── Mouse ────────────────────────────────────────────────────────────────────
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- ─── Screenshots ──────────────────────────────────────────────────────────────
hl.bind("Print",                   hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))
hl.bind(mod .. " + Print",         hl.dsp.exec_cmd("grim - | swappy -f -"))
hl.bind(mod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window --raw | swappy -f -"))


-- ─── Screen Recording ─────────────────────────────────────────────────────────
hl.bind(mod .. " + F9",  hl.dsp.exec_cmd(
    "killall -q wf-recorder && notify-send 'Recording stopped' || " ..
    "(wf-recorder -g \"$(slurp)\" -f ~/Videos/Screencasts/recording_$(date +%Y%m%d_%H%M%S).mp4 " ..
    "& notify-send 'Recording started')"
))
hl.bind(mod .. " + F10", hl.dsp.exec_cmd(
    "killall -q wf-recorder && notify-send 'Recording stopped' || " ..
    "(wf-recorder -f ~/Videos/Screencasts/recording_$(date +%Y%m%d_%H%M%S).mp4 " ..
    "& notify-send 'Recording started')"
))


-- ─── Volume ───────────────────────────────────────────────────────────────────
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true })
hl.bind("CTRL + M",             hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))


-- ─── Brightness ───────────────────────────────────────────────────────────────
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })


-- ─── Media ────────────────────────────────────────────────────────────────────
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("ALT + F1",       hl.dsp.exec_cmd("playerctl previous"))
hl.bind("ALT + F2",       hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("ALT + F3",       hl.dsp.exec_cmd("playerctl next"))
