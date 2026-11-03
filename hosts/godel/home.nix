{ pkgs, ... }:

{
  imports = [
    ../../home/danninx
  ];

  home.packages = with pkgs; [
    kanri
    protonmail-desktop
    typst
  ];
}
