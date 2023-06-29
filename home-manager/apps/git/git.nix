{

programs.git = {
  enable = true;
  userName = "sajayprakash";
  userEmail = "sajayprakash7@protonmail.com";
  extraConfig = {
    core = {
      editor = "nvim";
    };
    color = {
      ui = true;
    };
    push = {
      default = "simple";
    };
    pull = {
      ff = "only";
    };
    init = {
      defaultBranch = "main";
    };
  };
};

}
