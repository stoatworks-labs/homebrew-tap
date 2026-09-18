cask "atem-overseer" do
  version "0.3.6"
  sha256 "cbdd2e31eeb1e81774c32ba47f564f1d0ecac5eb63d7af68753ec4eae1462a34"
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
