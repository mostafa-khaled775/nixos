{ ... }:
{
  nix.registry.templates = {
    to = {
      owner = "mostafa-khaled775";
      repo = "flake-templates";
      type = "github";
    };
    from = {
      id = "templates";
      type = "indirect";
    };
  };
}
