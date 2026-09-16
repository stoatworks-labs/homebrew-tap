cask "flock-manager" do
  version "0.2.4"
  sha256 "b0bf1ed7b8ca97e2098122459d22b8b9efd51a572ca8315d2f27f5d77cd4b5c2"
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
