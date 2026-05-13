{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableBashCompletion = false;
  };
  environment.shells = [ pkgs.zsh ];
}
