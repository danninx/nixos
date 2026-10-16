{ pkgs, ... }:

{
  imports = [
    ../../home/danninx
  ];

  wayland.windowManager.hyprland.settings = {
      monitor = [
        { output = "eDP-1"; mode = "preferred"; position = "auto"; scale = 1; }
        { output = "HDMI-A-1"; mode = "preferred"; position = "auto"; scale = 1; mirror = "eDP-1"; }
      ];
  };

  xdg.configFile."uwsm/env".text = ''
    export XCURSOR_SIZE=24
    export HYPRCURSOR_THEME=BreezeX-RosePine-Linux
    export HYPRCURSOR_SIZE=24
    export LIBVA_DRIVER_NAME=nvidia
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export ELECTRON_OZONE_PLATFORM=auto
  '';
}
