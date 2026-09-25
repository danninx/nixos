{ pkgs, ... }:

{
  imports = [
    ../../home/danninx
  ];

  wayland.windowManager.hyprland.settings = {
    settings = {
      monitor = [
        "eDP-1, preferred, auto, 1"
        "HDMI-A-1, preferred, auto, 1, mirror, eDP-1"
      ];
    };
  };
}
