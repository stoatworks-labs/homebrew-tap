cask "openrcs" do
  version "0.11.1"
  sha256 "8b2bad70f749fa767077160a13888f7d9930cdd77b3e3ebbf4f7b1262a3137c7"

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
