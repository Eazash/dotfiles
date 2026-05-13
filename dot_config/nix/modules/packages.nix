{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.nil
    pkgs.vim
    pkgs.nixd
    pkgs.nixfmt
    pkgs.mas
  ];

  nix.settings.experimental-features = "nix-command flakes";
}
