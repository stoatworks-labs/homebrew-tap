cask "openrcs" do
  version "0.11.3"
  sha256 "c3b60d895a5c051f677f11d81510a55a6480b806d4c0db3510b440f2e119c80e"

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
