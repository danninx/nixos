{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    ../../modules/core
    ../../modules/hardware/nvidia.nix

    ../../modules/containers.nix
    ../../modules/hyprland.nix
    ../../modules/java.nix
    ../../modules/stylix.nix
  ];

  networking.hostName = "amara";

  hardware.nvidia = {
    powerManagement = {
      finegrained = true;
    };

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 60;

      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 90;
    };
  };
  services.upower.enable = true;

  system.stateVersion = "25.11";
}
