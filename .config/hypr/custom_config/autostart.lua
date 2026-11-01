return function()
    hl.on("hyprland.start", function()
    hl.exec_cmd("asusctl aura static -c $(cat ~/rog_colors.txt)")
    hl.exec_cmd("easyeffects --gapplication-service")
    hl.exec_cmd("pywalfox start")
end)
end