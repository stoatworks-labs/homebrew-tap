cask "livepremier-plus" do
  version "0.8.1"
  sha256 "2ac19cb62523f385ae4fdd81801d9e8e5d5bf0289ccf875771497e8a5b435412"
  url "https://github.com/stoatworks-labs/livepremier-plus/releases/download/v#{version}/livepremier-plus-#{version}-macos-universal.dmg"

  name "LivePremier Plus"
  desc "Your switcher's own interface, with the missing panels"
  homepage "https://stoatworks-labs.com/software/livepremier-plus/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "LivePremier Plus.app"

  zap trash: [
    "~/Library/Application Support/LivePremier Plus",
    "~/Library/Application Support/com.allansargeant.livepremier-plus",
    "~/Library/Preferences/com.allansargeant.livepremier-plus.plist",
    "~/Library/Saved Application State/com.allansargeant.livepremier-plus.savedState",
  ]
end
