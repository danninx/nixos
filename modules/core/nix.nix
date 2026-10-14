{ ... }:
{
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";
  nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
}
