{ pkgs, ... }:
{
  imports = [
    ../killioiden
    ../modules
    ./hardware-config.nix
    ./networking.nix
    ./raspi-compat.nix
  ];

  environment.systemPackages = with pkgs; [
    # Core 0
    curl
    firewalld
    git
    nano
    networkmanager
    openssh
    unzip
    wget
    zip

    # Core 1
    fish
    gh
    home-manager

    # Hosties
    deno

    # Misc
    fastfetch
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";
}
