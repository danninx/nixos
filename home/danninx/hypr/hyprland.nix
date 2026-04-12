{ pkgs, ...}: let
  font = "JetBrainsMono Nerd Font Bold";
  background = "rgb(1a1b26)";
  darker = "rgb(16161e)";
  foreground = "rgb(a9b1d6)";
  orange = "rgb(e0af68)";
  red = "rgb(f7768e)";
  red_tran = "rgba(f7768e55)";
  purple = "rgb(bb9af7)";
  purple_tran = "rgba(bb9af755)";
  transparent = "rgba(0,0,0,0)";

  terminal = "ghostty";
  fileManager = "dolphin";
  menu = "wofi --show drun";
in {
  imports = [
    ./extra/bindings.nix
    ./extra/env.nix
    ./extra/rules.nix
    ./extra/workspaces.nix
  ];

  home.packages = with pkgs; [
      hyprpaper
      hyprshot
      rose-pine-cursor
      swappy
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    settings = {
      exec-once = [
        "xdg-user-dirs-update"
        "dbus-update-activation-environment --systemd ALL"
        "systemctl --user import-environment ALL"
        "nm-applet &"
        "hyprpaper &"
        "hyprctl setcursor BreezeX-RosePine-Linux 28"
        "hypridle & hyprlock &"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "${purple_tran} ${red_tran} 45deg";
        "col.inactive_border" = transparent;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 2;
        rounding_power = 2;
        active_opacity = 1;
        inactive_opacity = 0.8;
        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.06, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.5, 0.5"
          "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 0.5, almostLinear, slidefade 70%"
          "zoomFactor, 1, 7, quick"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        background_color = background;
        force_default_wallpaper = 1;
        key_press_enables_dpms = true;
        mouse_move_enables_dpms = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 2;
        touchpad = {
          natural_scroll = false;
        };
      };

      gesture = [
        "3, horizontal, workspace"
      ];

      ecosystem = {
        no_update_news = true;
      };
    };
  };
}
