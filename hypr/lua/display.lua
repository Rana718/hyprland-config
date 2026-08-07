-- ══════════════════════════════════════════════════════════════════════════════
--                         DISPLAY & GPU CONFIGURATION
-- ══════════════════════════════════════════════════════════════════════════════

-- ─── Monitor ─────────────────────────────────────────────────────────────────
hl.monitor({ output = "eDP-1", mode = "1920x1080@144", position = "auto", scale = 1.2 })

-- ─── Environment Variables ───────────────────────────────────────────────────
local env = {
   -- NVIDIA GPU
   __GLX_VENDOR_LIBRARY_NAME           = "nvidia",
   __NV_PRIME_RENDER_OFFLOAD           = "1",
   __VK_LAYER_NV_optimus               = "NVIDIA_only",
   GBM_BACKEND                         = "nvidia-drm",
   WLR_NO_HARDWARE_CURSORS             = "1",
   ELECTRON_OZONE_PLATFORM_HINT        = "auto",
   -- VA-API (Intel iHD for Chromium renderer)
   LIBVA_DRIVER_NAME                   = "iHD",
   LIBVA_DRM_DEVICE                    = "/dev/dri/renderD128",
   -- Wayland / toolkits
   XDG_SESSION_TYPE                    = "wayland",
   XDG_CURRENT_DESKTOP                 = "Hyprland",
   XDG_SESSION_DESKTOP                 = "Hyprland",
   QT_QPA_PLATFORM                     = "wayland",
   QT_QPA_PLATFORMTHEME                = "qt6ct",
   QT_WAYLAND_DISABLE_WINDOWDECORATION = "1",
   QT_AUTO_SCREEN_SCALE_FACTOR         = "1",
   GDK_BACKEND                         = "wayland,x11,*",
   SDL_VIDEODRIVER                     = "wayland",
   CLUTTER_BACKEND                     = "wayland",
   MOZ_ENABLE_WAYLAND                  = "1",
   -- Cursor / GTK
   XCURSOR_SIZE                        = "24",
   XCURSOR_THEME                       = "Adwaita",
   GTK_THEME                           = "Adwaita:dark",
   ADW_DISABLE_PORTAL                  = "1",
}
for k, v in pairs(env) do hl.env(k, v) end

-- ─── Hyprland Config (single call) ───────────────────────────────────────────
hl.config({
   cursor = {
      no_hardware_cursors = true,
      no_break_fs_vrr     = true,
   },
   misc = {
      force_default_wallpaper      = 0,
      disable_hyprland_logo        = true,
      vrr                          = 0,
      animate_manual_resizes       = false,
      animate_mouse_windowdragging = false,
      focus_on_activate            = true,
   },
   decoration = {
      rounding         = 10,
      active_opacity   = 0.89,
      inactive_opacity = 0.89,
      blur             = { enabled = true, size = 4, passes = 2, new_optimizations = true, xray = false, ignore_opacity = true },
      shadow           = { enabled = false },
   },
   animations = { enabled = true },
   dwindle = { preserve_split = true, smart_split = true },
   general = {
      gaps_in     = 2,
      gaps_out    = 6,
      border_size   = 1,
      col           = {
         active_border   = { colors = { "rgba(89b4faee)", "rgba(cba6f7ee)" }, angle = 45 },
         inactive_border = "rgba(45475aaa)",
      },
      layout        = "dwindle",
      allow_tearing = false,
   },
   input = {
      kb_layout    = "us",
      follow_mouse = 1,
      sensitivity  = 0,
      touchpad     = { natural_scroll = true, tap_to_click = true, drag_lock = true },
   },
})

-- ─── Bezier Curves & Animations ──────────────────────────────────────────────
local curves = {
   { "ease",     { { 0.25, 0.1 }, { 0.25, 1 } } },
   { "overshot", { { 0.05, 0.9 }, { 0.1, 1.1 } } },
   { "smooth",   { { 0.5, 0 }, { 0.99, 0.99 } } },
}
for _, c in ipairs(curves) do
   hl.curve(c[1], { type = "bezier", points = c[2] })
end

local animations = {
   { "windows",          4, "overshot", "slide" },
   { "windowsOut",       4, "ease",     "slide" },
   { "fade",             3, "ease",     nil },
   { "workspaces",       3, "smooth",   "slide" },
   { "specialWorkspace", 3, "ease",     "slidevert" },
}
for _, a in ipairs(animations) do
   hl.animation({ leaf = a[1], enabled = true, speed = a[2], bezier = a[3], style = a[4] })
end
