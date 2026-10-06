cask "flock-manager" do
  version "0.2.6"
  sha256 "ab3a28a3623fc0f283114f388ddacb13ad4856c9b1bd08ef16e02c8d15edf8f7"

  url "https://github.com/stoatworks-labs/flock/releases/download/v#{version}/flock-#{version}-macos-app.dmg"
  name "Flock"
  desc "BirdDog decoder fleet UI"
  homepage "https://stoatworks-labs.com/software/flock/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "flock.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.flock",
    "~/Library/Application Support/com.allansargeant.flock-launcher",
    "~/Library/Application Support/flock",
    "~/Library/Preferences/com.allansargeant.flock-launcher.plist",
    "~/Library/Preferences/com.allansargeant.flock.plist",
    "~/Library/Saved Application State/com.allansargeant.flock-launcher.savedState",
    "~/Library/Saved Application State/com.allansargeant.flock.savedState",
  ]
end
