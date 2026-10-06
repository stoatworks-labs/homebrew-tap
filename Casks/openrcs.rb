cask "openrcs" do
  version "0.9.0"
  sha256 "2a4caaa5e8895cf183f5f6e2ad6cb356edf1236a388d9be986306e4fa0a01ffa"

  url "https://github.com/stoatworks-labs/openrcs/releases/download/v#{version}/openrcs-#{version}-macos-app.dmg"
  name "openRCS"
  desc "Modern control for Analog Way switchers"
  homepage "https://stoatworks-labs.com/software/openrcs/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "openRCS.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.openrcs",
    "~/Library/Application Support/openRCS",
    "~/Library/Preferences/com.allansargeant.openrcs.plist",
    "~/Library/Saved Application State/com.allansargeant.openrcs.savedState",
  ]
end
