cask "atem-overseer" do
  version "0.3.9"
  sha256 "5f7d795d177421b3957e7635152abbbcc9add1f3d1c7f80aa7e886be83b0f1de"

  url "https://github.com/stoatworks-labs/atem-overseer/releases/download/v#{version}/atem-overseer-#{version}-macos-universal.dmg"
  name "ATEM Overseer"
  desc "ATEM fleet dashboard"
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
