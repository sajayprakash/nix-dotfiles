{ config, lib, ... }:
{
  home.file.".config/dunst/dunstrc".text = ''
    [global]
    monitor = 0
    follow = mouse
    geometry = "350x8-36+36"
    indicate_hidden = yes
    shrink = no
    transparency = 0
    notification_height = 0
    separator_height = 1
    padding = 8
    horizontal_padding = 8
    frame_width = 0
    frame_color = "#2B3339"
    separator_color = frame
    sort = yes
    idle_threshold = 120
    corner_radius = 3

    font = JetBrains Mono Nerd Font 12
    line_height = 0
    markup = full
    format = "<b>%s</b>\n%b"
    alignment = left
    vertical_alignment = center
    show_age_threshold = 60
    word_wrap = yes
    ellipsize = middle

    ignore_newline = no
    stack_duplicates = true
    hide_duplicate_count = false

    show_indicators = no
    icon_position = left
    max_icon_size = 75
    icon_path = /usr/share/icons/Papirus/16x16/devices/:/usr/share/icons/Papirus/16x16/apps/
    sticky_history = yes
    history_length = 20
    dmenu = /usr/bin/dmenu -p dunst:
    browser = /usr/bin/firefox -new-tab
    always_run_script = true

    title = Dunst

    class = Dunst
    startup_notification = false
    verbosity = mesg
    corner_radius = 10
    ignore_dbusclose = false
    force_xinerama = false
    mouse_left_click = close_current
    mouse_middle_click = do_action, close_current
    mouse_right_click = close_all

    [experimental]
        per_monitor_dpi = false
    
    [shortcuts]
    
        close = ctrl+space
        close_all = ctrl+shift+space
        history = ctrl+grave
        context = ctrl+shift+period
    
    frame_color = "#2B3339"
    separator_color = "#263640"
    
    [base16_low]
        msg_urgency = low
        background = "#2B3339"
        foreground = "#D9D7D6"
    
    [base16_normal]
        msg_urgency = normal
        background = "#2B3339"
        foreground = "#D9D7D6"
    
    [base16_critical]
        msg_urgency = critical
        background = "#061115"
        foreground = "#D9D7D6"
  '';
}
