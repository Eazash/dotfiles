{ ... }:
{
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
      "dimentium/autoraise"
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
      # Github MCP server
      "github-mcp-server"
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
      # Package manager auto selector (@antfu/ni)
      "ni"
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
      # Auto switch focus on mouse hover
      "autoraiseapp"
      # Privacy First browser
      { name = "brave-browser"; greedy = true; }
      # Cross platform SQL editor and database management app
      { name = "beekeeper-studio"; greedy = true; }
      # Open source IDE for exploring and testing APIs
      "bruno"
      # Terminal-based AI coding assistant
      { name = "claude-code"; greedy = true; }
      # Free app that makes your Internet safer
      { name = "cloudflare-warp"; greedy = true; }
      # OpenAI codex agent
      { name = "codex"; greedy = true; }
      # Claude code parallelizer
      { name = "conductor"; greedy = true; }
      # Discord is discord
      { name = "discord"; greedy = true; }
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
      { name = "iterm2"; greedy = true; }
      # Electronics design automation suite
      "kicad"
      { name = "linear"; greedy = true; }
      # Lunar brightness manager
      { name = "lunar"; greedy = true; }
      # Privacy First VPN
      { name = "mullvad-vpn"; greedy = true; }
      # App to write, plan, collaborate, and get organised
      { name = "notion"; greedy = true; }
      # Office Suite
      "onlyoffice"
      # Replacement for Docker Desktop
      { name = "orbstack"; greedy = true; }
      # Peer to peer Bitorrent client
      "qbittorrent"
      # RAW photo processor
      "rawtherapee"
      { name = "raycast"; greedy = true; }
      # Window management
      { name = "rectangle"; greedy = true; }
      { name = "Spotify"; greedy = true; }
      { name = "visual-studio-code"; greedy = true; }
      # # All-in-one office suite
      # "wpsoffice"
    ];
    masApps = {
      "Snap" = 418073146;
      "Telegram" = 747648890;
      "WhatsApp Messenger" = 310633997;
    };
    enableZshIntegration = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
      extraFlags = [
        # Reduce brew bundle verbosity
        "--quiet"
      ];
    };
  };
}
