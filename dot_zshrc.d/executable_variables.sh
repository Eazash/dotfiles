# Configure oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Set oh-my-zsh theme (See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
ZSH_THEME="robbyrussell"

# Load oh-my-zsh plugins
# ! Too many plugins slow down shell startup
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws git chucknorris brew docker docker-compose node macos sudo pod z vscode)

# How often to auto-update oh-my-zsh (in days).
zstyle ':omz:update' frequency 15

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set visual editor to match cli editor (sticking with vim flavour)
export VISUAL=$EDITOR

# Locale setup
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# pnpm
export PNPM_HOME="/Users/ezra/Library/pnpm"

# ASDF custom data directory config from 0.16 migration (see https://asdf-vm.com/guide/getting-started-legacy.html)
export ASDF_DATA_DIR="/Users/ezra/.asdf"

# Android SDK Variables
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Chezmoi Home Directory
export CHEZMOI_HOME="$HOME/.local/share/chezmoi"
