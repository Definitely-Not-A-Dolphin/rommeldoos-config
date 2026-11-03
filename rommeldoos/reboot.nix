{ ... }:
let
  name = "reboot";
in
{
  systemd = {
    timers.${name} = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 00:02:00 Europe/Amsterdam";
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
        RemainAfterExit = true; # Prevents the service from automatically starting on rebuild. See https://discourse.nixos.org/t/how-to-prevent-custom-systemd-service-from-restarting-on-nixos-rebuild-switch/43431
      };
    };
  };
}
