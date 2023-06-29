{ config, pkgs, ... }:

{
  imports = [
    ./apps/hyprland/hyprland.nix
    ./apps/wofi/wofi.nix
    ./apps/zsh/zsh.nix
    ./apps/foot/foot.nix
    ./apps/git/git.nix
    ./apps/zathura/zathura.nix
  ];

  home.username = "sajay";
  home.homeDirectory = "/home/sajay";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    neovim
    firefox
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fonts.fontconfig.enable = true;

}
