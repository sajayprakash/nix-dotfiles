{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
