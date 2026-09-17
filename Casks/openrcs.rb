cask "openrcs" do
  version "0.8.0"
  sha256 "0ba9f2eef453e5664129b98f7195f1afbd3327aea94dbe7a1d75858fb67bb1d8"
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
