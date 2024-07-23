{ config, ... }: {
  programs.git = {
    enable = true;
    userName = config.accounts.email.accounts.main.userName;
    userEmail = config.accounts.email.accounts.main.address;
    extraConfig = {
      init.defaultBranch = "master";
    };
    ignores = [
      ".envrc"
      ".direnv"
    ];
    delta.enable = true;
    lfs.enable = true;
  };
}
