cask "openrcs" do
  version "0.8.3"
  sha256 "da7f7cd50ad414bf12b46e93ea2d6d09a6c716a789a488d49f3d48d0ef8c5606"
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
