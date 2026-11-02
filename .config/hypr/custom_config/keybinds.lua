return function()
    local mainmod = "SUPER"
    local terminal = "kitty"
    local fileManager = "nautilus"
    local menu = "rofi -show drun -theme drun_theme"
    local editor = "code"
    local browser = "google-chrome"

    -- Alt-Tab window switcher
    -- hl.bind("ALT",hl.dsp.exec_cmd("fabric-cli invoke-action hypr-fabric-bar-main alt-tab-activate && notify-send \"New Message\" \"User123: Hello\" --action=\"reply=Reply\""))
    -- hl.bind("ALT", function()
    --     hl.dispatch(hl.dsp.exec_cmd("fabric-cli invoke-action hypr-fabric-bar-main alt-tab-cancel && notify-send \"New Message\" \"User123: Hello\" --action=\"reply=Reply\""))
    -- end, { release = true })

    -- hl.bind("ALT",hl.dsp.exec_cmd("fabric-cli invoke-action hypr-fabric-bar-main alt-tab-cancel && notify-send \"New Message\" \"User123: Hello\" --action=\"reply=Reply\""),{release = true, transparent = true})
    -- hl.bind("ALT + TAB",         hl.dsp.exec_cmd("fabric-cli invoke-action hypr-fabric-bar-main alt-tab-next"),     {repeat_on_hold = true})
    -- hl.bind("ALT + SHIFT + TAB", hl.dsp.exec_cmd("fabric-cli invoke-action hypr-fabric-bar-main alt-tab-prev"),     {repeat_on_hold = true})

    -- ALT press (alone) → show overlay
    hl.bind("ALT + TAB", hl.dsp.exec_cmd("fabric-cli invoke-action hypr-fabric-bar-main alt-tab-next"),
        { repeat_on_hold = true })
    -- ALT release → activate selected window
    hl.bind("SUPER + Q", hl.dsp.window.close())
    hl.bind(string.format("%s + DELETE", mainmod), hl.dsp.exit())
    hl.bind(string.format("%s + SHIFT + W", mainmod),
        hl.dsp.exec_cmd("fabric-cli invoke-action hypr-fabric-bar-main toggle-wallpaper-selector"))
    hl.bind(string.format("%s + SHIFT + T", mainmod),
        hl.dsp.exec_cmd("fabric-cli invoke-action hypr-fabric-bar-main toggle-theme-selector"))
    hl.bind(string.format("%s + V", mainmod),
        hl.dsp.exec_cmd(
        "rofi -modi clipboard:~/Scripts/cliphist-rofi-img.sh -theme drun_theme -show clipboard -show-icons"))
    hl.bind("SUPER  +  A", hl.dsp.exec_cmd(menu))
    hl.bind(string.format("%s + P", mainmod), hl.dsp.window.pseudo())
    hl.bind(string.format("%s + J", mainmod), hl.dsp.layout("togglesplit"))
    hl.bind(string.format("%s + W", mainmod), hl.dsp.window.float({ action = "toggle" }))
    hl.bind("ALT  +  Return", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
    hl.bind(string.format("%s + L", mainmod), hl.dsp.exec_cmd("hyprlock"))
    hl.bind(string.format("%s + R", mainmod), hl.dsp.exec_cmd("~/fabric-bar/scripts/reset.sh"))
    hl.bind("ALT  +  Tab", hl.dsp.group.prev())

    hl.bind("print", hl.dsp.exec_cmd("grimshot savecopy anything"))

    hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
    hl.bind(string.format("%s + E", mainmod), hl.dsp.exec_cmd(fileManager))
    hl.bind(string.format("%s + C", mainmod), hl.dsp.exec_cmd(editor))
    hl.bind(string.format("%s + F", mainmod), hl.dsp.exec_cmd(browser))
    hl.bind(string.format("%s + left", mainmod), hl.dsp.focus({ direction = "left" }))
    hl.bind(string.format("%s + right", mainmod), hl.dsp.focus({ direction = "right" }))
    hl.bind(string.format("%s + up", mainmod), hl.dsp.focus({ direction = "up" }))
    hl.bind(string.format("%s + down", mainmod), hl.dsp.focus({ direction = "down" }))

    for i = 1, 10, 1 do
        if i == 10 then
            hl.bind(string.format("%s + %d", mainmod, 0), hl.dsp.focus({ workspace = 10 }))
        else
            hl.bind(string.format("%s + %d", mainmod, i), hl.dsp.focus({ workspace = i }))
        end
    end

    for i = 1, 10, 1 do
        if i == 10 then
            hl.bind(string.format("%s + SHIFT + %d", mainmod, 0), hl.dsp.window.move({ workspace = 10, follow = true }))
            hl.bind(string.format("%s + ALT + %d", mainmod, 0), hl.dsp.window.move({ workspace = 10, follow = false }))
        else
            hl.bind(string.format("%s + SHIFT + %d", mainmod, i), hl.dsp.window.move({ workspace = i, follow = true }))
            hl.bind(string.format("%s + ALT + %d", mainmod, i), hl.dsp.window.move({ workspace = i, follow = false }))
        end
    end

    hl.bind(string.format("%s + S", mainmod), hl.dsp.workspace.toggle_special("background"))
    hl.bind(string.format("%s + SHIFT + S", mainmod), hl.dsp.window.move({ workspace = "special:background" }))
    hl.bind(string.format("%s + mouse_down", mainmod), hl.dsp.focus({ workspace = "m + 1" }))
    hl.bind(string.format("%s + mouse_up", mainmod), hl.dsp.focus({ workspace = "m-1" }))
    hl.bind(string.format("%s + mouse:272", mainmod), hl.dsp.window.drag())
    hl.bind(string.format("%s + mouse:273", mainmod), hl.dsp.window.resize())
    hl.bind(string.format("XF86AudioRaiseVolume", mainmod),
        hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+ --limit 1.0"), { repeating = true })
    hl.bind(string.format("XF86AudioLowerVolume", mainmod),
        hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%- --limit 1.0"), { repeating = true })
    hl.bind(string.format("XF86AudioMute", mainmod), hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
    hl.bind(string.format("XF86AudioMicMute", mainmod), hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
    hl.bind(string.format("XF86MonBrightnessUp", mainmod), hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true })
    hl.bind(string.format("XF86MonBrightnessDown", mainmod), hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })
    hl.bind(string.format("XF86AudioNext", mainmod), hl.dsp.exec_cmd("playerctl next"))
    hl.bind(string.format("XF86AudioPause", mainmod), hl.dsp.exec_cmd("playerctl play-pause"))
    hl.bind(string.format("XF86AudioPlay", mainmod), hl.dsp.exec_cmd("playerctl play-pause"))
    hl.bind(string.format("XF86AudioPrev", mainmod), hl.dsp.exec_cmd("playerctl previous"))
    hl.bind(string.format("%s + SHIFT + right", mainmod), hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
        { repeating = true })
    hl.bind(string.format("%s + SHIFT + left", mainmod), hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
        { repeating = true })
    hl.bind(string.format("%s + SHIFT + up", mainmod), hl.dsp.window.resize({ x = 0, y = -50, relative = true }),
        { repeating = true })
    hl.bind(string.format("%s + SHIFT + down", mainmod), hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
        { repeating = true })
    hl.bind(string.format("%s + SHIFT + CTRL + left", mainmod), hl.dsp.window.move({ direction = "left", group_aware = true }))
    hl.bind(string.format("%s + SHIFT + CTRL + right", mainmod), hl.dsp.window.move({ direction = "right", group_aware = true }))
    hl.bind(string.format("%s + SHIFT + CTRL + up", mainmod), hl.dsp.window.move({ direction = "up", group_aware = true }))
    hl.bind(string.format("%s + SHIFT + CTRL + down", mainmod), hl.dsp.window.move({ direction = "down", group_aware = true }))
    hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd("asusctl leds next"))
    hl.bind("XF86KbdBrightnessDown", hl.dsp.exec_cmd("asusctl leds prev"))
    hl.bind("ALT + left", hl.dsp.exec_cmd("asusctl aura effect --next-mode"))
    hl.bind("ALT + right", hl.dsp.exec_cmd("asusctl aura effect --prev-mode"))
end
