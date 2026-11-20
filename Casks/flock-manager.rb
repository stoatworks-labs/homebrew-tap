cask "flock-manager" do
  version "0.2.7"
  sha256 "95492e966f98bd6cc8c458556d0dc42c38633bfe5f3a5f527fd6e454920e7a39"

  url "https://github.com/stoatworks-labs/flock/releases/download/v#{version}/flock-#{version}-macos-app.dmg"
  name "Flock"
  desc "Every BirdDog Play decoder from one page"
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
