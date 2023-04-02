{ config, lib, ... }:
{
  home.file.".config/kitty/kitty.conf".text = ''
    font_family        JetBrainsMono Nerd Font Mono
    bold_font          auto
    italic_font        auto 
    bold_italic_font   auto
    
    map cmd+1 goto_tab 1
    map cmd+2 goto_tab 2
    map cmd+3 goto_tab 3
    map cmd+4 goto_tab 4
    map cmd+5 goto_tab 5
    map cmd+6 goto_tab 6
    map cmd+7 goto_tab 7
    map cmd+8 goto_tab 8
    map cmd+9 goto_tab 9
    
    # Font size (in pts)
    # NOTE: Do not use odd values as these affect how kitty renders margin
    font_size        12
    
    dynamic_background_opacity yes
    confirm_os_window_close 0 
    hide_window_decorations titlebar-only
    window_padding_width 5
    
    enable_audio_bell no
    
    # Colors
    include ./theme.conf
    
    background_opacity         0.95
    dynamic_background_opacity yes
  '';
  home.file.".config/kitty/theme.conf".text = ''
    background            #001e26
    foreground            #9bc1c2
    cursor                #f34a00
    selection_background  #003747
    color0                #002731
    color8                #006388
    color1                #d01b24
    color9                #f4153b
    color2                #6bbe6c
    color10               #50ee84
    color3                #a57705
    color11               #b17e28
    color4                #2075c7
    color12               #178dc7
    color5                #c61b6e
    color13               #e14d8e
    color6                #259185
    color14               #00b29e
    color7                #e9e2cb
    color15               #fcf4dc
    selection_foreground #001e26
  '';
}

