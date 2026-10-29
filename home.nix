{ pkgs, ... }:
{
  home = {
    username = "killioiden";
    homeDirectory = "/home/dietpi";
    stateVersion = "26.05";

    packages = with pkgs; [
      # Core
      git
      gh

      # More Core
      deno
      fish
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.home-manager.enable = true;
}
