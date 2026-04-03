{
	inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
	outputs = { self, nixpkgs }: {
		nixosConfigurations.amara = nixpkgs.lib.nixosSystem {
			modules = [ ./configuration.nix ];
		};
	};
}
