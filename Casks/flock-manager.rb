cask "flock-manager" do
  version "0.2.5"
  sha256 "cf2c56c97062657744c26e4c8c47b53af44be5b45bd9999edd69384a751916d9"
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
