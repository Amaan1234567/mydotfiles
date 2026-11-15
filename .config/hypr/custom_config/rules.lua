-- Sample override: Custom workspace and window rules
return function()
   hl.workspace_rule({ workspace = "w[tv1]", gaps_out = { top = 10, right = 12, bottom = 19, left = 12 }, gaps_in = 5 })
    hl.workspace_rule({ workspace = "w[tv2-100]", gaps_out = { top = 20, right = 18, bottom = 24, left = 18 }, gaps_in = 5 })
    hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
    hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
    hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
    hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

    for i = 1, 5, 1 do
        hl.workspace_rule({ workspace = string.format("%d", i), monitor = "HDMI-A-1" })
    end

    hl.window_rule({
        name     = "fix-xwayland-drags",
        match    = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
        no_focus = true,
    })

    hl.window_rule({
        match = { class = "*" },
        opacity = "0.8 override",
        animation = "popin 85%"
    })
end