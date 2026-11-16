cask "simplecue" do
  version "0.5.0"
  sha256 "0537657d86d440000e85e77d56d853423f77fb9c07dfa80a82984e2ad2b79f51"

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
