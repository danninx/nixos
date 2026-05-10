{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./nvidia.nix

    ../../modules/bluetooth.nix
    ../../modules/containers.nix
    ../../modules/hyprland.nix
    ../../modules/java.nix
    ../../modules/locales.nix
    ../../modules/network.nix
    ../../modules/pipewire.nix
    ../../modules/stylix.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "amara";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    htop
    man-pages
    man-pages-posix
    vim
  ];

  programs.zsh.enable = true;
  users.users.danninx = {
    isNormalUser = true;
    description = "danninx";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      ghostty
      git
      starship
    ];
    shell = pkgs.zsh;
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

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";
  nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
