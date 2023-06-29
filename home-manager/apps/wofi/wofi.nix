{pkgs, ...}: {  
  home.packages = with pkgs; [wofi];
  xdg.configFile."wofi/style.css".source = ./style.css;
  xdg.configFile."wofi/config".text = ''
    mode=drun
    allow_images=true
    image_size=24
    width=25%
    gtk_dark=true
    term=foot
    layer=overlay
  '';
}
