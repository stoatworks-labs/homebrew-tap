cask "atem-overseer" do
  version "0.3.10"
  sha256 "81b3ab914356e5e5c6a1414ae1d3416f94c241cadc7494c22308cda6b6ed7662"

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
