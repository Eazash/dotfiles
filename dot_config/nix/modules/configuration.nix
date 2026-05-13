{ pkgs, ... }:
{
  users.users.ezra = {
    home = "/Users/ezra"; # Must be an absolute path string
    shell = pkgs.zsh;
  };
}
