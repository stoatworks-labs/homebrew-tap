cask "atem-overseer" do
  version "0.3.8"
  sha256 "7dbc11f5134880ec8c31c75d28174d8f941331a6d730721a7925338cca0e00d2"
  url "https://github.com/stoatworks-labs/atem-overseer/releases/download/v#{version}/atem-overseer-#{version}-macos-universal.dmg"

  name "ATEM Overseer"
  desc "ATEM fleet dashboard"
  homepage "https://stoatworks-labs.com/software/atem-overseer/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Atem Overseer.app"

  zap trash: [
    "~/Library/Application Support/Atem Overseer",
    "~/Library/Application Support/com.allansargeant.atem-overseer",
    "~/Library/Preferences/com.allansargeant.atem-overseer.plist",
    "~/Library/Saved Application State/com.allansargeant.atem-overseer.savedState",
  ]
end
