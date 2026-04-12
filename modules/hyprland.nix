{pkgs, ...}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
in {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
    ];
  };

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  security.pam.services.hyprlock = {};

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session}";
        user = "danninx";
      };
    };
  };
}
