{
  description = "Rommeldoos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs =
    inputs@{ nixpkgs, nixos-hardware, ... }:
    {
      nixosConfigurations.rpi500 = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          nixos-hardware.nixosModules.raspberry-pi-5
          ./rommeldoos/main.nix
        ];

        specialArgs = { inherit inputs; };
      };
    };
}
