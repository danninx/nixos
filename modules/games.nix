{ pkgs, ... }:
{
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  networking = {
    enableIPv6 = false;
    firewall = {
      enable = true;
      allowedUDPPorts = [
        27015
        27036
        3478
        4379
        4380
      ];
      allowedTCPPorts = [
        27015
        27036
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    protonup-qt
  ];
}
