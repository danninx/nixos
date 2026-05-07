{pkgs, ...}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
in {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
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
        command = "${tuigreet} --time --remember --remember-session --cmd 'uwsm start hyprland-uwsm.desktop'";
        user = "danninx";
      };
    };
  };
}
