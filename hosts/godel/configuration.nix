{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    ../../modules/bluetooth.nix
    ../../modules/containers.nix
    ../../modules/hyprland.nix
    ../../modules/locales.nix
    ../../modules/network.nix
    ../../modules/pipewire.nix
    ../../modules/stylix.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "godel";

  environment.systemPackages = with pkgs; [
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
      git
    ];
    shell = pkgs.zsh;
  };

  programs.nix-ld.enable = true;

  services.thermald.enable = true;
  services.tlp.enable = true;
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
