{
  description = "Sajay's Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        sajay = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
	    hyprland.homeManagerModules.default
            ./home-manager/home.nix
          ];
        };
      };
    };
}

