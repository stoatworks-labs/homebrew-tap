cask "simplecue" do
  version "0.5.2"
  sha256 "3547e32df67b9fb09da2c34350e5d4104a4b9cc88022eeffeb7dd4f84fc4b752"

  url "https://github.com/stoatworks-labs/simplecue/releases/download/v#{version}/simplecue-#{version}-macos-universal.dmg"
  name "SimpleCue"
  desc "Audio cue player for theatre"
  homepage "https://stoatworks-labs.com/software/simplecue/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "SimpleCue.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.simplecue",
    "~/Library/Application Support/SimpleCue",
    "~/Library/Preferences/com.allansargeant.simplecue.plist",
    "~/Library/Saved Application State/com.allansargeant.simplecue.savedState",
  ]
end
