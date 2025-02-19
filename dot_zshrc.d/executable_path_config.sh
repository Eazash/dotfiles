# Helper functions
# PATH="$PATH:~/opt/bin"   # appending
append_to_path() {
    case ":" in
        *":$1:"*) ;;
        *) PATH="$PATH:$1" ;;
    esac
}
# PATH="~/opt/bin"   # prepending
prepend_to_path() {
    case ":" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

# Add pnpm home directory to path (where global installs live)
case ":" in
  *":$PNPM_HOME:"*) ;;
  *) append_to_path "$PNPM_HOME" ;;
esac

 # Android platform tools (eg. adb)
append_to_path "/Users/ezra/Library/Android/sdk/platform-tools"

# Brew - PHP Setup
append_to_path "/opt/homebrew/opt/php@8.1/bin"
append_to_path "/opt/homebrew/opt/php@8.1/sbin"

# Postgres C library (required by an unknown downstream package/library)
append_to_path "/opt/homebrew/opt/libpq/bin"

# Wezterm
prepend_to_path "/Applications/WezTerm.app/Contents/MacOS"

# Place ASDF bin to front of path (it's installed in $HOME/bin)
append_to_path "$HOME/bin"
# Add ASDF shims to front of path
append_to_path "$ASDF_DATA_DIR/shims"

# Mysql client
append_to_path "/opt/homebrew/opt/mysql-client/bin"

# Export built PATH variable once
export PATH
