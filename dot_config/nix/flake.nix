{
  description = "system flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
    }:
    let
      commonModules = [
        ./modules/packages.nix
        ./modules/zsh.nix
        ./modules/security.nix
        ./modules/system.nix
        ./modules/system-defaults.nix
        ./modules/homebrew.nix
        ./modules/configuration.nix
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "ezra";
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.ezra = import ./modules/home.nix;
          home-manager.backupFileExtension = "home-manager-backup";
        }
      ];
    in
    {
      # Build darwin flake using:
      # $ sudo darwin-rebuild build --flake .#m1
      darwinConfigurations."m1" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit self; };
        modules = commonModules;
      };

      darwinConfigurations."m5" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit self; };
        modules = commonModules;
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."m1".pkgs;
    };
}
