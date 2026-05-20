{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./nvidia.nix

    ../../modules/bluetooth.nix
    ../../modules/containers.nix
    ../../modules/games.nix
    ../../modules/hyprland.nix
    ../../modules/java.nix
    ../../modules/locales.nix
    ../../modules/network.nix
    ../../modules/pipewire.nix
    ../../modules/stylix.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "babel";

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
