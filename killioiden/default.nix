{ inputs, pkgs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./fastfetch.nix
    ./fish.nix
  ];

  users.users.killioiden = {
    isNormalUser = true;
    home = "/home/killioiden";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  home-manager = {
    backupFileExtension = "bckp";
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.killioiden.home = {
      packages = [ ];
      stateVersion = "26.05"; # no touchy
    };
  };
}
