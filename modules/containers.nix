{ lib, ... }:
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = lib.mkDefault true;
  };
}
