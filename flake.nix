{
  description = "redoing my NixOS configuration with hindsight";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";

    alethea-shell = {
      url = "gitlab:danninx/alethea-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    home-manager,
    nixpkgs,
    stylix,
    ...
  }: let
    pkgs-x86 = import nixpkgs {system = "x86_64-linux";};
  in {
    nixosConfigurations.amara = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/amara/configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            backupFileExtension = "home.bak";
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users.danninx = ./home/danninx;
          };
        }
      ];
    };

    devShells.x86_64-linux.default = pkgs-x86.mkShell {
      buildInputs = with pkgs-x86; [
        nil
        nixd
      ];
    };

    formatter.x86_64-linux = pkgs-x86.alejandra;
  };
}
