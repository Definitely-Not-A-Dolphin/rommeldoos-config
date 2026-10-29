{ pkgs, username, ... }:
{
  home = {
    username = username;
    homeDirectory = "/home/${username}";
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
