cask "av-launcher" do
  version "0.3.2"
  sha256 "3f0b957677cf2e854e4165d9f0216528126d3d75030801cdb6dd89386cdf7027"

  url "https://github.com/stoatworks-labs/av-launcher/releases/download/v#{version}/av-launcher-#{version}-macos-universal.dmg"
  name "av-launcher"
  desc "Tray launcher shell for the web-server apps"
  homepage "https://stoatworks-labs.com/software/av-launcher/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "AV Launcher.app"

  zap trash: [
    "~/Library/Application Support/AV Launcher",
    "~/Library/Application Support/com.allansargeant.av-launcher",
    "~/Library/Preferences/com.allansargeant.av-launcher.plist",
    "~/Library/Saved Application State/com.allansargeant.av-launcher.savedState",
  ]
end
