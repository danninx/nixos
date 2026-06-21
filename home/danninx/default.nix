{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./alethea-shell.nix
    ./direnv.nix
    ./firefox.nix
    ./ghostty.nix
    ./hypr
    ./nixvim
    ./starship.nix
    ./vscode.nix
    ./wofi.nix
    ./zed.nix
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
    fastfetch
    gimp
    kdePackages.dolphin
    liberation_ttf
    obsidian
    opencode
    nerd-fonts.jetbrains-mono
    wofi
  ];

  programs.lazygit.enable = true;
  gtk.enable = true;

  stylix = {
    enable = true;
    targets = {
      gtk.enable = true;
      lazygit.enable = true;
      qt.enable = true;
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
