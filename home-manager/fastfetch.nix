{ ... }:
{
  home-manager.users.killioiden.programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        height = 20;
        padding = {
          top = 1;
          bottom = 1;
        };
      };
      display = {
        separator = "";
        percent = {
          type = 1;
          width = 3;
        };
      };
      modules =
        let
          codes = {
            dark-grey = "{##575757}";
            grey = "{##727272}";
            blue = "{##6A9FB5}";
            green = "{##75b5AA}";
            bold = "{#1}";
          };
        in
        [
          "break"
          {
            type = "custom";
            format = "${codes.grey}{{";
          }
          {
            type = "custom";
            format = "  ${codes.grey}${codes.blue}system{#0}   ${codes.dark-grey}= ${codes.grey}{{";
          }
          {
            type = "os";
            key = "    ${codes.blue}os       {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{name} {version} ({codename})\"{#0}${codes.grey};";
          }
          {
            type = "os";
            key = "    ${codes.blue}arch     {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{arch}\"{#0}${codes.grey};";
          }
          {
            type = "locale";
            key = "    ${codes.blue}locale   {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{result}\"{#0}${codes.grey};";
          }
          {
            type = "uptime";
            key = "    ${codes.blue}uptime   {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{days} days, {hours} hours, {minutes} mins\"{#0}${codes.grey};";
          }
          {
            type = "custom";
            format = "  ${codes.grey}};";
          }
          "break"
          {
            type = "custom";
            format = "  ${codes.grey}${codes.blue}hardware{#0} ${codes.dark-grey}= ${codes.grey}{{";
          }
          {
            type = "cpu";
            key = "    ${codes.blue}cpu      {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{name} ({cores-logical}) @ {freq-max}\"{#0}${codes.dark-grey};";
          }
          {
            type = "gpu";
            key = "    ${codes.blue}gpu      {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{name}\"{#0}${codes.dark-grey};";
          }
          {
            type = "memory";
            key = "    ${codes.blue}ram      {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{used<10} / {total>9}\"{#0}${codes.dark-grey}; #{percentage}";
          }
          {
            type = "disk";
            folders = "/";
            key = "    ${codes.blue}disk0    {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{size-used<10} / {size-total>9}\"{#0}${codes.dark-grey}; #{size-percentage}";
          }
          {
            type = "custom";
            format = "  ${codes.grey}};";
          }
          "break"
          {
            type = "custom";
            format = "  ${codes.grey}${codes.blue}desktop{#0}  ${codes.dark-grey}= ${codes.grey}{{";
          }
          {
            type = "de";
            key = "    ${codes.blue}de       {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{pretty-name} {version}\"{#0}${codes.dark-grey};";
          }
          {
            type = "wm";
            key = "    ${codes.blue}wm       {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{pretty-name} ({protocol-name})\"{#0}${codes.dark-grey};";
          }
          {
            type = "display";
            key = "    ${codes.blue}display  {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{width}x{height} @ {refresh-rate}Hz\"{#0}${codes.dark-grey};";
          }
          {
            type = "localip";
            key = "    ${codes.blue}localIp  {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{ipv4}\"{#0}${codes.dark-grey};";
          }
          {
            type = "custom";
            format = "  ${codes.grey}};";
          }
          "break"
          {
            type = "custom";
            format = "  ${codes.grey}${codes.blue}terminal{#0} ${codes.dark-grey}= ${codes.grey}{{";
          }
          {
            type = "shell";
            key = "    ${codes.blue}shell    {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{pretty-name} {version}\"{#0}${codes.dark-grey};";
          }
          {
            type = "terminal";
            key = "    ${codes.blue}term     {#0}${codes.dark-grey}= ";
            format = "${codes.green}${codes.blue}\"{pretty-name}\"{#0}${codes.dark-grey};";
          }
          {
            type = "packages";
            key = "    ${codes.blue}packages {#0}${codes.dark-grey}= ";
            format = "${codes.dark-grey}[ ${codes.green}${codes.blue}\"{nix-system} nix-system\" \"{nix-user} nix-user\"{#0}${codes.dark-grey} ];";
          }
          {
            type = "custom";
            format = "  ${codes.grey}};";
          }
          {
            type = "custom";
            format = "${codes.grey}};";
          }
        ];
    };
  };
}
