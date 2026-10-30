{ ... }:
{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "killioiden" ];
      MaxAuthTries = 6;
      PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
    };
  };
}
