{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    ../../modules/core
    ../../modules/hardware/nvidia.nix

    ../../modules/containers.nix
    ../../modules/games.nix
    ../../modules/hyprland.nix
    ../../modules/java.nix
    ../../modules/stylix.nix
  ];

  networking.hostName = "babel";

  hardware.nvidia.powerManagement = {
    finegrained = false;
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall.allowedTCPPorts = [ 22 ];

  system.stateVersion = "25.11";
}
