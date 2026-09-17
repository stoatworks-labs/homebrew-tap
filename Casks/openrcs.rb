cask "openrcs" do
  version "0.8.2"
  sha256 "bf9965a5e8c603eb5a94be8c4fc3705ee948572f1bc7d35a47d375dc2c5e4e0a"
  url "https://github.com/stoatworks-labs/openrcs/releases/download/v#{version}/openrcs-#{version}-macos-app.dmg"

  name "openRCS"
  desc "Modern control for Analog Way switchers"
  homepage "https://stoatworks-labs.com/software/openrcs/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "openRCS.app"

  zap trash: [
    "~/Library/Application Support/openRCS",
    "~/Library/Application Support/com.allansargeant.openrcs",
    "~/Library/Preferences/com.allansargeant.openrcs.plist",
    "~/Library/Saved Application State/com.allansargeant.openrcs.savedState",
  ]
end
