cask "openrcs" do
  version "0.8.1"
  sha256 "aee0ac66d8bfef73241e995b17bce343fc1b6bfe4835e8d2236f1193b2bc073d"
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
