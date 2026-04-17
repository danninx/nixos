{...}: let
  mainMod = "SUPER";
  terminal = "ghostty";
  menu = "wofi --show=drun";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${mainMod}, T, exec, ${terminal}"
      "${mainMod}, Q, killactive,"
      "${mainMod}, V, togglefloating,"
      "${mainMod}, L, exec, hyprlock"
      "${mainMod}, F, fullscreen"
      "${mainMod}, X, exec, ${menu}"
      "${mainMod}, B, global, danni-shell:toggle-bar"
      "${mainMod}, A, movefocus, l"
      "${mainMod}, D, movefocus, r"
      "${mainMod}, W, movefocus, u"
      "${mainMod}, S, movefocus, d"
      "${mainMod}, mouse_down, workspace, e+1"
      "${mainMod}, mouse_up, workspace, e-1"
      "${mainMod}, 1, workspace, 1"
      "${mainMod}, 2, workspace, 2"
      "${mainMod}, 3, workspace, 3"
      "${mainMod}, 4, workspace, 4"
      "${mainMod}, 5, workspace, 5"
      "${mainMod}, 6, workspace, 6"
      "${mainMod} and SHIFT, 1, movetoworkspace, 1"
      "${mainMod} and SHIFT, 2, movetoworkspace, 2"
      "${mainMod} and SHIFT, 3, movetoworkspace, 3"
      "${mainMod} and SHIFT, 4, movetoworkspace, 4"
      "${mainMod} and SHIFT, 5, movetoworkspace, 5"
      "${mainMod} and SHIFT, 6, movetoworkspace, 6"
      "${mainMod}, semicolon, workspace, name:discord"
      "${mainMod} and SHIFT, semicolon, movetoworkspace, name:discord"
      "${mainMod}, R, workspace, name:reading"
      "${mainMod} and SHIFT, R, movetoworkspace, name:reading"
      "${mainMod} and SHIFT, S, exec, hyprshot --freeze --clipboard-only --mode region; sleep 0.5s && wl-paste | swappy -f -"
    ];

    bindm = [
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, mouse:273, resizewinow"
    ];

    binde = [
      "${mainMod}, j, workspace, e-1"
      "${mainMod}, k, workspace, e+1"
      "${mainMod} and SHIFT, j, movetoworkspace, e-1"
      "${mainMod} and SHIFT, k, movetoworkspace, e+1"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
