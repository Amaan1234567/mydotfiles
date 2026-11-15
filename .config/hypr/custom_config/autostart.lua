return function()
    hl.on("hyprland.start", function()
    hl.exec_cmd("asusctl aura static -c $(cat ~/rog_colors.txt)")
    hl.exec_cmd("easyeffects --gapplication-service")
    hl.exec_cmd("pywalfox start")
    hl.exec_once("systemctl --user import-environment SSH_AUTH_SOCK DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_once("dbus-update-activation-environment --systemd SSH_AUTH_SOCK DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
end