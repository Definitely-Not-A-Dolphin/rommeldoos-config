{ pkgs, ... }:
{
  home = {
    username = "killioiden";
    homeDirectory = "/home/killioiden";
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

  programs.home-manager.enable = true;
}
