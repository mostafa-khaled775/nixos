{ config, ... }: {
  programs.git = {
    enable = true;
    userName = config.accounts.email.accounts.main.userName;
    userEmail = config.accounts.email.accounts.main.address;
    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
    };
    ignores = [
      ".envrc"
      ".direnv"
    ];
    delta.enable = true;
    lfs.enable = true;
  };
}
