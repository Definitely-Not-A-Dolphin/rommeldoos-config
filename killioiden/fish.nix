{ ... }:
{
  programs.fish.enable = true;

  home-manager.users.killioiden.programs.fish = {
    enable = true; # this could probs be deleted
    interactiveShellInit = ''
      fastfetch
    '';
  };
}
