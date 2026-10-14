{ pkgs, ... }:

{
  imports = [
    ../../home/danninx
  ];

  home.packages = with pkgs; [
    protonmail-desktop
  ];

  programs.prismlauncher.enable = true;
}
