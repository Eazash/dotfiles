{
  description = "system flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.vim
            pkgs.nixd
            pkgs.nixfmt
            pkgs.mas
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;

          programs.zsh = {
            enable = true;
            enableCompletion = true;
            enableBashCompletion = true;
            enableAutosuggestions = true;
            enableSyntaxHighlighting = true;
            histSize = 10000;
          };

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Unlock sudo with fingerprint
          security.pam.services.sudo_local.touchIdAuth = true;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          # Setup primary user
          system.primaryUser = "ezra";

          # Sensible system defaults
          system.defaults = {
            dock = {
              autohide = true;
              mineffect = "scale";
              mru-spaces = false;
              show-recents = false;
              persistent-apps = [
                "/System/Applications/Apps.app"
                "/Applications/Brave Browser.app"
                "/Applications/iTerm.app"
                "/Applications/Visual Studio Code.app"
                "/Applications/Spotify.app"
                "/Applications/Telegram.app"
                "/Applications/Linear.app"
                "/Applications/Discord.app"
                "/System/Applications/Mail.app"
                "/System/Applications/Calendar.app"
              ];
            };
            finder.AppleShowAllExtensions = true;
            finder.FXPreferredViewStyle = "clmv";
            loginwindow.LoginwindowText = "nixcademy.com";
            screencapture.location = "~/Pictures/screenshots";
            screensaver.askForPasswordDelay = 10;
          };

          homebrew = {
            enable = true;
            taps = [
              "altinity/clickhouse"
              "aws/tap"
              "circleci-public/circleci"
              "dart-lang/dart"
              "leoafarias/fvm"
              "libsql/sqld"
              "nikitabobko/tap"
              "oven-sh/bun"
              "sst/tap"
              "stripe/stripe-cli"
              "supabase/tap"
              "tursodatabase/tap"
            ];
            brews = [
              # Run your GitHub Actions locally
              "act"
              # GNU internationalization (i18n) and localization (l10n) library
              "gettext"
              # Core application library for C
              "glib"
              # OpenType text shaping engine
              "harfbuzz"
              # General-purpose data compression with high compression ratio
              "xz"
              # Development kit for the Java programming language
              "openjdk"
              # Tool for reverse engineering 3rd party, closed, binary Android apps
              "apktool"
              # Cryptography and SSL/TLS Toolkit
              "openssl@3"
              # Utility to check whether MAC addresses are already taken on a LAN
              "arping"
              # Extendable version manager with support for Ruby, Node.js, Erlang & more
              "asdf"
              # Automatic configure script builder
              "autoconf"
              # Client for Amazon Elastic Beanstalk web service
              "aws-elasticbeanstalk"
              # CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM
              "aws-sam-cli"
              # Official Amazon AWS command-line interface
              "awscli"
              # Microsoft Azure CLI 2.0
              "azure-cli"
              # Programmable completion for Bash 3.2
              "bash-completion"
              # Clone of cat(1) with syntax highlighting and Git integration
              "bat"
              # Powerful, enterprise-ready, open source web server with automatic HTTPS
              "caddy"
              # Tool to obtain certs from Let's Encrypt and autoenable HTTPS
              "certbot"
              # Validate CloudFormation templates against the CloudFormation spec
              "cfn-lint"
              # Manage your dotfiles across multiple diverse machines, securely
              "chezmoi"
              # Enables you to reproduce the CircleCI environment locally
              "circleci"
              # Cloudflare Tunnel client (formerly Argo Tunnel)
              "cloudflared"
              # Dependency manager for Cocoa projects
              "cocoapods"
              # Apjanke's fork of the classic cowsay project
              "cowsay"
              # Secure runtime for JavaScript and TypeScript
              "deno"
              # Diff that understands syntax
              "difftastic"
              # Lightweight DNS forwarder and DHCP server
              "dnsmasq"
              # Run arbitrary commands when files change
              "entr"
              # Modern, maintained replacement for ls
              "eza"
              # Simple, fast and user-friendly alternative to find
              "fd"
              # Infamous electronic fortune-cookie generator
              "fortune"
              # Generic library support script
              "libtool"
              # Command-line fuzzy finder written in Go
              "fzf"
              # New file format for still image compression
              "jpeg-xl"
              # Interact with Google Gemini AI models from the command-line
              "gemini-cli"
              # GitHub command-line tool
              "gh"
              # Distributed revision control system
              "git"
              # Render markdown on the CLI
              "glow"
              # GNU multiple precision arithmetic library
              "gmp"
              # GNU Privacy Guard (OpenPGP)
              "gnupg"
              # Open source programming language to build simple/reliable/efficient software
              "go"
              # Graph visualization software from AT&T and Bell Labs
              "graphviz"
              # Tool for glamorous shell scripts
              "gum"
              # Command-line benchmarking tool
              "hyperfine"
              # API Support for your favorite torrent trackers
              {
                name = "jackett";
                restart_service = "changed";
              }
              # Lightweight and flexible command-line JSON processor
              "jq"
              # Lazier way to manage everything docker
              "lazydocker"
              # Postgres C API library
              {
                name = "libpq";
                link = true;
              }
              # Control external displays (USB-C/DisplayPort Alt Mode) using DDC/CI on M1 Macs
              "m1ddc"
              # Show markdown documents on text terminals
              "mdcat"
              # Polyglot runtime manager (asdf rust clone)
              "mise"
              # Deep clean and optimize your Mac
              "mole"
              # Open source relational database management system
              "mysql-client"
              # NCurses Disk Usage
              "ncdu"
              # Fast, highly customisable system info script
              "neofetch"
              # Incremental parsing library
              "tree-sitter"
              # Ambitious Vim-fork focused on extensibility and agility
              "neovim"
              # Libraries for security-enabled client and server applications
              "nss"
              # Modern shell for the GitHub era
              "nushell"
              # PostgreSQL syntax beautifier
              "pgformatter"
              # General-purpose scripting language
              "php@8.1"
              # Execute binaries from Python packages in isolated environments
              "pipx"
              # Python version management
              "pyenv"
              # Interpreted, interactive, object-oriented programming language
              "python@3.10"
              # Interpreted, interactive, object-oriented programming language
              "python@3.11"
              # Interpreted, interactive, object-oriented programming language
              "python@3.12"
              # Develop and deploy code with zero configuration
              "railway"
              # Search tool like grep and The Silver Searcher
              "ripgrep"
              # Soak up standard input and write to a file
              "sponge"
              # Cross-shell prompt for astronauts
              "starship"
              # Command-line tool for Stripe
              "stripe-cli"
              # Log file highlighter
              "tailspin"
              # Tool Command Language
              "tcl-tk"
              # User interface to the TELNET protocol
              "telnet"
              # Terminal multiplexer
              "tmux"
              # High-performance data structure server that primarily serves key/value workloads
              "valkey"
              # Convert HTML to PDF
              "weasyprint"
              # Internet file retriever
              "wget"
              # Little beautifier tool for xcodebuild
              "xcbeautify"
              # Generate your Xcode project from a spec file and your folder structure
              "xcodegen"
              # Process YAML, JSON, XML, CSV and properties documents from the CLI
              "yq"
              # Fish-like fast/unobtrusive autosuggestions for zsh
              "zsh-autosuggestions"
              # Fish shell like syntax highlighting for zsh
              "zsh-syntax-highlighting"
              # Incredibly fast JavaScript runtime, bundler, transpiler and package manager - all in one.
              "oven-sh/bun/bun"
              # Supabase CLI
              "supabase/tap/supabase"
            ];
            casks = [
              # Privacy First browser
              "brave-browser"
              # Cross platform SQL editor and database management app
              "beekeeper-studio"
              # Open source IDE for exploring and testing APIs
              "bruno"
              # Terminal-based AI coding assistant
              "claude-code"
              # Free app that makes your Internet safer
              "cloudflare-warp"
              # Discord is discord
              "discord"
              # Photography workflow application and raw developer
              "darktable"
              # Multi-protocol API development platform
              "firecamp"
              "font-hack-nerd-font"
              # Free and open-source image editor
              "gimp"
              # Cross-platform Git credential storage for multiple hosting providers
              "git-credential-manager"
              # Menu bar application that displays the CPU speed limit due to thermal issues
              "hot"
              # Terminal emulator as alternative to Apple's Terminal app
              "iterm2"
              # Electronics design automation suite
              "kicad"
              "linear-linear"
              # Privacy First VPN
              "mullvad-vpn"
              # App to write, plan, collaborate, and get organised
              "notion"
              # Replacement for Docker Desktop
              "orbstack"
              # Peer to peer Bitorrent client
              "qbittorrent"
              # RAW photo processor
              "rawtherapee"
              "raycast"
              # Window management
              "rectangle"
              "Spotify"
              "visual-studio-code"
              # All-in-one office suite
              "wpsoffice"
            ];
            masApps = {
              "Snap" = 418073146;
              "Telegram" = 747648890;
              "WhatsApp Messenger" = 310633997;
            };
            enableZshIntegration = true;
            onActivation.autoUpdate = false;
            onActivation.cleanup = "zap";
          };
        };
    in
    {
      # Build darwin flake using:
      # $ sudo darwin-rebuild build --flake .#m1
      darwinConfigurations."m1" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "ezra";

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;
            };
          }
        ];
      };
      darwinConfigurations."m5" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "ezra";

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;
            };
          }
        ];
      };
      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."m1".pkgs;
    };
}
