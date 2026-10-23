{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./desktop
    ./dev
    ./shell

    ./firefox.nix
  ];

  home.username = "danninx";
  home.homeDirectory = "/home/danninx";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    bruno
    discord
    fastfetch
    gimp
    inkscape
    kdePackages.dolphin
    liberation_ttf
    obsidian
    opencode
    nerd-fonts.jetbrains-mono
  ];

  gtk.enable = true;

  stylix = {
    enable = true;
    targets = {
      gtk.enable = true;
      qt.enable = false;
    };
  };

  xdg.userDirs =
    let
      default = s: "${config.home.homeDirectory}/${s}";
      media = s: (default "media/${s}");
    in
    {
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
