# Helper functions
# PATH="$PATH:~/opt/bin"   # appending
append_to_path() {
    case ":" in
        *":$1:"*) ;;
        *) PATH="$PATH:$1" ;;
    esac
}
# PATH="~/opt/bin:$PATH"   # prepending
prepend_to_path() {
    case ":" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

# Add pnpm home directory to path (where global installs live)
append_to_path "$PNPM_HOME" 

 # Android platform tools (eg. adb)
append_to_path "$ANDROID_HOME/emulator"
append_to_path "$ANDROID_HOME/platform-tools"

# Brew - PHP Setup
append_to_path "/opt/homebrew/opt/php@8.1/bin"
append_to_path "/opt/homebrew/opt/php@8.1/sbin"

# Postgres C library (required by an unknown downstream package/library)
append_to_path "/opt/homebrew/opt/libpq/bin"

# Wezterm
prepend_to_path "/Applications/WezTerm.app/Contents/MacOS"

# Mysql client
append_to_path "/opt/homebrew/opt/mysql-client/bin"

# Bin folder used by pipx
append_to_path "$HOME/.local/bin"

# Sqlite
prepend_to_path "/opt/homebrew/opt/sqlite/bin"

# Export built PATH variable once
export PATH
