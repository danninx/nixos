{ pkgs, ... }:
{
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = true;
      wifi.macAddress = "random";
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };
  };
  programs.ssh.startAgent = true;
  services.tailscale.enable = true;
  environment.systemPackages = with pkgs; [
    openvpn
  ];
}
