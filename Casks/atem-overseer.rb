cask "atem-overseer" do
  version "0.3.11"
  sha256 "72b73666d2f7954869e1b41de6311524d20da0133dd1c6b9466d56630488939a"

  url "https://github.com/stoatworks-labs/atem-overseer/releases/download/v#{version}/atem-overseer-#{version}-macos-universal.dmg"
  name "ATEM Overseer"
  desc "Whole fleet of ATEMs on one screen"
  homepage "https://stoatworks-labs.com/software/atem-overseer/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Atem Overseer.app"

  zap trash: [
    "~/Library/Application Support/Atem Overseer",
    "~/Library/Application Support/com.allansargeant.atem-overseer",
    "~/Library/Preferences/com.allansargeant.atem-overseer.plist",
    "~/Library/Saved Application State/com.allansargeant.atem-overseer.savedState",
  ]
end
