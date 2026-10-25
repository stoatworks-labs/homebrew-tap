cask "livepremier-plus" do
  version "0.18.6"
  sha256 "327821e1219349765d8ede724dab81076a93f70fbc4bf2cf94a854440b71fb16"

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
