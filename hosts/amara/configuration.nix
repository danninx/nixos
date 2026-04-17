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

  stylix = {
    enable = true;
    targets.gtk.enable = true;

    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NFM";
      };

      emoji = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NFP";
      };
    };
  };

  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
