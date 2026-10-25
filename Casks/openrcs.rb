cask "openrcs" do
  version "0.11.2"
  sha256 "b85fd7710cfbf5e4c39fcfef4563a860354bc3a180afbcbc3d085f15a5bf5c55"

  url "https://github.com/stoatworks-labs/openrcs/releases/download/v#{version}/openrcs-#{version}-macos-app.dmg"
  name "openRCS"
  desc "Fresh control surface for Analog Way LiveCore and Midra"
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
