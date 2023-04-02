{ config, lib, ... }:
{
  # Change shell to zsh
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    historySubstringSearch.enable = true;
    prezto = {
      utility.safeOps = true;
      caseSensitive = true;
    };
    shellAliases = {
      cnix="nvim ~/.dotfiles/nixos/configuration.nix";
      hnix="nvim ~/.dotfiles/home-manager/home.nix";
      apuser="sh ~/.dotfiles/apply-user.sh";
      apsys="sh ~/.dotfiles/apply-system.sh";
    };
    initExtra = ''
      autoload -U colors && colors
      PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
    '';
  };

  # Use exa instead of ls,ll...
  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  xdg.enable = true;
}
