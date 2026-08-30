{ pkgs, ... }:
{
  networking = {
    enableIPv6 = false;
    firewall = {
      enable = true;
      allowedUDPPorts = [ 27015 27036 3478 4379 4380 ];
      allowedTCPPorts = [ 27015 27036 ];
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
  services.timesyncd.enable = true;
  environment.systemPackages = with pkgs; [
    openvpn
  ];
}
