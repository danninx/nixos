{ pkgs, ... }:
{
  programs.vscode = {
    enable = false;
    package = pkgs.vscode.fhs;
  };
}
