cask "simplecue" do
  version "0.5.1"
  sha256 "b27a93a3b429c3541e3e3f63489920ebf2cebc5588b6d4f1708b15ca7a27d487"

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
