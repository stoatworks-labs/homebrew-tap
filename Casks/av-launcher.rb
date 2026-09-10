cask "av-launcher" do
  version "0.2.1"

  on_arm do
    sha256 "ded8dd37cca579fcb1cdca1b6b4d1b836dc21f4cac59ae3a19ba86d02f23ff22"
    url "https://github.com/stoatworks-labs/av-launcher/releases/download/v#{version}/av-launcher-#{version}-macos-aarch64.dmg"
  end

  on_intel do
    sha256 "5e1be65cdd3f971796f36aa1d9499ecdd823ce9ada28d7faee84b5f55e4b3261"
    url "https://github.com/stoatworks-labs/av-launcher/releases/download/v#{version}/av-launcher-#{version}-macos-x86_64.dmg"
  end

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
