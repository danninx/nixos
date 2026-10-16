-- note to self: config.<x> -> config/<x>.lua
require("config.looknfeel")
require("config.bindings")

hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hyprctl setcursor BreezeX-RosePine-Linux 28")
    hl.exec_cmd("hyprlock")
end)

hl.window_rule({
    name = "idle-inhibit-fullscreen",
    match = { class = ".*" },
    idle_inhibit = "fullscreen",
})

for i = 1, 6 do
    hl.workspace_rule({ workspace = tostring(i), persistent = true })
end

hl.workspace_rule({ workspace = "name:discord", persistent = true })

hl.config({
    dwindle = { preserve_split = true },
    master = { new_status = "master" },

    input = {
        kb_layout = "us",
        follow_mouse = 2,
        repeat_delay = 250,
        repeat_rate = 50,
        touchpad = { natural_scroll = false },
    },

    misc = {
        force_default_wallpaper = 1,
        key_press_enables_dpms = true,
        mouse_move_enables_dpms = true,
    },

    ecosystem = { no_update_news = true },
})
