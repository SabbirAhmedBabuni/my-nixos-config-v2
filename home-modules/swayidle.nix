{ ... }:
{
  services.swayidle = {
    enable = true;
    events = {
      before-sleep = "/run/current-system/sw/bin/noctalia msg session lock";
      lock = "/run/current-system/sw/bin/noctalia msg session lock";
    };
  };
}
