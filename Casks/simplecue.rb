cask "simplecue" do
  version "0.4.1"
  sha256 "2140845a5e687284127029df0d0ccaa62f8aafe53e8ea909574d6d67102b6247"
  url "https://github.com/stoatworks-labs/simplecue/releases/download/v#{version}/simplecue-#{version}-macos-universal.dmg"

  name "SimpleCue"
  desc "Audio cue player for theatre"
  homepage "https://stoatworks-labs.com/software/simplecue/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "SimpleCue.app"

  zap trash: [
    "~/Library/Application Support/SimpleCue",
    "~/Library/Application Support/com.allansargeant.simplecue",
    "~/Library/Preferences/com.allansargeant.simplecue.plist",
    "~/Library/Saved Application State/com.allansargeant.simplecue.savedState",
  ]
end
