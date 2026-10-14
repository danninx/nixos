{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.packages = lib.mkIf config.programs.direnv.enable ([ pkgs.devenv ]);
}
