{ ... }:
let
  name = "reboot";
in
{
  systemd = {
    timers.${name} = {
      wantedBy = [ "timers.target" ];
      timerConfigOnCalendar = "*-*-* 00:01:00 Europe/Amsterdam";
    };

    services.${name} = {
      script = ''
        sudo reboot
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        RemainAfterExit = true; # Prevents the service from automatically starting on rebuild. See https://discourse.nixos.org/t/how-to-prevent-custom-systemd-service-from-restarting-on-nixos-rebuild-switch/43431
      };
    };
  };
}
