cask "livepremier-plus" do
  version "0.17.6"
  sha256 "33ae561b96f260c8b19b66ad36a89d20fc32cb3af367adac631ecb01c5fdb66c"

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
