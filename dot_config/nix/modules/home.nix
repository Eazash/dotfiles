{
  lib,
  pkgs,
  config,
  ...
}:
{
  home.username = "ezra";
  home.homeDirectory = lib.mkDefault "/Users/ezra";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.sessionPath = [
    # High-priority prepends
    "$HOME/.bun/bin"
    "/opt/homebrew/opt/sqlite/bin"
    "/Applications/WezTerm.app/Contents/MacOS"
    "/Users/ezra/.rd/bin"
    # Appends (still before system PATH, but lower relative priority)
    "$PNPM_HOME"
    "$ANDROID_HOME/emulator"
    "$ANDROID_HOME/platform-tools"
    "/opt/homebrew/opt/php@8.1/bin"
    "/opt/homebrew/opt/php@8.1/sbin"
    "/opt/homebrew/opt/libpq/bin"
    "/opt/homebrew/opt/mysql-client/bin"
    "$HOME/.local/bin"
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "aws"
        "brew"
        "docker"
        "docker-compose"
        "git"
        "macos"
        "node"
        "sudo"
        "terraform"
        "vscode"
        "z"
      ];
      extraConfig = ''
        zstyle ':omz:update' frequency 15
      '';
    };

    sessionVariables = {
      LC_ALL = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
      PNPM_HOME = "/Users/ezra/Library/pnpm";
      ASDF_DATA_DIR = "/Users/ezra/.asdf";
      ANDROID_HOME = "$HOME/Library/Android/sdk";
      CHEZMOI_HOME = "$HOME/.local/share/chezmoi";
      PYTHON_AUTO_VRUN = "true";
    };

    shellAliases = {
      # neovim
      vim = "nvim";
      vi = "nvim";
      # zshrc
      szrc = "source ~/.zshrc";
      vzrc = "vim ~/.zshrc";
      vzrcd = "vim ~/.zshrc.d";
      czrc = "bat ~/.zshrc";
      # ssh config
      vssh = "vim ~/.ssh/config";
      # grep
      aligrep = "alias | grep";
      igrep = "grep -i";
      # terraform
      tf = "terraform";
      # z
      ze = "z -e";
      # ensure package manager is used for running scripts
      npx = "nlx";
      # docker
      dpss = "docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'";
      dpsn = "docker ps --format '{{.Names}}'";
    };
    # Runs before compinit / oh-my-zsh sourcing
    initContent =
      let
        zshConfigEarlyInit = lib.mkOrder 500 ''
          if type brew &>/dev/null; then
            FPATH="$(brew --prefix)/share/zsh/site-functions:''${FPATH}"
          fi
          eval "$(brew shellenv zsh)"

          disable -r time
        '';
        zshConfigGeneral = lib.mkOrder 1000 ''
          # Editor — prefer nvim, fall back to vim over SSH
          if [[ -n $SSH_CONNECTION ]]; then
            export EDITOR='vim'
          else
            export EDITOR='nvim'
          fi
          export VISUAL="$EDITOR"

          # Custom functions
          function vsz { vsc "$(ze $@)" }

          function getEBENV {
            aws elasticbeanstalk describe-configuration-settings \
              --application-name "$1" --environment-name "$2" \
              | jq -r '.ConfigurationSettings | .[] | .OptionSettings | .[] | select(.Namespace == "aws:elasticbeanstalk:application:environment")'
          }

          function beanstalk_option_to_env { jq -rS '"\(.OptionName)=\(.Value)"' | sort }

          function updateEBENV {
            aws elasticbeanstalk update-environment --environment-name "$1" --option-settings "$2"
          }

          function ssh_host_to_ip {
            ssh -G "$1" | grep -iw hostname | cut -d ' ' -f 2 | tr -d '\n' | xargs echo
          }

          function aws_account_id { aws sts get-caller-identity | jq -r '.Account' }

          function aws_default_region {
            aws ec2 describe-availability-zones | jq -r '.AvailabilityZones[0].RegionName'
          }

          function aws_ecr_url {
            echo "$(aws_account_id).dkr.ecr.$(aws_default_region).amazonaws.com"
          }

          function docker_ecr_login {
            aws ecr get-login-password --region "$(aws_default_region)" \
              | docker login --username AWS --password-stdin "$(aws_ecr_url)"
          }

          function get_tg_url {
            local token="''${1:-''${TG_TOKEN}}"
            if [[ -n "''${token}" ]]; then
              echo "https://api.telegram.org/bot''${token}"
            else
              echo 'Usage: get_tg_url <TG_TOKEN>\nNote: "TG_TOKEN" can also be set as an environment variable'
              return 1
            fi
          }

          function run_with_brk {
            NODE_OPTIONS="--inspect-brk" "$@"
          }

          # Evaluations
          eval "$(starship init zsh)"
          # Avoid using shims because of overhead. mise-vscode should handle IDE config without shims
          eval "$(mise activate zsh)"

          # Rust
          [[ -e "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

          # iTerm2 shell integration
          [[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"

          # Vite+
          [[ -e "$HOME/.vite-plus/env" ]] && source "$HOME/.vite-plus/env"

          ## Keybindings
          bindkey "^[^[[C"     forward-word       # Option + Right
          bindkey "^[^[[D"     backward-word      # Option + Left
          bindkey "^[[D"    begining-of-line   # CMD + Left
          bindkey "^[[C" end-of-line          # CMD + Right
        '';

      in
      lib.mkMerge [
        zshConfigEarlyInit
        zshConfigGeneral
      ];
  };
}
