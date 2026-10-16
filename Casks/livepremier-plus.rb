cask "livepremier-plus" do
  version "0.17.5"
  sha256 "f800a163224c055d355910717fc7d7cb62524c0e2e038e1bf0ad165a75baae8b"

  url "https://github.com/stoatworks-labs/livepremier-plus/releases/download/v#{version}/livepremier-plus-#{version}-macos-universal.dmg"
  name "LivePremier Plus"
  desc "Your switcher's own interface, with the missing panels"
  homepage "https://stoatworks-labs.com/software/livepremier-plus/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "LivePremier Plus.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.livepremier-plus",
    "~/Library/Application Support/LivePremier Plus",
    "~/Library/Preferences/com.allansargeant.livepremier-plus.plist",
    "~/Library/Saved Application State/com.allansargeant.livepremier-plus.savedState",
  ]
end
