--
--[[ GENERAL BINDINGS ]]
--

local terminal = "ghostty"
local filepicker = "dolphin"
local locker = "hyprlock"
local menu_cmd = "wofi --show=drun"
local screenshot_cmd = 'hyprshot --freeze --clipboard-only --mode region; sleep 0.5s && wl-paste | swappy -f -'

hl.bind("SUPER + B", hl.dsp.global("alethea-shell:toggle-bar-active"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + L", hl.dsp.exec_cmd(locker))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(screenshot_cmd))
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + X", hl.dsp.exec_cmd(menu_cmd))

-- volume and brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- untiled window movement
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- movement between windows
hl.bind("SUPER + A", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + D", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + W", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + S", hl.dsp.focus({ direction = "down" }))

--
--[[ WORKSPACE BINDINGS ]]
--

-- numerical workspaces
for i = 1, 6, 1 do
    hl.bind("SUPER + "..i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind("SUPER + SHIFT + "..i, hl.dsp.window.move({ workspace = tostring(i) }))
end

-- discord workspace
hl.bind("SUPER + semicolon", hl.dsp.focus({ workspace = "name:discord" }))
hl.bind("SUPER + SHIFT + semicolon", hl.dsp.window.move({ workspace = "name:discord" }))

-- workspace movement
hl.bind("SUPER + j", hl.dsp.focus({ workspace = "e-1" }), { repeating = true })
hl.bind("SUPER + k", hl.dsp.focus({ workspace = "e+1" }), { repeating = true })
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ workspace = "e-1" }), { repeating = true })
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ workspace = "e+1" }), { repeating = true })
