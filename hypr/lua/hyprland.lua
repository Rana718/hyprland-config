-- ══════════════════════════════════════════════════════════════════════════════
--                    HYPRLAND CONFIG — LUA
--                    ASUS TUF F15 | RTX 3050 Ti + Intel UHD
-- ══════════════════════════════════════════════════════════════════════════════

require("keybinds")


-- ─── Programs ─────────────────────────────────────────────────────────────────
local terminal    = "alacritty"
local fileManager = "thunar"
local browser     = "brave"
local menu        = "rofi -show drun -show-icons"


-- ─── Monitor ──────────────────────────────────────────────────────────────────
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@144",
    position = "auto",
    scale    = 1.2,
})


-- ─── Environment Variables ────────────────────────────────────────────────────

-- NVIDIA / GPU
hl.env("__GLX_VENDOR_LIBRARY_NAME",      "nvidia")
hl.env("__NV_PRIME_RENDER_OFFLOAD",      "1")
hl.env("__VK_LAYER_NV_optimus",          "NVIDIA_only")
hl.env("AQ_DRM_DEVICES",                 "/dev/dri/card2:/dev/dri/card1")
hl.env("WLR_DRM_DEVICES",                "/dev/dri/card2:/dev/dri/card1")
hl.env("GBM_BACKEND",                    "nvidia-drm")
hl.env("WLR_NO_HARDWARE_CURSORS",        "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT",   "auto")

-- Wayland / Toolkits
hl.env("XDG_SESSION_TYPE",               "wayland")
hl.env("XDG_CURRENT_DESKTOP",           "Hyprland")
hl.env("XDG_SESSION_DESKTOP",           "Hyprland")
hl.env("QT_QPA_PLATFORM",               "wayland")
hl.env("QT_QPA_PLATFORMTHEME",          "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",   "1")
hl.env("GDK_BACKEND",                   "wayland,x11,*")
hl.env("SDL_VIDEODRIVER",               "wayland")
hl.env("CLUTTER_BACKEND",               "wayland")
hl.env("MOZ_ENABLE_WAYLAND",            "1")

-- Cursor / Theme
hl.env("XCURSOR_SIZE",       "24")
hl.env("XCURSOR_THEME",      "Adwaita")
hl.env("GTK_THEME",          "Adwaita:dark")
hl.env("ADW_DISABLE_PORTAL", "1")


-- ─── Autostart ────────────────────────────────────────────────────────────────
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/gsd-xsettings")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("sleep 5 && hypridle")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("copyq --start-server")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("blueman-applet")
end)


-- ─── Look & Feel ──────────────────────────────────────────────────────────────
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 10,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(89b4faee)", "rgba(cba6f7ee)"}, angle = 45 },
            inactive_border = "rgba(45475aaa)",
        },
        layout        = "dwindle",
        allow_tearing = false,
    },

    decoration = {
        rounding         = 10,
        active_opacity   = 0.89,
        inactive_opacity = 0.89,

        blur = {
            enabled           = true,
            size              = 4,
            passes            = 2,
            new_optimizations = true,
            xray              = false,
            ignore_opacity    = true,
        },

        shadow = {
            enabled      = true,
            range        = 10,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        smart_split    = true,
    },

    misc = {
        force_default_wallpaper      = 0,
        disable_hyprland_logo        = true,
        vrr                          = 0,
        animate_manual_resizes       = false,
        animate_mouse_windowdragging = false,
        focus_on_activate            = true,
    },

    input = {
        kb_layout    = "us",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = true,
            tap_to_click   = true,
            drag_lock      = true,
        },
    },

    cursor = {
        no_hardware_cursors = true,
        no_break_fs_vrr     = true,
    },
})


-- ─── Animations ───────────────────────────────────────────────────────────────
hl.curve("ease",     { type = "bezier", points = { {0.25, 0.1}, {0.25, 1}    } })
hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1,  1.1}  } })
hl.curve("smooth",   { type = "bezier", points = { {0.5,  0},   {0.99, 0.99} } })

hl.animation({ leaf = "windows",          enabled = true, speed = 4, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 4, bezier = "ease",     style = "slide" })
hl.animation({ leaf = "fade",             enabled = true, speed = 3, bezier = "ease" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3, bezier = "smooth",   style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "ease",     style = "slidevert" })


-- ─── Window Rules ─────────────────────────────────────────────────────────────

-- Float by class
local floatClasses = {
    "com.github.hluk.copyq",
    "copyq",
    "org.hyprland.xdg-desktop-portal-hyprland",
    "pavucontrol",
    "org.pulseaudio.pavucontrol",
    "nm-connection-editor",
    "blueman-manager",
}

for _, class in ipairs(floatClasses) do
    hl.window_rule({
        name  = "float-" .. class,
        match = { class = "^" .. class .. "$" },
        float = true,
    })
end

-- pavucontrol size
hl.window_rule({
    name  = "size-pavucontrol",
    match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol)$" },
    size  = "900 600",
})

-- Thunar: float only when opened with a path (not Super+E / home folder)
hl.window_rule({
    name  = "float-thunar-path",
    match = { class = "^thunar$", initial_title = "negative:rana - Thunar" },
    float = true,
    size  = "900 600",
})

-- Float by title
local floatTitles = {
    "^Rename .*$",
    "^File Operation Progress$",
    "^Open File$",
    "^Save File$",
}

for _, title in ipairs(floatTitles) do
    hl.window_rule({
        name  = "float-title-" .. title,
        match = { title = title },
        float = true,
    })
end

-- Gaming: no vsync wait
hl.window_rule({ name = "immediate-cs2",   match = { class = "^cs2$" },          immediate = true })
hl.window_rule({ name = "immediate-steam", match = { class = "^steam_app_.*$" }, immediate = true })

-- Fully opaque: browsers + Discord
local opaqueApps = {
    "brave-browser",
    "google-chrome",
    "chromium",
    "firefox",
    "discord",
}

for _, app in ipairs(opaqueApps) do
    hl.window_rule({
        name   = "opaque-" .. app,
        match  = { class = "^" .. app .. "$" },
        opaque = true,
    })
end
