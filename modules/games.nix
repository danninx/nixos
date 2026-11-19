{ pkgs, ... }:
{
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  # don't recall what these were for
  # networking = {
  #   enableIPv6 = false;
  #   firewall = {
  #     enable = true;
  #     allowedUDPPorts = [
  #       27015
  #       27036
  #       3478
  #       4379
  #       4380
  #     ];
  #     allowedTCPPorts = [
  #       27015
  #       27036
  #     ];
  #   };
  # };
}
