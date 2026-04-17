{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./nvidia.nix

    ../../modules/bluetooth.nix
    ../../modules/hyprland.nix
    ../../modules/network.nix
    ../../modules/locales.nix
    ../../modules/java.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "amara";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  environment.systemPackages = [ pkgs.vim pkgs.man-pages pkgs.man-pages-posix ];
  programs.zsh.enable = true;
  users.users.danninx = {
    isNormalUser = true;
    description = "danninx";
    extraGroups = [ "docker" "networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
      ghostty
      git
      starship
    ];
    shell = pkgs.zsh;
  };

  services.upower.enable = true;

  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
