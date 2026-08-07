-- ══════════════════════════════════════════════════════════════════════════════
--                         AUTOSTART
-- ══════════════════════════════════════════════════════════════════════════════

hl.on("hyprland.start", function()
   -- ─── Import env into systemd user session ────────────────────────────────
   hl.exec_cmd(
      "systemctl --user import-environment " ..
      "LIBVA_DRIVER_NAME LIBVA_DRM_DEVICE " ..
      "__GLX_VENDOR_LIBRARY_NAME GBM_BACKEND " ..
      "ELECTRON_OZONE_PLATFORM_HINT __NV_PRIME_RENDER_OFFLOAD " ..
      "__VK_LAYER_NV_optimus XDG_SESSION_TYPE XDG_CURRENT_DESKTOP"
   )

   -- ─── System services ─────────────────────────────────────────────────────
   hl.exec_cmd("/usr/lib/gsd-xsettings")
   hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

   -- ─── Bar & notifications ─────────────────────────────────────────────────
   hl.exec_cmd("waybar")
   hl.exec_cmd("swaync")
   hl.exec_cmd("swayosd-server")

   -- ─── Wallpaper & idle ────────────────────────────────────────────────────
   hl.exec_cmd("hyprpaper")
   hl.exec_cmd("sleep 5 && hypridle")

   -- ─── Clipboard ───────────────────────────────────────────────────────────
   hl.exec_cmd("wl-paste --type text  --watch cliphist store")
   hl.exec_cmd("wl-paste --type image --watch cliphist store")
   hl.exec_cmd("copyq --start-server")

   -- ─── Tray applets ────────────────────────────────────────────────────────
   hl.exec_cmd("udiskie")
   hl.exec_cmd("blueman-applet")
end
)
