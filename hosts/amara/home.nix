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

  xdg.configFile."uwsm/env".text = ''
    export XCURSOR_SIZE=24
    export HYPRCURSOR_THEME=BreezeX-RosePine-Linux
    export HYPRCURSOR_SIZE=24
    export LIBVA_DRIVER_NAME=nvidia
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export ELECTRON_OZONE_PLATFORM=auto
  '';
}
