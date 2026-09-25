cask "livepremier-plus" do
  version "0.16.0"
  sha256 "eb09704f90dd2a5ee8bd37d93183f67f41d1b569dfe97d2ae0e1ab8e31e6fb8c"
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
