{ pkgs, ... }:

{
  imports = [
    ./ghostty.nix 
    ./nixvim.nix
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    firefox
    nerd-fonts.jetbrains-mono
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
