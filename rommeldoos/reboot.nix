{ pkgs, ... }:
let
  name = "reboot-every-so-often";
in
{
  systemd = {
    timers.${name} = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 05:00:00 Europe/Amsterdam";
        Unit = "${name}.service";
      };
    };

    services.${name} = {
      script = ''
        ${pkgs.sudo}/bin/sudo reboot
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        # Prevents the service from automatically starting on rebuild.
        RemainAfterExit = true;
      };
    };
  };
}
