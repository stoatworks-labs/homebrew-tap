cask "livepremier-plus" do
  version "0.6.0"
  sha256 "25ab29514cbdf2e3341e05b84dc78fa1d261badc02d355c06e9305d0215f30ba"
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
