{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprshot
    rose-pine-cursor
    swappy
  ];

  xdg.portal.enable = true;

  services.polkit-gnome.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    configType = "lua";
    extraConfig = builtins.readFile ./hyprland.lua;
  };

  xdg.configFile."hypr/config".source = ./config;
}
