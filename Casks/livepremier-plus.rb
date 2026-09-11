cask "livepremier-plus" do
  version "0.5.0"
  sha256 "ed8ec1bcc69fc565001c674e63aacbb375ddf13313c1cb37ad04632dcb251c0e"
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
