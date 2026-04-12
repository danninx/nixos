{
  config,
  pkgs,
  ...
}: let
  default = s: "${config.home.homeDirectory}/${s}";
  media = s: (default "media/${s}");
in {
  imports = [
    ./ghostty.nix
    ./hypr
    ./nixvim.nix
    ./starship.nix
    ./zsh.nix
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

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;
    desktop = default "desktop";
    documents = default "documents";
    download = default "downloads";
    music = media "music";
    pictures = media "pictures";
    publicShare = default "public";
    templates = default "templates";
    videos = media "videos";
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
