{ ... }:
{
  users.users.killioiden = {
    isNormalUser = true;
    home = "/home/killioiden";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    password = "server";
  };
}
