{ config, lib, ... }:
{
  home.file.".config/i3status/config".text = ''
    general {
        colors = true
        interval = 5
    }

    order += "disk /"
    order += "battery all"
    order += "load"
    order += "tztime local"
    
    battery all {
            format = "%status %percentage %remaining"
    }
    
    tztime local {
            format = "%Y-%m-%d %H:%M:%S"
    }
    
    load {
            format = "%1min"
    }
    
    disk "/" {
            format = "%avail"
    }
  '';
}
