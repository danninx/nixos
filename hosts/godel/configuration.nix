{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    ../../modules/core
    ../../modules/hardware/framework-13-pro-intel.nix

    ../../modules/containers.nix
    ../../modules/hyprland.nix
    ../../modules/stylix.nix
  ];

  networking.hostName = "godel";

  services.upower.enable = true;
  virtualisation.docker.enableOnBoot = false;

  nix.settings.trusted-users = [ "root" "danninx" ];

  system.stateVersion = "25.11";
}
