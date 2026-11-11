cask "livepremier-plus" do
  version "0.19.0"
  sha256 "c13f25b9d8fb09e54301b714ec6619587df02ce1aad8ad38fb8f9cdf16a31915"

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
