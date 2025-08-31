{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    # NOTE: 'nixos' is the default hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [ 
       ./configuration.nix

       home-manager.nixosModules.home-manager {
         home-manager.useGlobalPkgs = true;
	 home-manager.useUserPackages = true;

	 home-manager.users.p = import ./user.nix;
	 home-manager.extraSpecialArgs = { inherit inputs; };
       }
      ];
    };
  };
}
