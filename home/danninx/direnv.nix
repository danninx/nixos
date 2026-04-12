{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = lib.mkIf config.programs.direnv.enable (with pkgs; [
    direnv
  ]);
}
