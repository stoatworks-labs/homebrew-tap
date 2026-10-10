cask "openrcs" do
  version "0.10.0"
  sha256 "0cf90c543286b492ebfd8b79fe1c472698ba2b940e75da97be65fcb766d4dd25"

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
