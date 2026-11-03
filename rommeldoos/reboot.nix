{ ... }:
let
  name = "reboot-every-so-often";
in
{
  systemd = {
    timers.${name} = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "2m";
        #OnCalendar = "*-*-* 00:02:00 Europe/Amsterdam";
        Unit = "${name}.service";
      };
    };

    services.${name} = {
      script = ''
        sudo reboot
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
