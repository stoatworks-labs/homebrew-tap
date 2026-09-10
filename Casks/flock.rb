cask "flock" do
  version "0.2.3"
  sha256 "cfaa7474621327a9013f249b0f70904e638dc913fe2738fd7c6260f15792524d"
  url "https://github.com/stoatworks-labs/flock/releases/download/v#{version}/flock-#{version}-macos-app.dmg"

  name "Flock"
  desc "BirdDog decoder fleet UI"
  homepage "https://stoatworks-labs.com/software/flock/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "flock.app"

  zap trash: [
    "~/Library/Application Support/flock",
    "~/Library/Application Support/com.allansargeant.flock",
    "~/Library/Preferences/com.allansargeant.flock.plist",
    "~/Library/Saved Application State/com.allansargeant.flock.savedState",
    "~/Library/Application Support/com.allansargeant.flock-launcher",
    "~/Library/Preferences/com.allansargeant.flock-launcher.plist",
    "~/Library/Saved Application State/com.allansargeant.flock-launcher.savedState",
  ]
end
