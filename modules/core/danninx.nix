{ pkgs, ... }:
{
  users.users.danninx = {
    isNormalUser = true;
    description = "danninx";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      htop
      man-pages
      man-pages-posix
      vim
    ];
  };
}
