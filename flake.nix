{
  description = "redoing my NixOS configuration with hindsight";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }: {
    nixosConfigurations.amara = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        ./hosts/amara/configuration.nix 
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            backupFileExtension = "home.bak";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.danninx = ./home/danninx;
          };
        }
      ];
    };
  };
}
