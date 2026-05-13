{ ... }:
{
  system.defaults = {
    dock = {
      autohide = true;
      mineffect = "scale";
      mru-spaces = false;
      show-recents = false;
      showAppExposeGestureEnabled = true;
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
    screencapture.location = "~/Pictures/screenshots";
    screensaver.askForPasswordDelay = 10;
  };
}
