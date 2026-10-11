cask "rfutils" do
  version "0.5.0"
  sha256 "129be6cf5c7f6a853658dddecf728294d488acb78ea73a9e0897f3018259b555"

  url "https://github.com/stoatworks-labs/RFutils/releases/download/v#{version}/rfutils-#{version}-macos-universal.dmg"
  name "RFutils"
  desc "RF coordination & mic monitoring"
  homepage "https://stoatworks-labs.com/software/rfutils/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "RFutils.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.rfutils",
    "~/Library/Application Support/com.allansargeant.rfutils-launcher",
    "~/Library/Application Support/RFutils",
    "~/Library/Preferences/com.allansargeant.rfutils-launcher.plist",
    "~/Library/Preferences/com.allansargeant.rfutils.plist",
    "~/Library/Saved Application State/com.allansargeant.rfutils-launcher.savedState",
    "~/Library/Saved Application State/com.allansargeant.rfutils.savedState",
  ]
end
