{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    userName = config.accounts.email.accounts.main.userName;
    userEmail = config.accounts.email.accounts.main.address;
    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
    ignores = [
      ".envrc"
      ".direnv"
    ];
    delta.enable = true;
    lfs.enable = true;
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };

  programs.gh-dash = {
    enable = true;
    settings.prSections = [
      {
        title = "My Pull Requests";
        filters = "is:open author:@me";
      }
    ];
  };
}
