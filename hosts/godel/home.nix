{ pkgs, ... }:

{
  imports = [
    ../../home/danninx
  ];

  home.packages = with pkgs; [
    protonmail-desktop
    typst
  ];
}
