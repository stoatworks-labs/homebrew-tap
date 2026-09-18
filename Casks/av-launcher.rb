cask "av-launcher" do
  version "0.3.1"
  sha256 "855209b2d5add39164f9177183437baf925484d2f9cdfb4ba0ac5b5c1a08a992"
  url "https://github.com/stoatworks-labs/av-launcher/releases/download/v#{version}/av-launcher-#{version}-macos-universal.dmg"

  name "av-launcher"
  desc "Tray launcher shell for the web-server apps"
  homepage "https://stoatworks-labs.com/software/av-launcher/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "AV Launcher.app"

  zap trash: [
    "~/Library/Application Support/AV Launcher",
    "~/Library/Application Support/com.allansargeant.av-launcher",
    "~/Library/Preferences/com.allansargeant.av-launcher.plist",
    "~/Library/Saved Application State/com.allansargeant.av-launcher.savedState",
  ]
end
