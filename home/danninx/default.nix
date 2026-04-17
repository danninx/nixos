{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alethea-shell.nix
    ./direnv.nix
    ./ghostty.nix
    ./hypr
    ./nixvim
    ./starship.nix
    ./wofi.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    discord
    firefox
    gnumake
    liberation_ttf
    obsidian
    opencode
    nerd-fonts.jetbrains-mono
    wofi
  ];

  programs.lazygit.enable = true;
  gtk.enable = true;
  stylix.enable = true;
  stylix.targets.lazygit.enable = true;
  stylix.targets.gtk.enable = true;

  xdg.userDirs = let
    default = s: "${config.home.homeDirectory}/${s}";
    media = s: (default "media/${s}");
  in {
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
