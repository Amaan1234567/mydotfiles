hl.monitor({
    output = "eDP-1",
    mode = "highrr",
    position = "auto",
    scale = "1.25",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@100",
    position = "auto-left",
    scale = "1",
})


hl.on("hyprland.start", function () 
  hl.exec_cmd("hypridle")
  hl.exec_cmd("swww-daemon")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,ssh")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("/home/amaan/Documents/fabric-bar/scripts/start.sh")
  hl.exec_cmd("/home/amaan/Scripts/wallpaper_loop.sh")
  hl.exec_cmd("asusctl aura static -c $(cat ~/rog_colors.txt)")
  hl.exec_cmd("easyeffects --gapplication-service")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("pywalfox start")
end)

hl.env("SSH_AUTH_SOCK","$XDG_RUNTIME_DIR/keyring/ssh")
hl.env("HYPRCURSOR_THEME","Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE","24")
hl.env("XCURSOR_THEME","Bibata-Modern-Ice")
hl.env("PATH","$PATH:$scrPath")
hl.env("XDG_CURRENT_DESKTOP","Hyprland")
hl.env("XDG_SESSION_TYPE","wayland")
hl.env("XDG_SESSION_DESKTOP","Hyprland")
hl.env("XDG_SCREENSHOTS_DIR","$HOME/Pictures/screenshots")
hl.env("QT_QPA_PLATFORM","wayland")
hl.env("QT_QPA_PLATFORMTHEME","qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION","1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR","1")
hl.env("MOZ_ENABLE_WAYLAND","1")
hl.env("GDK_SCALE","1")
hl.env("GDK_BACKEND","wayland")
hl.env("WLR_NO_HARDWARE_CURSORS","1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT","auto")

-- hl.env("NVD_BACKEND","direct")
-- hl.env("LIBVA_DRIVER_NAME","nvidia")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME","nvidia")
-- hl.env("__GL_VRR_ALLOWED")
-- hl.env("WLR_DRM_NO_ATOMIC","1")
-- hl.env("__GL_GSYNC_ALLOWED","1")
-- hl.env("__GL_VRR_ALLOWED","1")
hl.env("AQ_DRM_DEVICES","/dev/dri/card0:/dev/dri/card1")
-- hl.env("AQ_FORCE_LINEAR_BLIT","0")
hl.env("GBM_BACKEND","nvidia-drm")
hl.env("__NV_PRIME_RENDER_OFFLOAD","1")
hl.env("__VK_LAYER_NV_optimus","NVIDIA_only")




hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 3,

        col = {
            active_border   = { colors = {"rgba(33ccffee)"} },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 30,
        rounding_power = 2.5,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.,

        shadow = {
            enabled      = true,
            range        = 10,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 2,
            passes    = 3,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
