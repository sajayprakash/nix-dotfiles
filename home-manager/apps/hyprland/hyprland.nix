{
  imports = [
    ../foot/foot.nix
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    systemdIntegration = true;
    disableAutoreload = false;
    nvidiaPatches = true;
    extraConfig = ''
        See https://wiki.hyprland.org/Configuring/Monitors/
        monitor=,preferred,auto,auto
        monitor=DP-1,1920x1080@144,auto,auto
        monitor=HDMI-A-1,disable
        
        # Startup
        # exec-once=/usr/lib/polkit-kde-authentication-agent-1
        # exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        # exec-once = hyprpaper & dunst 
        # exec-once = wl-clipboard-history -t
        
        # Source a file (multi-file configs)
        # source = ~/.config/hypr/nvidia.conf
        
        # Some default env vars.
        # env = XCURSOR_SIZE,24
        
        # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
        input {
            kb_layout = us
            kb_variant =
            kb_model =
            kb_options = caps:escape
            kb_rules =
            follow_mouse = 1
            touchpad {
                natural_scroll = no
            }
            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }
        
        general {
            gaps_in = 4
            gaps_out = 8
            border_size = 2
            col.active_border = rgba(2aa198D9) rgba(00afafD9) 45deg
            col.inactive_border = rgba(1e2030D9) rgba(363a4fD9) 45deg
            layout = dwindle 
        }
        
        decoration {
            rounding = 5
            blur = yes
            blur_size = 3
            blur_passes = 3
            blur_new_optimizations = on
            drop_shadow = yes
            shadow_range = 4
            shadow_render_power = 3
            col.shadow = rgba(181926F2)
        }
        
        # Blur Wofi
        layerrule = blur,wofi
        
        animations {
            enabled = true
            bezier = myBezier, 0.05, 0.9, 0.1, 1.05
            bezier = rotate,0,0,1,1
            animation = windows, 1, 4, myBezier
            animation = windowsIn, 1, 4, myBezier, slide
            animation = windowsOut, 1, 3, myBezier, popin 90%
            animation = border, 1, 6, default
            animation = fade, 1, 7, default
            animation = workspaces, 1, 6, default
            animation = borderangle, 1, 20, rotate, loop    # borderangle - for animating the border's gradient angle
        }
        
        dwindle {
            pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = yes # you probably want this
        }
        
        master {
            new_is_master = true
        }
        
        gestures {
            workspace_swipe = off
        }
        
        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = SUPER, RETURN , exec, foot 
        bind = SUPER, W, exec, firefox 
        bind = SUPER, Q, killactive, 
        bind = SUPER SHIFT, Q, exit, 
        bind = SUPER, E, exec, nemo 
        bind = SUPER SHIFT, F, togglefloating, 
        bind = SUPER, F, fullscreen, 
        bind = SUPER, D, exec, wofi --show
        bind = SUPER, P, pseudo, # dwindle
        bind = SUPER, J, togglesplit, # dwindle
        
        # Move focus with mainMod + arrow keys
        bind = SUPER, left, movefocus, l
        bind = SUPER, right, movefocus, r
        bind = SUPER, up, movefocus, u
        bind = SUPER, down, movefocus, d
        
        # Switch workspaces with mainMod + [0-9]
        bind = SUPER, 1, workspace, 1
        bind = SUPER, 2, workspace, 2
        bind = SUPER, 3, workspace, 3
        bind = SUPER, 4, workspace, 4
        bind = SUPER, 5, workspace, 5
        bind = SUPER, 6, workspace, 6
        bind = SUPER, 7, workspace, 7
        bind = SUPER, 8, workspace, 8
        bind = SUPER, 9, workspace, 9
        bind = SUPER, 0, workspace, 10
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = SUPER SHIFT, 1, movetoworkspace, 1
        bind = SUPER SHIFT, 2, movetoworkspace, 2
        bind = SUPER SHIFT, 3, movetoworkspace, 3
        bind = SUPER SHIFT, 4, movetoworkspace, 4
        bind = SUPER SHIFT, 5, movetoworkspace, 5
        bind = SUPER SHIFT, 6, movetoworkspace, 6
        bind = SUPER SHIFT, 7, movetoworkspace, 7
        bind = SUPER SHIFT, 8, movetoworkspace, 8
        bind = SUPER SHIFT, 9, movetoworkspace, 9
        bind = SUPER SHIFT, 0, movetoworkspace, 10
        
        # Scroll through existing workspaces with mainMod + scroll
        bind = SUPER, mouse_down, workspace, e+1
        bind = SUPER, mouse_up, workspace, e-1
        
        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = SUPER, mouse:272, movewindow
        bindm = SUPER, mouse:273, resizewindow
        
      '';

  };
  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE= "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  }
